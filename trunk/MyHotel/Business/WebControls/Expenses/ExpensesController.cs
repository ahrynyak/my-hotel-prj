using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyHotel.Utils;
using MyHotel.LINQDB;
using MyHotel.Business.Entity.Expenses;
using System.Data;

namespace MyHotel.Business.WebControls.Expenses
{
    public class ExpensesController
    {
        private ExpensesController()
        {
            ShowAllLevels = true;
        }
        #region Converters

        private static ExpensesDetailsEntity expensesDetailToExpensesDetailsEntity(ExpensesDetail e)
        {
            return new ExpensesDetailsEntity() { ExpensesDetailsID = e.ExpensesDetailsID, ExpensesItemID = e.ExpensesItemID, Cost = e.Cost, Date = e.Date, Description = e.Description };
        }

        private static ExpensesItemsEntity ExpensesItemToExpensesItemsEntity(ExpensesItem e)
        {
            return new ExpensesItemsEntity() { ExpensesItemID = e.ExpensesItemID, Name = e.Name, ParentExpensesItemID = e.ParentExpensesItemID ?? 0, FullName = e.ParentExpensesItemID != null ? e.ExpensesItem1.Name + "->" + e.Name : e.Name };
        }

        #endregion

        public static bool ShowAllLevels { get; set; }

        public static List<ExpensesItemsEntity> GetExpensesItems()
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                return dataContext.ExpensesItems.Select(e => ExpensesItemToExpensesItemsEntity(e)).ToList();
            }
        }

        public static ExpensesItemsEntity GetExpensesItemsByID(int expensesItemID)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                return ExpensesItemToExpensesItemsEntity(dataContext.ExpensesItems.First(e => e.ExpensesItemID == expensesItemID));
            }
        }

        public static List<ExpensesDetailsEntity> GetExpensesDetails(DateTime startDate, DateTime endDate)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                return dataContext.ExpensesDetails.Where(e => e.Date >= startDate && e.Date <= endDate).Select(e => expensesDetailToExpensesDetailsEntity(e)).ToList();
            }
        }

        public static ExpensesDetailsEntity GetExpensesDetailsByID(int expensesDetailsID)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                return expensesDetailToExpensesDetailsEntity(dataContext.ExpensesDetails.First(e => e.ExpensesDetailsID == expensesDetailsID));
            }
        }

        public static void SaveExpensesDetails(ExpensesDetailsEntity expensesDetailsEntity)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                if (expensesDetailsEntity.Cost > 0)
                {
                    if (expensesDetailsEntity.ExpensesDetailsID > 0)
                    {
                        //edit
                        ExpensesDetail expensesDetail = dataContext.ExpensesDetails.FirstOrDefault(e => e.ExpensesDetailsID == expensesDetailsEntity.ExpensesDetailsID);
                        if (expensesDetail != null)
                        {
                            expensesDetail.Cost = expensesDetailsEntity.Cost;
                            expensesDetail.Date = expensesDetailsEntity.Date;
                            expensesDetail.Description = expensesDetailsEntity.Description;
                            dataContext.SubmitChanges();
                        }
                        else
                        {
                            throw new InvalidConstraintException("Запис з витратами для зміни не знайдений №" + expensesDetailsEntity.ExpensesDetailsID);
                        }
                    }
                    else
                    {
                        //new
                        dataContext.ExpensesDetails.InsertOnSubmit(new ExpensesDetail()
                        {
                            ExpensesItemID = expensesDetailsEntity.ExpensesItemID,
                            Cost = expensesDetailsEntity.Cost,
                            Date = expensesDetailsEntity.Date,
                            Description = expensesDetailsEntity.Description
                        });
                        dataContext.SubmitChanges();
                    }
                }
                else
                {
                    throw new InvalidConstraintException("Сума повинна бути > 0");
                }
            }
        }

        public static void DeleteExpensesDetails(int expensesDetailsID)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                dataContext.ExpensesDetails.DeleteAllOnSubmit(dataContext.ExpensesDetails.Where(e => e.ExpensesDetailsID == expensesDetailsID));
                dataContext.SubmitChanges();
            }
        }
    }
}
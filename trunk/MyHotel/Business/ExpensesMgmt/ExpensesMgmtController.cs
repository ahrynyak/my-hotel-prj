using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyHotel.Utils;
using MyHotel.LINQDB;
using MyHotel.Business.Entity.Expenses;
using System.Data;

namespace MyHotel.Business.ExpensesMgmt
{
    public class ExpensesMgmtController
    {
        public static DateTime GetDefaultStartDate()
        {
            return DateTime.Now.AddDays(-DateTime.Now.Day + 1);
        }

        public static DateTime GetDefaultEndDate()
        {
            return DateTime.Now;
        }

        #region Converters

        private static ExpensesDetailsEntity expensesDetailsToExpensesDetailsEntity(ExpensesDetail e)
        {
            return new ExpensesDetailsEntity() { ExpensesDetailsID = e.ExpensesDetailsID, ExpensesItemID = e.ExpensesItemID, Cost = e.Cost, Date = e.Date, Description = e.Description };
        }

        private static ExpensesItemsEntity expensesDetailsToExpensesItemsEntity(ExpensesItem e)
        {
            return new ExpensesItemsEntity() { ExpensesItemID = e.ExpensesItemID, Name = e.Name, ParentExpensesItemID = e.ParentExpensesItemID ?? 0 };
        }

        #endregion

        public static List<ExpensesItemsEntity> GetExpensesItems()
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                return dataContext.ExpensesItems.Select(e => expensesDetailsToExpensesItemsEntity(e)).ToList();
            }
        }

        public static ExpensesItemsEntity GetExpensesItemsByID(int expensesItemID)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                return expensesDetailsToExpensesItemsEntity(dataContext.ExpensesItems.First(e => e.ExpensesItemID == expensesItemID));
            }
        }

        public static List<ExpensesDetailsEntity> GetExpensesDetails(DateTime startDate, DateTime endDate)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                return dataContext.ExpensesDetails.Where(e => e.Date >= startDate && e.Date <= endDate).Select(e => expensesDetailsToExpensesDetailsEntity(e)).ToList();
            }
        }

        public static ExpensesDetailsEntity GetExpensesDetailsByID(int expensesDetailsID)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                return expensesDetailsToExpensesDetailsEntity(dataContext.ExpensesDetails.First(e => e.ExpensesDetailsID == expensesDetailsID));
            }
        }

        public static void SaveExpensesDetails(ExpensesDetailsEntity expensesDetailsEntity)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
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
                        Description = expensesDetailsEntity.Description });
                    dataContext.SubmitChanges();
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
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyHotel.Utils;
using MyHotel.LINQDB;
using MyHotel.Business.Entity.Expenses;

namespace MyHotel.Business.ExpensesMgmt
{
    public class ExpensesMgmtController
    {
        public static DateTime GetDefaultStartDate()
        {
            return DateTime.Now;
        }

        public static DateTime GetDefaultEndDate()
        {
            return DateTime.Now.AddMonths(6);
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

        public static List<ExpensesItemsEntity> GetExpensesItems(int expensesItemID)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                if (expensesItemID == 0)
                {
                    return dataContext.ExpensesItems.Where(e => e.ParentExpensesItemID == null).Select(e => expensesDetailsToExpensesItemsEntity(e)).ToList();
                }
                else
                {
                    return dataContext.ExpensesItems.Where(e => e.ParentExpensesItemID == expensesItemID).Select(e => expensesDetailsToExpensesItemsEntity(e)).ToList();
                }
            }
        }

        public static List<ExpensesDetailsEntity> GetExpensesDetails(int expensesItemID)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {

                return dataContext.ExpensesDetails.Where(e => e.ExpensesItemID == expensesItemID).Select(e => expensesDetailsToExpensesDetailsEntity(e)).ToList();
            }
        }

        //public static void SaveExpensesDetails(ExpensesGridView expensesGridView)
        //{
        //    using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
        //    { }
        //}

        //public static void DeleteExpensesDetails(ExpensesGridView expensesGridView)
        //{
        //    using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
        //    { }
        //}
    }
}
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

        private static ExpensesGridView expensesDetailsToExpensesDetailsEntity(ExpensesDetail e)
        {
            return new ExpensesGridView() { ExpensesDetailsID = e.ExpensesDetailsID, ExpensesItemID = e.ExpensesItemID, Cost = e.Cost, Date = e.Date, Description = e.Description, Name = e.ExpensesItem.Name, ParentExpensesItemID = e.ExpensesItem.ParentExpensesItemID ?? 0 };
        }

        #endregion

        public static List<ExpensesGridView> GetExpensesGridView()
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {

                return dataContext.ExpensesDetails.Select(e => expensesDetailsToExpensesDetailsEntity(e)).ToList();
            }
        }


        public static void SaveExpensesDetails(ExpensesGridView expensesGridView)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            { }
        }

        public static void DeleteExpensesDetails(ExpensesGridView expensesGridView)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            { }
        }
    }
}
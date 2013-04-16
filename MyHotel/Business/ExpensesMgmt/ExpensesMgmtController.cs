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

        private static ExpensesItemsEntity expensesItemsToExpensesItemsEntity(ExpensesItem e)
        {
            return new ExpensesItemsEntity() { ExpensesItemID = e.ExpensesItemID, Name = e.Name, ParentExpensesItemID = e.ParentExpensesItemID ?? 0 };
        }
        
        private static ExpensesDetailsEntity expensesDetailsToExpensesDetailsEntity(ExpensesDetail e)
        {
            return new ExpensesDetailsEntity() { ExpensesDetailsID = e.ExpensesDetailsID, ExpensesItemID = e.ExpensesItemID, Cost = e.Cost, Date = e.Date, Description = e.Description };
        }

        #endregion

        public static List<ExpensesItemsEntity> GetExpensesItemsGroups()
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                return dataContext.ExpensesItems.Where(e => e.ParentExpensesItemID == null).Select(e => expensesItemsToExpensesItemsEntity(e)).ToList();
            }
        }

        public static List<ExpensesItemsEntity> GetExpensesItemsSubGroups(ExpensesItemsEntity expensesItemsEntity)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                return dataContext.ExpensesItems.Where(e => e.ParentExpensesItemID == expensesItemsEntity.ExpensesItemID).Select(e => expensesItemsToExpensesItemsEntity(e)).ToList();
            }
        }

        public static List<ExpensesDetailsEntity> GetExpensesDetails(ExpensesItemsEntity expensesItemsEntity)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                return dataContext.ExpensesDetails.Where(e => e.ExpensesItemID == expensesItemsEntity.ExpensesItemID).Select(e => expensesDetailsToExpensesDetailsEntity(e)).ToList();
            }
        }


        public static void SaveExpensesDetails(ExpensesDetailsEntity roomBookingEntity)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            { }
        }

        public static void DeleteExpensesDetails(int expensesDetailsID)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            { }
        }
    }
}
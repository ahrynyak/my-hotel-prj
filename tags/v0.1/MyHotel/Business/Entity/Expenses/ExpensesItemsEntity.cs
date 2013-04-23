using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyHotel.Business.Entity.Expenses
{
    [Serializable]
    public class ExpensesItemsEntity
    {
        public int ExpensesItemID { get; set; }
        public int ParentExpensesItemID { get; set; }
        public string Name { get; set; }
        public string FullName { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyHotel.Business.Entity.Expenses
{
    public class ExpensesItemsEntity
    {
        public int ExpensesItemID { get; set; }
        public int ParentExpensesItemID { get; set; }
        public string Name { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyHotel.Business.Entity.Expenses
{
    public class ExpensesDetailsEntity
    {
        public int ExpensesDetailsID { get; set; }
        public int ExpensesItemID { get; set; }
        public DateTime Date { get; set; }
        public double Cost { get; set; }
        public string Description { get; set; }
    }
}
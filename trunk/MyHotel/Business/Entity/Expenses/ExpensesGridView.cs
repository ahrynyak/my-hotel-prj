﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyHotel.Business.Entity.Expenses
{
    [Serializable]
    public class ExpensesGridView : ExpensesDetailsEntity
    {
        public int ExpensesDetailsID { get; set; }
        public DateTime Date { get; set; }
        public double Cost { get; set; }
        public string Description { get; set; }

        public int ExpensesItemID { get; set; }
        public int ParentExpensesItemID { get; set; }
        public string Name { get; set; }
    }
}
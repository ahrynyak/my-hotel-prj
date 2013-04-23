using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MyHotel.Business.Entity
{
    interface IViewData
    {
        void Refresh(DateTime startDate, DateTime endDate);
        void Refresh();
    }
}

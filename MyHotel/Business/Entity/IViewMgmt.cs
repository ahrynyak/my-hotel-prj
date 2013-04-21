using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MyHotel.Business.Entity
{
    interface IViewData
    {
        void Reload(DateTime startDate, DateTime endDate);
    }
}

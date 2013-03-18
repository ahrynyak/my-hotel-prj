using System;

namespace MyHotel.Utils
{
    public enum EBookingStatus
    {
        NotConfirmed = 0,
        Confirmed = 1,
        Prepaid = 2,
        Fullpaid = 3,
        ProlongationPossible = 4
    }
}
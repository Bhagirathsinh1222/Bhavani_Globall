//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Bhavani_Globall
{
    using System;
    using System.Collections.Generic;
    
    public partial class TransportMaster
    {
        public int TransportId { get; set; }
        public Nullable<int> ShipmentId { get; set; }
        public Nullable<int> EmployeeId { get; set; }
        public string Departure_Location { get; set; }
        public string Arrival_Location { get; set; }
        public Nullable<System.DateTime> Departure_Date { get; set; }
        public Nullable<System.DateTime> Arrival_Date { get; set; }
        public string Distance { get; set; }
        public Nullable<decimal> TransportCost { get; set; }
        public Nullable<bool> IsActive { get; set; }
    }
}

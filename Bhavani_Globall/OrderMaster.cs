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
    
    public partial class OrderMaster
    {
        public int OrderId { get; set; }
        public Nullable<int> CustomerId { get; set; }
        public Nullable<int> ProductId { get; set; }
        public Nullable<int> ShipmentId { get; set; }
        public Nullable<int> PayModeId { get; set; }
        public string TrackingNumber { get; set; }
        public Nullable<System.DateTime> Orderdate { get; set; }
        public Nullable<int> Quantity { get; set; }
        public Nullable<decimal> TotalPrice { get; set; }
        public Nullable<int> UnitId { get; set; }
        public string Note { get; set; }
        public Nullable<bool> IsActive { get; set; }
    }
}

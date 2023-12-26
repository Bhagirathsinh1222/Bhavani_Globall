using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bhavani_Globall
{
    public partial class OrderMaster1 : System.Web.UI.Page
    {
        Bhavani_GlobalEntities db;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProduct();
                BindUnit();
                BindPayMode();
                BindShip();
                BindOrder();
            }

        }


        public void BindOrder()
        {

            string QuantityUnit = "";

            db = new Bhavani_GlobalEntities();

            var rej = (from CM in db.CustomerMasters
                       join OM in db.OrderMasters on CM.CustomerId equals OM.CustomerId
                       join PM in db.ProductMasters on OM.ProductId equals PM.ProductId
                       join UM in db.UnitMasters on OM.UnitId equals UM.UnitId
                       select new
                       {

                           CM.FullName,
                           CM.MobileNo,
                           PM.ProductTitle,
                           QuantityUnit = OM.Quantity + UM.UnitName,
                           OM.TotalPrice,




                       }).ToList();


            GridViewCustomer.DataSource = rej;
            GridViewCustomer.DataBind();

        }




        public void BindProduct()
        {
            db = new Bhavani_GlobalEntities();

            var rej = (from PM in db.ProductMasters where PM.IsActive == true select PM).ToList();

            ddlProduct.DataSource = rej;
            ddlProduct.DataTextField = "ProductTitle";
            ddlProduct.DataValueField = "ProductId";
            ddlProduct.DataBind();
        }

        public void BindPayMode()
        {
            db = new Bhavani_GlobalEntities();

            var rej = (from PM in db.PayModeMasters where PM.IsActive == true select PM).ToList();

            ddlPayModeId.DataSource = rej;
            ddlPayModeId.DataTextField = "PaymodeName";
            ddlPayModeId.DataValueField = "PayModeId";
            ddlPayModeId.DataBind();



        }

        public void BindUnit()
        {
            db = new Bhavani_GlobalEntities();

            var rej = (from UM in db.UnitMasters where UM.IsActive == true select UM).ToList();

            ddlUnitId.DataSource = rej;
            ddlUnitId.DataTextField = "UnitName";
            ddlUnitId.DataValueField = "UnitId";
            ddlUnitId.DataBind();
        }

        public void BindShip()
        {
            db = new Bhavani_GlobalEntities();

            var rej = (from SM in db.ShipmentmethodMasters select SM).ToList();

            ddlShipmentMethod.DataSource = rej;
            ddlShipmentMethod.DataTextField = "ShipMentName";
            ddlShipmentMethod.DataValueField = "ShipMentId";
            ddlShipmentMethod.DataBind();




        }


        public void Cal()
        {
            db = new Bhavani_GlobalEntities();

            int ProductId = Convert.ToInt32(ddlProduct.SelectedValue);
            var rej = (from PM in db.ProductMasters where PM.ProductId == ProductId select PM).FirstOrDefault();
            {
                Session["ProductPrice"] = rej.ProductPrice;
            };

            decimal Price = Convert.ToDecimal(Session["ProductPrice"]);

            decimal TotalPrice = 0;
            int Quantity = Convert.ToInt32(txtQuantity.Text);

            txtTotalPrice.Text = (Quantity * Price).ToString();

        }

        public void InsertOrder()
        {
            db = new Bhavani_GlobalEntities();

            var res = new CustomerMaster
            {
                FullName = txtFullName.Text,
                Email = txtEmail.Text,
                MobileNo = txtMobileNo.Text,
                Address = txtAddress.Text,




            };
            db.CustomerMasters.Add(res);
            db.SaveChanges();

            int id = res.CustomerId;

            var rej = new OrderMaster
            {
                CustomerId = id,
                ProductId = Convert.ToInt32(ddlProduct.SelectedValue),
                ShipmentId = Convert.ToInt32(ddlShipmentMethod.SelectedValue),
                PayModeId = Convert.ToInt32(ddlPayModeId.SelectedValue),
                TrackingNumber = txtTrackingNumber.Text,
                Orderdate = DateTime.Now,
                Quantity = Convert.ToInt32(txtQuantity.Text),
                TotalPrice = Convert.ToDecimal(txtTotalPrice.Text),
                UnitId = Convert.ToInt32(ddlUnitId.SelectedValue),
                Note = txtNote.Text,
                IsActive = true,


            };
            db.OrderMasters.Add(rej);
            db.SaveChanges();

        }





        protected void GridViewCustomer_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            addPanel.Visible = true;
            ListPanel.Visible = false;
        }

        protected void txtQuantity_TextChanged(object sender, EventArgs e)
        {
            Cal();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            InsertOrder();
        }
    }
}
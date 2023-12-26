using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bhavani_Globall
{
    public partial class CustomerList : System.Web.UI.Page
    {
        Bhavani_GlobalEntities db;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCustomer();
            }
        }

        public void BindCustomer()
        {
            db = new Bhavani_GlobalEntities();

            var rej = (from CM in db.InquiryMasters where CM.IsActive == true select CM).ToList();

            GridViewCustomer.DataSource = rej;
            GridViewCustomer.DataBind();

        }

        protected void GridView1_PageIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridViewCustomer_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            BindCustomer();
        }
    }
}
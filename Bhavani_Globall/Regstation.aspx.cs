using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bhavani_Globall
{
    public partial class Regstation : System.Web.UI.Page
    {
        Bhavani_GlobalEntities db;
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        public void InsertRej()
        {
            db = new Bhavani_GlobalEntities();

            int Regid = 0;
            var rej = new RegstationMaster
            {
                FullName = txtFullName.Text,
                MobileNO = txtMobileNO.Text,
                Email = txtEmail.Text,
                Address = txtAddress.Text,
                Password = txtPassword.Text,
                IsActive = true,

            };
            db.RegstationMasters.Add(rej);
            db.SaveChanges();

            Regid = rej.RejId;

            var res = new LoginMaster
            {
                UserName = txtEmail.Text,
                Password = txtPassword.Text,
                RoleId = 1,
                Id = Regid,
                IsActive = true,

            };
            db.LoginMasters.Add(res);
            db.SaveChanges();

        }




        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            InsertRej();
            Response.Redirect("LoginMaster.aspx");
        }
    }
}
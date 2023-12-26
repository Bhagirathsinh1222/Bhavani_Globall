using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bhavani_Globall
{
    public partial class LoginMaster1 : System.Web.UI.Page
    {
        Bhavani_GlobalEntities db;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void Login()
        {
            db = new Bhavani_GlobalEntities();

            var res = (from LG in db.LoginMasters where LG.UserName == txtEmail.Text && LG.Password == txtPassword.Text select LG).ToList();

            if (res != null)
            {
                var rej = (from LG in db.LoginMasters where LG.UserName == txtEmail.Text && LG.Password == txtPassword.Text select LG).FirstOrDefault();
                {
                    Session["RoleId"] = rej.RoleId;
                }
                int RoleId = Convert.ToInt32(Session["RoleId"]);

                if (RoleId == 1)
                {
                    Response.Redirect("ProductMaster.aspx");
                }
                else
                {

                    lblMessage.Text = "Incorrect Password";
                }


            }



        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Login();
        }
    }
}
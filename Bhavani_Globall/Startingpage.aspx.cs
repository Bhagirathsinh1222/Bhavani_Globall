using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bhavani_Globall
{
    public partial class Startingpage : System.Web.UI.Page
    {
        Bhavani_GlobalEntities db;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CountryBind();
                StateBind();
                CityBind();

            }
        }

        public void CountryBind()
        {
            db = new Bhavani_GlobalEntities();

            var lst = (from CM in db.CountryMasters select CM).ToList();

            ddlCountry.DataSource = lst;
            ddlCountry.DataTextField = "countryName";
            ddlCountry.DataValueField = "countryID";
            ddlCountry.DataBind();

        }
        public void StateBind()
        {
            db = new Bhavani_GlobalEntities();
            var rej = (from SM in db.StateMasters where SM.countryID == ddlCountry.SelectedItem.Value select SM).ToList();

            ddlState.DataSource = rej;
            ddlState.DataTextField = "stateName";
            ddlState.DataValueField = "stateID";
            ddlState.DataBind();

        }
        public void CityBind()
        {
            db = new Bhavani_GlobalEntities();

            int stateid = Convert.ToInt32(ddlState.SelectedValue);

            var rej = (from CM in db.CityMasters where CM.stateID == stateid select CM).ToList();

            ddlCity.DataSource = rej;
            ddlCity.DataTextField = "cityName";
            ddlCity.DataValueField = "cityID";
            ddlCity.DataBind();

        }

        public void insertCustomer()
        {
            db = new Bhavani_GlobalEntities();



            var rej = new CustomerMaster
            {
                FullName = txtFullName.Text,
                Email = txtEmail.Text,
                MobileNo = txtMobileNo.Text,

                Address = txtAddress.Text,
                ShipmentMethod = txtAddress.Text,
                Note = txtNote.Text,
                IsActive = true,
            };
            db.CustomerMasters.Add(rej);
            db.SaveChanges();


        }








        protected void Button1_Click(object sender, EventArgs e)
        {
            insertCustomer();
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            StateBind();

        }

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            CityBind();
        }
    }
}
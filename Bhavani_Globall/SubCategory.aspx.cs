using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bhavani_Globall
{
    public partial class SubCategory : System.Web.UI.Page
    {
        Bhavani_GlobalEntities db;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SubcategoryBind();
                bindCategory();
            }
        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Common objc = new Common();
            int SubCategoryID = 0;
            SubCategoryID = Convert.ToInt32(e.CommandArgument);
            SubCategory1 = SubCategoryID;

            db = new Bhavani_GlobalEntities();
            SubcategoryMaster ObjS = new SubcategoryMaster();

            if (e.CommandName == "SubDelete")
            {
                var rej = (from SM in db.SubcategoryMasters where SM.SubcategoryId == SubCategoryID select SM).FirstOrDefault();
                rej.IsActive = false;

                db.SaveChanges();
                SubcategoryBind();

            }

            if (e.CommandName == "SubEdit")
            {
                AddPenal.Visible = true;
                ListPanel.Visible = false;

                var rej = (from SM in db.SubcategoryMasters
                           where SM.SubcategoryId == SubCategoryID
                           select SM).FirstOrDefault();
                {



                }


                SubcategoryBind();
            }

        }

        protected void btnAdd_Click1(object sender, EventArgs e)
        {
            AddPenal.Visible = true;
            ListPanel.Visible = false;
        }

        public void SubcategoryBind()
        {
            db = new Bhavani_GlobalEntities();
            var list = (from S in db.SubcategoryMasters where S.IsActive == true select S).ToList();

            GridViewSub.DataSource = list;
            GridViewSub.DataBind();

        }

        public void InsertSubCategory()
        {
            db = new Bhavani_GlobalEntities();

            //int result = 0;
           

            if (SubCategory1 == 0)
            {
                var rej = new SubcategoryMaster
                {
                    CategoryId = Convert.ToInt32(ddlCategory.SelectedItem.Value),
                    SubcategoryName = txtsubCategory.Text,
                    SubCategoryDetails = txtSubcategorydetails.Text,
                    IsActive = true,
                };
                db.SubcategoryMasters.Add(rej);
                db.SaveChanges();

            }

            else if (SubCategory1 > 0)
            {

                var rej = (from SM in db.SubcategoryMasters
                           where SM.SubcategoryId == SubCategory1
                           select SM).FirstOrDefault();

                rej.SubcategoryName = txtsubCategory.Text;
                rej.SubCategoryDetails = txtSubcategorydetails.Text;
                db.SaveChanges();

                SubcategoryBind();

                Response.Redirect("SubCategory.aspx");
            }
        }
        public void bindCategory()
        {
            var rej = (from CM in db.CategoryMasters select CM).ToList();

            ddlCategory.DataSource = rej;
            ddlCategory.DataTextField = "CategoryName";
            ddlCategory.DataValueField = "CategoryId";
            ddlCategory.DataBind();

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            InsertSubCategory();
        }
        private long SubCategory1
        {
            get
            {
                if (ViewState["SubcategoryId"] != null)
                {
                    return (long)ViewState["SubcategoryId"];
                }
                return 0;

            }

            set
            {
                ViewState["SubcategoryId"] = value;
            }
        }
    }
}
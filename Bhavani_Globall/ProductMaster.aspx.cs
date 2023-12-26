using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bhavani_Globall
{
    public partial class ProductMaster1 : System.Web.UI.Page
    {
        Bhavani_GlobalEntities db;
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                BindProduct();
                CategoryBind();
                SubCategory();
                BindUnit();
            }
        }

        public void BindProduct()
        {
            Common objc = new Common();
            db = new Bhavani_GlobalEntities();
            var rej = (from PM in db.ProductMasters where PM.IsActive == true select PM).ToList();

            GridViewProduct.DataSource = rej;
            GridViewProduct.DataBind();
        }

        public void CategoryBind()
        {
            db = new Bhavani_GlobalEntities();
            var res = (from CM in db.CategoryMasters select CM).ToList();

            ddlCategoryName.DataSource = res;
            ddlCategoryName.DataTextField = "CategoryName";
            ddlCategoryName.DataValueField = "CategoryId";
            ddlCategoryName.DataBind();

        }
        public void SubCategory()
        {
            db = new Bhavani_GlobalEntities();
            int id = Convert.ToInt32(ddlCategoryName.SelectedItem.Value);

            var rej = (from SM in db.SubcategoryMasters where SM.CategoryId == id select SM).ToList();

            ddlSubCategory.DataSource = rej;
            ddlSubCategory.DataTextField = "SubcategoryName";
            ddlSubCategory.DataValueField = "SubcategoryId";
            ddlSubCategory.DataBind();
        }

        public void BindUnit()
        {
            db = new Bhavani_GlobalEntities();
            var rej = (from UM in db.UnitMasters select UM).ToList();

            ddlunit.DataSource = rej;
            ddlunit.DataTextField = "UnitName";
            ddlunit.DataValueField = "UnitId";
            ddlunit.DataBind();


        }

        public void InsertProduct()
        {
            db = new Bhavani_GlobalEntities();



            if (Product1 == 0)
            {

                int pid = 0;
                var rej = new ProductMaster
                {
                    CategoryId = Convert.ToInt32(ddlCategoryName.SelectedItem.Value),
                    SubcategoryId = Convert.ToInt32(ddlSubCategory.SelectedItem.Value),
                    ProductTitle = txtProductTitle.Text,
                    ProductDetails = txtProductDetails.Text,
                    ProductPrice = Convert.ToDecimal(txtProductPrice.Text),
                    ProductQuantity = Convert.ToDecimal(txtProductQuantity.Text),
                    ProductImages = lblFilePath.Text,
                    ExpiryDate = Convert.ToDateTime(txtExpiryDate.Text),
                    //UnitId = Convert.ToInt32(ddlunit.SelectedItem.Value),
                    IsActive = true,
                };

                db.ProductMasters.Add(rej);
                db.SaveChanges();

                pid = rej.ProductId;


                BindProduct();
            }
            else if (Product1 > 0)
            {


                var rej = (from PM in db.ProductMasters where PM.ProductId == Product1 select PM).FirstOrDefault();

                rej.CategoryId = Convert.ToInt32(ddlCategoryName.SelectedItem.Value);
                rej.SubcategoryId = Convert.ToInt32(ddlSubCategory.SelectedItem.Value);
                rej.ProductTitle = txtProductTitle.Text;
                rej.ProductDetails = txtProductDetails.Text;
                rej.ProductPrice = Convert.ToDecimal(txtProductPrice);
                rej.ProductQuantity = Convert.ToDecimal(txtProductQuantity);
                rej.ProductImages = lblFilePath.Text;
                rej.ExpiryDate = Convert.ToDateTime(txtExpiryDate.Text);
                rej.UnitId = Convert.ToInt32(ddlunit.SelectedValue);
                db.SaveChanges();

                BindProduct();
                Response.Redirect("SubCategory.aspx");

            }


        }






        protected void GridViewProduct_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            db = new Bhavani_GlobalEntities();
            int ProductID = 0;
            ProductID = Convert.ToInt32(e.CommandArgument);
            Product1 = ProductID;

            ProductMaster objP = new ProductMaster();

            if (e.CommandName == "PDelete")
            {
                var rej = (from PM in db.ProductMasters where PM.ProductId == ProductID select PM).FirstOrDefault();
                rej.IsActive = false;

                db.SaveChanges();
                BindProduct();
            }

            if (e.CommandName == "PEdit")
            {
                addPanel.Visible = true;
                ListPanel.Visible = false;
                db = new Bhavani_GlobalEntities();
                var rej = (from PM in db.ProductMasters
                           where
                           PM.ProductId == ProductID
                           select PM).FirstOrDefault();

                if (rej != null)
                {
                    rej.CategoryId = Convert.ToInt32(ddlCategoryName.SelectedItem.Value);
                    rej.SubcategoryId = Convert.ToInt32(ddlSubCategory.SelectedItem.Value);
                    rej.ProductTitle = txtProductTitle.Text;
                    rej.ProductDetails = txtProductDetails.Text;
                    rej.ProductPrice = Convert.ToInt32(txtProductPrice.Text);
                    rej.ProductQuantity = Convert.ToDecimal(txtProductQuantity);
                    rej.ProductImages = lblFilePath.Text;
                    rej.ExpiryDate = Convert.ToDateTime(txtExpiryDate.Text);
                    rej.UnitId = Convert.ToInt32(ddlunit.SelectedValue);



                }
                BindProduct();

            }





        }

        public void UploadImage()
        {
            try
            {
                string filename = "", newfile = "";
                string[] validFileTypes = { "jpeg", "png", "jpg", "bmp", "gif" };

                if (!FileUploadimg.HasFile)
                {
                    this.Page.ClientScript.RegisterStartupScript(GetType(), "ShowAlert", "alert('Please select a file.');", true);
                    FileUploadimg.Focus();
                }


                string ext = System.IO.Path.GetExtension(FileUploadimg.PostedFile.FileName).ToLower();
                bool isValidFile = false;
                for (int i = 0; i < validFileTypes.Length; i++)
                {
                    if (ext == "." + validFileTypes[i])
                    {
                        isValidFile = true;
                        break;
                    }
                }
                if (isValidFile == true)
                {

                    //if (!FileUploadimg.HasFile)
                    //{

                    filename = Server.MapPath(FileUploadimg.FileName);
                    newfile = FileUploadimg.PostedFile.FileName;

                    FileInfo fi = new FileInfo(newfile);

                    // check folder exist or not
                    if (!System.IO.Directory.Exists(@"~\ProductPhoto"))
                    {
                        try
                        {

                            string Imgname = txtProductTitle.Text;

                            string path = Server.MapPath(@"~\ProductPhoto\");

                            System.IO.Directory.CreateDirectory(path);
                            FileUploadimg.SaveAs(path + @"\" + txtProductTitle.Text + ext);

                            ImageProfileImage.ImageUrl = @"~\ProductPhoto\" + txtProductTitle.Text + ext;
                            ImageProfileImage.Visible = true;

                            lblFilePath.Text = Imgname + ext;


                        }
                        catch (Exception ex)
                        {
                            lblFilePath.Text = "Not able to create new directory";

                        }

                    }
                    //}
                }
                else
                {
                    this.Page.ClientScript.RegisterStartupScript(GetType(), "ShowAlert", "alert('Please select valid file.');", true);
                }
            }
            catch (Exception ex)
            {

            }

        }

        private long Product1
        {
            get
            {
                if (ViewState["ProductId"] != null)
                {
                    return (long)ViewState["ProductId"];
                }
                return 0;

            }

            set
            {
                ViewState["ProductId"] = value;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            addPanel.Visible = true;
            ListPanel.Visible = false;
        }

        protected void ddlCategoryName_SelectedIndexChanged(object sender, EventArgs e)
        {
            SubCategory();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            InsertProduct();
        }

        protected void btnfileUpload_Click(object sender, EventArgs e)
        {
            UploadImage();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductMaster.aspx");
        }
    }
}
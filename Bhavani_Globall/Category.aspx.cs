using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bhavani_Globall
{
    public partial class Category : System.Web.UI.Page
    {
        Bhavani_GlobalEntities db;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategory();
            }
        }

        public void BindCategory()
        {
            db = new Bhavani_GlobalEntities();

            var rej = (from CM in db.CategoryMasters where CM.IsActive == true select CM).ToList();

            GridCategory.DataSource = rej;
            GridCategory.DataBind();


        }


        public void UploadImage()
        {
            try
            {
                string filename = "", newfile = "";
                string[] validFileTypes = { "jpeg", "png", "jpg", "bmp", "gif" };

                if (!FileUploadimage.HasFile)
                {
                    this.Page.ClientScript.RegisterStartupScript(GetType(), "ShowAlert", "alert('Please select a file.');", true);
                    FileUploadimage.Focus();
                }


                string ext = System.IO.Path.GetExtension(FileUploadimage.PostedFile.FileName).ToLower();
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

                    if (FileUploadimage.HasFile)
                    {

                        filename = Server.MapPath(FileUploadimage.FileName);
                        newfile = FileUploadimage.PostedFile.FileName;

                        FileInfo fi = new FileInfo(newfile);

                        // check folder exist or not
                        if (!System.IO.Directory.Exists(@"~\ProductPhoto"))
                        {
                            try
                            {

                                string Imgname = txtName.Text;

                                string path = Server.MapPath(@"~\ProductPhoto\");

                                System.IO.Directory.CreateDirectory(path);
                                FileUploadimage.SaveAs(path + @"\" + txtName.Text + ext);

                                ImageProfileImage.ImageUrl = @"~\ProductPhoto\" + txtName.Text + ext;
                                ImageProfileImage.Visible = true;

                                lblFilePath.Text = Imgname + ext;


                            }
                            catch (Exception ex)
                            {
                                lblFilePath.Text = "Not able to create new directory";

                            }

                        }
                    }
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




        public void InsertCategory()
        {
            
            int result = 0;
            db = new Bhavani_GlobalEntities();

            if (CategoryID1 == 0)
            {
                var rej = new CategoryMaster
                {

                    CategoryName = txtName.Text,
                    CategoryImage = lblFilePath.Text,
                    Details = txtDetails.Text,
                    IsActive = true


                };
                db.CategoryMasters.Add(rej);
                result = db.SaveChanges();

            }
            else if (CategoryID1 > 0)
            {
                var rej = (from CM in db.CategoryMasters
                           where CM.CategoryId == CategoryID1
                           select CM).FirstOrDefault();


                rej.CategoryName = txtName.Text;
                rej.Details = txtDetails.Text;
                db.SaveChanges();

                BindCategory();

                Response.Redirect("Category.aspx");

            }
        }



        private long CategoryID1
        {
            get
            {
                if (ViewState["CategoryId"] != null)
                {
                    return (long)ViewState["CategoryId"];

                }
                return 0;
            }
            set
            {
                ViewState["CategoryId"] = value;
            }
        }



        protected void GridCategory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           
            int CategoryID = 0;

            CategoryID = Convert.ToInt32(e.CommandArgument);
            CategoryID1 = CategoryID;

            db = new Bhavani_GlobalEntities();
            CategoryMaster objC = new CategoryMaster();

            if (e.CommandName == "CategoryDelete")
            {


                var rej = (from CM in db.CategoryMasters where CategoryID == CM.CategoryId select CM).FirstOrDefault();
                rej.IsActive = false;

                db.SaveChanges();
                BindCategory();
            }
            if (e.CommandName == "CategoryEdit")
            {

                addPanel.Visible = true;

                ListPanel.Visible = false;

                var rej = (from CM in db.CategoryMasters
                           where CM.CategoryId == CategoryID
                           select CM).FirstOrDefault();


                if (rej != null)
                {
                    txtName.Text = rej.CategoryName;
                    txtDetails.Text = rej.Details;

                }
                BindCategory();

            }

        }

        protected void btnfileUpload_Click(object sender, EventArgs e)
        {
            UploadImage();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            InsertCategory();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            addPanel.Visible = true;
            ListPanel.Visible = false;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Category.aspx");
        }
    }
}
<%@ Page Title="" Language="C#" MasterPageFile="~/BhavaniMaster.Master" AutoEventWireup="true" CodeBehind="SubCategory.aspx.cs" Inherits="Bhavani_Globall.SubCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form runat="server">
        <div>
            <asp:Panel ID="ListPanel" runat="server">
                <div class="Search">
                    <div class="col-md-6">
                        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                        <asp:Button ID="btnSearch" Width="12%" class="btn btn-block btn-secondary" runat="server" Text="search" />
                        <asp:Button ID="btnAdd" Width="12%" class="btn btn-block btn-info" OnClick="btnAdd_Click1" runat="server" Text="Add New category" />

                    </div>
                </div>
                <div >
                    <asp:GridView ID="GridViewSub" AutoGenerateColumns="false" class="table table-bordered table-striped dataTable dtr-inline" OnRowCommand="GridView1_RowCommand" runat="server">
                        <Columns>
                            
                            <asp:TemplateField HeaderText="SubCategoryName">
                                <ItemTemplate>
                                    <asp:Label ID="lblSubCategory" runat="server" Text='<%# Eval("SubcategoryName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField  HeaderText="Details">
                                <ItemTemplate>
                                    <asp:Label ID="lblDetails" runat="server" Text='<%# Eval("SubCategoryDetails") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnEdit" runat="server" class="btn-donate" CommandName="SubEdit" CommandArgument='<%# Eval("SubcategoryId") %>' Text="Edit" />
                                    <asp:Button ID="btnDelete" class="btn-donate" CommandName="SubDelete" CommandArgument='<%# Eval ("SubcategoryId") %>' runat="server" Text="Delete" />
                                    <%--<asp:Button ID="btnView" class="btn-donate" CommandName="SubView" CommandArgument='<%# Eval ("SubcategoryId") %>' runat="server" Text="View" />--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                             
                        </Columns>




                    </asp:GridView>

                </div>
            </asp:Panel>
        </div>
        <div class="card-body">
            <div class="col-md-6">
                <div class="form-group">
                    <asp:Panel ID="AddPenal" Visible="false" runat="server">

                        <div>

                            <label>CategoryName</label>
                            <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>

                        </div>

                        <div>

                            <label>SubCategory Name</label>
                            <asp:TextBox ID="txtsubCategory" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorDetails" runat="server" ForeColor="Red"
                                ControlToValidate="txtsubCategory" ErrorMessage="Enter the Subcategory name" ValidationGroup="p1"
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </div>

                        <div>

                            <label>SubCategory Details</label>
                            <asp:TextBox ID="txtSubcategorydetails" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"
                                ControlToValidate="txtSubcategorydetails" ErrorMessage="Enter the Details" ValidationGroup="p1"
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </div>



                        <div>

                            <asp:Button ID="btnSubmit" Width="90px" OnClick="btnSubmit_Click" ValidationGroup="p1" class="btn btn-block btn-success" runat="server" Text="Submit" />

                            <asp:Button ID="btnBack" class="btn btn-block bg-gradient-danger" Width="35%"  runat="server" Text="BackToHome" />
                        </div>
                        <div>
                        </div>


                        </div>
                 </asp:Panel>
                </div>
            </div>
        
    </form>
                    

</asp:Content>

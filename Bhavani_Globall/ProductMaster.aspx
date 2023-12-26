<%@ Page Title="" Language="C#" MasterPageFile="~/BhavaniMaster.Master" AutoEventWireup="true" CodeBehind="ProductMaster.aspx.cs" Inherits="Bhavani_Globall.ProductMaster1" %>
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
                        <asp:Button ID="btnAdd" OnClick="btnAdd_Click" Width="12%" class="btn btn-block btn-info" runat="server" Text="Add New category" />

                    </div>
                </div>
                <div>
                </div>

                <asp:GridView ID="GridViewProduct" class="table table-bordered table-striped dataTable dtr-inline" OnRowCommand="GridViewProduct_RowCommand" AutoGenerateColumns="false" runat="server">

                    <Columns>
                        <asp:TemplateField HeaderText="Product Title">
                            <ItemTemplate>
                                <asp:Label ID="lblProducttitle" runat="server" Text='<%# Eval("ProductTitle")  %>'></asp:Label>

                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="ProductDetails">
                            <ItemTemplate>
                                <asp:Label ID="lblProductDetails" runat="server" Text='<%# Eval("ProductDetails")  %>'></asp:Label>

                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="ProductPrice">
                            <ItemTemplate>
                                <asp:Label ID="lblProductPrice" runat="server" Text='<%# Eval("ProductPrice")  %>'></asp:Label>

                            </ItemTemplate>
                        </asp:TemplateField>




                        <asp:TemplateField HeaderText="Product Images">
                            <ItemTemplate>
                                <asp:Image ID="ImageProduct" Height="50px" Width="50px" ImageUrl='<%#"../ProductPhoto/"+ Eval ("ProductImages") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ExpiryDate">
                            <ItemTemplate>
                                <asp:Label ID="lblExpiryDate" runat="server" Text='<%# Eval("ExpiryDate")  %>'></asp:Label>

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="UnitId">
                            <ItemTemplate>
                                <asp:Label ID="lblUnitId" runat="server" Text='<%# Eval("UnitId")  %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>

                            <ItemTemplate>
                                <asp:Button ID="btnEdit" class="btn-donate" CommandName="PEdit" CommandArgument='<%# Eval("ProductId") %>' runat="server" Text="Edit" />
                                <asp:Button ID="btnDelete" class="btn-donate" CommandName="PDelete" CommandArgument='<%# Eval("ProductId") %>' runat="server" Text="Delete" />
                                <%-- <asp:Button ID="btnView" CommandName="PView" CommandArgument='<%# Eval("ProductId") %>' runat="server" Text="Edit" />
                                --%>
                            </ItemTemplate>
                        </asp:TemplateField>



                    </Columns>
                </asp:GridView>
            </asp:Panel>

            <div class="card-body">
                <div class="col-md-6">
                    <div class="form-group">
                        <asp:Panel ID="addPanel" Visible="false" runat="server">


                            <div>
                                <label>Select The Category Name</label>
                                <asp:DropDownList ID="ddlCategoryName" class="form-control" OnSelectedIndexChanged="ddlCategoryName_SelectedIndexChanged" AutoPostBack="true" runat="server"></asp:DropDownList>

                            </div>
                            <div>
                                <label>Select The SubCategory Name</label>
                                <asp:DropDownList ID="ddlSubCategory" class="form-control" runat="server"></asp:DropDownList>

                            </div>
                            <div>
                                <label>Product Title </label>

                                <asp:TextBox ID="txtProductTitle" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ForeColor="Red"
                                    ControlToValidate="txtProductTitle" ErrorMessage="Please Enter The Product Title" ValidationGroup="p1"
                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </div>
                            <div>
                                <label>ProductDetails</label>
                                <asp:TextBox ID="txtProductDetails" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red"
                                    ControlToValidate="txtProductDetails" ErrorMessage="Please Enter The ProductDetails" ValidationGroup="p1"
                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </div>
                            <div>

                                <label>ProductPrice</label>
                                <asp:TextBox ID="txtProductPrice" class="form-control" runat="server"></asp:TextBox>
                                
                            </div>
                            <div>
                                <label>Select Unit</label>

                                <asp:DropDownList ID="ddlunit" runat="server"></asp:DropDownList>
                            </div>
                            <div>
                                <label>ProductQuantity</label>
                                <asp:TextBox ID="txtProductQuantity" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red"
                                    ControlToValidate="txtProductQuantity" ErrorMessage="Please Enter The ProductQuantity" ValidationGroup="p1"
                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </div>

                            <div>
                                <label>Product Images</label>
                                <asp:FileUpload ID="FileUploadimg" class="form-control" runat="server" />
                            </div>
                            <div>
                                <label>ExpiryDate</label>
                                <asp:TextBox ID="txtExpiryDate" TextMode="Date" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"
                                    ControlToValidate="txtExpiryDate" ErrorMessage="Please Enter The txtExpiryDate" ValidationGroup="p1"
                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </div>



                            <div>
                                <asp:Button ID="btnfileUpload" Width="90px" class="btn btn-block btn-info" runat="server" OnClick="btnfileUpload_Click" Text="upload" />
                                <asp:Button ID="btnSubmit" Width="90px" ValidationGroup="p1" class="btn btn-block btn-success" OnClick="btnSubmit_Click" runat="server" Text="Submit" />

                                <asp:Button ID="btnBack" OnClick="btnBack_Click" class="btn btn-block bg-gradient-danger" Width="35%" runat="server" Text="BackToHome" />
                            </div>
                            <div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">

                                    <asp:Image ID="ImageProfileImage" Visible="true" Width="50%" runat="server" />


                                    <asp:Label ID="lblFilePath" Visible="true" runat="server" Text=""></asp:Label>

                                </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </form>

</asp:Content>

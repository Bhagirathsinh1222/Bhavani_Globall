<%@ Page Title="" Language="C#" MasterPageFile="~/BhavaniMaster.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Bhavani_Globall.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
       
        <div>
            <asp:Panel ID="ListPanel" runat="server">
                <div class="Search">
                    <div class="col-md-6">
                        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                        <asp:Button ID="btnSearch"  width=12% class="btn btn-block btn-secondary"  runat="server" Text="search" />
                        <asp:Button ID="btnAdd" width=12%     class="btn btn-block btn-info"  OnClick="btnAdd_Click" runat="server" Text="Add New category" />

                    </div>
                </div>
                <div>
                    <asp:GridView ID="GridCategory" class="table table-bordered table-striped dataTable dtr-inline" OnRowCommand="GridCategory_RowCommand" AutoGenerateColumns="false" runat="server">
                        <Columns>
                           <%-- <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Label ID="lblsrNo"  runat="server" Text="<%# Container.DataItem +1% %>"</asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>

                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblName" Text='<%# Eval ("CategoryName") %>' runat="server" ></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Details">
                                <ItemTemplate>

                                    <asp:Label ID="lblDetails" Text='<%# Eval("Details") %>' runat="server" ></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                     <asp:Image ID="ImageCategory" Height="70px" Width="75px" ImageUrl='<%# "../ProductPhoto/"+ Eval("CategoryImage") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>

                                    <asp:Button ID="btnEdit" CommandName="CategoryEdit" class="btn-donate" CommandArgument='<%# Eval("CategoryId") %>' runat="server" Text="Edit" />
                                    <asp:Button ID="BtnDelete" runat="server" class="btn-donate" CommandArgument='<%# Eval("CategoryId") %>' CommandName="CategoryDelete" Text="Delete" />
                                    <asp:Button ID="BtnView" runat="server" class="btn-donate" CommandArgument='<%# Eval("CategoryId") %>' CommandName="CategoryView" Text="View" />
                                </ItemTemplate>
                            </asp:TemplateField>
                             
                        </Columns>
                         
                    </asp:GridView>
            </asp:Panel>
        </div>
         <div class="card-body">
                                <div class="col-md-6">
                                    <div class="form-group">
            <asp:Panel ID="addPanel" Visible="false" runat="server">


                <div>
                    <label> CategoryName</label>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"
                        ControlToValidate="txtName" ErrorMessage="Please Enter The Category" ValidationGroup="p1" 
                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>

                <div>

                    <label> CategoryDetails</label>
                    <asp:TextBox ID="txtDetails" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorDetails" runat="server" ForeColor="Red"
                        ControlToValidate="txtDetails" ErrorMessage="Enter the Details" ValidationGroup="p1" 
                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
                
                <div>
                    <label>
                       CategoryImage
                    </label>

                    <asp:FileUpload ID="FileUploadimage"  class="form-control" runat="server" />
                </div>


                <div>
                    <asp:Button ID="btnfileUpload" Width="90px" class="btn btn-block btn-info" OnClick="btnfileUpload_Click" runat="server" Text="upload" />
                    <asp:Button ID="btnSubmit" Width="90px" ValidationGroup="p1" class="btn btn-block btn-success" OnClick="btnSubmit_Click" runat="server" Text="Submit" />

                    <asp:Button ID="btnBack" class="btn btn-block bg-gradient-danger" Width="35%" OnClick="btnBack_Click" runat="server" Text="BackToHome" />
                </div>
                <div>
                              </div>
                        <div class="col-md-4">
                                    <div class="form-group">

                                        <asp:Image ID="ImageProfileImage" Width="50%" runat="server" />

                                      
                                        <asp:Label ID="lblFilePath" runat="server" Text=""></asp:Label>
                                  
                                        </div>

                             
                </div>




            </asp:Panel>
        </div>
            </div>
             </div>
    </form>
  
</asp:Content>

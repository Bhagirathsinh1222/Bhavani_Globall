<%@ Page Title="" Language="C#" MasterPageFile="~/BhavaniMaster.Master" AutoEventWireup="true" CodeBehind="OrderMaster.aspx.cs" Inherits="Bhavani_Globall.OrderMaster1" %>
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

                <asp:GridView ID="GridViewCustomer" class="table table-bordered table-striped dataTable dtr-inline" OnRowCommand="GridViewCustomer_RowCommand" AutoGenerateColumns="false" runat="server">
                    <Columns>
                        <asp:TemplateField HeaderText="FullName">
                            <ItemTemplate>
                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval ("FullName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="MobileNo">
                            <ItemTemplate>
                                <asp:Label ID="lblMobileNo" runat="server" Text='<%# Eval ("MobileNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ProductTitle">
                            <ItemTemplate>
                                <asp:Label ID="lblProductTitle" runat="server" Text='<%# Eval ("ProductTitle") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Quantity">
                            <ItemTemplate>
                                <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval ("QuantityUnit") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%--<asp:TemplateField HeaderText="UnitId">
                            <ItemTemplate>
                                <asp:Label ID="lblUnitId" runat="server" Text='<%# Eval ("UnitId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>

                        <asp:TemplateField HeaderText="TotalPrice">
                            <ItemTemplate>
                                <asp:Label ID="lblMobileNo" runat="server" Text='<%# Eval ("TotalPrice") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                    </Columns>
                </asp:GridView>
            </asp:Panel>
            <div class="card-body">
                <div class="col-md-6">
                    <div class="form-group">
                        <asp:Panel ID="addPanel" Visible="false" runat="server">

                            <%--                           <asp:UpdatePanel></asp:UpdatePanel>--%>
                            <div>
                                <label>FullName</label>
                                <asp:TextBox ID="txtFullName" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div>
                                <label>Email</label>
                                <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div>
                                <label>MobileNo </label>

                                <asp:TextBox ID="txtMobileNo" class="form-control" runat="server"></asp:TextBox>

                            </div>
                            <div>
                                <label>Address</label>
                                <asp:TextBox ID="txtAddress" class="form-control" runat="server"></asp:TextBox>

                            </div>
                            <div>
                                <label>ProductId</label>

                                <asp:DropDownList ID="ddlProduct" class="form-control" runat="server"></asp:DropDownList>
                            </div>
                            <%-- <div>

                                <label>ProductPrice</label>
                                <asp:TextBox ID="txtProductPrice" class="form-control" runat="server"></asp:TextBox>

                            </div>--%>
                            <div>

                                <label>ShipmentMethod</label>
                                <asp:DropDownList ID="ddlShipmentMethod" class="form-control" runat="server"></asp:DropDownList>

                            </div>

                            <div>
                                <label>PayMode</label>

                                <asp:DropDownList ID="ddlPayModeId" class="form-control" runat="server"></asp:DropDownList>
                            </div>
                            <div>
                                <label>Tracking Number</label>
                                <asp:TextBox ID="txtTrackingNumber" class="form-control" runat="server"></asp:TextBox>

                            </div>
                            <div>
                                <label>Orderdate</label>
                                <asp:TextBox ID="txtOrderdate" TextMode="Date" class="form-control" runat="server"></asp:TextBox>

                            </div>
                            <div>
                                <label>Quantity</label>
                                <asp:TextBox ID="txtQuantity" OnTextChanged="txtQuantity_TextChanged" AutoPostBack="true" class="form-control" runat="server"></asp:TextBox>

                            </div>
                            <div>
                                <label>UnitId</label>

                                <asp:DropDownList ID="ddlUnitId" class="form-control" runat="server"></asp:DropDownList>
                            </div>


                            <div>
                                <label>TotalPrice</label>
                                <asp:TextBox ID="txtTotalPrice" class="form-control" runat="server"></asp:TextBox>

                            </div>

                            <div>
                                <label>Note</label>
                                <asp:TextBox ID="txtNote" class="form-control" runat="server"></asp:TextBox>

                            </div>

                            <div>

                                <asp:Button ID="btnSubmit" Width="90px" OnClick="btnSubmit_Click" class="btn btn-block btn-success" runat="server" Text="Submit" />

                                <asp:Button ID="btnBack" class="btn btn-block bg-gradient-danger" Width="35%" runat="server" Text="BackToHome" />
                            </div>
                            <div>
                            </div>

                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

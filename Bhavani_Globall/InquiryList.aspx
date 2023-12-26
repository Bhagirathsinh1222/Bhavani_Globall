<%@ Page Title="" Language="C#" MasterPageFile="~/BhavaniMaster.Master" AutoEventWireup="true" CodeBehind="InquiryList.aspx.cs" Inherits="Bhavani_Globall.CustomerList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form runat="server">
        <div>
            
                <div class="Search">
                    <div class="col-md-12">
                        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                        <asp:Button ID="btnSearch" Width="12%" class="btn btn-block btn-secondary" runat="server" Text="search" />
                        
                    </div>
                </div>
        </div>


        <asp:GridView ID="GridViewCustomer" AutoGenerateColumns="false"  OnRowCommand="GridViewCustomer_RowCommand"  class="table table-bordered table-striped dataTable dtr-inline" OnPageIndexChanged="GridView1_PageIndexChanged" runat="server">
            <Columns>
                <asp:TemplateField HeaderText="FullNamme">
                    <ItemTemplate>
                        <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MobileNo">
                    <ItemTemplate>
                        <asp:Label ID="lblMobileNo" runat="server" Text='<%# Eval("MobileNo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="countryName">
                    <ItemTemplate>
                        <asp:Label ID="lblcountryName" runat="server" Text='<%# Eval("countryName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="stateName">
                    <ItemTemplate>
                        <asp:Label ID="lblstateName" runat="server" Text='<%# Eval("stateName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="CityName">
                    <ItemTemplate>
                        <asp:Label ID="lblCity" runat="server" Text='<%# Eval("cityName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address">
                    <ItemTemplate>
                        <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ShipmentMethod">
                    <ItemTemplate>
                        <asp:Label ID="lblShipmentMethod" runat="server" Text='<%# Eval("ShipmentMethod") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Note">
                    <ItemTemplate>
                        <asp:Label ID="lblNote" runat="server" Text='<%# Eval("Note") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField> 
            </Columns> 
        </asp:GridView>
         
    </form>
</asp:Content>

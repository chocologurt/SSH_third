<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="SSH3.AdminConsole.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="form-horizontal">
                    <section id="changeSkillForm">
                        <div class="form-horizontal">
                            <hr />
                            <div class="form-group">
                                <asp:Label runat="server" ID="userAccessFail" Text="User's Access Fail Attempt" />
                                <br />
                                <asp:GridView ID="AspNetGridView" runat="server" BackColor="White" BorderColor="#999999"
                                    BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical"
                                    SelectedRowStyle-BackColor="#FFFF99">
                                    <AlternatingRowStyle BackColor="#DCDCDC" />
                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                    
                                </asp:GridView>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" ID="userDeactivation" Text="User's Deactivations" />
                                <br />
                                <asp:Label runat="server" ID="types_of_reasons" Text="Reason 1: The website isn't easy to use. <br /> Reason 2: I don't like this website. <br /> Reason 3: Others ." />
                                <%--<asp:DropDownList runat="server" ID="sort_by" OnSelectedIndexChanged="sort_by_SelectedIndexChanged">
                                    <asp:ListItem Value="Username"> Username</asp:ListItem>
                                    <asp:ListItem Value="Code">Code</asp:ListItem>
                                </asp:DropDownList>--%>

                                <asp:GridView ID="userDeactivateGridView" runat="server" BackColor="White" BorderColor="#999999"
                                    BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical"
                                    SelectedRowStyle-BackColor="#FFFF99">
                                    <AlternatingRowStyle BackColor="#DCDCDC" />
                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                    
                                </asp:GridView>
                            </div>
                            </div>
                        </section>
         </div>
</asp:Content>

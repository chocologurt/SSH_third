<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="SSH3.Account.ProfilePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div id="profilemain" runat="server">
        <div id="profilepageHeader">
            <asp:Image runat="server" ID="userPicture" ImageUrl="~/Imagesss/introductions_800_clr_10909-1.png" Height="100px" Width="100px" />
            <asp:Label runat="server" ID="userFullNameText" Text="Full Name: James Seah" Font-Size="Large"></asp:Label>
        </div>
        <div id="row">
            <asp:Button runat="server" ID="personalInfoButton" CssClass="btn btn-primary" Text="Personal Information" OnClick="personalInfoButton_Click"/>
            <asp:Button runat="server" ID="SkillsOwnedButton" CssClass="btn btn-primary" Text="Skilled Owned" OnClick="SkillsOwnedButton_Click" />
           
        </div>

        <div id="content" runat="server">
            <asp:MultiView runat="server" ID="MultiView1">
                <asp:View ID="personalInfoView" runat="server">
                    <div id="personalInfoContent">
                        <asp:Label runat="server" ID="userEmailLabel" Text="Email:" Font-Size="XX-Large"></asp:Label>
                        <asp:Label runat="server" ID="userEmailText" Text="-insert something here-" Font-Size="XX-Large"></asp:Label>
                        <hr />
                        <asp:Label runat="server" ID="userUsernameLabel" Text="Username:" Font-Size="XX-Large"></asp:Label>
                        <asp:Label runat="server" ID="userUsernameText" Text="-insert something here-" Font-Size="XX-Large"></asp:Label>
                    </div>
                </asp:View>
                <asp:View ID="skillsOwnedView" runat="server">
                    <div id="skillsOwnedContent">
                        <div class="form-group">
                                <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999"
                                    BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical"
                                    SelectedRowStyle-BackColor="#FFFF99">
                                    <AlternatingRowStyle BackColor="#DCDCDC" />
                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#000065" />
                                </asp:GridView>
                            </div>
                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</asp:Content>

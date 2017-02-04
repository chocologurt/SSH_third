<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="SSH3.Account.ProfilePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .tab {
            display: inline;
            padding: 4px 18px 4px 18px;
            background-color: deeppink;
            font-weight: bold;
            color: black;
            border : 1px solid black;
        }

            .tab:hover {
                color: White;
            }

        .tabClicked {
            display: inline;
            padding: 4px 18px 4px 18px;
            color: black;
            background-color: lavenderblush;
            border : 1px solid black;
        }

        /*#tabContents {
            padding: 4px 18px 4px 18px;
            color: black;
            background-color: lavenderblush;
            border: 1px solid black;

        }*/

        #profilePanel {
            padding: 4px 18px 4px 18px;
            color: black;
            background-color: lavenderblush;
            border: 1px solid black;
        }

         #profilepageHeader{
             padding: 4px 18px 4px 18px;
            color: black;
            background-color: lavenderblush;
         }
       
    </style>
    <br />
    <br />
    <div class="panel panel-default" id="profilePanel">
    
        <div id="profilepageHeader" class="panel-heading">
            <asp:Image runat="server" ID="userPicture" ImageUrl="~/Imagesss/introductions_800_clr_10909-1.png" Height="100px" Width="100px" />
            <asp:Label runat="server" ID="userFullNameLabel" Text="Full Name:" Font-Size="X-Large" Font-Italic="True" Font-Bold="True"></asp:Label>
            <asp:Label runat="server" ID="userFullNameText" Text="-insert something here-" Font-Size="X-Large" Font-Italic="True" Font-Bold="True" />
        </div>
       <%-- <div id="row">
            <asp:Button runat="server" ID="personalInfoButton" CssClass="tab" Text="Personal Information" OnClick="personalInfoButton_Click" />
            <asp:Button runat="server" ID="SkillsOwnedButton" CssClass="tab" Text="Skilled Owned" OnClick="SkillsOwnedButton_Click" />
            <asp:Button runat="server" ID="HobbiesButton" CssClass="tab" Text="My Hobbies" OnClick="HobbiesButton_Click" />
        </div>--%>

        <div class="panel-body" runat="server" id="tabContents">
           
                    <div id="personalInfoContent">
                        <h4><u>Personal Information</u></h4>
                        
                        <asp:Label runat="server" ID="userUsernameLabel" Text="Username:" Font-Size="Large" Font-Bold="True"></asp:Label>
                        <asp:Label runat="server" ID="userUsernameText" Text="-insert something here-" Font-Size="Large"></asp:Label>
                        <br />
                        <asp:Label runat="server" ID="userInstitutionLabel" Text="Institution:" Font-Size="Large" Font-Bold="True" />
                        <asp:Label runat="server" ID="userInstitutionText" Text="-insert something here-" Font-Size="Large" />
                        <br />
                        <asp:Label runat="server" ID="userFOILabel" Text="Field Of Industry:" Font-Size="Large" Font-Bold="True" />
                        <asp:Label runat="server" ID="userFOIText" Text="-insert something here-" Font-Size="Large" />
                        <br />
                        <asp:Label runat="server" ID="userDesignationLabel" Text="Designation:" Font-Size="Large" Font-Bold="True" />
                        <asp:Label runat="server" ID="userDesignationText" Text="-insert something here" Font-Size="Large" />
                    </div>
              <hr />
             
                    <div id="skillsOwnedContent">
                        <h4><u>Skills</u></h4>
                  
                        <div class="form-group">
                            <asp:GridView ID="SkillsGridView" runat="server" BackColor="White" BorderColor="#999999"
                                BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical"
                                SelectedRowStyle-BackColor="#FFFF99">
                                <AlternatingRowStyle BackColor="#DCDCDC" />
                                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <HeaderStyle BackColor="#002db3" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />

                            </asp:GridView>
                        </div>
                    </div>
               <hr />
                    <div id="HobbiesContent">
                        <h4><u>Hobbies</u></h4>
      
                        <div class="form-group">
                            <asp:GridView ID="HobbiesGridView" runat="server" BackColor="White" BorderColor="#999999"
                                BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical"
                                SelectedRowStyle-BackColor="#FFFF99">
                                <AlternatingRowStyle BackColor="#DCDCDC" />
                                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <HeaderStyle BackColor="#002db3" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                            
                            </asp:GridView>
                        </div>
                    </div>
            
        </div>
    </div>

</asp:Content>
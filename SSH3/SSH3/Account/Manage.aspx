<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="SSH3.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <div class="panel panel-danger">
        <div class="panel-heading">
    <h2><%: Title %>.</h2>

    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success" style="font-size: large"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>
</div>
        <div class="panel-body">
    <div class="row">
        <div class="col-md-12">
            <div class="form-horizontal">
                <h4>Change your account settings</h4>
                <hr />
                <dl class="dl-horizontal">
                    <dt>
                        <asp:Label runat="server" Text="Password:" Font-Size="Large" />
                        </dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Change]" Visible="false" ID="ChangePassword" runat="server" Font-Size="Large" />
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Create]" Visible="false" ID="CreatePassword" runat="server" Font-Size="Large" />
                    </dd>
                    <dt> &nbsp;</dt>
                    <dd>&nbsp;</dd>
                    <%--<dt>External Logins:</dt>
                    <dd><%: LoginsCount %>
                        <asp:HyperLink NavigateUrl="/Account/ManageLogins" Text="[Manage]" runat="server" />
                    </dd>--%>
                    <%--
                        Phone Numbers can used as a second factor of verification in a two-factor authentication system.
                        See <a href="http://go.microsoft.com/fwlink/?LinkId=403804">this article</a>
                        for details on setting up this ASP.NET application to support two-factor authentication using SMS.
                        Uncomment the following blocks after you have set up two-factor authentication
                    --%>
                    <%--<--%>
                    <dt>
                        <asp:Label runat="server" Text="Phone Number:" Font-Size="Large" />
                        </dt>
                    <% if (HasPhoneNumber)
                        { %>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Add]" Font-Size="Large" />
                    </dd>
                    <% }
                        else
                        { %>
                    <dd>
                        <asp:Label Text="" ID="PhoneNumber" runat="server" Font-Size="Large" />
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Change]" Font-Size="Large" />
                        &nbsp;|&nbsp;
                        <asp:LinkButton Text="[Remove]" OnClick="RemovePhone_Click" runat="server" Font-Size="Large" />
                    </dd>
                    <dt> &nbsp;</dt>
                    <dd>&nbsp;</dd>
                    <% } %>

                   
                    <dt>
                        <asp:Label runat="server" Text="Two-Factor Authentication:" Font-Size="Large" />
                      </dt>
                    <dd>
                        <%--<p>
                            There are no two-factor authentication providers configured. See <a href="http://go.microsoft.com/fwlink/?LinkId=403804">this article</a>
                            for details on setting up this ASP.NET application to support two-factor authentication.
                        </p>--%>
                    <% if (TwoFactorEnabled)
                            { %>

                        <%--                        Enabled--%>
                    <asp:LinkButton Text="[Disable]" runat="server" CommandArgument="false" OnClick="TwoFactorDisable_Click" Font-Size="Large" />

                    <% }
                            else
                         { %>

                    <%--  Disabled--%>
                    <asp:LinkButton Text="[Enable]" CommandArgument="true" OnClick="TwoFactorEnable_Click" runat="server" Font-Size="Large" />

                     <% } %>
                      </dd>
                    <dt> &nbsp;</dt>
                    <dd>&nbsp;</dd>
                    <dt>
                        <asp:Label runat="server" Text="Change Particulars:" Font-Size="Large" />
                        </dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="~/Account/ChangeParticulars" Text="[Change]" ID="ChangeParticulars" runat="server" Font-Size="Large" />
                    </dd>
                    <%--<dt>Profile Picture:</dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/AddorChangeProfilePic" Text="[Add/Change]" ID="AddorChangeProfilePic" runat="server" />
                    </dd>--%>
                    <dt> &nbsp;</dt>
                    <dd>&nbsp;</dd>
                    <dt>
                        <asp:Label runat="server" Text="Skills Owned:" Font-Size="Large" />
                   </dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/AddSkill" Text="[Add]" ID="AddSkills" runat="server" Font-Size="Large" />
                         &nbsp;|&nbsp;
                        <asp:HyperLink NavigateUrl="/Account/DeleteSkill" Text="[Remove]" ID="DeleteSkills" runat="server" Font-Size="Large" />
                    </dd>
                    <dt> &nbsp;</dt>
                    <dd>&nbsp;</dd>
                    <dt>
                        <asp:Label runat="server" Text="Your Hobbies:" Font-Size="Large" />
                    </dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="~/Account/AddHobby" Text="[Add]" ID="AddHobby" runat="server" Font-Size="Large" />
                         &nbsp;|&nbsp;
                        <asp:HyperLink NavigateUrl="~/Account/DeleteHobby" Text="[Remove]" ID="DeleteHobby" runat="server" Font-Size="Large" />
                    </dd>
                    <dt> &nbsp;</dt>
                    <dd>&nbsp;</dd>
                    <dt>
                        <asp:Label runat="server" Text="Deactivate Account" Font-Size="Large" />
                      </dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/DeactivateAccount" Text="[Deactivate]" ID="DeactivateAccount" runat="server" Font-Size="Large" />
                    </dd>
                    <dt>Go to Friend's Profile Page:</dt>
                    <dd>
                        <asp:Button runat="server" ID="FriendPage" Text="Go!" OnClick="FriendPage_Click" />
                    </dd>
                </dl>
            </div>
        </div>
    </div>
        </div>
        </div>
</asp:Content>
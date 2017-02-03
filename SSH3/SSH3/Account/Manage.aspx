<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="SSH3.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>

    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="form-horizontal">
                <h4>Change your account settings</h4>
                <hr />
                <dl class="dl-horizontal">
                    <dt>Password:</dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Change]" Visible="false" ID="ChangePassword" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Create]" Visible="false" ID="CreatePassword" runat="server" />
                    </dd>
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
                    <dt>Phone Number:</dt>
                    <% if (HasPhoneNumber)
                        { %>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Add]" />
                    </dd>
                    <% }
                        else
                        { %>
                    <dd>
                        <asp:Label Text="" ID="PhoneNumber" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Change]" />
                        &nbsp;|&nbsp;
                        <asp:LinkButton Text="[Remove]" OnClick="RemovePhone_Click" runat="server" />
                    </dd>
                    <% } %>

                   
                    <dt>Two-Factor Authentication:</dt>
                    <dd>
                        <%--<p>
                            There are no two-factor authentication providers configured. See <a href="http://go.microsoft.com/fwlink/?LinkId=403804">this article</a>
                            for details on setting up this ASP.NET application to support two-factor authentication.
                        </p>--%>
                    <% if (TwoFactorEnabled)
                            { %>

                        <%--                        Enabled--%>
                    <asp:LinkButton Text="[Disable]" runat="server" CommandArgument="false" OnClick="TwoFactorDisable_Click" />

                    <% }
                            else
                         { %>

                    <%--  Disabled--%>
                    <asp:LinkButton Text="[Enable]" CommandArgument="true" OnClick="TwoFactorEnable_Click" runat="server" />

                     <% } %>
                      </dd>
                    <dt>Change Particulars:</dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="~/Account/ChangeParticulars" Text="[Change]" ID="ChangeParticulars" runat="server" />
                    </dd>
                    <dt>Profile Picture:</dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/AddorChangeProfilePic" Text="[Add/Change]" ID="AddorChangeProfilePic" runat="server" />
                    </dd>
                    <dt>Skills Owned:</dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/AddSkill" Text="[Add]" ID="AddSkills" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/DeleteSkill" Text="[Delete]" ID="DeleteSkills" runat="server" />
                    </dd>
                    <dt>Your Hobbies:</dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="~/Account/AddHobby" Text="[Add]" ID="AddHobby" runat="server" />
                        <asp:HyperLink NavigateUrl="~/Account/DeleteHobby" Text="[Delete]" ID="DeleteHobby" runat="server" />
                    </dd>
                    <dt>Deactivate Account:</dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/DeactivateAccount" Text="[Deactivate]" ID="DeactivateAccount" runat="server" />
                    </dd>
                    <dt>Go to Friend's Profile Page:</dt>
                    <dd>
                        <asp:Button runat="server" ID="FriendPage" Text="Go!" OnClick="FriendPage_Click" />
                    </dd>
                </dl>
            </div>
        </div>
    </div>
</asp:Content>
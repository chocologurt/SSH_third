<%@ Page Title="Manage Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManagePassword.aspx.cs" Inherits="SSH3.Account.ManagePassword" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <div class="form-horizontal">
        <section id="passwordForm">
            <asp:PlaceHolder runat="server" ID="setPassword" Visible="false">
                <p>
                    You do not have a local password for this site. Add a local
                        password so you can log in without an external login.
                </p>
                <div class="form-horizontal">
                    <h4>Set Password Form</h4>
                    <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                    <hr />
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="password" CssClass="col-md-2 control-label">Password</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="password"
                                CssClass="text-danger" ErrorMessage="The password field is required."
                                Display="Dynamic" ValidationGroup="SetPassword" />
                            <asp:ModelErrorMessage runat="server" ModelStateKey="NewPassword" AssociatedControlID="password"
                                CssClass="text-danger" SetFocusOnError="true" />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="confirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="confirmPassword" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="confirmPassword"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required."
                                ValidationGroup="SetPassword" />
                            <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="confirmPassword"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match."
                                ValidationGroup="SetPassword" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" Text="Set Password" ValidationGroup="SetPassword" OnClick="SetPassword_Click" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>
            </asp:PlaceHolder>

            <asp:PlaceHolder runat="server" ID="changePasswordHolder" Visible="false">
                <div class="form-horizontal">
                    <h4>Change Password Form</h4>
                    <hr />
                    <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="CurrentPasswordSelection" CssClass="col-md-2 control-label">Type of Current Password</asp:Label>
                        <div class="col-md-10">
                            <asp:RadioButtonList ID="CurrentPasswordSelection" runat="server" AutoPostBack="true" OnSelectedIndexChanged="CurrentPasswordSelection_SelectedIndexChanged">
                                <asp:ListItem Text="Text" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Image" Value="2"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPasswordSelection"
                                CssClass="text-danger" ErrorMessage="This is required to choose a selection" />
                        </div>
                    </div>
                    <div id="textCurrentPassword" runat="server" visible="false">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="CurrentPassword" CssClass="col-md-2 control-label">Password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="CurrentPassword" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword"
                                    CssClass="text-danger" ErrorMessage="The password field is required." />
                            </div>
                        </div>
                    </div>
                    <div id="imageCurrentPassword" runat="server" visible="false">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="imageCurrentPasswordControl" CssClass="col-md-2 control-label">Please choose an image</asp:Label>
                            <div class="col-md-10">
                                <asp:FileUpload runat="server" ID="imageCurrentPasswordControl" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="imageCurrentPasswordControl"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The image field is required." />
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="NewPasswordSelection" CssClass="col-md-2 control-label">Type of New Password</asp:Label>
                        <div class="col-md-10">
                            <asp:RadioButtonList ID="NewPasswordSelection" runat="server" AutoPostBack="true" OnSelectedIndexChanged="NewPasswordSelection_SelectedIndexChanged">
                                <asp:ListItem Text="Text" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Image" Value="2"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPasswordSelection"
                                CssClass="text-danger" ErrorMessage="This is required to choose a selection" />
                        </div>
                    </div>
                    <div id="textNewPassword" runat="server" visible="false">
                        <div class="form-group">
                            <asp:Label runat="server" ID="NewPasswordLabel" AssociatedControlID="NewPassword" CssClass="col-md-2 control-label">New password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="NewPassword" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
                                    CssClass="text-danger" ErrorMessage="The new password is required."
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="ConfirmNewPasswordLabel" AssociatedControlID="ConfirmNewPassword" CssClass="col-md-2 control-label">Confirm new password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="ConfirmNewPassword" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Confirm new password is required."
                                    ValidationGroup="ChangePassword" />
                                <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The new password and confirmation password do not match."
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                    </div>
                    <div id="imageNewPassword" runat="server" visible="false">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="newImagePasswordControl" CssClass="col-md-2 control-label">Please choose an image</asp:Label>
                            <div class="col-md-10">
                                <asp:FileUpload runat="server" ID="newImagePasswordControl" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="newImagePasswordControl"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The image field is required." />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" Text="Change Password" ValidationGroup="ChangePassword" OnClick="ChangePassword_Click" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>
            </asp:PlaceHolder>
        </section>
    </div>
</asp:Content>
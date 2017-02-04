<%@ Page Title="Manage Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManagePassword.aspx.cs" Inherits="SSH3.Account.ManagePassword" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <div class="panel panel-default">
        <div class="panel-heading">
            <h2><%: Title %>.</h2>
            <p class="text-danger">
                <asp:Literal runat="server" ID="ErrorMessage" />
                <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
            </p>
        </div>
        <div class="panel-body">
            <div class="form-horizontal">
                <section id="passwordForm">
                    <div class="form-horizontal">
                        <%--  <h4>Change Password Form</h4>--%>
                        <div id="textCurrentPassword" runat="server" visible="true">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="CurrentPassword" CssClass="col-md-2 control-label">Password</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="CurrentPassword" TextMode="Password" CssClass="form-control" />
                                    <asp:ImageButton runat="server" ID="showorhidepassword" ImageUrl="~/Imagesss/eye3-01-128.png" OnClick="showorhidepassword_Click" Height="50px" Width="50px" />
                                    <%-- <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword"
                                    CssClass="text-danger" ErrorMessage="The password field is required." />--%>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="imagePasswordEnabled" AssociatedControlID="YesOrNoImageCurrent" CssClass="col-md-2 control-label">Did you use an image together with your above text as a password?</asp:Label>
                            <div class="col-md-10">
                                <asp:RadioButtonList runat="server" AutoPostBack="true" RepeatDirection="Horizontal" ID="YesOrNoImageCurrent" OnSelectedIndexChanged="YesOrNoImageCurrent_SelectedIndexChanged">
                                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                </asp:RadioButtonList>
                                <%--  <asp:RequiredFieldValidator runat="server" ControlToValidate="YesOrNoImageCurrent"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="Please check no if you didnt use an image" />--%>
                            </div>
                        </div>
                        <div id="imageCurrentPassword" runat="server" visible="false">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="imageCurrentPasswordControl" CssClass="col-md-2 control-label">Please choose an image</asp:Label>
                                <div class="col-md-10">
                                    <asp:FileUpload runat="server" ID="imageCurrentPasswordControl" />
                                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="imageCurrentPasswordControl"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The image field is required." />--%>
                                </div>
                            </div>
                        </div>
                        <br />
                    </div>
                    <div id="textNewPassword" runat="server" visible="true">
                        <div class="form-group">
                            <asp:Label runat="server" ID="NewPasswordLabel" AssociatedControlID="NewPassword" CssClass="col-md-2 control-label">New password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="NewPassword" TextMode="Password" CssClass="form-control" />
                                <asp:ImageButton runat="server" ID="showorhidepassword1" ImageUrl="~/Imagesss/eye3-01-128.png" OnClick="showorhidepassword1_Click" Height="50px" Width="50px" />
                                <%-- <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
                                CssClass="text-danger" ErrorMessage="The new password is required."
                                ValidationGroup="ChangePassword" />--%>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="ConfirmNewPasswordLabel" AssociatedControlID="ConfirmNewPassword" CssClass="col-md-2 control-label">Confirm new password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="ConfirmNewPassword" TextMode="Password" CssClass="form-control" />
                                <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="Confirm new password is required."
                                ValidationGroup="ChangePassword" />--%>
                                <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The new password and confirmation password do not match."
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" ID="newImageEnabled" AssociatedControlID="YesOrNoImageNew" CssClass="col-md-2 control-label">Do you want a image to use together with your above text as a password?</asp:Label>
                        <div class="col-md-10">
                            <asp:RadioButtonList runat="server" AutoPostBack="true" RepeatDirection="Horizontal" ID="YesOrNoImageNew" OnSelectedIndexChanged="YesOrNoImageNew_SelectedIndexChanged">
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </asp:RadioButtonList>
                            <%--   <asp:RequiredFieldValidator runat="server" ControlToValidate="YesOrNoImageNew"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Please check no if you dont wish to use image." />--%>
                        </div>
                    </div>
                    <div id="imageNewPassword" runat="server" visible="false">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="newImagePasswordControl" CssClass="col-md-2 control-label">Please choose an image</asp:Label>
                            <div class="col-md-10">
                                <asp:FileUpload runat="server" ID="newImagePasswordControl" />
                                <%-- <asp:RequiredFieldValidator runat="server" ControlToValidate="newImagePasswordControl"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="The image field is required." />--%>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" Text="Change Password" ValidationGroup="ChangePassword" OnClick="ChangePassword_Click" CssClass="btn btn-default" />
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</asp:Content>
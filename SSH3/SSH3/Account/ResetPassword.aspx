<%@ Page Title="Reset Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="SSH3.Account.ResetPassword" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Enter your new password</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" autocomplete="off" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="form-group">          
        <div id="textPassword" runat="server" visible="true">
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                 <asp:ImageButton runat="server" ID="showorhidepassword" ImageUrl="~/Imagesss/eye3-01-128.png" OnClick="showorhidepassword_Click" Height="50px" Width="50px" />
               <%-- <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />--%>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />--%>
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
        </div>
            </div>
                <div class="form-group">
            <asp:Label runat="server" ID="imagePasswordEnabled" AssociatedControlID="YesOrNoImage" CssClass="col-md-2 control-label">Do you want a image to use together with your above text as a password?</asp:Label>
            <div class="col-md-10">
                <asp:RadioButtonList runat="server" AutoPostBack="true" RepeatDirection="Horizontal" ID="YesOrNoImage" OnSelectedIndexChanged="YesOrNoImage_SelectedIndexChanged" >
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
                 <asp:RequiredFieldValidator runat="server" ControlToValidate="YesOrNoImage"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Please check no if you dont wish to use image." />
            </div>
        </div>
        <div id="imagePassword" runat="server" visible="false">
            <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="imagePasswordControl" CssClass="col-md-2 control-label">Please choose an image</asp:Label>
                            <div class="col-md-10">
                                <asp:FileUpload runat="server" ID="imagePasswordControl" />
                                <%--  <asp:RequiredFieldValidator runat="server" ControlToValidate="imagePasswordControl"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The image field is required." />--%>
                            </div>
                        </div>
                    </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="Reset_Click" Text="Reset" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>

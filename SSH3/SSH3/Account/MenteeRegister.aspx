﻿<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenteeRegister.aspx.cs" Inherits="SSH3.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" autocomplete="off" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The email field is required." />
            </div>
        </div>
      <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Username" CssClass="col-md-2 control-label">Username</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Username" CssClass="form-control" TextMode="SingleLine" autocomplete="off" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Username"
                    CssClass="text-danger"  Display="Dynamic" ErrorMessage="The username field is required" />
            </div>
        </div>
        <div class="form-group">
          <asp:Label runat="server" AssociatedControlID="fullName" CssClass="col-md-2 control-label">Full Name</asp:Label>
          <div class="col-md-10">
              <asp:TextBox runat="server" ID="fullName" CssClass="form-control" TextMode="SingleLine" autocomplete="off" />
              <asp:RequiredFieldValidator runat="server" ControlToValidate="fullName"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The Full Name field is required" />
              <%-- Allow spaces in Name [*] is recurrence of defined group  DONE--%>
              <asp:RegularExpressionValidator runat="server" ControlToValidate="fullName"
                  ValidationExpression="([A-Za-z])+( [A-Za-z]+)*"
                  CssClass="text-danger" Display="Dynamic" ErrorMessage="No Numbers & Symbols are allowed in the Name field." />
          </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="userInstitution" CssClass="col-md-2 control-label">Your Institution</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="userInstitution" CssClass="form-control" TextMode="SingleLine" autocomplete="off" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="userInstitution"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The Instution field is required" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="userInstitution"
                    ValidationExpression="([A-za-z ]{0,25})"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Institution is too long." />
                 </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="userPhoneNumber" CssClass="col-md-2 control-label">Your Phone Number</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="userPhoneNumber" CssClass="form-control" TextMode="Phone" autocomplete="off" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="userPhoneNumber"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The Phone Number field is required" />
                <%-- done --%>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="userPhoneNumber"
                    ValidationExpression="([\d]{8})"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Invalid Phone number" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="userFOI" CssClass="col-md-2 control-label">Your Field of Industry</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="userFOI" runat="server" CssClass="ddl" BackColor="#F6F1DB" ForeColor="#7d6754" Font-Names="Andalus" AutoPostBack="true">
                    <asp:ListItem Text="SELECT" Value="SELECT"></asp:ListItem>
                    <asp:ListItem Text="Information Technology" Value="IT"></asp:ListItem> 
                    <asp:ListItem Text="Business" Value="Business"></asp:ListItem>
                    <asp:ListItem Text="Interactive & Digital Media" Value="IDM"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="userFOI"
                    CssClass="text-danger" Display="Dynamic" InitialValue="SELECT" ErrorMessage="The Field of Industry field is required" />
            </div>
        </div>
       <%-- <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="userDesignation" CssClass="col-md-2 control-label">Your Designation</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="userDesignation" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="userDesignation"
                    CssClass="text-danger" ErrorMessage="The Designation field is required" />
            </div> 
        </div>--%>

        

        <div id="textPassword" runat="server" visible="true">
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" autocomplete="off"/>
                <asp:ImageButton runat="server" ID="showorhidepassword" ImageUrl="~/Imagesss/eye3-01-128.png" OnClick="showorhidepassword_Click" Height="50px" Width="50px" />
               <%-- <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password field is required." />--%>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" autocomplete="off"/>
             <%--   <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />--%>
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
        </div>
          <div class="form-group">
            <asp:Label runat="server" ID="imagePasswordEnabled" AssociatedControlID="YesOrNoImage" CssClass="col-md-2 control-label" TabIndex="0">Do you want a image to use together with your above text as a password?</asp:Label>
            <div class="col-md-10">
                <asp:RadioButtonList runat="server" AutoPostBack="true" RepeatDirection="Horizontal" ID="YesOrNoImage" OnSelectedIndexChanged="YesOrNoImage_SelectedIndexChanged" >
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
              <%--   <asp:RequiredFieldValidator runat="server" ControlToValidate="YesOrNoImage"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Please check no if you dont wish to use image." />--%>
            </div>
        </div>
        <div id="imagePassword" runat="server" visible="false">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="imagePasswordControl" CssClass="col-md-2 control-label">Please choose an image</asp:Label>
                <div class="col-md-10">
                  <asp:FileUpload runat="server" id="imagePasswordControl" />
                   <%-- <asp:RequiredFieldValidator runat="server" ControlToValidate="imagePasswordControl"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The image field is required." />--%>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
            </div>
        </div>
          <br />  
    </div>
</asp:Content>

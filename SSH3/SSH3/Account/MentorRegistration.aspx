﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MentorRegistration.aspx.cs" Inherits="SSH3.Account.MentorRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h4>Create a new account</h4>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
       <hr />
    <div class="form-horizontal">
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="MentorEmail" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="MentorEmail" CssClass="form-control" TextMode="Email" autocomplete="off" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="MentorEmail"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The email field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="mentorUsername" CssClass="col-md-2 control-label">Username</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="mentorUsername" CssClass="form-control" TextMode="SingleLine" autocomplete="off" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="mentorUsername"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The Username field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="mentorFullName" CssClass="col-md-2 control-label">Full Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="mentorFullName" CssClass="form-control" TextMode="SingleLine" autocomplete="off" />
                   <asp:RequiredFieldValidator runat="server" ControlToValidate="mentorFullName"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The Full Name field is required." />
                 <asp:RegularExpressionValidator runat="server" ControlToValidate="mentorFullName"
                  ValidationExpression="([A-Za-z])+( [A-Za-z]+)*"
                  CssClass="text-danger" Display="Dynamic" ErrorMessage="No Numbers & Symbols are allowed in the Name field." />
            </div>
        </div>

         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="MentorInstitution" CssClass="col-md-2 control-label">Your Institution</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="MentorInstitution" CssClass="form-control" TextMode="SingleLine" autocomplete="off" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="MentorInstitution"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The Instution field is required" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="MentorInstitution"
                    ValidationExpression="[A-za-z ]{0,25}"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Institution is too long." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="MentorPhoneNumber" CssClass="col-md-2 control-label">Your Phone Number</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="MentorPhoneNumber" CssClass="form-control" TextMode="Phone" autocomplete="off" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="MentorPhoneNumber"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The Phone Number field is required" />
                 <asp:RegularExpressionValidator runat="server" ControlToValidate="MentorPhoneNumber"
                    ValidationExpression="([\d]{8})"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Invalid Phone number" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="MentorFOI" CssClass="col-md-2 control-label">Your Field of Industry</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="MentorFOI" runat="server" CssClass="ddl" BackColor="#F6F1DB" ForeColor="#7d6754" Font-Names="Andalus" AutoPostBack="true">
                    <asp:ListItem Text="=SELECT=" Value="SELECT"></asp:ListItem>
                    <asp:ListItem Text="Information Technology" Value="IT"></asp:ListItem> 
                    <asp:ListItem Text="Business" Value="Business"></asp:ListItem>
                    <asp:ListItem Text="Interactive & Digital Media" Value="IDM"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="MentorFOI"
                    CssClass="text-danger" Display="Dynamic" InitialValue="SELECT" ErrorMessage="The Field of Industry field is required" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="MentorDesignation" CssClass="col-md-2 control-label">Your Designation</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="MentorDesignation" CssClass="form-control" TextMode="SingleLine" autocomplete="off" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="MentorDesignation"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The Designation field is required" />
                 <asp:RegularExpressionValidator runat="server" ControlToValidate="MentorDesignation"
                    ValidationExpression="[A-za-z ]{0,25}"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Designation is too long." />
            </div> 
        </div>

         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="PasswordSelection" CssClass="col-md-2 control-label">Type of Password</asp:Label>
            <div class="col-md-10">
               <asp:RadioButtonList ID="PasswordSelection" runat="server" AutoPostBack="true" OnSelectedIndexChanged="PasswordSelection_SelectedIndexChanged">    
                   <asp:ListItem Text="I want text as a Password" Value="1"></asp:ListItem>
                         <asp:ListItem Text="I want an image as my Password" Value="2"></asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="PasswordSelection"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="This is required to choose a selection"/>
            </div>
        </div>

        <div id="textPassword" runat="server" visible="false">
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="MentorPassword" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="MentorPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="MentorPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="MentorPassword" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
        </div>
         <div id="imagePassword" runat="server" visible="false">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="imagePasswordControl" CssClass="col-md-2 control-label">Please choose an image</asp:Label>
                <div class="col-md-10">
                  <asp:FileUpload runat="server" id="imagePasswordControl" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="imagePasswordControl"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The image field is required." />
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

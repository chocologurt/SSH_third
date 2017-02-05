<%@ Page Title="Change Particulars" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangeParticulars.aspx.cs" Inherits="SSH3.Account.ChangeParticulars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        #changeParticularsPanel{
              padding: 4px 18px 4px 18px;
            color: black;
            background-color: seashell;
            border: 1px solid black;
        }
        #panelHeading{
 padding: 4px 18px 4px 18px;
            color: black;
            background-color: seashell;
        }
    </style>
    <br />
    <br />
    <div class="panel panel-default" id="changeParticularsPanel">
        <div class="panel-heading" id="panelHeading">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
            </div>
        <br />
    <div class="form-horizontal">
        <section id="changeParticularsForm">
            <asp:PlaceHolder runat="server" ID="mentorParticulars" Visible="false">
                <div class="form-horizontal">
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="mentorFullName" CssClass="col-md-2 control-label">Full Name:</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="mentorFullName" TextMode="SingleLine" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="mentorFullName"
                                CssClass="text-danger" ErrorMessage="This FullName field is required"
                                Display="Dynamic" ValidationGroup="mentorParticulars" />
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="mentorFullName"
                                ValidationExpression="([A-Za-z])+( [A-Za-z]+)*"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="No Numbers & Symbols are allowed in the Name field." />
                        </div>
                    </div>
                    <br />
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="mentorInstitution" CssClass="col-md-2 control-label">Institution:</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="mentorInstitution" TextMode="SingleLine" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="mentorInstitution"
                                CssClass="text-danger" ErrorMessage="This Institution is required"
                                Display="Dynamic" ValidationGroup="mentorParticulars" />
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="mentorInstitution"
                                ValidationExpression="([A-za-z ]{0,25})"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="Institution is too long." />
                        </div>
                    </div>
                    <br />
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="mentorDesignation" CssClass="col-md-2 control-label">Designation</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="mentorDesignation" TextMode="SingleLine" autocomplete="off" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="mentorDesignation"
                                CssClass="text-danger" ErrorMessage="This Designation is requried"
                                Display="Dynamic" ValidateGroup="mentorParticulars" />
                              <asp:RegularExpressionValidator runat="server" ControlToValidate="mentorDesignation"
                                ValidationExpression="([A-za-z ]{0,25})"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="Designation is too long." />
                        </div>
                    </div>
                     <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="FileUpload2" CssClass="col-md-2 control-label">Choose Profile Picture:</asp:Label>
                    <div class="col-md-10">
                        <asp:FileUpload ID="FileUpload2" runat="server" />
                        <br />
                   
                        <br />
                    </div>
                    <br />
                    <asp:Label runat="server" AssociatedControlID="imgDemo2" CssClass="col-md-2 control-label">Sample Output of Profile Picture:</asp:Label>
                    <div class="col-md-10">
                        <asp:Image ID="imgDemo2" runat="server" Height="100px" Width="100px" />
                        <br />
                        <br />
                        
                    </div>
                </div>
                </div>
            </asp:PlaceHolder>
            <asp:PlaceHolder runat="server" ID="menteeParticulars" Visible="false">
                <div class="form-horizontal">
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="menteeFullName" CssClass="col-md-2 control-label">Full Name:</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="menteeFullName" TextMode="SingleLine" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="menteeFullName"
                                CssClass="text-danger" ErrorMessage="This FullName field is required"
                                Display="Dynamic" ValidationGroup="menteeParticulars" />
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="menteeFullName"
                                ValidationExpression="([A-Za-z])+( [A-Za-z]+)*"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="No Numbers & Symbols are allowed in the Name field." />
                        </div>
                    </div>
                    <br />
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="menteeInstitution" CssClass="col-md-2 control-label">Institution:</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="menteeInstitution" TextMode="SingleLine" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="menteeInstitution"
                                CssClass="text-danger" ErrorMessage="This Institution is required"
                                Display="Dynamic" ValidationGroup="menteeParticulars" />
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="menteeInstitution"
                                ValidationExpression="([A-za-z ]{0,25})"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="Institution is too long." />
                        </div>
                    </div>
                     <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="FileUpload1" CssClass="col-md-2 control-label">Choose Profile Picture:</asp:Label>
                    <div class="col-md-10">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <br />
                      
                        <br />
                    </div>
                    <br />
                    <asp:Label runat="server" AssociatedControlID="imgDemo" CssClass="col-md-2 control-label">Sample Output of Profile Picture:</asp:Label>
                    <div class="col-md-10">
                        <asp:Image ID="imgDemo" runat="server"  Height="100px" Width="100px" />
                        <br />
                        <br />
                        
                    </div>
                </div>
                </div>
            </asp:PlaceHolder>
            <div class="form-group">
                <asp:Label runat="server" CssClass="col-md-2 control-label">&nbsp;</asp:Label>
                <div class="col-md-10">
                <asp:Button ID="changeParticularsBtn" runat="server" OnClick="changeParticularsBtn_Click" Text="Submit Particulars" />
            </div>

            </div> 

        </section>
            </div>
      </div>

       
</asp:Content>
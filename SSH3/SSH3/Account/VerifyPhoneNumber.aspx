<%@ Page Title="Verify Phone Number" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerifyPhoneNumber.aspx.cs" Inherits="SSH3.Account.VerifyPhoneNumber" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel panel-default">
        <div class="panel-heading">
 <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>   
             <asp:ValidationSummary runat="server" CssClass="text-danger" />
            </div>
        <div class="panel-body">
    <div class="form-horizontal">
        <h4>Enter verification code</h4>
        <hr />
        <asp:HiddenField runat="server" ID="PhoneNumber" />
    
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Code" CssClass="col-md-2 control-label">Code</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Code" CssClass="form-control" autocomplete="off"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Code"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The Code field is required." />

            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="Code_Click"
                    Text="Submit" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
            </div>
        </div>
</asp:Content>

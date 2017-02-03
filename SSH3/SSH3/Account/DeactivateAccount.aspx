<%@ Page Title="Deactivate Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeactivateAccount.aspx.cs" Inherits="SSH3.Account.DeactivateAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--<div class="form-horizontal">
        <section id="deactivateAccountForm">
            <div class="form-horizontal">
                <hr />
                <h2> We are sad to see you go :(</h2>
                <p>
                    <asp:Literal runat="server" ID="ErrorMessage"></asp:Literal>
                </p>
                <br />
                <div class="form-horizontal">
                <div class="form-group">
                    
                   <asp:Label runat="server" AssociatedControlID="reasonDropDownList" CssClass="col-md-2 control-label">Please select why you want to deactivate your account:
                   </asp:Label>
                    <div class="col-md-10">
                        <asp:DropDownList ID="reasonDropDownList" runat="server" OnSelectedIndexChanged="reasonDropDownList_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Text="Select..." Value="-1"></asp:ListItem>
                            <asp:ListItem Text="The website isn't easy to use" Value="1"></asp:ListItem>
                            <asp:ListItem Text="I dont like this website" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Other Reasons" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <br />
                    <br />
                    <div id="otherReasonDiv" runat="server" visible="false">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="otherReasonTxtBox" CssClass="col-md-2 control-label">Please enter the reason:</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox ID="otherReasonTxtBox" runat="server" TextMode="SingleLine" />
                            </div>
                        </div>
                    </div>
                    <asp:Button ID="submitBtn" runat="server" OnClick="submitBtn_Click" Text="Deactivate Account" />
                </div>
            </div>
                </div>
        </section>
    </div>--%>
    <div class="container">
        <h1>We are sad to see you go :(</h1>
    </div>
    <div class="row">
        <div class="col-lg-6"> 
            <asp:Label runat="server" AssociatedControlID="reasonDropDownList" >Please select why you want to deactivate your account: </asp:Label>

        </div>

     <div class="col-lg-6" style=""> 
            <asp:DropDownList ID="reasonDropDownList" runat="server" OnSelectedIndexChanged="reasonDropDownList_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Text="Select..." Value="-1"></asp:ListItem>
                            <asp:ListItem Text="The website isn't easy to use" Value="1"></asp:ListItem>
                            <asp:ListItem Text="I dont like this website" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Other Reasons" Value="3"></asp:ListItem>
                        </asp:DropDownList>

        </div>
    </div>
    <div class="row" id="otherReasonDiv" runat="server" visible="false">
        <div class="col-lg-6">
            <asp:Label runat="server" AssociatedControlID="otherReasonTxtBox" >Please enter the reason:</asp:Label>
        </div>
        <div class="col-lg-6">
            <asp:TextBox ID="otherReasonTxtBox" runat="server" TextMode="SingleLine" />
        </div>
    </div>
    <div class="row">
        <asp:Button ID="submitBtn" runat="server" OnClick="submitBtn_Click" Text="Deactivate Account" />
    </div>
</asp:Content>

<%@ Page Title="Deactivate Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeactivateAccount.aspx.cs" Inherits="SSH3.Account.DeactivateAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal">
        <section id="deactivateAccountForm">
            <div class="form-horizontal">
                <hr />
                <h2> We are sad to see you go :(</h2>
                <p>
                    <asp:Literal runat="server" ID="ErrorMessage"></asp:Literal>
                </p>
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
        </section>
    </div>
</asp:Content>

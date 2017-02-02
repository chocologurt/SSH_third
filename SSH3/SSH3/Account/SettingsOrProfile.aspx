<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SettingsOrProfile.aspx.cs" Inherits="SSH3.Account.SettingsOrProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal">
        <h4>Please choose one of the following by clicking on the image</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />


            <div class="Settings">
                <asp:ImageButton runat="server"
                    ImageUrl="~/Imagesss/settings-5-xxl.png" ID="settingsButton" OnClick="settingsButton_Click" Height="200px" Width="200px" />
                <asp:Label runat="server" CssClass="col-md-2 control-label" AssociatedControlID="settingsButton" Font-Size="Large">Settings</asp:Label>
            </div>

            <div class="Mentor">
                <asp:ImageButton runat="server"
            ImageUrl="~/Imagesss/profile-icon-png-906.png" ID="profilePageButton" Height="200px" Width="200px" OnClick="profilePageButton_Click"/>
                <asp:Label runat="server" CssClass="col-md-2 control-label" AssociatedControlID="profilePageButton" Font-Size="Large">ProfilePage</asp:Label>
            </div>
        </div>
</asp:Content>

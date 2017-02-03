<%@ Page Title="Add Or Change Profile Picture" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddorChangeProfilePic.aspx.cs" Inherits="SSH3.Account.AddorChangeProfilePic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <div class="form-horizontal">
        <section id="profilePicForm">
            <div class="form-horizontal">
                <h4>Add/Change Profile Picture</h4>
                <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                <hr />
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="FileUpload1" CssClass="col-md-2 control-label">Choose Profile Picture:</asp:Label>
                    <div class="col-md-10">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <br />
                        <asp:Button ID="btnPreview" runat="server" Text="Submit ProfilePicture" OnClick="btnPreview_Click" />
                        <br />
                    </div>
                    <br />
                    <asp:Label runat="server" AssociatedControlID="imgDemo" CssClass="col-md-2 control-label">Sample Output of Profile Picture:</asp:Label>
                    <div class="col-md-10">
                        <asp:Image ID="imgDemo" runat="server" />
                        <br />
                        <br />
                        
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
<%@ Page Title="Deactivate Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeactivateAccount.aspx.cs" Inherits="SSH3.Account.DeactivateAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <br />
    <br />
   <div class="panel panel-default">
       <div class="panel-heading">
            <h2> We are sad to see you go :(</h2>
                <p>
                    <asp:Literal runat="server" ID="ErrorMessage"></asp:Literal>
                </p>
       </div>
       <br />

       <div class="panel-body">
       <%--    <div class="form-horizontal">--%>
               <div class="row">
                    <asp:Label runat="server" AssociatedControlID="reasonDropDownList" CssClass="col-md-2 control-label" >Please select why you want to deactivate your account: </asp:Label>
                   <div class="col-md-10">
                         <asp:DropDownList ID="reasonDropDownList" runat="server" OnSelectedIndexChanged="reasonDropDownList_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Text="Select..." Value="-1"></asp:ListItem>
                            <asp:ListItem Text="The website isn't easy to use" Value="1"></asp:ListItem>
                            <asp:ListItem Text="I dont like this website" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Other Reasons" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                   </div>
               </div>
               <br />
               <div class="row">
                   <div id="otherReasonDiv" runat="server" visible="false">

                   <asp:Label runat="server" AssociatedControlID="otherReasonTxtBox"  ID="otherReasonLabel" CssClass="col-md-2 control-label">Please enter the reason:</asp:Label>
                   <div class="col-md-10">
                        <asp:TextBox ID="otherReasonTxtBox" runat="server" TextMode="SingleLine" />
                   </div>
               </div>

               </div>
               <br />
               <div class="row">
                   <asp:Label runat="server" CssClass="col-md-2 control-label">&nbsp;</asp:Label>
                   <div class="col-md-10">
                       <asp:Button ID="submitBtn" runat="server" OnClick="submitBtn_Click" Text="Deactivate Account" />
                   </div>
               </div>
           </div>
       </div>
<%--   </div>--%>
</asp:Content>
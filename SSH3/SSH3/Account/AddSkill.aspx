<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddSkill.aspx.cs" Inherits="SSH3.Account.AddSkill" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <div class="form-horizontal">
        <section id="addSkillForm">
            <div class="form-horizontal">
                <hr />
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="CategoryDropDownList" CssClass="col-md-2 control-label">Category of Skill:</asp:Label>
                    <div class="col-md-10">
                        <asp:DropDownList ID="CategoryDropDownList" runat="server" OnSelectedIndexChanged="CategoryDropDownList_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>
                        <%--<asp:Button ID="CategoryBtn" runat="server" OnClick="CategoryBtn_Click" Text="I want this category"/>--%>
                    </div>
                    <br />
                    </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="SkillDropDownList" CssClass="col-md-2 control-label">Selection of Skill:</asp:Label>
                    <div class="col-md-10">
                        <asp:DropDownList ID="SkillDropDownList" runat="server" />
                        <asp:Button ID="ConfirmSkill" runat="server" OnClick="ConfirmSkill_Click" Text="Confirm Skill Selection" />
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>

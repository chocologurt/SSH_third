<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddSkill.aspx.cs" Inherits="SSH3.Account.AddSkill" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <script type="text/javascript">
       function confirmNewSkillModal() {
           $('#addSkillPortion').modal('show');
       }
   </script>
    
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
                        <asp:Button ID="AddSkillButton" runat="server" OnClick="AddSkill_Click" Text="Confirm Skill Selection" />
                    </div>
                </div>
            </div>
        </section>
    </div>
    <div class="modal fade" id="addSkillPortion">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
                    <h4 class="modal-title">Comfirm Addition of this Skill</h4>
                </div>

                <div class="modal-body">
                    Are you sure that you want to add this skill?
                </div>

                <div class="modal-footer">
                    <asp:Button runat="server" BackColor="#00ffff" Text="Confirm" ID="ConfirmSkill" OnClick="ConfirmSkill_Click" />
                    <asp:Button runat="server" CssClass="btn btn-info" data-dismiss="modal" Text="Cancel" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

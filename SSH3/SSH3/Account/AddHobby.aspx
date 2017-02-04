<%@ Page Title="Add Hobby" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddHobby.aspx.cs" Inherits="SSH3.Account.AddHobby" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function confirmAddNewHobby() {
            $('#addHobbyPortion').modal('show');
        }
    </script>
    <style type="text/css">
        #addHobbyPanel {
            padding: 4px 18px 4px 18px;
            color: black;
            background-color: mintcream;
            border: 1px solid black;
        }
    </style>
    <br />
    <br />
    <div class="panel panel-default" id="addHobbyPanel">
      
            <h2><%: Title %></h2>
            <p class="text-danger">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>
    
        <div class="form-horizontal">
            <section id="addSkillForm">
                <div class="form-horizontal">
                    <hr />
                    <br />
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="CategoryDropDownList" CssClass="col-md-2 control-label" Font-Size="Large">Category of Skill:</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="CategoryDropDownList" runat="server" OnSelectedIndexChanged="CategoryDropDownList_SelectedIndexChanged" AutoPostBack="true" Font-Size="Large"></asp:DropDownList>
                            <%--<asp:Button ID="CategoryBtn" runat="server" OnClick="CategoryBtn_Click" Text="I want this category" />--%>
                        </div>
                        <br />
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="HobbyDropDownList" CssClass="col-md-2 control-label" Font-Size="Large">Selection of Skill:</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="HobbyDropDownList" runat="server" Font-Size="Large" /> 
                            <br />
                            <br />
                             <asp:Button ID="AddHobbyButton" OnClick="AddHobby_Click" runat="server" Text="Confirm Skill Selection" Font-Size="Large" />
                        </div>
                    </div>
                  
                </div>
            </section>
        </div>

        <div class="modal fade" id="addHobbyPortion">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title">Confirmation of Adding this Hobby</h4>
                    </div>

                    <div class="modal-body">
                        Are you sure that you want to add this skill?
                    </div>

                    <div class="modal-footer">
                        <asp:Button runat="server" BackColor="#00ffff" Text="Confirm" ID="ConfirmHobby" OnClick="ConfirmHobby_Click" />
                        <asp:Button runat="server" CssClass="btn btn-info" data-dismiss="modal" Text="Cancel" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
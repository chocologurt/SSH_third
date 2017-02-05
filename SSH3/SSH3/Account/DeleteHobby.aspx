<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeleteHobby.aspx.cs" EnableEventValidation="false" Inherits="SSH3.Account.DeleteHobby" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function confirmDeleteModal() {
            $('#deleteSelectedHobby').modal('show');
        }
    </script>
    <style type="text/css">
        #deleteHobbyPanel {
            padding: 4px 18px 4px 18px;
            color: black;
            background-color: aliceblue;
            /*border: 1px solid black;*/
        }

        #panelHeader {
            padding: 4px 18px 4px 18px;
            color: black;
            background-color: aliceblue;
        }
    </style>
    <br />
    <br />
    <div class="panel panel-default" id="deleteHobbyPanel">
        <div class="panel-heading" id="panelHeader">
            <h2>Summary of the Hobbies you have.</h2>
            <p class="text-danger">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>
        </div>
        <br />
        <div class="form-horizontal">
            <section id="changeHobbyForm">
                <div class="form-group">
                    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%" GridLines="Vertical"
                        SelectedRowStyle-BackColor="#FFFF99" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" Font-Size="Large"/>
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" Font-Size="Medium" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="Black" />

                    </asp:GridView>
                    <br />
                    <asp:Button ID="Deletebtn" runat="server" OnClick="DeleteSelected_Click" Text="Delete Skill" />
                </div>

                <div class="modal fade" id="deleteSelectedHobby">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                <h4 class="modal-title">Confirm Delete Selected Row</h4>
                            </div>

                            <div class="modal-body">
                                Are you sure you want to delete the selected row?
                            </div>

                            <div class="modal-footer">
                                <asp:Button runat="server" CssClass="btn btn-info" Text="Delete" ID="deleteButton" OnClick="Deletebtn_Click" />
                                <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Cancel" />
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</asp:Content>
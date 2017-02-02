<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeleteHobby.aspx.cs" EnableEventValidation = "false" Inherits="SSH3.Account.DeleteHobby" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <script type="text/javascript">
        function confirmDeleteModal() {
            $('#deleteSelectedHobby').modal('show');
        }
    </script>
    <div class="form-horizontal"> 
            <div class="form-horizontal">
                <hr />
                <h2>Summary of the Hobbies you have.</h2>
                <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage"  />
    </p>
                <div class="form-horizontal">
                    <section id="changeHobbyForm">
                        <div class="form-horizontal">
                            <hr />
                            <div class="form-group">
                                <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999"
                                    BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical"
                                    SelectedRowStyle-BackColor="#FFFF99" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                    <AlternatingRowStyle BackColor="#DCDCDC" />
                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#000065" />
                                </asp:GridView>
                            </div>
                            <asp:Button ID="Deletebtn" runat="server" OnClick="DeleteSelected_Click" Text="Delete Skill" />
                        </div>
                    </section>
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
                                <asp:Button runat="server" BackColor="#00ffff" Text="Delete" ID="deleteButton" OnClick="Deletebtn_Click" />
                                <asp:Button runat="server" CssClass="btn btn-info" data-dismiss="modal" Text="Cancel" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</asp:Content>

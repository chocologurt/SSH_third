<%@ Page Title="ChangeSkill" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeleteSkill.aspx.cs" EnableEventValidation = "false" Inherits="SSH3.Account.ChangeSkill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <div class="form-horizontal">
        <section id="addSkillForm">
            <div class="form-horizontal">
                <hr />
                <h2>Summary of the type of Skills you have.</h2>
                <p class="text-danger">
                    <asp:Literal runat="server" ID="Literal1" />
                </p>
                <div class="form-horizontal">
                    <section id="changeSkillForm">
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
                            <asp:Button ID="Deletebtn" runat="server" OnClick="Deletebtn_Click" Text="Delete Skill" />
                        </div>
                    </section>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
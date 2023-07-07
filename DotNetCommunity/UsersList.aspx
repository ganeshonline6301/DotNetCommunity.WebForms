<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage4.Master" AutoEventWireup="true" CodeBehind="UsersList.aspx.cs" Inherits="DotNetCommunity.UsersList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <br />
                <br />
                <center>
                    <img src="imgs/UsersList.svg" class="img-fluid" />
                </center>
                <br /><br />
            </div>
            <div class="col-md-8">
                <br />
                <br />
                <div class="card">
                    <div class="card-body">
                        <center>
                            <label>Users List</label>
                            <div>
                                <asp:GridView ID="gridusers" runat="server" CssClass="table-primary table-hover" AutoGenerateColumns="false" OnRowCommand="gridusers_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Login ID">
                                            <ItemTemplate>
                                                <asp:Label ID="lblloginid" runat="server" Text='<%#Eval("loginid") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate>
                                                <%#Eval("name") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="User name">
                                            <ItemTemplate>
                                                <%#Eval("username") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Security question">
                                            <ItemTemplate>
                                                <%#Eval("secquestion") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Answer">
                                            <ItemTemplate>
                                                <%#Eval("answer") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <%#Eval("status") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="btnblock" runat="server" Text="Block" CssClass="btn btn-primary" CommandName="block" CommandArgument='<%#Eval("loginid") %>' Enabled='<%#Eval("status").ToString() != "pending" %>' />
                                                <asp:Button ID="btnapprove" runat="server" Text="Approve" CssClass="btn btn-primary" CommandName="approve" CommandArgument='<%#Eval("loginid") %>' Enabled='<%#Eval("status").ToString() != "approved" %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

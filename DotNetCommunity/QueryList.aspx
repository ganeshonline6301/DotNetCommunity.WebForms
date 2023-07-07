<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage4.Master" AutoEventWireup="true" CodeBehind="QueryList.aspx.cs" Inherits="DotNetCommunity.QueryList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <br />
                <br />
                <center>
                    <img src="imgs/List.svg" class="img-fluid" />
                </center>
            </div>
            <div class="col-md-8">
                <br />
                <div class="card">
                    <div class="card-body">
                        <center>
                            <label>Users List</label>
                            <div>
                                <asp:GridView ID="gridqueries" runat="server" CssClass="table-primary table-hover" AutoGenerateColumns="false" OnRowCommand="gridqueries_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="ID">
                                            <ItemTemplate>
                                                <asp:label ID="lblquestionid" runat="server" Text='<%#Eval("questionid") %>'></asp:label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Question">
                                            <ItemTemplate>
                                                <%#Eval("question") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Posted by">
                                            <ItemTemplate>
                                                <%#Eval("name") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="btn btn-primary" CommandName="deleting" CommandArgument='<%#Eval("questionid") %>' /> 
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

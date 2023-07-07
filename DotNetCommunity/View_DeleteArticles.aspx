<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage4.Master" AutoEventWireup="true" CodeBehind="View_DeleteArticles.aspx.cs" Inherits="DotNetCommunity.View_DeleteArticles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <br />
                <br />
                <center>
                    <img src="imgs/List.svg" class="img-fluid"/>
                </center>
            </div>
            <div class="col-md-8">
                <br />
                <div class="card">
                    <div class="card-body">
                        <center>
                            <label>Users List</label>
                            <div>
                                <asp:GridView ID="gridarticles" CssClass="table-primary table-hover" runat="server" AutoGenerateColumns="false" OnRowCommand="gridarticles_RowCommand">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:label ID="lblarticleid" runat="server" Text='<%#Eval("articleid") %>'></asp:label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <%#Eval("articletype") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <%#Eval("articledesc") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <%#Eval("cdate") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <%#Eval("name") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="btn btn-primary" CommandName="deleting" CommandArgument='<%#Eval("articleid") %>' /> 
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
        <br />
        <br />
    </div>
</asp:Content>

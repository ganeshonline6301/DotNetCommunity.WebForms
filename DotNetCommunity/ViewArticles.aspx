<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.Master" AutoEventWireup="true" CodeBehind="ViewArticles.aspx.cs" Inherits="DotNetCommunity.ViewArticles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <center>
                    <br />
                    <br />
                    <br />
                    <img src="imgs/ViewArticles.svg" width="350" height="350"/>
                </center>
            </div>
            <div class="col-md-8 mx-auto">
                <br />
                <div class="card border-primary mb-3">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <center>
                                    <label>Articles</label>
                                    <div class="form-group">
                                        <asp:GridView ID="gridallarticles" runat="server" CssClass="table-primary table-hover" AutoGenerateColumns="false" OnRowCommand="gridallarticles_RowCommand">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Article type">
                                                    <ItemTemplate>
                                                        <%#Eval("ArticleType") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Articles">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblArticleDesc" runat="server" Text='<%#Eval("ArticleDesc") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Posted date">
                                                    <ItemTemplate>
                                                        <%#Eval("cdate") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Posted by">
                                                    <ItemTemplate>
                                                        <%#Eval("Name") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Button runat="server" ID="btnselectarticle" Text="Read" CssClass="btn btn-primary btn-sm" CommandName="read" CommandArgument='<%#Eval("articledesc") %>' />
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
        </div>
        <br />
        <br />
        <div class="row">
            <div class="col-md-12">
                <div class="card text-white bg-primary mb-3" id="cardarticle" runat="server" visible="false">
                    <div class="card-body">
                        <center>
                            <asp:Label ID="lblarticleview" runat="server"></asp:Label>
                        </center>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.Master" AutoEventWireup="true" CodeBehind="SearchArticles.aspx.cs" Inherits="DotNetCommunity.SearchArticles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/sweetalert.css" rel="stylesheet" />
    <script src="Scripts/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <center>
                    <br />
                    <br /><br />
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
                                    <label>Article type</label>
                                    <asp:TextBox ID="txtsearcharticle" runat="server" placeholder="Search" CssClass="form-control" Width="200"></asp:TextBox>
                                    <br />
                                    <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnsearch_Click" />
                                    <br />
                                    <hr />
                                    <div class="form-group">
                                        <asp:GridView ID="gridallarticles" runat="server" CssClass="table-primary table-hover" AutoGenerateColumns="false" OnRowCommand="gridallarticles_RowCommand">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Article type">
                                                   <ItemTemplate>
                                                       <%#Eval("articletype") %>
                                                   </ItemTemplate>
                                               </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Articles">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblArticleDesc" runat="server" Text='<%#Eval("articledesc") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Posted date">
                                                    <ItemTemplate>
                                                        <%#Eval("cdate") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Posted by">
                                                    <ItemTemplate>
                                                        <%#Eval("name") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Button CssClass="btn btn-primary" ID="btnview" runat="server" CommandName="read" Text="Read" CommandArgument='<%#Eval("articledesc")%>' />
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
    </div>
</asp:Content>

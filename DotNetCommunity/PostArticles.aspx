<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.Master" AutoEventWireup="true" CodeBehind="PostArticles.aspx.cs" Inherits="DotNetCommunity.PostArticles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/sweetalert.css" rel="stylesheet" />
    <script src="Scripts/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <br />
                <div class="card border-primary mb-3">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/postquery.svg" width="150" height="150" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Post Your Article</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <hr />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Article ID:</label>

                                <div class="form-group">
                                    <asp:Label runat="server" ID="lblarticleid" CssClass="form-label"></asp:Label>
                                </div>
                                <br />
                                <label>Article Type:</label>

                                <div class="form-group">
                                    <asp:DropDownList ID="droparticletype" runat="server" CssClass="btn btn-primary btn-block">
                                        <asp:ListItem>-Select article type-</asp:ListItem>
                                        <asp:ListItem>C#.NET</asp:ListItem>
                                        <asp:ListItem>ASP.NET</asp:ListItem>
                                        <asp:ListItem>ADO.NET</asp:ListItem>
                                        <asp:ListItem>MVC</asp:ListItem>
                                        <asp:ListItem>SQL</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <br />
                                <label>Description:</label>

                                <div class="form-group">
                                    <asp:TextBox ID="txtarticledesc" runat="server" CssClass="form-control" placeholder="Write an article" TextMode="MultiLine" Rows="10"></asp:TextBox>
                                </div>
                                <br />
                                <div class="form-group">
                                    <center>
                                        <asp:Button class="btn btn-lg btn-primary btn-block" ID="btnpostarticle" runat="server" Text="Post Article" OnClick="btnpostarticle_Click"/>
                                        <br />
                                        <br />
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <br />
            </div>
        </div>
    </div>
</asp:Content>

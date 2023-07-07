<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="DotNetCommunity.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/sweetalert.css" rel="stylesheet" />
    <script src="Scripts/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <br />
                <div class="card border-primary mb-3">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/admin-286-256.png" width="110" height="110" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Admin Login</h3>
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
                                <br />
                                <label>Admin ID:</label>

                                <div class="form-group">
                                    <asp:TextBox ID="txtuser" runat="server" CssClass="form-control" placeholder="Admin ID"></asp:TextBox>
                                </div>
                                <br />
                                <label>Password:</label>
                               
                                <div class="form-group">
                                    <asp:TextBox ID="txtpwd" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                                <br />
                                <div class="form-group">
                                    <center>
                                        <asp:Button class="btn btn-lg btn-primary btn-block" ID="btnadminlogin" runat="server" Text="Login" OnClick="btnadminlogin_Click"/>
                                        <br />
                                        <br />
                                        <br />
                                        <asp:Label CssClass="form-label" ID="lblmsg" runat="server"></asp:Label>
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <a href="HomePage.aspx"><-Back to Home</a>
                <br />
                <br />
            </div>
        </div>
    </div>
</asp:Content>

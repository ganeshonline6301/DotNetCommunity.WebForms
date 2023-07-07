<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="DotNetCommunity.UserLogin1" %>
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
                                    <img src="imgs/user-286-256.png" width="110" height="110" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>User Login</h3>
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
                                <label>User ID:</label>

                                <div class="form-group">
                                    <asp:TextBox ID="txtuser" runat="server" CssClass="form-control" placeholder="user ID"></asp:TextBox>
                                </div>
                                <br />
                                <label>Password:</label>
                               
                                <div class="form-group">
                                    <asp:TextBox ID="txtpwd" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                                <br />
                                <div class="form-group">
                                    <center>
                                        <asp:Button class="btn btn-lg btn-primary btn-block" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                                        <br />
                                        <br />
                                        <a href="ForgotPassword.aspx">Forgot Password</a>
                                        <br />
                                        <br />
                                        <asp:Label ID="lblmsg" runat="server" CssClass="form-label" ForeColor="Red"></asp:Label>
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

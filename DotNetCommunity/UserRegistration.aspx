<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="DotNetCommunity.UserRegistration" %>
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
                                    <img src="imgs/register-286-256.png" width="80" height="80" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>User Registration</h4>
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
                                <label>Login ID:</label>

                                <div class="form-group">
                                    <asp:Label runat="server" ID="lblloginid" CssClass="form-label"></asp:Label>
                                </div>
                                <br />
                                <label>Full Name:</label>

                                <div class="form-group">
                                    <asp:TextBox ID="txtfullname" runat="server" CssClass="form-control" placeholder="Full Name"></asp:TextBox>
                                </div>
                                <br />
                                <label>User Name:</label>

                                <div class="form-group">
                                    <asp:TextBox ID="txtuser" runat="server" CssClass="form-control" placeholder="User Name"></asp:TextBox>
                                </div>
                                <br />
                                <label>Password:</label>
                               
                                <div class="form-group">
                                    <asp:TextBox ID="txtpwd" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                                <br />
                                <label>Question:</label>

                                <div class="form-group">
                                    <asp:DropDownList ID="dropquestion" runat="server" CssClass="btn btn-primary btn-block">
                                        <asp:ListItem>-Select any question-</asp:ListItem>
                                        <asp:ListItem>What is your petname?</asp:ListItem>
                                        <asp:ListItem>What is your first school name?</asp:ListItem>
                                        <asp:ListItem>What is your favourite food?</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <br />
                                <lable>Answer:</lable>
                                <div class="form-group">
                                    <asp:TextBox ID="txtanswer" runat="server" CssClass="form-control" placeholder="Answer"></asp:TextBox>
                                </div>
                                <br />
                                <div class="form-group">
                                    <center>
                                        <asp:Button class="btn btn-lg btn-primary btn-block" ID="btnsingup" runat="server" Text="Signup" OnClick="btnsingup_Click" />
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

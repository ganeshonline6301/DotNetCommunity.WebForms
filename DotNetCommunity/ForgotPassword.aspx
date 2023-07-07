<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="DotNetCommunity.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/sweetalert.css" rel="stylesheet" />
    <script src="Scripts/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <br />
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/forgott.svg" width="110" height="110" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Forgot Password</h3>
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
                                <label>User Name:</label>

                                <div class="form-group">
                                    <asp:TextBox ID="txtuser" runat="server" CssClass="form-control" placeholder="User Name"></asp:TextBox>
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
                                        <asp:Button class="btn btn-lg btn-primary btn-block" ID="btngetpassword" runat="server" Text="Get Password" OnClick="btngetpassword_Click" />
                                    </center>
                                </div>
                                <br />
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

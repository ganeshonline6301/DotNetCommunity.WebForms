<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.Master" AutoEventWireup="true" CodeBehind="PostQuery.aspx.cs" Inherits="DotNetCommunity.PostQuery" %>
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
                                    <h4>Post Your Query</h4>
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
                                <label>Question ID:</label>

                                <div class="form-group">
                                    <asp:Label runat="server" ID="lblquestionid" CssClass="form-label"></asp:Label>
                                </div>
                                <br />
                                <label>Question:</label>

                                <div class="form-group">
                                    <asp:TextBox ID="txtquestion" runat="server" CssClass="form-control" placeholder="Write a Question"></asp:TextBox>
                                </div>
                                <br />
                                <div class="form-group">
                                    <center>
                                        <asp:Button class="btn btn-lg btn-primary btn-block" ID="btnpostquestion" runat="server" Text="Post Question" OnClick="btnpostquestion_Click" />
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

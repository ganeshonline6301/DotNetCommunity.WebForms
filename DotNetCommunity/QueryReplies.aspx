<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.Master" AutoEventWireup="true" CodeBehind="QueryReplies.aspx.cs" Inherits="DotNetCommunity.QueryReplies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/sweetalert.css" rel="stylesheet" />
    <script src="Scripts/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <center>
                    <br /><br /><br />
                    <img src="imgs/ViewAllQueries.svg" width="350" height="350"/>
                </center>
             </div>
            <div class="col-md-8 mx-auto">
                <br />
                <div class="card border-primary mb-3">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                    <label>Question:</label>
                                    <asp:Label ID="lblquestion" runat="server"></asp:Label>
                                    <hr />
                                    <label>Answer:</label>
                                    <asp:TextBox ID="txtanswer" TextMode="MultiLine" runat="server" CssClass="form-control" Rows="8"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-md-12">
                                <center>
                                   <asp:Button ID="btnreplysubmit" CssClass="btn btn-primary btn-block" runat="server" Text="Post Reply" OnClick="btnreplysubmit_Click" />
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

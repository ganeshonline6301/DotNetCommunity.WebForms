<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.Master" AutoEventWireup="true" CodeBehind="ArticleView.aspx.cs" Inherits="DotNetCommunity.ArticleView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <center>
                    <br /><br />
                    <img src="imgs/ArticleView.svg" class="img-fluid"/>
                    <br /><br />
                </center>
            </div>
            <div class="col-md-8">
                <div class="card border-primary mb-3" >
                    <div class="card-body">
                        <h4 class="card-title">Article</h4>
                        <asp:Label ID="lblarticle" runat="server" CssClass="card-text"></asp:Label>
                        <br />
                        <br />
                        <br />
                        <center>
                            <asp:Button ID="btnbacksearch" Text="Back to Search" CssClass="btn btn-primary" runat="server" OnClick="btnback_Click"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnbackview" Text="Back to View all" CssClass="btn btn-primary" runat="server" OnClick="btnbackview_Click" />
                        </center>
                    </div>
                </div>
                <br />
                <br />
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
               
            </div>
        </div>
    </div>
    
</asp:Content>
 
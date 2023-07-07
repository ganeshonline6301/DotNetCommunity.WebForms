<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage4.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="DotNetCommunity.Admin_Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .lbladminname{
            font-family:'3D Isometric';
            font-size:600%;
            color:#007bff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <center>
                            <img src="imgs/urban-931.gif" class="img-fluid" />
                            <br />
                            <asp:Label ID="lbladminname" runat="server" class="lbladminname"></asp:Label>
                        </center>
                    </div>
                </div>
            </div>
        </section>
</asp:Content>

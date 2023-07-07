<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.Master" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="DotNetCommunity.UserHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .lblfullname{
            font-family:'3D Isometric';
            font-size:580%;
            color:#007bff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <br />
                        <center>
                            <img src="gifs/juicy-man-programmer-writing-code-and-make-web-design-on-a-pc.gif" class="img-fluid" />
                            <br />
                            <asp:Label ID="lblfullname" runat="server" class="lblfullname"></asp:Label>
                        </center>  
                    </div>
                </div>
            </div>
    </section>
</asp:Content>


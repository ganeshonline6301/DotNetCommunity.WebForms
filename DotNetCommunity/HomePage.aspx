<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="DotNetCommunity.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container-h1{
            font-family:'Lato';
            color:#007bff;
            font-size:540%;
            text-shadow: 2px 2px 4px #555;
        }
        .container-h5{
            font-family:'Century Gothic';
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <section>
            <div class="container">
                <%--first row--%>
                <div class="row">
                    <div class="col-md-6">
                        <br />
                        <h1 class="container-h1">Welcome to .Net Community</h1>
                    </div>
                    <div class="col-md-6">
                        <center>
                            <img src="gifs/juicy-team-discussing-the-project.gif" class="img-fluid" />
                            <br />
                            <img src="imgs/code.png" class="img-fluid"  />
                        </center>
                    </div>
                </div>
                <br />
                <br />
                <br />
                <div class="row">
                    <div class="col-md-12">
                        <div class="card text-white bg-primary mb-3" style="max-width:100rem;">
                            <div class="card-body">
                                <h5 class="container-h5">
                                    The online hub for .net developers and enthusiasts! 
                                    Here, you can get all kinds of information related to .Net programming language.  
                                    this community website for .Net users that can help widespred, disperate offline communities to come together,
                                    connect and share thoughts, ideas and valuable information. .Net community website allow users to communicate through a single platform 
                                    and share data to an individual or a wide network of users.
                                </h5>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
</asp:Content>

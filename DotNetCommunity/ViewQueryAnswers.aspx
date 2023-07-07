<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.Master" AutoEventWireup="true" CodeBehind="ViewQueryAnswers.aspx.cs" Inherits="DotNetCommunity.ViewQueryAnswers" %>
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
                    <img src="imgs/ViewAnswers.svg" width="350" height="350"/>
                </center>
            </div>
            <div class="col-md-8 mx-auto">
                <br />
                <div class="card border-primary mb-3">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                    <center>
                                    <div class="form-group">
                                        <asp:GridView ID="gridallanswers" runat="server" CssClass="table-primary table-hover" AutoGenerateColumns="false">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Questions">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblquestion" runat="server" Text='<%#Eval("Question") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Answers">
                                                    <ItemTemplate>
                                                        <%#Eval("Reply") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Posted by">
                                                    <ItemTemplate>
                                                        <%#Eval("Name") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </center>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

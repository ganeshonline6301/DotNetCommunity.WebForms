<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.Master" AutoEventWireup="true" CodeBehind="ViewProjects.aspx.cs" Inherits="DotNetCommunity.ViewProjects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/sweetalert.css" rel="stylesheet" />
    <script src="Scripts/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <center>
                    <br />
                    <br />
                    <br />
                    <img src="imgs/ViewArticles.svg" width="350" height="350"/>
                </center>
            </div>
            <div class="col-md-8 mx-auto">
                <br />
                <div class="card border-primary mb-3">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <label>Project type:</label>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" ID="txtsearchfile" CssClass="form-control" placeholder="Search" Width="200"></asp:TextBox>
                                        <br />
                                        <asp:Button ID="btnsearch" Text="Search" runat="server" CssClass="btn btn-primary" OnClick="btnsearch_Click" />
                                        &nbsp;&nbsp;
                                        <asp:Button ID="btnviewall" Text="View all" runat="server" CssClass="btn btn-primary" OnClick="btnviewall_Click" UseSubmitBehavior="false" />
                                    </div>
                                    <hr />
                                    <div class="form-group">
                                        <asp:GridView ID="gridallfiles" runat="server" CssClass="table-primary table-hover" AutoGenerateColumns="false" OnRowCommand="gridallfiles_RowCommand1">
                                            <Columns>
                                               <asp:TemplateField HeaderText="Project type">
                                                   <ItemTemplate>
                                                       <%#Eval("projecttype") %>
                                                   </ItemTemplate>
                                               </asp:TemplateField>
                                                <asp:TemplateField HeaderText="File name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblfilename" runat="server" Text='<%#Eval("filename") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="File type">
                                                    <ItemTemplate>
                                                        <%#Eval("filetype") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Posted by">
                                                    <ItemTemplate>
                                                        <%#Eval("name") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Button CssClass="btn btn-primary" ID="btndownload" runat="server" CommandName="download" Text="Download" CommandArgument='<%#Eval("filename")%>' />
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
        <br />
        <br />
    </div>
</asp:Content>

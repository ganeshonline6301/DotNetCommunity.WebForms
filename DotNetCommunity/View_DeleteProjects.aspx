<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage4.Master" AutoEventWireup="true" CodeBehind="View_DeleteProjects.aspx.cs" Inherits="DotNetCommunity.View_DeleteProjects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <br />
                <br />
                <center>
                    <img src="imgs/List.svg" class="img-fluid" />
                </center>
            </div>
            <div class="col-md-8">
                <br />
                <div class="card">
                    <div class="card-body">
                        <center>
                            <label>Users List</label>
                            <div>
                                <asp:GridView ID="gridprojects" CssClass="table-primary table-hover" runat="server" AutoGenerateColumns="false" OnRowCommand="gridprojects_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Project type">
                                            <ItemTemplate>
                                                <%#Eval("projecttype") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="File name">
                                            <ItemTemplate>
                                                <asp:label ID="lblfilename" runat="server" Text='<%#Eval("filename") %>'></asp:label>
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
                                                <asp:Button ID="btnblock" runat="server" Text="Delete" CssClass="btn btn-primary" CommandName="deleting" CommandArgument='<%#Eval("projectid") %>' /> 
                                                <asp:Button ID="btndownload" runat="server" Text="Download" CssClass="btn btn-primary" CommandName="download" CommandArgument='<%#Eval("filename") %>' />
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
        <br />
        <br />
    </div>
</asp:Content>

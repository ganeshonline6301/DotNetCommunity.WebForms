<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.Master" AutoEventWireup="true" CodeBehind="ViewAllQueries.aspx.cs" Inherits="DotNetCommunity.ViewAllQueries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                    <div class="card-header">Questions</div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <center>
                                    <div class="form-group">
                                        <asp:GridView ID="gridallqueries" runat="server" CssClass="table-primary table-hover" AutoGenerateColumns="false" OnRowCommand="gridallqueries_RowCommand">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Questions">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblquestion" runat="server" Text='<%#Eval("Question") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Posted by">
                                                    <ItemTemplate>
                                                        <%#Eval("Name") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Button runat="server" ID="btnselectquestion" Text="Reply" CssClass="btn btn-primary btn-sm" CommandName="reply" CommandArgument='<%#Eval("question") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Label ID="lblmsg" runat="server"></asp:Label>
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

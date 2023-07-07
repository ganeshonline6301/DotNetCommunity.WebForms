<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.Master" AutoEventWireup="true" CodeBehind="UploadProject.aspx.cs" Inherits="DotNetCommunity.UploadProject" %>
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
                                    <img src="imgs/uploadproject.svg" width="150" height="150" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Upload Project</h4>
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
                                <label>Project ID:</label>
                                <div class="form-group">
                                    <asp:Label runat="server" ID="lblprojectid" CssClass="form-label"></asp:Label>
                                </div>
                                <br />

                                <label>Project type:</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtprojecttype" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <br />

                                <label>Upload a project:</label>
                                <div>
                                    <asp:FileUpload ID="uploadfile" runat="server"></asp:FileUpload>
                                </div>
                                <br />

                                <div class="form-group">
                                    <center>
                                        <asp:Button class="btn btn-lg btn-primary btn-block" ID="btnupload" runat="server" Text="Upload" OnClick="btnupload_Click" />
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

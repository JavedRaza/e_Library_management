<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="ELibraryManagement.adminlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="imgs/adminuser.png" />
                                    <h5>Admin Login</h5>
                                </center>
                                <hr />
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" placeholder="Admin Login" ID="TextBox1" runat="server"></asp:TextBox>
                                        </div>
                                         <div class="form-group">
                                            <asp:TextBox CssClass="form-control" placeholder="Password"   ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:Button CssClass="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <p><a href="homepage.aspx"><< Back to home</a></p>
            </div>
        </div>
    </div>
</asp:Content>

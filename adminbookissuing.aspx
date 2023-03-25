<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookissuing.aspx.cs" Inherits="ELibraryManagement.adminbookissuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <center>
                                            <h4>Book Issuing</h4>
                                            <img width="100px" src="imgs/books.png" />
                                        </center>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="TextBox3">Member ID</label>
                                            <asp:TextBox CssClass="form-control" placeholder="ID" ID="TextBox3" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="TextBox3">Member Name</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Member Name" ID="TextBox2" runat="server" ReadOnly="True"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="TextBox3">Start Date</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Start Date" ID="TextBox4" runat="server" TextMode="Date"></asp:TextBox>
                                        </div>
                                         <div class="form-group">
                                            <asp:Button CssClass="btn btn-primary btn-block" ID="Button2" runat="server" Text="Issue" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="TextBox1">Book ID</label>
                                        <div class="form-group">
                                            <div class="input-group">
                                                 <asp:TextBox CssClass="form-control" placeholder="ID" ID="TextBox1" runat="server"></asp:TextBox>
                                                 <asp:Button CssClass="btn btn-dark " ID="Button4" runat="server" Text="Go" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="TextBox3">Book Name</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Book Name" ID="TextBox5" runat="server" ReadOnly="True"></asp:TextBox>
                                        </div>
                                         <div class="form-group">
                                            <label for="TextBox3">Start Date</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Start Date" ID="TextBox6" runat="server" TextMode="Date"></asp:TextBox>
                                        </div>
                                         <div class="form-group">
                                            <asp:Button CssClass="btn btn-success btn-block" ID="Button1" runat="server" Text="Return" />
                                        </div>
                                    </div>
                                </div>
                        </div>
                    </div>
                        <p><a href="homepage.aspx"><< Back to home</a></p>
                </div>
            </div>
        </div>
             
             <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Issued Book List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:GridView class="table table-stripped table-bordered" ID="GridView1" runat="server">
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
   </div>
</asp:Content>

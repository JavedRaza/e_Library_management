<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewbooks.aspx.cs" Inherits="ELibraryManagement.viewbooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div class="container">
        <div class="col-md-12">
            <div class="row">
                <div class="col">
                    <center>
                        <h4>Book Inventory List</h4>
                    </center>
                </div>
            </div>
            <div class="row">
                <div class="col">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <asp:GridView class="table table-stripped table-bordered" ID="GridView1" runat="server">
                    </asp:GridView>
                </div>
            </div>
            <p><a href="homepage.aspx"><< Back to home</a></p>
        </div>
    </div>
</asp:Content>

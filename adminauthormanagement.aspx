<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminauthormanagement.aspx.cs" Inherits="ELibraryManagement.adminauthormanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <center>
                                            <h4>User Profile</h4>
                                            <img width="100px" src="imgs/writer.png" />
                                        </center>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-4">
                                        <label for="TextBox1">Author ID</label>
                                        <div class="form-group">
                                            <div class="input-group">
                                                 <asp:TextBox CssClass="form-control" placeholder="ID" ID="TextBox1" runat="server"></asp:TextBox>
                                                 <asp:Button CssClass="btn btn-secondary " ID="Button4" runat="server" Text="Go" OnClick="Button4_Click" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="TextBox3">Author Name</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Author Name" ID="TextBox3" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-4">
                                        <div class="form-group">
                                            <asp:Button CssClass="btn btn-success btn-block " ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
                                        </div>
                                 </div>
                                    <div class="col-4">
                                        <div class="form-group">
                                            <asp:Button CssClass="btn btn-info btn-block" ID="Button2" runat="server" Text="Update" OnClick="Button2_Click" />
                                        </div>
                                 </div>
                                    <div class="col-4">
                                        <div class="form-group">
                                            <asp:Button CssClass="btn btn-danger btn-block " ID="Button3" runat="server" Text="Delete" OnClick="Button3_Click" />
                                        </div>
                                 </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
             <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Author List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [author_master_btl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="author_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="author_id" HeaderText="author_id"  SortExpression="author_id" />
                                        <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
   </div>
</asp:Content>

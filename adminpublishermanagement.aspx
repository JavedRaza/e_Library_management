<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminpublishermanagement.aspx.cs" Inherits="ELibraryManagement.adminpublishermanagement" %>
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
                                            <h4>Publisher Profile</h4>
                                            <img width="100px" src="imgs/publisher.png" />
                                        </center>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-4">
                                        <label for="TextBox1">Publisher ID</label>
                                        <div class="form-group">
                                            <div class="input-group">
                                                 <asp:TextBox CssClass="form-control" placeholder="ID" ID="TextBox1" runat="server"></asp:TextBox>
                                                 <asp:Button CssClass="btn btn-secondary " ID="Button4" runat="server" Text="Go" OnClick="Button4_Click" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="TextBox3">Publihser Name</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Publisher Name" ID="TextBox3" runat="server"></asp:TextBox>
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
                                    <h4>Publisher List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [publisher_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-stripped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="publisher_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="publisher_id" HeaderText="publisher_id" ReadOnly="True" SortExpression="publisher_id" />
                                        <asp:BoundField DataField="publisher_name" HeaderText="publisher_name" SortExpression="publisher_name" />
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

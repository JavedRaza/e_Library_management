<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookinventory.aspx.cs" Inherits="ELibraryManagement.adminbookinventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgView').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);

            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <center>
                                            <h4>Book Details</h4>
                                            <img id="imgView" width="100px" height="150px" src="bookInventory/books1.png" />
                                        </center>
                                    </div>
                                </div>
                                <br/>
                                <div class="row">
                                    <div class="col">
                                        <asp:FileUpload onChange="readURL(this)" CssClass="form-control" ID="FileUpload1" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="TextBox3">Book ID</label>
                                            <div class="input-group">
                                                <asp:TextBox CssClass="form-control" placeholder="ID" ID="TextBox3" runat="server"></asp:TextBox>
                                                <asp:Button CssClass="btn btn-primary " ID="Button3" runat="server" Text="Go" OnClick="Button3_Click" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="form-group">
                                            <label for="TextBox3">Book Name</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Searched... book" ID="TextBox2" runat="server" ></asp:TextBox>
                                        </div>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                       <div class="form-group">
                                            <label for="TextBox3">Language</label>
                                            <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                                <asp:ListItem Text="English" Value="English"></asp:ListItem>
                                                <asp:ListItem Text="Hindi" Value="Hindi"></asp:ListItem>
                                                <asp:ListItem Text="Telugu" Value="Telugu"></asp:ListItem>
                                                <asp:ListItem Text="Gujrati" Value="Gujrati"></asp:ListItem>
                                                <asp:ListItem Text="Bengali" Value="Bengali"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                       <div class="form-group">
                                            <label for="TextBox3">Publisher Name</label>
                                            <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server">
                                                <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                                <asp:ListItem Text="Arihant Books" Value="Arihant Books"></asp:ListItem>
                                                <asp:ListItem Text="Jaico Publishing House" Value="Jaico Publishing House"></asp:ListItem>
                                                <asp:ListItem Text="Rupa Publications " Value="Rupa Publications"></asp:ListItem>
                                                <asp:ListItem Text="Roald Dahl" Value="Roald Dahl"></asp:ListItem>
                                                <asp:ListItem Text="Pan Macmillan India" Value="Pan Macmillan India"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="TextBox3">Author Name</label>
                                            <asp:DropDownList CssClass="form-control" ID="DropDownList3" runat="server">
                                                <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                                <asp:ListItem Text="J. K. Rowling" Value="J. K. Rowling"></asp:ListItem>
                                                <asp:ListItem Text="Stephen King" Value="Stephen King"></asp:ListItem>
                                                <asp:ListItem Text="Rabindranath Tagore" Value="Rabindranath Tagore"></asp:ListItem>
                                                <asp:ListItem Text="Roald Dahl" Value="Roald Dahl"></asp:ListItem>
                                                <asp:ListItem Text="Ernest Hemingway" Value="Ernest Hemingway"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label for="TextBox3">Publish Date</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Date" ID="TextBox8" runat="server" TextMode="Date"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="TextBox3">Genre</label>
                                            <asp:ListBox CssClass="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="5">
                                                <asp:ListItem Text="Fiction" Value="Fiction"></asp:ListItem>
                                                <asp:ListItem Text="Novel" Value="Novel"></asp:ListItem>
                                                <asp:ListItem Text="Narrative" Value="Narrative"></asp:ListItem>
                                                <asp:ListItem Text="Science fiction" Value="Science fiction"></asp:ListItem>
                                                <asp:ListItem Text="Romance novel" Value="Romance novel"></asp:ListItem>
                                                <asp:ListItem Text="Punjabi" Value="Punjabi"></asp:ListItem>

                                            </asp:ListBox>
                                        </div>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4">
                                        <div class="form-group">
                                            <label for="TextBox3">Edition</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Edition" ID="TextBox9" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="TextBox3">Actual Stock</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Actual Stock" ID="TextBox10" runat="server"></asp:TextBox>
                                        </div>

                                    </div>
                                    <div class="col-4">
                                        <div class="form-group">
                                            <label for="TextBox3">Book Cost(per unit)</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Book Cost" ID="TextBox11" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="TextBox3">Current Stock</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Current Stock" ID="TextBox12" runat="server" ReadOnly="True"></asp:TextBox>
                                        </div>

                                    </div>
                                    <div class="col-4">
                                        <div class="form-group">
                                            <label for="TextBox3">Pages</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Pages" ID="TextBox13" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="TextBox3">Issued Books</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Issued Books" ID="TextBox14" runat="server" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="TextBox3">Book Description</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Book description" ID="TextBox15" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4">
                                        <div class="form-group">
                                            <asp:Button CssClass="btn btn-success btn-block" ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group">
                                            <asp:Button CssClass="btn btn-primary btn-block" ID="Button2" runat="server" Text="Update" OnClick="Button2_Click" />
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group">
                                            <asp:Button CssClass="btn btn-danger btn-block" ID="Button4" runat="server" Text="Delete" OnClick="Button4_Click" />
                                        </div>
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
             
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Inventory List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-stripped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="book_id" HeaderText="book_id" ReadOnly="True" SortExpression="book_id" />
                                        <asp:BoundField DataField="book_name" HeaderText="book_name" SortExpression="book_name" />
                                        <asp:BoundField DataField="genre" HeaderText="genre" SortExpression="genre" />
                                        <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name" />
                                        <asp:BoundField DataField="publisher_name" HeaderText="publisher_name" SortExpression="publisher_name" />
                                        <asp:BoundField DataField="publish_date" HeaderText="publish_date" SortExpression="publish_date" />
                                        <asp:BoundField DataField="language" HeaderText="language" SortExpression="language" />
                                        <asp:BoundField DataField="edition" HeaderText="edition" SortExpression="edition" />
                                        <asp:BoundField DataField="book_cost" HeaderText="book_cost" SortExpression="book_cost" />
                                        <asp:BoundField DataField="no_of_pages" HeaderText="no_of_pages" SortExpression="no_of_pages" />
                                        <asp:BoundField DataField="book_description" HeaderText="book_description" SortExpression="book_description" />
                                        <asp:BoundField DataField="actual_stock" HeaderText="actual_stock" SortExpression="actual_stock" />
                                        <asp:BoundField DataField="current_stock" HeaderText="current_stock" SortExpression="current_stock" />
                                        <asp:BoundField DataField="book_img_link" HeaderText="book_img_link" SortExpression="book_img_link" />
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

<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminusermanagement.aspx.cs" Inherits="ELibraryManagement.adminusermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
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
                                            <h4>Member Details</h4>
                                            <img width="100px" src="imgs/generaluser.png" />
                                        </center>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="TextBox3">Member ID</label>
                                            <div class="input-group">
                                                <asp:TextBox CssClass="form-control" placeholder="ID" ID="TextBox3" runat="server"></asp:TextBox>
                                                <asp:Button CssClass="btn btn-primary " ID="Button3" runat="server" Text="Go" OnClick="Button3_Click" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="TextBox3">DOB</label>
                                            <asp:TextBox CssClass="form-control" placeholder="DOB" ID="TextBox4" runat="server" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="TextBox3">Full Name</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Member Name" ID="TextBox2" runat="server" ReadOnly="True"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="TextBox7">Contact No</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Contact No" ID="TextBox7" runat="server" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label for="TextBox8">Account Status</label>
                                            <div class="input-group">
                                                 <asp:TextBox CssClass="form-control" placeholder="Account status" ID="TextBox8" runat="server" ReadOnly="True"></asp:TextBox>
                                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-success ml-1 mr-1" runat="server" OnClick="LinkButton1_Click"><i class="fa-sharp fa-solid fa-check-circle"></i></asp:LinkButton>
                                                <asp:LinkButton ID="LinkButton2" CssClass="btn btn-warning mr-1 " runat="server" OnClick="LinkButton2_Click"><i class="fa-sharp fa-solid fa-pause-circle"></i></asp:LinkButton>
                                                <asp:LinkButton ID="LinkButton3" CssClass="btn btn-danger mr-1 " runat="server" OnClick="LinkButton3_Click"><i class="fa-sharp fa-solid fa-times-circle"></i></asp:LinkButton>
                                                 
                                                
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="TextBox9">Email No</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Email No" ID="TextBox9" runat="server" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                               </div>
                               <div class="row">
                                   <div class="col-md-4">
                                       <div class="form-group">
                                            <label for="TextBox3">State</label>
                                            <asp:TextBox CssClass="form-control" placeholder="State" ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
                                        </div>

                                   </div>
                                   <div class="col-md-4">
                                       <div class="form-group">
                                            <label for="TextBox3">City</label>
                                            <asp:TextBox CssClass="form-control" placeholder="City" ID="TextBox5" runat="server" ReadOnly="True"></asp:TextBox>
                                        </div>
                                   </div>
                                   <div class="col-md-4">
                                       <div class="form-group">
                                            <label for="TextBox3">Pin Code</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Pin Code" ID="TextBox6" runat="server" ReadOnly="True"></asp:TextBox>
                                        </div>

                                   </div>
                               </div>
                               <div class="row">
                                   <div class="col-12">
                                       <div class="form-group">
                                            <label for="TextBox3">Full Postal Address</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Full Postal Address" ID="TextBox10" runat="server" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                   </div>
                               </div>
                               <div class="row">
                                   <div class="col">
                                       <div class="form-group">
                                            <asp:Button CssClass="btn btn-danger btn-block" ID="Button1" runat="server" Text="Delete User Permanently" OnClick="Button1_Click" />
                                        </div>
                                   </div>
                               </div>
                        </div>
                    </div>
                        <p><a href="homepage.aspx"><< Back to home</a></p>
                </div>
            </div>
        </div>
             
             <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Member List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-stripped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" >
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="ID" ReadOnly="True" SortExpression="member_id" />
                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="account_status" HeaderText="Status" SortExpression="account_status" />
                                        <asp:BoundField DataField="contact_no" HeaderText="Contact No" SortExpression="contact_no" />
                                        <asp:BoundField DataField="email" HeaderText="E-mail Id" SortExpression="email" />
                                        <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
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

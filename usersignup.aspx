   <%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="ELibraryManagement.usersignup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/generaluser.png" />
                                    <h4> Member Sign Up</h4>
                                </center>
                                <hr />
                                </div>
                        </div>
                        <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="TextBox1">Full Name</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Full Name" ID="TextBox1" runat="server"></asp:TextBox>
                                        </div>
                                         <div class="form-group">
                                             <label for="TextBox2">Contact Number</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Contact Number"   ID="TextBox2" runat="server" TextMode="Number"></asp:TextBox>
                                        </div>
                                         
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="TextBox3">Date of Birth</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Date of Birth" ID="TextBox3" runat="server" TextMode="Date"></asp:TextBox>
                                        </div>
                                         <div class="form-group">
                                             <label for="TextBox4">Email ID</label>
                                            <asp:TextBox CssClass="form-control" placeholder="Email ID "   ID="TextBox4" runat="server" TextMode="Email"></asp:TextBox>
                                        </div>
                                         
                                    </div>
                                </div>
                        <div class="row">
                                <div class="col-4">
                                   <div class="form-group">
                                    <label for="">State</label>
                                       <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                           <asp:ListItem Text="Select" Value="select"></asp:ListItem>
                                           <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh"></asp:ListItem>
                                           <asp:ListItem Text="Madhya Pradesh" Value="MAdhya Pradesh"></asp:ListItem>
                                           <asp:ListItem Text="Jharkhand" Value="Jharkhand"></asp:ListItem>
                                           <asp:ListItem Text="Rajasthan" Value="Rajasthan"></asp:ListItem>
                                           <asp:ListItem Text="Punjab" Value="Punjab"></asp:ListItem>
                                           <asp:ListItem Text="Delhi" Value="Delhi"></asp:ListItem>
                                           <asp:ListItem Text="Uttarakhand" Value="Uttarakhand"></asp:ListItem>
                                           <asp:ListItem Text="Himachal" Value="Himachal"></asp:ListItem>
                                           <asp:ListItem Text="Jammu & Kahsmir" Value="ammu & Kahsmir"></asp:ListItem>
                                           <asp:ListItem Text="Haryana" Value="Haryana"></asp:ListItem>
                                           <asp:ListItem Text="Maharashtra" Value="Maharashtra"></asp:ListItem>
                                           <asp:ListItem Text="West Bengal" Value="West Bengal"></asp:ListItem>
                                           <asp:ListItem Text="Bihar" Value="Bihar"></asp:ListItem>
                                           <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh"></asp:ListItem>
                                           <asp:ListItem Text="Telangana" Value="Telangana"></asp:ListItem>
                                           <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu"></asp:ListItem>
                                           <asp:ListItem Text="Kerala" Value="Kerala"></asp:ListItem>
                                           <asp:ListItem Text="Goa" Value="Goa"></asp:ListItem>
                                       </asp:DropDownList>
                                </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="TextBox5">City</label>
                                        <asp:TextBox CssClass="form-control" placeholder="City"  ID="TextBox5" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="TextBox6">Pin Code</label>
                                        <asp:TextBox CssClass="form-control" placeholder="Pin Code"  ID="TextBox6" runat="server" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="TextBox7">Full Address</label>
                                        <asp:TextBox CssClass="form-control" placeholder="Full Address" ID="TextBox7" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        <div class="row">
                                <div class="col-md-12 text-center">
                                    <span class="badge badge-pill badge-primary">Login Credentials</span>
                                </div>
                            </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="TextBox8">User Login</label>
                                    <asp:TextBox CssClass="form-control" placeholder="User Login" ID="TextBox8" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                 <div class="form-group">
                                    <label for="TextBox9">Full Name</label>
                                    <asp:TextBox CssClass="form-control" placeholder="Password" ID="TextBox9" runat="server" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                         </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                     <asp:Button CssClass="btn btn-success btn-block btn-lg" ID="Button10" runat="server" Text="Sign Up" OnClick="Button10_Click" />
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
   
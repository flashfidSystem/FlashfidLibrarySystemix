<%@ Page Title="Admin Sign Up" Language="C#" MasterPageFile="~/ProfileMaster/Site1.Master" AutoEventWireup="true" CodeBehind="AdminSignUp.aspx.cs" Inherits="LibrarySystem.Accounts.AdminSignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
       <div class="container">
     <div class="row">
         <div class="col-md-8 mx-auto">
               <div class="card">

             <div class="card-body">
                 <div class="row">
                <div class="col">
                    <center>
                   <img width="100px" src="../imgs/download%20(1).png" />
                    </center>
                       </div>
                    </div>

                  <div class="row">
                <div class="col">
                    <center>
                   <h4>Librarian Sign Up</h4>
                    </center>
                       </div>
                    </div>



                  <div class="row">
                <div class="col">
                    <hr>
                       </div>
                    </div>

                 <div class="row">
                <div class="col-md-6">
                     <label>Full Name
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFullname" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="as">*</asp:RequiredFieldValidator>
                     </label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtFullname" runat="server" placeholder="Full Name" ValidationGroup="as"></asp:TextBox>
                       </div>
                       </div>
                      <div class="col-md-6">
                   <label>Date of Birth <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDOB" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="as">*</asp:RequiredFieldValidator>
                          </label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtDOB" runat="server" placeholder="Password" TextMode="Date" ValidationGroup="as"></asp:TextBox>
                       </div>
                       </div>


                    </div>


                 
                 <div class="row">
                <div class="col-md-6">
                     <label>Phone Number
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPhone" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="as">*</asp:RequiredFieldValidator>
                     </label>&nbsp; <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtPhone" runat="server" placeholder="Phone Number" TextMode="Number" ValidationGroup="as"></asp:TextBox>
                       </div>
                       </div>
                      <div class="col-md-6">
                   <label>Email
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEmail" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="as">*</asp:RequiredFieldValidator>
                          </label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="Email" TextMode="Email" ValidationGroup="as"></asp:TextBox>
                       </div>
                       </div>
                    </div>



                     <div class="row">
                <div class="col-md-4">
                     <label>City <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtCity" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="as">*</asp:RequiredFieldValidator>
                     </label>&nbsp;<div class="form-group">
                        <asp:TextBox Class="form-control" ID="txtCity" runat="server" placeholder="City" ValidationGroup="as"  ></asp:TextBox>
                       </div>
                       </div>
                      <div class="col-md-4">
                   <label>Pin Code </label>&nbsp;<div class="form-group">
                        <asp:TextBox Class="form-control" ID="txtCode" runat="server" placeholder="Code"  TextMode="Number"></asp:TextBox>
                       </div>
                       </div>
                             <div class="col-md-4">
                   <label>State
                                 </label>
                                 &nbsp; <div class="form-group">
                        

                            <asp:DropDownList CssClass="form-control" ID="DropState" runat="server" ValidationGroup="as">
                                 
                        </asp:DropDownList>
                       </div>
                       </div>

                    </div>



                   <div class="row">
                <div class="col">
                     <label>Full Address <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtAdess" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="as">*</asp:RequiredFieldValidator>
                     </label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtAdess" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2" ValidationGroup="as"></asp:TextBox>
                       </div>
                       </div>
                   
                    </div>


                  <div class="row">
                    
                <div class="col">
                <center>
                     <span class="badge badge-pill badge-primary">Note: User Name and Password is case sentitive</span> </center>
                       </div>
                         
                    </div>



                  <div class="row">
                <div class="col-md-6">
                     Librarian ID
                   <label>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtLIbID" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="as">*</asp:RequiredFieldValidator>
                     </label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtLIbID" runat="server" placeholder="User Name" ValidationGroup="as"  ></asp:TextBox>
                       </div>
                       </div>
                      <div class="col-md-6">
                   <label>Password <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtPassword" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="as">*</asp:RequiredFieldValidator>
                          </label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtPassword" runat="server" placeholder="Password"  TextMode="Password" ValidationGroup="as"></asp:TextBox>
                       </div>
                       </div>
                    </div>



                  <div class="row">
                <div class="col">
              
                     <div class="form-group">
                         <asp:Button Class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Sign me Up" OnClick="Button1_Click" ValidationGroup="as" />
                       </div>
                      
                       </div>
                    </div>

                </div>
         </div>
             <a href="../homepage.aspx"><< Back to Home</a>

         </br> </br> </br>
         </div>
       


         
     </div>
    </div>

</asp:Content>

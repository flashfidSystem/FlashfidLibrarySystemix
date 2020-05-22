<%@ Page Title="User sign up" Language="C#" MasterPageFile="~/ProfileMaster/Site1.Master" AutoEventWireup="true" CodeBehind="UserSignup.aspx.cs" Inherits="LibrarySystem.UserSignup" %>
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
                       <img width="150px" src="../imgs/istockphoto-1095289632-170x170.jpg" /> 
                    </center>
                       </div>
                    </div>

                  <div class="row">
                <div class="col">
                    <center>
                   <h4>Student Sign Up</h4>
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
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtfullname" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="asv">*</asp:RequiredFieldValidator>
                     </label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtfullname" runat="server" placeholder="Full Name" ValidationGroup="asv"></asp:TextBox>
                       </div>
                       </div>
                      <div class="col-md-6">
                   <label>Date of Birth</label>
                    <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtdob" runat="server" placeholder="Password" TextMode="Date"></asp:TextBox>
                       </div>
                       </div>


                    </div>


                 
                 <div class="row">
                <div class="col-md-6">
                     <label>Phone Number
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtphoneno" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="asv">*</asp:RequiredFieldValidator>
                     </label>
                     &nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtphoneno" runat="server" placeholder="Phone Number" TextMode="Number" ValidationGroup="asv"></asp:TextBox>
                       </div>
                       </div>
                      <div class="col-md-6">
                   <label>Email
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtemail" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="asv">*</asp:RequiredFieldValidator>
                          </label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtemail" runat="server" placeholder="Email" TextMode="Email" ValidationGroup="asv"></asp:TextBox>
                       </div>
                       </div>
                    </div>



                     <div class="row">
                <div class="col-md-4">
                     <label>City
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtcity" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="asv">*</asp:RequiredFieldValidator>
                     </label>&nbsp;<div class="form-group">
                        <asp:TextBox Class="form-control" ID="txtcity" runat="server" placeholder="City" ValidationGroup="asv"  ></asp:TextBox>
                       </div>
                       </div>
                      <div class="col-md-4">
                   <label>Code</label>&nbsp;<div class="form-group">
                        <asp:TextBox Class="form-control" ID="txtcode" runat="server" placeholder="Code"  TextMode="Number" OnTextChanged="txtcode_TextChanged"></asp:TextBox>
                       </div>
                       </div>
                             <div class="col-md-4">
                   <label>State
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="Dropstate" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="asv">*</asp:RequiredFieldValidator>
                                 </label>&nbsp;<div class="form-group">
                        

                            <asp:DropDownList CssClass="form-control" ID="Dropstate" runat="server" ValidationGroup="asv">
                        
                        </asp:DropDownList>
                       </div>
                       </div>

                    </div>



                   <div class="row">
                <div class="col">
                     <label>Full Address <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtadress" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="asv">*</asp:RequiredFieldValidator>
                     </label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtadress" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2" ValidationGroup="asv"></asp:TextBox>
                       </div>
                       </div>
                   
                    </div>


                  <div class="row">
                    
                <div class="col">
                <center>
                     <span class="badge badge-pill badge-primary">Note: Matric No and Password is case sentitive</span> </center>
                       </div>
                         
                    </div>



                  <div class="row">
                <div class="col-md-6">
                     <label>Matric No
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtmatric" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="asv">*</asp:RequiredFieldValidator>
                     </label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtmatric" runat="server" placeholder="User Name" ValidationGroup="asv"  ></asp:TextBox>
                       </div>
                       </div>
                      <div class="col-md-6">
                   <label>Password <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtpassword" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="asv">*</asp:RequiredFieldValidator>
                          </label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtpassword" runat="server" placeholder="Password"  TextMode="Password" ValidationGroup="asv"></asp:TextBox>
                       </div>
                       </div>
                    </div>



                  <div class="row">
                <div class="col">
              
                     <div class="form-group">
                         <asp:Button Class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Sign me Up" OnClick="Button1_Click" ValidationGroup="asv" />
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

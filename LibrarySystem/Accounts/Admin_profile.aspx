<%@ Page Title="Admin Profile" Language="C#" MasterPageFile="~/ProfileMaster/Site1.Master" AutoEventWireup="true" CodeBehind="Admin_profile.aspx.cs" Inherits="LibrarySystem.Accounts.Admin_profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

    </script>

    
    <script type="text/javascript">
        $(document).ready(function () { $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable(); });
    </script>

  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
    <div class="row">
        <center>
        <div class="col">


        </div>
        </center>
     
    </div>
   <br />


      <div class="container-fluid">
     <div class="row">
         <div class="col-12">
             <center>
               <div class="card">

             <div class="card-body">
                  <div class="row">
                <div class="col">
                    <center>
                        <asp:Image ID="Image1"  height="100px" width="100px" Class="rounded-circle" runat="server"></asp:Image>
   <img id="imgview" src="../imgs/read1.png"  width="70px" height="60px" />
 <%--//<img id="imgview" />--%>
                    <%-- // <img id="img3" src=" />--%>
                    </center>
                       </div>
                    </div>
                 
                  <div class="row">
                <div class="col">
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                    <asp:Label ID="Label4" runat="server" Font-Size="XX-Large" ForeColor="Lime"></asp:Label>
                    <center>
                   <h4>My Profile</h4>
<asp:Label ID="Label5" runat="server" Font-Size="Large" ForeColor="#006699"></asp:Label>
                        &nbsp;</center>
                       </div>
                    </div>
                 <hr class="border-primary" />
                   <div class="row">
                <div class="col-12">
                    <asp:FileUpload onchange="readURL(this);" Class="form-control" ID="FileUpload1" runat="server" />
                      <asp:Button Class="  btn btn-success" ID="btnUpload" runat="server" Text="Upload Image" OnClick="btnUpload_Click" ValidationGroup="aaa" />
                    </div>
                    </div>
                   <hr class="border-primary" />
                  <div class="row">
                <div class="col">
  
                       </div>
                    </div>

                  
                  <div class="row">
                    
                <div class="col">
                <center>
                     <span class="badge badge-pill badge-primary">Note:Member ID and Password is case sentitive</span>&nbsp; Last Update-<asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Small"></asp:Label>
                    </center>
                       </div>
                         
                    </div>
                  <hr class="border-primary" />
                 
                  <div class="row">
                <div class="col-md-4">
                     <label>Librarian ID
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtMatric" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="spa">*</asp:RequiredFieldValidator>
                     </label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtMatric" runat="server" placeholder="User Name" ReadOnly="True" ValidationGroup="spa"></asp:TextBox>
                         <asp:Button Class="  btn btn-success" ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click" />
                         </div>
                       </div>
                      <div class="col-md-4">
                   <label>Password <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtPassword" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="spa">*</asp:RequiredFieldValidator>
                          </label>
                    &nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtPassword" runat="server" placeholder="Old Password"  TextMode="Password" ValidationGroup="spa"></asp:TextBox>
                       </div>
                       </div>

                       <div class="col-md-4">
                     <label>Confirm Password <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtConfirmPass" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="spa">*</asp:RequiredFieldValidator>
                           </label>
                    &nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtConfirmPass" runat="server" placeholder="New Password" TextMode="Password" ValidationGroup="spa" ></asp:TextBox>
                       </div>
                       </div>


                    </div>




                
                 <div class="row">
                <div class="col-md-6">
                     <label>Full Name <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtFullName" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="spa">*</asp:RequiredFieldValidator>
                     </label>
                    &nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtFullName" runat="server" placeholder="Full Name" ValidationGroup="spa"></asp:TextBox>
                       </div>
                       </div>
                      <div class="col-md-6">
                   <label>Date of Birth</label>
                    <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtDOB" runat="server" placeholder="Password" TextMode="Date"></asp:TextBox>
                       </div>
                       </div>


                    </div>


                 
                 <div class="row">
                <div class="col-md-6">
                     <label>Phone Number
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtNumner" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="spa">*</asp:RequiredFieldValidator>
                     </label>
                    &nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtNumner" runat="server" placeholder="Phone Number" TextMode="Number" ValidationGroup="spa"></asp:TextBox>
                       </div>
                       </div>
                      <div class="col-md-6">
                   <label>Email <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEmail" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="spa">*</asp:RequiredFieldValidator>
                          </label>
                    &nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="Email" TextMode="Email" ValidationGroup="spa"></asp:TextBox>
                       </div>
                       </div>
                    </div>



                     <div class="row">
                <div  class="col-md-4">
                     <label>City <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCity" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="spa">*</asp:RequiredFieldValidator>
                     </label>
                    &nbsp;<div class="form-group">
                        <asp:TextBox Class="form-control" ID="txtCity" runat="server" placeholder="City" ValidationGroup="spa"  ></asp:TextBox>
                       </div>
                       </div>
                      <div class="col-md-4">
                   <label>Code <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCode" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="spa">*</asp:RequiredFieldValidator>
                          </label>
                    &nbsp;<div class="form-group">
                        <asp:TextBox Class="form-control" ID="txtCode" runat="server" placeholder="Code"  TextMode="Number" ValidationGroup="spa"></asp:TextBox>
                       </div>
                       </div>
                             <div class="col-md-4">
                   <label>State <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropState" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="spa">*</asp:RequiredFieldValidator>
                                 </label>
                    &nbsp;<div class="form-group">
                        

                            <asp:DropDownList CssClass="form-control" ID="DropState" runat="server" ValidationGroup="spa">
                                  <asp:ListItem Text="Select" Value="Select" runat="server"></asp:ListItem>
                                  <asp:ListItem Text="Lagos" Value="Lagos" runat="server"></asp:ListItem>
                                  <asp:ListItem Text="Select" Value="Select" runat="server"></asp:ListItem>
                                  <asp:ListItem Text="Select" Value="Select" runat="server"></asp:ListItem>
                                  <asp:ListItem Text="Select" Value="Select" runat="server"></asp:ListItem>
                                  <asp:ListItem Text="Select" Value="Select" runat="server"></asp:ListItem>
                                  <asp:ListItem Text="Select" Value="Select" runat="server"></asp:ListItem>
                                  <asp:ListItem Text="Select" Value="Select" runat="server"></asp:ListItem>
                                  <asp:ListItem Text="Select" Value="Select" runat="server"></asp:ListItem>
                                  <asp:ListItem Text="Select" Value="Select" runat="server"></asp:ListItem>
                                  <asp:ListItem Text="Select" Value="Select" runat="server"></asp:ListItem>
                                  <asp:ListItem Text="Select" Value="Select" runat="server"></asp:ListItem>
                                  <asp:ListItem Text="Select" Value="Select" runat="server"></asp:ListItem>
                                  <asp:ListItem Text="Select" Value="Select" runat="server"></asp:ListItem>
                                  <asp:ListItem Text="Select" Value="Select" runat="server"></asp:ListItem>
                                  <asp:ListItem Text="Select" Value="Select" runat="server"></asp:ListItem>
                                  <asp:ListItem Text="Select" Value="Select" runat="server"></asp:ListItem>
                        </asp:DropDownList>
                       </div>
                       </div>

                    </div>



                   <div class="row">
                <div class="col-12">
                     <label>Full Address <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddress" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="spa">*</asp:RequiredFieldValidator>
                     </label>
                    &nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2" ValidationGroup="spa"></asp:TextBox>
                       </div>
                       </div>
                   
                    </div>

            




                  <div class="row">
                <div class="col-8 mx-auto">
              <center>
                     <div class="form-group">
                         <asp:Button Class="btn btn-success btn-lg btn-block" ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" ValidationGroup="spa" />
                       </div>
                      </center>
                       </div>
                    </div>

                </div>
         </div>
             <a href="../homepage.aspx"><< Back to Home</a>

         </br> </br> </br>
                 </center>
         </div>
       
      

         
     </div>
    </div>




</asp:Content>


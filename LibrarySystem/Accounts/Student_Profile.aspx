<%@ Page Title="Student profile" Language="C#" MasterPageFile="~/ProfileMaster/Site1.Master" AutoEventWireup="true" CodeBehind="Student_Profile.aspx.cs" Inherits="LibrarySystem.Accounts.Student_Profile" %>
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
     
       <div class="container-fluid">
     <div class="row">
         <div class="col-md-5">
               <div class="card">

             <div class="card-body">
                  <div class="row">
                <div class="col">
                    <center>
                       
                        <asp:Image ID="Image1" height="100px" width="100px" Class="rounded-circle" runat="server"></asp:Image>
   <img id="imgview" src="../imgs/read1.png" height="50px" width="50px" Class="rounded-circle"" />
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
                        &nbsp;&nbsp;&nbsp; Your<span> Status -</span>
                        <asp:Label CssClass="badge badge-pill badge-success" ID="Label1" runat="server" Text="Status"></asp:Label>
                    </center>
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
                     <span class="badge badge-pill badge-primary">Note:Matric No and Password is case sentitive</span>&nbsp; Last Update-<asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Small"></asp:Label>
                    </center>
                       </div>
                         
                    </div>
                  <hr class="border-primary" />
                 
                  <div class="row">
                <div class="col-md-4">
                     <label>Matric Number
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtMatric" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="as">*</asp:RequiredFieldValidator>
                     </label><div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtMatric" runat="server" placeholder="User Name" ReadOnly="True" ValidationGroup="as"></asp:TextBox>
                         <asp:Button Class="  btn btn-success" ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click" />
                         </div>
                       </div>
                      <div class="col-md-4">
                   <label>Password
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtPassword" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="as">*</asp:RequiredFieldValidator>
                          </label><div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtPassword" runat="server" placeholder="Old Password"  TextMode="Password" ValidationGroup="as"></asp:TextBox>
                       </div>
                       </div>

                       <div class="col-md-4">
                     <label>Confirm Password
                           </label>
                    <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtConfirmPass" runat="server" placeholder="New Password" TextMode="Password" ></asp:TextBox>
                       </div>
                       </div>


                    </div>




                
                 <div class="row">
                <div class="col-md-6">
                     <label>Full Name
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtFullName" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="as">*</asp:RequiredFieldValidator>
                     </label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtFullName" runat="server" placeholder="Full Name" ValidationGroup="as"></asp:TextBox>
                       </div>
                       </div>
                      <div class="col-md-6">
                   <label>Date of Birth
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtDOB" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="as">*</asp:RequiredFieldValidator>
                          </label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtDOB" runat="server" placeholder="Password" TextMode="Date" ValidationGroup="as"></asp:TextBox>
                       </div>
                       </div>


                    </div>


                 
                 <div class="row">
                <div class="col-md-6">
                     <label>Phone Number <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtNumner" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="as">*</asp:RequiredFieldValidator>
                     </label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtNumner" runat="server" placeholder="Phone Number" TextMode="Number" ValidationGroup="as"></asp:TextBox>
                       </div>
                       </div>
                      <div class="col-md-6">
                   <label>Email <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtEmail" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="as">*</asp:RequiredFieldValidator>
                          </label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="Email" TextMode="Email" ValidationGroup="as"></asp:TextBox>
                       </div>
                       </div>
                    </div>



                     <div class="row">
                <div class="col-md-4">
                     <label>City
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtCity" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="as">*</asp:RequiredFieldValidator>
                     </label>&nbsp;<div class="form-group">
                        <asp:TextBox Class="form-control" ID="txtCity" runat="server" placeholder="City" ValidationGroup="as"  ></asp:TextBox>
                       </div>
                       </div>
                      <div class="col-md-4">
                   <label>Code</label>
                    <div class="form-group">
                        <asp:TextBox Class="form-control" ID="txtCode" runat="server" placeholder="Code"  TextMode="Number"></asp:TextBox>
                       </div>
                       </div>
                             <div class="col-md-4">
                   <label>State
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="DropState" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="as">*</asp:RequiredFieldValidator>
                                 </label>
                    &nbsp;<div class="form-group">
                        

                            <asp:DropDownList CssClass="form-control" ID="DropState" runat="server" ValidationGroup="as">
                                 
                        </asp:DropDownList>
                       </div>
                       </div>

                    </div>

                 <div class="row">
               <div class="col-md-4">
                   <label>Daily fine</label>
                          &nbsp;
                          <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtDaily" runat="server" placeholder="Amount" Text="20" OnTextChanged="txtDaily_TextChanged" ReadOnly="True"></asp:TextBox>
                       </div>
                       </div>

                      <div class="col-md-4">
                   <label>Late Day's</label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtLate" runat="server" placeholder="Late Day's" OnTextChanged="txtLate_TextChanged" ReadOnly="True" >0</asp:TextBox>
                       </div>
                       </div>
                  
                      <div class="col-md-4">
                   <label>Fine Amount</label>
                          &nbsp;#
                          <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtAmount" runat="server" placeholder="Amount" ReadOnly="True">0</asp:TextBox>
                       </div>
                       </div>

                    </div>

                   <div class="row">
                <div class="col-12">
                     <label>Full Address
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtAddress" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="as">*</asp:RequiredFieldValidator>
                     </label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2" ValidationGroup="as"></asp:TextBox>
                       </div>
                       </div>
                   
                    </div>

            




                  <div class="row">
                <div class="col-8 mx-auto">
              <center>
                     <div class="form-group">
                         <asp:Button Class="btn btn-success btn-lg btn-block" ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" ValidationGroup="as" />
                       </div>
                      </center>
                       </div>
                    </div>

                </div>
         </div>
             <a href="../homepage.aspx"><< Back to Home</a>

         </br> </br> </br>
         </div>
       
         <div class="col-md-7">

              <div class="card">

             <div class="card-body">
                 <div class="row">
                <div class="col">
                    <center>
                        <img src="../imgs/icons8-return-book-64.png" />
                    </center>
                       </div>
                    </div>

                  <div class="row">
                <div class="col">
                    <center>
                   <h4>All Books Issued</h4>
                        
                        <asp:Label CssClass="badge badge-pill badge-success" ID="Label2" runat="server" Text="Books State"></asp:Label>

                    </center>
                       </div>
                    </div>

                  <div class="row">
                <div class="col">
                     <hr class="border-primary" />
                       </div>
                    </div>

                  <div class="row">
                <div class="col">
                    <asp:GridView Class="table table-striped table-bordered" ID="GridView1" runat="server" Width="458px" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound"></asp:GridView>
                       </div>
                    </div>

          

                </div>



         </div>

         </div>

         
     </div>
    </div>

</asp:Content>

<%@ Page Title="Admin Student Management" Language="C#" MasterPageFile="~/ProfileMaster/Site1.Master" AutoEventWireup="true" CodeBehind="Admin_Student_management.aspx.cs" Inherits="LibrarySystem.Accounts.Admin_management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script type="text/javascript">
        $(document).ready(function () { $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();});

        // $(document).ready( function () {
        // $('#myTable').DataTable();
        //} );
    </script>


</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
       <div class="container-fluid">
     <div class="row">
         <div class="col-md-6">
               <div class="card">
             <div class="card-body">
               <div class="row">
                <div class="col">
                    <center>
                   <h4>Student's Details</h4>
       
                    </center>
                       </div>
                    </div>


                  <div class="row">
                <div class="col">
                    <center>
                       <img src="../imgs/images.jpg" width="150px" height="150px" />  
                    </center>
                       </div>
                    </div>



                  <div class="row">
                <div class="col">
  <hr class="border-primary" />
                       </div>
                    </div>

                 <div class="row">
              
                     <div class="col-md-3">
                         Matric No
                   <label>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMatric" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="as">*</asp:RequiredFieldValidator>
                         </label>&nbsp;<div class="form-group">
                         <div class="input-group">
                        <asp:TextBox CssClass="form-control" ID="txtMatric" runat="server" placeholder="Id" ValidationGroup="as"></asp:TextBox>
                          <asp:Button Class="btn btn-success"   ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click" />
                       </div>
                       </div>
                     </div>



                      <div class="col-md-4">
                   <label>Full Name</label>
                    <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtFullName" runat="server" placeholder="Full Name" ReadOnly="True"></asp:TextBox>
                       </div>
                       </div>

                      <div class="col-md-5">
                   <label>Account Status</label>
                    <div class="form-group">
                         <div class="input-group">
                        <asp:TextBox CssClass="form-control" ID="txtStatus" runat="server" placeholder="Status" ReadOnly="True"></asp:TextBox>
                             <asp:LinkButton Class="btn btn-primary" ID="LinkButton4" runat="server" OnClick="LinkButton4_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                             <asp:LinkButton Class="btn btn-warning" ID="LinkButton5" runat="server" OnClick="LinkButton5_Click"><i class="far fa-pause-circle"></i></asp:LinkButton>
                             <asp:LinkButton Class="btn btn-danger" ID="LinkButton6" runat="server" OnClick="LinkButton6_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                          
                       </div>
                    
                    </div>
                       </div>

                    </div>

 


                       <div class="row">
              
                       <div class="col-md-4">
                   <label>DOB</label>
                    <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtDOB" runat="server" placeholder="DOB" ReadOnly="True" TextMode="Date"></asp:TextBox>
                       </div>
                       </div>


                      <div class="col-md-4">
                   <label>Phone No</label>
                    <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtPhone" runat="server" placeholder="Number" ReadOnly="True" TextMode="Number"></asp:TextBox>
                       </div>
                       </div>

                      <div class="col-md-4">
                   <label>Email</label>
                    <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="Email" ReadOnly="True" TextMode="Email"></asp:TextBox>
                       </div>
                       </div>

                    </div>


                   <div class="row">
              
                       <div class="col-md-4">
                   <label>State</label>
                    <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtState" runat="server" placeholder="State" ReadOnly="True"  ></asp:TextBox>
                       </div>
                       </div>


                      <div class="col-md-4">
                   <label>City</label>
                    <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtMtCity" runat="server" placeholder="City" ReadOnly="True"></asp:TextBox>
                       <%-- <asp:TextBox  ID="txtCity" runat="server"   ></asp:TextBox>--%>
                       </div>
                       </div>

                      <div class="col-md-4">
                   <label>Pin Code</label>
                    <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtCode" runat="server" placeholder="Code" ReadOnly="True" TextMode="Email"></asp:TextBox>
                       </div>
                       </div>

                    </div>






                 <div class="row">
              
                     

                      <div class="col-md-12">
                   <label>Student Address</label>
                    <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" placeholder="Student Address" TextMode="MultiLine" Rows="2" ReadOnly="True"></asp:TextBox>
                       </div>
                       </div>

                    </div>


                 <center>
   <asp:Button Class="btn btn-dark " ID="Button1" runat="server" Text="Cancel" OnClick="Button1_Click" />
                 </center>
              

                  <div class="row">
              
                        <div class="col-8 mx-auto">
              <asp:Button Class="btn btn-danger btn-lg btn-block"   ID="Button6" runat="server" Text="Delete Student Permanently" OnClick="Button6_Click" ValidationGroup="as" />
                       </div>
                    </div>




                </div>
         </div>
           
             <a href="homepage.aspx"><< Back to Home</a>
         </br> </br> </br>
         </div>
       
         <div class="col-md-6">

              <div class="card">

             <div class="card-body">
                

                  <div class="row">
                <div class="col">
                    <center>
                   <h4>Student List</h4>
       
                    </center>
                       </div>
                    </div>

 

                  <div class="row">
                <div class="col">
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FlashfidLibDBConnectionString %>" SelectCommand="SELECT * FROM [student_master_tbl]"></asp:SqlDataSource>
                     <hr class="border-primary" />
                       </div>
                    </div>

                  <div class="row">
                <div class="col">
                    <asp:GridView Class="table table-striped table-bordered" ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="matric_no" DataSourceID="SqlDataSource1" Width="608px">
                        <Columns>
                            <asp:BoundField DataField="matric_no" HeaderText="Matric No" ReadOnly="True" SortExpression="matric_no" />
                            <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                            <asp:BoundField DataField="account_status" HeaderText="Account Status" SortExpression="account_status" />
                            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                            <asp:BoundField DataField="contact_no" HeaderText="Phone No" SortExpression="contact_no" />
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

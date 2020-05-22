<%@ Page Title="Admin Publisher Management" Language="C#" MasterPageFile="~/ProfileMaster/Site1.Master" AutoEventWireup="true" CodeBehind="Admin_Publisher_Management.aspx.cs" Inherits="LibrarySystem.Admin_Publisher_Management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        $(document).ready(function () { $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();});

        // $(document).ready( function () {
        // $('#myTable').DataTable();
        //} );
    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
     <div class="container">
     <div class="row">
         <div class="col-md-5">
               <div class="card">
             <div class="card-body">
               <div class="row">
                <div class="col">
                    <center>
                   <h4>Publisher Details</h4>
       
                    </center>
                       </div>
                    </div>


                  <div class="row">
                <div class="col">
                    <center>
                       <img src="../imgs/istockphoto-1095289632-170x170.jpg" />  
                    </center>
                       </div>
                    </div>



                  <div class="row">
                <div class="col">
                    <asp:Label ID="Mesageaa" runat="server"></asp:Label>
  <hr class="border-primary" />
                       </div>
                    </div>

                 <div class="row">
                <div class="col-md-4">
                     <label>Publisher Id
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPublisherId" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="ai">*</asp:RequiredFieldValidator>
                     </label>&nbsp;<div class="form-group">
                         <div class="input-group">
                        <asp:TextBox CssClass="form-control" ID="txtPublisherId" runat="server" placeholder="Id" ValidationGroup="ai"></asp:TextBox>
                          <asp:Button Class="btn btn-success"   ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                       </div>
                       </div>
                     </div>
                      <div class="col-md-8">
                   <label>Publisher Name
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPublisherName" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="ai">*</asp:RequiredFieldValidator>
                          </label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtPublisherName" runat="server" placeholder="Publisher Name" ValidationGroup="ai" ></asp:TextBox>
                       </div>
                       </div>


                    </div>


                 
               


                 <center>
<asp:Button Class="btn btn-dark " ID="Button5" runat="server" Text="Cancel" OnClick="Button5_Click"></asp:Button>
                 </center>
                 <br />
                  <div class="row">
                <div class="col-4">
              <asp:Button Class="btn btn-primary btn-lg btn-block"   ID="Button2" runat="server" Text="Add" OnClick="Button2_Click" ValidationGroup="ai" />
                       </div>

                        <div class="col-4">
              <asp:Button Class="btn btn-warning btn-lg btn-block"   ID="Button3" runat="server" Text="Update" OnClick="Button3_Click" ValidationGroup="ai" />
                       </div>

                        <div class="col-4">
              <asp:Button Class="btn btn-danger btn-lg btn-block"   ID="Button4" runat="server" Text="delete" OnClick="Button4_Click" />
                       </div>
                    </div>




                </div>
         </div>
             <a href="Accounts/homepage.aspx"><< Back to Home</a>

         </br> </br> </br>
         </div>
       
         <div class="col-md-7">

              <div class="card">

             <div class="card-body">
                

                  <div class="row">
                <div class="col">
                    <center>
                   <h4>List of Publisher</h4>
       
                    </center>
                       </div>
                    </div>

 

                  <div class="row">
                <div class="col">
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FlashfidLibDBConnectionString %>" SelectCommand="SELECT * FROM [publisher_master_tbl]"></asp:SqlDataSource>
                     <hr class="border-primary" />
                       </div>
                    </div>

                  <div class="row">
                <div class="col">
                    <asp:GridView Class="table table-striped table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1" Width="608px"></asp:GridView>
                       </div>
                    </div>

          

                </div>
         </div>

         </div>

         
     </div>
    </div>

</asp:Content>

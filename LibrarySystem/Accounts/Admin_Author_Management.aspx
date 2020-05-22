<%@ Page Title="Admin Author Management" Language="C#" MasterPageFile="~/ProfileMaster/Site1.Master" AutoEventWireup="true" CodeBehind="Admin_Author_Management.aspx.cs" Inherits="LibrarySystem.Admin_Author_Management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () { $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable(); });
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
                   <h4>Author's Details</h4>
       
                    </center>
                       </div>
                    </div>


                  <div class="row">
                <div class="col">
                    <center>
                <img width="100ppx" height="100px" src="../imgs/images%20(1).png" />       
                    </center>
                       </div>
                    </div>



                  <div class="row">
                <div class="col">
                    <asp:Label ID="mesage" runat="server"></asp:Label>
  <hr class="border-primary" />
                       </div>
                    </div>

                 <div class="row">
                <div class="col-md-5">
                     <label>Author Id</label>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAuthorId" ForeColor="#FF3300" ValidationGroup="aa">required</asp:RequiredFieldValidator>
                     <div class="form-group">
                         <div class="input-group">
                        <asp:TextBox CssClass="form-control" ID="txtAuthorId" runat="server" placeholder="Id" OnTextChanged="txtAuthorId_TextChanged" ValidationGroup="aa"></asp:TextBox>
                          <asp:Button Class="btn btn-primary"   ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click"  />
                       </div>
                       </div>
                     </div>
                      <div class="col-md-7">
                   <label>Author Name</label>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAuthorName" ForeColor="#FF3300" ValidationGroup="aa">required</asp:RequiredFieldValidator>
                          <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtAuthorName" runat="server" placeholder="Author Name" ValidationGroup="aa" ></asp:TextBox>
                       </div>
                       </div>


                    </div>


                 
               
                        <br />
                 <center>
                       <asp:Button Class="btn btn-dark " ID="Button1" runat="server" Text="Cancel" OnClick="Button1_Click" />
                 </center>
               <br />

                  <div class="row">
                <div class="col-4">
              <asp:Button Class="btn btn-primary btn-lg btn-block"   ID="Button2" runat="server" Text="Add" OnClick="Button2_Click" ValidationGroup="aa" />
                       </div>

                        <div class="col-4">
              <asp:Button Class="btn btn-warning btn-lg btn-block"   ID="Button3" runat="server" Text="Update" OnClick="Button3_Click" ValidationGroup="aa" />
                       </div>

                        <div class="col-4">
              <asp:Button Class="btn btn-danger btn-lg btn-block"   ID="Button4" runat="server" Text="delete" OnClick="Button4_Click" />
                       </div>
                    </div>




                </div>
         </div>
             <a href="Accounts/homepage.aspx"><< Back to Home</a>
         </div>
       
        
           <div class="col-md-7">

              <div class="card">

             <div class="card-body">
                

                  <div class="row">
                <div class="col">
                    <center>
                   <h4>List of Authors</h4>
       
                    </center>
                       </div>
                    </div>

 

                  <div class="row">
                <div class="col">
                    
                     <hr class="border-primary" />
                       </div>
                    </div>

                  <div class="row">

                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FlashfidLibDBConnectionString %>" SelectCommand="SELECT * FROM [author_master_tbl]"></asp:SqlDataSource>
                <div class="col">
                   
                    <asp:GridView Class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="author_id" DataSourceID="SqlDataSource1" Width="608px">
                        <Columns>
                            <asp:BoundField DataField="author_id" HeaderText="author_id" ReadOnly="True" SortExpression="author_id" />
                            <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name" />
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

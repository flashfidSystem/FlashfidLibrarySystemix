<%@ Page Title="Admin Book Issueing" Language="C#" MasterPageFile="~/ProfileMaster/Site1.Master" AutoEventWireup="true" CodeBehind="Admin_Book_Issuing.aspx.cs" Inherits="LibrarySystem.Admin_Book_Issuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    
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
                   <h4>Book Issuing</h4>
       
                    </center>
                       </div>
                    </div>


                  <div class="row">
                <div class="col">
                    <center>
                      <img src="../imgs/read1.png" width="150px" height="150px" />
                    </center>
                       </div>
                    </div>



                  <div class="row">
                <div class="col">
  <hr class="border-primary" />
                       </div>
                    </div>

                 <div class="row">
              
                      <div class="col-md-6">
                   <label>Matric No
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMatric" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="ai">*</asp:RequiredFieldValidator>
                          </label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtMatric" runat="server" placeholder="Member Id" ValidationGroup="ai" ></asp:TextBox>
                       </div>
                       </div>

                     <div class="col-md-6">
                     <label>Book Id&nbsp;
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBookID" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="ai">*</asp:RequiredFieldValidator>
                         </label>&nbsp;<div class="form-group">
                         <div class="input-group">
                        <asp:TextBox CssClass="form-control" ID="txtBookID" runat="server" placeholder="Book Id" ValidationGroup="ai"></asp:TextBox>
                          <asp:Button Class="btn btn-success"   ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click" style="height: 31px" />
                       </div>
                       </div>
                     </div>

                    </div>


                 
                 <div class="row">
              
                      <div class="col-md-6">
                   <label>Student Name
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtStuName" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="ai">*</asp:RequiredFieldValidator>
                          </label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtStuName" runat="server" placeholder="Member Name" ReadOnly="True" ValidationGroup="ai"></asp:TextBox>
                       </div>
                       </div>

                      <div class="col-md-6">
                   <label>Book Name
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtBookName" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="ai">*</asp:RequiredFieldValidator>
                          </label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtBookName" runat="server" placeholder="Book Name" ReadOnly="True" ValidationGroup="ai"></asp:TextBox>
                       </div>
                       </div>

                    </div>


                 <div class="row">
              
                      <div class="col-md-6">
                   <label>Issue Date</label>&nbsp;<div class="form-group">
                              <asp:TextBox CssClass="form-control" ID="txtIssueDate" runat="server" placeholder="Issue date" ReadOnly="True"></asp:TextBox>
                       </div>
                       </div>

                      <div class="col-md-6">
                   <label>Due Date
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEnd" Font-Bold="True" ForeColor="#FF3300" ValidationGroup="ai">*</asp:RequiredFieldValidator>
                          <asp:Label ID="Label1" runat="server" ForeColor="#FF3300"></asp:Label>
                          </label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtEnd" runat="server" placeholder="End Date" TextMode="Date" ValidationGroup="ai" OnTextChanged="txtEnd_TextChanged"></asp:TextBox>
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
                <div class="col-5">
              <asp:Button Class="btn btn-primary btn-lg btn-block"   ID="btnIssue" runat="server" Text="Issue" OnClick="btnIssue_Click" ValidationGroup="ai" />
                       </div>

                      <div class="col-2">
             <asp:Button Class="btn btn-dark btn-lg btn-block" ID="Button1" runat="server" Text="C" OnClick="Button1_Click" />
                       </div>

                        <div class="col-5">
              <asp:Button Class="btn btn-success btn-lg btn-block"   ID="btnReturn" runat="server" Text="Return" OnClick="btnReturn_Click" ValidationGroup="ai" />
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
                   <h4>List of Book Issued</h4>
       
                    </center>
                       </div>
                    </div>

 

                  <div class="row">
                <div class="col">
                     <hr class="border-primary" />
                       </div>
                    </div>

                  <div class="row">

                    <%--  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FlashfidLibDBConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>--%>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FlashfidLibDBConnectionString %>" SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>
                <div class="col">
                    <asp:GridView Class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" Width="600px">
                        <Columns>
                            <asp:BoundField DataField="member_id" HeaderText="member_id" SortExpression="member_id" />
                            <asp:BoundField DataField="member_name" HeaderText="member_name" SortExpression="member_name" />
                            <asp:BoundField DataField="book_id" HeaderText="book_id" SortExpression="book_id" />
                            <asp:BoundField DataField="book_name" HeaderText="book_name" SortExpression="book_name" />
                            <asp:BoundField DataField="issue_date" HeaderText="issue_date" SortExpression="issue_date" />
                            <asp:BoundField DataField="due_date" HeaderText="due_date" SortExpression="due_date" />
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

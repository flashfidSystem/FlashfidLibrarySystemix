<%@ Page Title="Super Admin Login" Language="C#" MasterPageFile="~/ProfileMaster/Site1.Master" AutoEventWireup="true" CodeBehind="Super_Admin_Login.aspx.cs" Inherits="LibrarySystem.Accounts.Super_Admin_Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
       <div class="container">
     <div class="row">
         <div class="col-md-6 mx-auto">
               <section>
          
         <div class="card">
             <div class="card-body">
                 <div class="row">
                <div class="col">
                    <center>
                 
<img width="100px" src="../imgs/images.jpg" />
                    </center>
                       </div>
                    </div>

                  <div class="row">
                <div class="col">
                    <center>
                   <h3>Super Admin Login</h3>
                    </center>
                       </div>
                    </div>

                  <div class="row">
                <div class="col">
                    <hr>
                       </div>
                    </div>

                  <div class="row">
                <div class="col">
                    <label>User Name</label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtUsename" runat="server" placeholder="User Name"></asp:TextBox>
                       </div>
                     <label>Password</label>&nbsp;<div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtPass" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                       </div>

                     <div class="form-group">
                         <asp:Button Class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Sign me in" OnClick="Button1_Click" ValidationGroup="al" />
                       </div>
                     <%-- <div class="form-group">
                       <a href="UserSignup.aspx">    <input Class="btn btn-info btn-block btn-lg" id="Button2" type="button" value="Sign Up" /></a>
                       </div>--%>
                       </div>
                    </div>

                </div>
              
         </div>
                   <a href="homepage.aspx"><< Back to Home</a>
                    </br> 
         </br> </br> </br> 
         </section>

         </div>
       
             

        

        
     </div>
    </div>
</asp:Content>

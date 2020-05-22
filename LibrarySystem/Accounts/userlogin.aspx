<%@ Page Title="User Login" Language="C#" MasterPageFile="~/ProfileMaster/Site1.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="LibrarySystem.userlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
     body{

         background-image:url("../imgs/li.png");
         background-repeat:no-repeat;
         background-size:cover;
         opacity: 1;
     }
     .op{
         opacity: 0.5;
     }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      
    <div class="container">
     <div class="row">
         <div class="col-md-6 mx-auto">
               <div class="card">

             <div class="card-body  ">
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
                   <h3>Student Login</h3>
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
                    <label>Matric Number</label>
                    <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtmatric" runat="server" placeholder="User Name"></asp:TextBox>
                       </div>
                     <label>Password</label>
                    <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtpass" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                       </div>

                     <div class="form-group">
                         <asp:Button Class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Sign me in" OnClick="Button1_Click" />
                       </div>
                      <div class="form-group">
                       <a href="UserSignup.aspx">    <input Class="btn btn-info btn-block btn-lg" id="Button2" type="button" value="Sign Up" /></a>
                       </div>
                       </div>
                    </div>

                </div>
         </div>
             <a href="../homepage.aspx"><< Back to Home</a>

          
         </div>
       


         
     </div>
    </div>
   


</asp:Content>

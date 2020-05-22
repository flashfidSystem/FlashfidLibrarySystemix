<%@ Page Title="Darshbord" Language="C#" MasterPageFile="~/ProfileMaster/Site1.Master" AutoEventWireup="true" CodeBehind="DarshBoards.aspx.cs" Inherits="LibrarySystem.Accounts.DarshBoards" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
        <section class="breadcrumbs-section he">
        <div class="container pl-3 p-sm-3">
            <div class="row">
                <div class="col-12">
                    <h2>Dashboard</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="homepage.aspx">Home</a></li>
                        <li class="breadcrumb-item active">Dashboard</li>
                   <h2 class="pa">
                        <center>
                      Only Super Admin have access to this page
                            </center>
                    </h2>
                         </ol>
                     
                </div>
            </div>
        </div>
    </section>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">              
                       <hr class="alert-primary" />
                </div>
            </div>
        </div>
    </section>

 
        <center>
        <div class="container" >
            <div class="row p-5">

                  &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                  <div class="col-md-3">
                     <div class="parent">
                        <asp:Panel CssClass= "alert-secondary" ID="Panel1" runat="server" Width="250px" Height="120px">
                           <h5>Total Number of Admin</h5>
                       <asp:Label CssClass="p-4" ID="lbltotalAdmin" runat="server" Text="0" Font-Bold="True" Font-Size="XX-Large" ForeColor="White"></asp:Label>
                             
                             <img  class="child pt-2" src="../imgs/icons8-laptop-flower-50.png" width="30px" height="50px" />
                                 
                             </asp:Panel>         
                </div>
                      </div>


                    &nbsp;&nbsp;  &nbsp;&nbsp;



                  <div class="col-md-3">
                     <div class="parent">
                        <asp:Panel CssClass="alert-danger " ID="Panel2" runat="server" Width="250px" Height="120px">
                           <h5>Total Number of Student's</h5>
                       <asp:Label CssClass="p-4"   ID="lbltotalStudent" runat="server" Text="0" Font-Bold="True" Font-Size="XX-Large" ForeColor="White"></asp:Label>
                             
                             <img  class="child" src="../imgs/read1.png" width="30px" height="50px" />
                                
                             </asp:Panel>         
                </div>
                      </div>



                 &nbsp;&nbsp;  &nbsp;&nbsp;


                 <div class="col-md-3">
                     <div class="parent">
                        <asp:Panel CssClass="alert-success" ID="Panel3" runat="server" Width="250px" Height="120px">
                           <h5>Total Number of Books</h5>
                       <asp:Label CssClass="p-4" ID="lbltotalBooks" runat="server" Text="0" Font-Bold="True" Font-Size="XX-Large" ForeColor="#003366"></asp:Label>
                            
                             <img  class="child" src="../imgs/icons8-passport-500.png" width="30px" height="50px" />
                                
                             </asp:Panel>         
                </div>
                      </div>

                 &nbsp;&nbsp;  &nbsp;&nbsp;

          </div>
 
            <div class="row p-5">

                  &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                 <div class="col-md-3">
                     <div class="parent">
                        <asp:Panel Class="alert-success " ID="Panel4" runat="server" Width="250px" Height="120px">
                           <h5>Total Amount</h5> <span>
                               <asp:Label ID="Label1" runat="server" Text="#" Font-Bold="True" ForeColor="#009999" Font-Size="X-Large"></asp:Label>

                                                 </span>
                       <asp:Label CssClass="p-4"  ID="lbltotalAmount" runat="server" Text="0000" Font-Bold="True" Font-Size="XX-Large" ForeColor="#006666"></asp:Label>
 
                             <img  class="child" src="../imgs/coinsoooo.png" width="30px" height="50px" />
                                
                             </asp:Panel>         
                </div>
                      </div>

                    &nbsp;&nbsp;  &nbsp;&nbsp;



                <div class="col-md-3">
                     <div class="parent">
                        <asp:Panel CssClass="alert-primary " ID="Panel5" runat="server" Width="250px" Height="120px">
                           <h5>Unreturm Books</h5>
                       <asp:Label CssClass="p-4"  ID="lblUnreturn" runat="server" Text="0" Font-Bold="True" Font-Size="XX-Large" ForeColor="White"></asp:Label>
                             
                             <img  class="child" src="../imgs/ajax-loader.gif" width="30px" height="50px" />
                                
                             </asp:Panel>         
                </div>
                      </div>



                 &nbsp;&nbsp;  &nbsp;&nbsp;

  <div class="col-md-3">
                     <div class="parent">
                        <asp:Panel CssClass= "alert-secondary" ID="Panel6" runat="server" Width="250px" Height="120px">
                           <h5>Total Number of author&#39;s</h5>
                       <asp:Label CssClass="p-4"  ID="lbltotalauthor" runat="server" Text="0" Font-Bold="True" Font-Size="XX-Large" ForeColor="White"></asp:Label>
                           
                             <img  class="child" src="../imgs/icons8-person-48.png" width="30px" height="50px" />
                                
                             </asp:Panel>         
                </div>
                      </div>

                 &nbsp;&nbsp;  &nbsp;&nbsp;

          </div>
        </div>
            </center>
  <div class="container">
      <div class="row">
          <div class="col-md-10">
              <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/imgs/icons8-refund-64.png" OnClick="ImageButton1_Click" Width="58px"></asp:ImageButton>
          </div>
      </div>
  </div>
 
        <div class="container">
            <div class="row p-5">
                <div class="col-md-3">              
                    <asp:LinkButton Class="footerlinks2" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Go to Contact page</asp:LinkButton>
                </div>

                  <div class="col-md-3">              
                    <asp:LinkButton Class="footerlinks2" ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Go to Feed back page</asp:LinkButton>
                </div>

                  <div class="col-md-3">              
                    <asp:LinkButton Class="footerlinks2" ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">Upload PDF</asp:LinkButton>
                </div>
            </div>
        </div>
    

</asp:Content>

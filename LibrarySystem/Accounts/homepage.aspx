<%@ Page Title="Home page" Language="C#" MasterPageFile="~/ProfileMaster/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="LibrarySystem.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script>
       $('.carousel').carousel({
           interval: 100
       })
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
    <section>
        <div class="container-fluid">
            <div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
         
      <img src="../imgs/slides1.png"  class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
    <%-- <h1 class="slide">Issue For Books...</h1>--%>
        <p class="slide">Before You Can Issue a Book you Must Regiser as a User In the Sign Up Button.</p>
      </div>
    </div>
       
    <div class="carousel-item">
      <img src="../imgs/slides2.png"  class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
          
        <%--<h1 class="slide">View Book Inventory...</h1>--%>
        <p>Non Register Can View Books before registeration.</p>
      </div>
    </div>
    <div class="carousel-item">
        
   
      <img src="../imgs/slides3.png"  class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
   <%-- <h1 class="slide">Search for Books...</h1>--%>
        <p class="slide">Non Register Can Search for Books before registeration.</p>
      </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
        </div>
    </section>





    <section>
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <center>
                            <h2>Our Features</h2>
                        <p>Our 3 Main Features</p>
                        <center>           
                </div>
            </div>

                 <div class="row">
                    <div class="col-md-4">
                        <center>
                          <img width="100px" src="../imgs/4-books-png-image-thumb.png" />
                        <h4>Digital Book Inventory</h4>
                        <p>Non Register Can View Books before registeration.</p>
                        </center>                      
                </div>

                      <div class="col-md-4">
                        <center>
                       <img width="100px" src="../imgs/read1.png" />
                        <h4>Search Books</h4>
                        <p >Non Register Can Search for Books before registeration.</p>
                        </center>                      
                          </div>

                           <div class="col-md-4">
                        <center>
                             <img width="100" src="../imgs/icons8-refund-64.png" />
                        <h4>Issuing Books</h4>
                        <p>Before You Can Issue a Book you Must Regiser as a User In the Sign Up Button.</p>
                        </center>                      
                </div>

                

                </div>
            </div>
    </section>

    <section>
        <img src="../imgs/slides4.png" class="img-fluid"/>
    </section>

      <section>
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <center>
                            <h2>Our Process</h2>
                        <p>We have a easy 3 step process</p>
                        </center>  
                </div>
                </div>


                 <div class="row">
                    <div class="col-md-4">
                        <center>
                             <img width="150" src="../imgs/icons8-passport-500.png" /> 
                        <h4>Sign Up</h4>
                        <p>After a User have Register, The Admin Only can make your Account Active Then you aCan Issue a Book.</p>
                        </center>                      
                </div>

                      <div class="col-md-4">
                        <center>
                            <img width="150" src="../imgs/icons8-laptop-flower-50.png" />
                        <h4>Search Books</h4>
                        <p>Search For all Books In the Library.</p>
                        </center>                      
                </div>
                           <div class="col-md-4">
                        <center>
                              <img width="150" src="../imgs/icons8-tall-person-240.png" />
                        <h4>Visit Us</h4>
                        <p>Click on About Us to see More Information About this Site, Or&nbsp; Click Chat button to Chat us.</p>
                        </center>                      
                </div>

                </div>

                </div>
            
    </section>
</asp:Content>

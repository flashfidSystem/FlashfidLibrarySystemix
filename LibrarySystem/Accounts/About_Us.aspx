<%@ Page Title="About Us" Language="C#" MasterPageFile="~/ProfileMaster/Site1.Master" AutoEventWireup="true" CodeBehind="About_Us.aspx.cs" Inherits="LibrarySystem.Accounts.About_Us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
    <section class="breadcrumbs-section">
        <div class="container p-1 p-sm-3">
            <div class="row">
                <div class="col-12">
                    <h2>About Us</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="homepage.aspx">Home</a></li>
                        <li class="breadcrumb-item active">About Us</li>
                    </ol>

                </div>
            </div>
        </div>
    </section>

    <section class="about-company-section">
         <div class="container p-1 p-sm-3">
            <div class="row">
                <div class="col-12 text-center">
                    <h2>About Flashfid System</h2>
                  <hr />
                </div>

                 <div class="col-md-3">
                   <img class="img-fluid qualities-img p-4"  width="700px" height="1900px" src="../imgs/Untitled-1-Recovered%20copy.png" />
         
                </div>

                 <div class="col-md-9">
                  <p>
                      nfrvkrejlguithigorjgyurhgurgjrfngvyurfjsfdiuvfv rhjgvnrfgvuytv rfbnvufnvhyrfnvr fvhfevnrfvurjnfvrtv rfvrr
                      urhfiurhgfyurr gfjrngfiurhueijfurehoirfd edujfreujfreygfre frehyfureifgryefnerjhnfre fhyerfherrbfvyurenfyuerf 4e
                      eiuhfureifyerfre neuifherufrefnbufvnrekjvuyfdnvujfnvf dfhvfdvyufhvjfbvyufdhvkfnvhdfvyufnv.
                  </p>
                       <p>
                      nfrvkrejlguithigorjgyurhgurgjrfngvyurfjsfdiuvfv rhjgvnrfgvuytv rfbnvufnvhyrfnvr fvhfevnrfvurjnfvrtv rfvrr
                      urhfiurhgfyurr gfjrngfiurhueijfurehoirfd edujfreujfreygfre frehyfureifgryefnerjhnfre fhyerfherrbfvyurenfyuerf 4e
                      eiuhfureifyerfre neuifherufrefnbufvnrekjvuyfdnvujfnvf dfhvfdvyufhvjfbvyufdhvkfnvhdfvyufnv.
                  </p>
                       <p>
                      nfrvkrejlguithigorjgyurhgurgjrfngvyurfjsfdiuvfv rhjgvnrfgvuytv rfbnvufnvhyrfnvr fvhfevnrfvurjnfvrtv rfvrr
                      urhfiurhgfyurr gfjrngfiurhueijfurehoirfd edujfreujfreygfre frehyfureifgryefnerjhnfre fhyerfherrbfvyurenfyuerf 4e
                      eiuhfureifyerfre neuifherufrefnbufvnrekjvuyfdnvujfnvf dfhvfdvyufhvjfbvyufdhvkfnvhdfvyufnv.
                  </p>

                   
                </div>


            </div>
        </div>

    </section>

    <section class="home-newsletter p-2 pt-md-2 pb-md-2">
        <div class="row alert-primary">
            <div class="col-12 text-center">
<h3>
   Please Send us a Mail 
</h3>
                <div class="input-group p-3 alert-infos">
                    <asp:TextBox  class="form-control boder" ID="txtmesage" runat="server" placeholder="Enter your mail"   ></asp:TextBox>
                    <asp:TextBox class="form-control boder" ID="txtemail" runat="server" placeholder="Email Address" TextMode="Email"></asp:TextBox>
                    <span class="input-group-btn">
                        <asp:Button Class="btn btn-theme btn-primary boder boder"  ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                    </span>
                   
                </div>
                <h3>
 Thanks...
</h3>
            </div>
        </div>


    </section>

    <section class="pt-3 pb-4">
        <div class="container">
           <div class="row mt-4">
               <div class="col text-center">
                   <h3>Our awesome team</h3>


        </div>
      </div>
            <hr class="border-primary"/>

            <div class="row">
                <div class="col-md-4 text-center">
                    <img  class="rounded-circle qualities-img p-4"  width="150px" height="150px" src="../imgs/FB_IMG_15833187752374204.jpg" />
                    <h5>CEO of Flashfid System</h5>
                    <p> <i>- OLORUNFEMI ADEDOYIN</i></p>

                </div>


                <div class="col-md-4 text-center">
                    <img  class="rounded-circle qualities-img p-4" width="150px" height="150px" src="../imgs/FULLSTACK.jpg" />
                 <%--  // <img class="rounded-circle" width="150px" height="150px" src="../imgs/FB_IMG_15833187752374204.jpg" />--%>
                    <h5>System Analyst</h5>
                    <p> <i>- OLOJEDE WOLE</i></p>

                </div>

                <div class="col-md-4 text-center">
                    <img class="rounded-circle qualities-img p-4" width="150px" height="150px" src="../imgs/DS.jpg" />
                   <%-- <img  class="rounded-circle" width="150px" height="150px" src="../imgs/FB_IMG_15833187752374204.jpg" />--%>
                    <h5>CEO of Cynergy Solution Limited</h5>
                    <p> <i>- OLORUNFEMI ADEDOYIN</i></p>

                </div>


            </div>

             <div class="row">
                <div class="col-md-4 text-center">
                    <img  class="rounded-circle qualities-img p-4"  width="150px" height="150px" src="../imgs/JOSH.jpg" />
                   <%-- <img  class="rounded-circle"  width="150px" height="150px" src="../imgs/FB_IMG_15833187752374204.jpg" />--%>
                    <h5>Consultant of Flashfid System</h5>
                    <p> <i>- AWE JOSHUA</i></p>

                </div>


                <div class="col-md-4 text-center">
                    <img  class="rounded-circle qualities-img p-4" width="150px" height="150px" src="../imgs/FB_IMG_15833188657619432.jpg" />
                   
                    <h5>Managing Director of Flashfid System</h5>
                    <p> <i>- OLOJEDE WOLE</i></p>

                </div>

                <div class="col-md-4 text-center">
                    <img class="rounded-circle qualities-img p-4" width="150px" height="150px" src="../imgs/FB_IMG_15833188657619432.jpg" />
                  
                    <h5>CEO of Cynergy Solution Limited</h5>
                    <p> <i>- OLORUNFEMI ADEDOYIN</i></p>

                </div>


            </div>

    </div>
    </section>


</asp:Content>

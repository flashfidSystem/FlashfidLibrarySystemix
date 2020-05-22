<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/ProfileMaster/Site1.Master" AutoEventWireup="true" CodeBehind="Contact_us.aspx.cs" Inherits="LibrarySystem.Accounts.Contact_us"   %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
        <section class="breadcrumbs-section">
        <div class="container pl-3 p-sm-3">
            <div class="row">
                <div class="col-12">
                    <h2>About Us</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="homepage.aspx">Home</a></li>
                        <li class="breadcrumb-item active">Contact Us</li>
                    </ol>

                </div>
            </div>
        </div>
    </section>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <p>
                        We are always here to help. if you have requirements/queries/question about our service, fill up
                        the contact form below and we'll do our best to reply within  24 hours alternative simply 
                        pickup the phone and give us a call or click on the chat button to chat with us.
                     
                    </p>
                       <hr />
                </div>
            </div>
        </div>
    </section>

     <section class="form-section">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                     <%--<form >--%>
                   
                         <div class="form-row">
                <div class="form-group col-md-6">
                             <asp:TextBox Class="form-control" ID="txtfullname" runat="server" placeholder="Full name"></asp:TextBox>
                         </div>

                          <div class="form-group col-md-6">
                             <asp:TextBox Class="form-control" ID="txtemaill" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                         </div>
                         </div>
                       

                               <div class="form-row">
                <div class="form-group col-md-6">
                             <asp:TextBox Class="form-control" ID="txtnumber" runat="server" placeholder="Contact Number" TextMode="Number"></asp:TextBox>
                         </div>

                          <div class="form-group col-md-6">
                              <asp:DropDownList Class="form-control" ID="DropDownList1" runat="server" placeholder="contry"></asp:DropDownList>
           
                         </div>
                         </div>

                           <div class="form-row">
                <div class="form-group col-md-12">
                    
                             <asp:TextBox Class="form-control" ID="txtSubject" runat="server" placeholder="Subject" ></asp:TextBox>
                         </div>
 
                         </div>

                          

                           <div class="form-row">
                <div class="form-group col-md-12">
                             <asp:TextBox Class="form-control" ID="txtMesage" runat="server" placeholder="Message" TextMode="MultiLine"></asp:TextBox>
                         </div>
 
                         </div>

                            <div class="form-row">
                <div class="form-group col-md-12 text-center">
                    <asp:Button Class="btn btn-primary" ID="Button1" runat="server" Text="Send Message" OnClick="Button1_Click1" />
                    
                         </div>
 
                         </div>

                   <%--  </form>--%>
                       
                </div>

                 
                <div class="col-md-6 address">
                    <h5>Call us / WhatsApp</h5>
                    <p><a href="tel:+2348168071631"><i class="fas fa-phone"></i>+(234) 8168071631</a> <br /></p>
                    <h5>
                        Email / Website
                    </h5>
                    <p>
                        <a href="mailto:adedoyinolorunfemi2020@gmail.com"><i class="fas fa-envelope"></i>adedoyinolorunfemi2020@gmail.com</a><br />
                        <a href="http://flashfid.tech/"><i class="fas fa-globe">www.flashfid.tech</i></a>
                    </p>



                    <h5>Working hours</h5>
                    <p>
                        Mon - Fri : 9am - 4pm(IST)
                    </p>
                    <h5>Address</h5>
                    <p>1 Folagoro street, lagos state ,Nigeria</p>
                </div>


            </div>
        </div>
    </section>


    <section>
        <div>

            <iframe src="https://www.google.com/maps/embed?
                pb=!1m18!1m12!1m3!1d202902.24027650335!2d72.75717812903171!3d19.
                098888422879796!2m3!1fo!2fo!3fo!3m2!1i1024!2i768!4f13.
                1!3m3!1m2!1s0x3be7c630664edc1%3A0x5da4ed8f8d648c69!2sLagos%2c
                +Ikeja!5e0!3m2!1sen!2sin!4v1544531259939" width="100%" height="400%" style="border:0" frameborder="0"></iframe>
        </div>
    </section>

</asp:Content>

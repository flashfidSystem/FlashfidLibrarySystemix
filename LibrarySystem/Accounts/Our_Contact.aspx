<%@ Page Title="Our Contact" Language="C#" MasterPageFile="~/ProfileMaster/Site1.Master" AutoEventWireup="true" CodeBehind="Our_Contact.aspx.cs" Inherits="LibrarySystem.Accounts.Our_Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        $(document).ready(function () { $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable(); });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
        <section class="breadcrumbs-section">
        <div class="container pl-3 p-sm-3">
            <div class="row">
                <div class="col-12">
                    <h2>Flashfid Contact</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="DarshBoards.aspx">Darshboard</a></li>
                        <li class="breadcrumb-item active">Our Contact</li>
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
                        Your Agreement is to reply your client before 24 hours, please keep up to the agreement, Aggressive words are not permitted here.
                     
                    </p>
                       <hr class="alert-primary"/>
                </div>
            </div>
        </div>
    </section>
    
     <div class="container">
        <div class="row">
                  <div class="col-md-12">
                    <h5>Everyone that contact you</h5>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FlashfidLibDBConnectionString %>" SelectCommand="SELECT * FROM [Contact_us]"></asp:SqlDataSource>
                   

                        <asp:GridView Class="table table-striped table-bordered" ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="full_name" HeaderText="full_name" SortExpression="full_name" />
                                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                <asp:BoundField DataField="contact_no" HeaderText="contact_no" SortExpression="contact_no" />
                                <asp:BoundField DataField="country" HeaderText="country" SortExpression="country" />
                                <asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject" />
                                <asp:BoundField DataField="message" HeaderText="message" SortExpression="message" />
                                <asp:BoundField DataField="getme" HeaderText="getme" SortExpression="getme" />
                            </Columns>
                        </asp:GridView>



              

</div>
        </div>
    </div>
              
</asp:Content>

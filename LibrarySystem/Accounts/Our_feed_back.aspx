<%@ Page Title="Our feedback" Language="C#" MasterPageFile="~/ProfileMaster/Site1.Master" AutoEventWireup="true" CodeBehind="Our_feed_back.aspx.cs" Inherits="LibrarySystem.Accounts.Our_feed_back" %>
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
                    <h2>Flashfid feed back</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="DarshBoards.aspx">Darshboard</a></li>
                        <li class="breadcrumb-item active">Our feed back</li>
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
                   <h5>Everyone that gave you feed back</h5>
                   
                        
                             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FlashfidLibDBConnectionString %>" SelectCommand="SELECT * FROM [feedback]"></asp:SqlDataSource>
                <div class="col-md-6">
                        
                    <asp:GridView Class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="emails" HeaderText="emails" SortExpression="emails" />
                            <asp:BoundField DataField="messages" HeaderText="messages" SortExpression="messages" />
                            <asp:BoundField DataField="getme" HeaderText="getme" SortExpression="getme" />
                        </Columns>
                    </asp:GridView>
                         </div>
 
                         

                 
                       
                </div>

                 

            </div>
        </div>





</asp:Content>

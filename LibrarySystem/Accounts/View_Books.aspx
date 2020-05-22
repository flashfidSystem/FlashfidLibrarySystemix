<%@ Page Title="View Books" Language="C#" MasterPageFile="~/ProfileMaster/Site1.Master" AutoEventWireup="true" CodeBehind="View_Books.aspx.cs" Inherits="LibrarySystem.Accounts.View_Books" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script type="text/javascript">

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

    </script>



    <script type="text/javascript">
        $(document).ready(function () { $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable(); });
    </script>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
<div class="row">

<div class="col-sm-12">
    <center>
        <h3>
            View All Books In The Library
        </h3>
        <div class="row">
            <div class="col-sm-12 col-sm-12">
 <asp:Panel CssClass="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="false">
<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
     </asp:Panel>
            </div>
        </div>
         
        <br />

        <div class="row">
   
               <div class="card">

                    <div class="card-body">


                        <div class="row">
                            <div class="col">
                                <center>
                   <h4>Book Inventory List</h4>
       
                    </center>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FlashfidLibDBConnectionString2 %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                                <hr class="border-primary" />
                            </div>
                        </div>

                     <div class="row">
                         
               
                                 <asp:DataList runat="server" Class="table table-striped table-bordered" DataSourceID="SqlDataSource1">
                                     <ItemTemplate>
                                     
                                          <div class="container-fluid">
                                              <div class="row">
                                                  <div class="col-lg-10">
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Size="Large"></asp:Label>

                                                                  </div>
                                                            </div>


                                                        <div class="row">
                                                            Author-<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Large" ForeColor="#006699" Text='<%# Eval("author_name") %>'></asp:Label>
                                                            &nbsp;| Department-<asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text='<%# Eval("department") %>'></asp:Label>
                                                            &nbsp;| Language-<asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" Text='<%# Eval("language") %>'></asp:Label>
                                                            &nbsp;</div>


                                                        <div class="row">
                                                            Publisher-<asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#006699" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                            &nbsp;| Publish Date-<asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" Text='<%# Eval("publish_date") %>'></asp:Label>
                                                            &nbsp;| Pages-<asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("no_of_pages") %>'></asp:Label>
                                                            &nbsp;| Edition-<asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("edition") %>'></asp:Label>
                                                            </div>



                                                        <div class="row">
                                                            Cost-<asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Large" ForeColor="#006699" Text='<%# Eval("book_cost") %>'></asp:Label>
                                                            &nbsp;| Actual Stock-<asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                            &nbsp;| Available-<asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("current_stock") %>'></asp:Label>
                                                            </div>

                                                       <div class="row">

                                                           Description-<asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Large" ForeColor="#009999" Text='<%# Eval("book_description") %>'></asp:Label>

                                                           </div>
                                                             </div>

                                                   <div class="col-lg-2">

                                                       <asp:Image Class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                                             </div>
                                                    </div>
                                                </div>
                                    </ItemTemplate>
                               
                   
                         




                       </asp:DataList>


                         </div>
                    </div>

                </div>




        </div>
</div>
    <center>
     <a href="homepage.aspx"><< Back to Home</a><span class="clearfix"></span><br />
     <center>


</div>

</div>

  
   


</asp:Content>

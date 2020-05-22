<%@ Page Title="Download PDF" Language="C#" MasterPageFile="~/ProfileMaster/Site1.Master" AutoEventWireup="true" CodeBehind="Download_PDF.aspx.cs" Inherits="LibrarySystem.Accounts.Download_PDF" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        $(document).ready(function () { $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();});

        // $(document).ready( function () {
        // $('#myTable').DataTable();
        //} );
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    
        <div class="breadcrumbs-section">
        <div class="container pl-3 p-sm-3">
            <div class="row">
                <div class="col-12">
                    <h2>PDF Download</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Student_Profile.aspx">My Profile</a></li>
                        <li class="breadcrumb-item active">PDF</li>
                    </ol>

                </div>
            </div>
        </div>
    </div>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2>
                        <center>
                       Download available PDF Book in the library.
                            </center>
                    </h2>
                       <hr class="alert-primary" />
                </div>
            </div>
        </div>
    </section>



       <div class="col-md-12">

              <div class="card">

             <div class="card-body">
                 <div class="row">
                <div class="col">
                    <center>
 
                        <img src="../imgs/icons8-passport-500.png" width="100px" height="100px" />
                    </center>
                       </div>
                    </div>

                 
                   <div class="row">
                       <div class="col">
                 <div class="form-group">
                         </div>
                             </div>
                    </div>


                  <div class="row">
                <div class="col">
                     <hr class="border-primary" />
                       </div>
                    </div>
                
                  <div class="row">
                <div class="col-md-12">
                     <asp:GridView  Class="table table-striped table-bordered"   ID="grdBindFiles" runat="server" AutoGenerateColumns="False" >
                            <Columns>
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image ID="img" runat="server" AlternateText="No pdf image" Width="40px" Height="40px" ImageUrl='<%# Eval("Image","~/book_inventory/{0}") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                         
                              
                                 <asp:TemplateField HeaderText="PDF File Name">
                                    <ItemTemplate>
                                      <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("Image") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Download">
                                    <ItemTemplate>
                                        <asp:LinkButton  Class="colo" ID="linkDownloadFile" runat="server" Text="Download" OnClick="linkDownloadFile_Click" CommandArgument='<%#Eval("ImageId") %>'><i class="fa fa-download" aria-hidden="true"></i></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>


                            </Columns>
                            </asp:GridView>


                    
                       </div>
                    </div>

          

                </div>



         </div>

         </div>
        
    
</asp:Content>

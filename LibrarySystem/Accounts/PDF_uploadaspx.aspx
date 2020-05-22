<%@ Page Title="PDF upload" Language="C#" MasterPageFile="~/ProfileMaster/Site1.Master" AutoEventWireup="true" CodeBehind="PDF_uploadaspx.aspx.cs" Inherits="LibrarySystem.Accounts.PDF_uploadaspx" %>
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
                    <h2>Student PDF upload</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="DarshBoards.aspx">Darshboard</a></li>
                        <li class="breadcrumb-item active">PDF upload</li>
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
                        <center>
                        You can upload PDF your student to download and read, this page is visible for the super Admin only.
                     </center>
                    </p>
                       <hr class="alert-primary"/>
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
                         <asp:FileUpload ID="fuimage" runat="server" />
                     <asp:Button CssClass="btn btn-primary" ID="btnUploadImage" runat="server" Text="Upload" OnClick="btnUploadImage_Click" /> 
                         </div>
                             </div>
                    </div>


                  <div class="row">
                <div class="col">
                     <hr class="border-primary" />
                       </div>
                    </div>
                
                  <div class="row">
                <div class="col">
                     <asp:GridView  Class="table table-striped table-bordered" ID="grdBindFiles" runat="server" AutoGenerateColumns="False" >
                            <Columns>
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image ID="img" runat="server" AlternateText="no image" Width="40px" Height="40px" ImageUrl='<%# Eval("Image","~/book_inventory/{0}") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                         
                              
                                 <asp:TemplateField  HeaderText="PDF File Name">
                                    <ItemTemplate>
                                        <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("Image") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                  <asp:TemplateField  HeaderText="Download">
                                    <ItemTemplate>
                                        <asp:LinkButton  Class="colo" ID="linkDownloadFile" runat="server" Text="Download" OnClick="linkDownloadFile_Click" CommandArgument='<%#Eval("ImageId") %>'></asp:LinkButton>
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

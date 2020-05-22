<%@ Page Title="Book Inventory" Language="C#" MasterPageFile="~/ProfileMaster/Site1.Master" AutoEventWireup="true" CodeBehind="Admin_Book_Inventory.aspx.cs" Inherits="LibrarySystem.Accounts.Admin_Book_Inventory" %>

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
 
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                   <h4>Book's Details</h4>
       
                    </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <center>
                                    <asp:Label ID="messagew" runat="server"></asp:Label>
                                <img id="imgview" height="150px" width="100px" src="book_inventory/images%20(5).jpg" />
                    <%--  //<img id="imgview"  src="../book_inventory/images%20(5).jpg"/> --%> 
                    </center>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col">
                                <hr class="border-primary" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="FileUpload1" Font-Size="Small" ForeColor="#FF3300" ValidationGroup="abi">*</asp:RequiredFieldValidator>
                                <asp:FileUpload onchange="readURL(this);" Class="form-control" ID="FileUpload1" runat="server" />
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-4">
                                <label>Book Id
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtbookId" Font-Size="Small" ForeColor="#FF3300" ValidationGroup="abi">*</asp:RequiredFieldValidator>
                                </label>&nbsp;<div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txtbookId" runat="server" placeholder="Book Id" ValidationGroup="abi"></asp:TextBox>
                                        <asp:Button Class="  btn btn-success" ID="Button3" runat="server" Text="Go" OnClick="Button3_Click" />
                                    </div>
                                </div>
                            </div>



                            <div class="col-md-8">
                                <label>Book Name <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBookNamae" Font-Size="Small" ForeColor="#FF3300" ValidationGroup="abi">*</asp:RequiredFieldValidator>
                                </label>&nbsp;<div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtBookNamae" runat="server" placeholder="Book Name" ValidationGroup="abi"></asp:TextBox>
                                </div>
                            </div>


                        </div>




                        <div class="row">

                            <div class="col-md-4">
                                <label>Language <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropLanguage" Font-Size="Small" ForeColor="#FF3300" ValidationGroup="abi">*</asp:RequiredFieldValidator>
                                </label>&nbsp;<div class="auto-style6">
                                    <asp:DropDownList Class="form-control" ID="DropLanguage" runat="server" ValidationGroup="abi">
                                    </asp:DropDownList>
                                </div>

                                <label>Publisher Name <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropPublisherName" Font-Size="Small" ForeColor="#FF3300" ValidationGroup="abi">*</asp:RequiredFieldValidator>
                                </label>&nbsp;<div class="form-group">
                                    <asp:DropDownList Class="form-control" ID="DropPublisherName" placeholder="Select" runat="server" ValidationGroup="abi">
                                        <%--  --%>
                                    </asp:DropDownList>
                                </div>
                            </div>






                            <div class="col-md-4">
                                <label>Author Name <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropAuthorName" Font-Size="Small" ForeColor="#FF3300" ValidationGroup="abi">*</asp:RequiredFieldValidator>
                                </label>&nbsp;<div class="form-group">
                                    <asp:DropDownList Class="form-control" ID="DropAuthorName" runat="server" ValidationGroup="abi"></asp:DropDownList>
                                </div>

                                <label>Publish Date</label>&nbsp;<div class="form-group">
                                    <asp:TextBox Class="form-control" ID="txtPublicationDate" runat="server" TextMode="Date" OnLoad="txtPublicationDate_Load"></asp:TextBox>
                                </div>
                            </div>

                             



                            <div class="col-md-4">
                                <label>Department
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ListBoxDepartment" Font-Size="Small" ForeColor="#FF3300" ValidationGroup="abi">*</asp:RequiredFieldValidator>
                                </label>&nbsp;<div class="form-group">
                                    <asp:ListBox class="form-group" ID="ListBoxDepartment" runat="server" Rows="5" SelectionMode="Multiple" Width="150px" ValidationGroup="abi">
                                         
                                    </asp:ListBox>
                                </div>

                            </div>

                        </div>











                        <div class="row">

                            <div class="col-md-4">
                                <label>Edition </label>&nbsp;<div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtEdition" runat="server" placeholder="Edition"></asp:TextBox>
                                </div>
                            </div>


                            <div class="col-md-4">
                                <label>Book Cost
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtBookCost" Font-Size="Small" ForeColor="#FF3300" ValidationGroup="abi">*</asp:RequiredFieldValidator>
                                </label>&nbsp;<div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtBookCost" runat="server" placeholder="Book Cost" TextMode="Number" ValidationGroup="abi"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Pages
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtBookPages" Font-Size="Small" ForeColor="#FF3300" ValidationGroup="abi">*</asp:RequiredFieldValidator>
                                </label>&nbsp;<div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtBookPages" runat="server" placeholder="Pages" TextMode="Number" ValidationGroup="abi"></asp:TextBox>
                                </div>
                            </div>

                        </div>






                        <div class="row">

                            <div class="col-md-4">
                                <label>Actual Stock <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtActualStock" Font-Size="Small" ForeColor="#FF3300" ValidationGroup="abi">*</asp:RequiredFieldValidator>
                                </label>&nbsp;<div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtActualStock" runat="server" placeholder="Actual Stock" TextMode="Number" ValidationGroup="abi"></asp:TextBox>
                                </div>
                            </div>


                            <div class="col-md-4">
                                <label>Curent Stock</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtCureentStock" runat="server" placeholder="Curent Stock" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Issued Book</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtIssueBook" runat="server" placeholder="Issued Book" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                        </div>





                        <div class="row">

                            <div class="col-12 mx-auto">
                                <label>Book Description
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtBooDesc" Font-Size="Small" ForeColor="#FF3300" ValidationGroup="abi">*</asp:RequiredFieldValidator>
&nbsp;</label>&nbsp;<div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtBooDesc" runat="server" placeholder="Book Description" TextMode="MultiLine" ValidationGroup="abi"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        
                 <center>
                                            <asp:Button Class="btn btn-dark " ID="Button7" runat="server" Text="Cancel" OnClick="Button7_Click" />
                 
                 </center>
                        <br />
                        <div class="row">
                            <div class="col-4">
                                <asp:Button Class="btn btn-success btn-lg btn-block" ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" ValidationGroup="abi" />
                            </div>
                            <div class="col-4">
                                <asp:Button Class="btn btn-warning btn-lg btn-block" ID="Button2" runat="server" Text="Update" OnClick="Button2_Click" ValidationGroup="abi" />
                            </div>

                            <div class="col-4">
                                <asp:Button Class="btn btn-danger btn-lg btn-block" ID="Button6" runat="server" Text="Delete" OnClick="Button6_Click" />
                            </div>
                        </div>

                    </div>


                </div>
                <a href="homepage.aspx"><< Back to Home</a>
                </br> </br> </br> 
            </div>



            <div class="col-md-7">
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
                         <asp:GridView Class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                             <Columns>
                                 <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" SortExpression="book_id" >
                                 <ControlStyle Font-Bold="True" ForeColor="#33CC33" Width="1px" />
                                 <HeaderStyle BackColor="#CCFF33" Width="1px" />
                                 </asp:BoundField>
                                 <asp:TemplateField>
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
                               
                    </asp:TemplateField>
                             </Columns>




                         </asp:GridView>


                         </div>
                    </div>

                </div>
                 </div>
            </div>
        </div>
</asp:Content>

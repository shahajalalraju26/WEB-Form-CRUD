<%@ Page Title="Employee" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="EmployeeManagement.Employee" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-2">
        <h3 class="mb-4 text-center">Create New Employee</h3>

        <div class="mt-3">
            <asp:Label ID="lblMessage" runat="server" />
        </div>

        <div class="row">
            <div class="col-6">
                <div class="row mb-2">
                    <div class="col-3">
                        <label for="txtName" class="form-label">Name</label>
                    </div>
                    <div class="col-9">
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-3">
                        <label for="ddlGender" class="form-label">Gender</label>
                    </div>
                    <div class="col-9">
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select">
                            <asp:ListItem Text="Select Gender" Value="" />
                            <asp:ListItem Text="Male" Value="Male" />
                            <asp:ListItem Text="Female" Value="Female" />
                            <asp:ListItem Text="Other" Value="Other" />
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-3">
                        <label for="txtJoiningDate" class="form-label">Joining Date</label>
                    </div>
                    <div class="col-9">
                        <asp:TextBox ID="txtJoiningDate" runat="server" CssClass="form-control" TextMode="Date" />
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-3">
                        <label for="txtSalary" class="form-label">Salary</label>
                    </div>
                    <div class="col-9">
                        <asp:TextBox ID="txtSalary" runat="server" CssClass="form-control" TextMode="Number" />
                    </div>

                </div>

                <div class="row mb-2">
                    <div class="col-3">
                        <label for="fuPhoto" class="form-label">Photo</label>
                    </div>
                    <div class="col-9">
                        <asp:FileUpload ID="fuPhoto" runat="server" CssClass="form-control" />
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-3">
                        <label class="form-label">Is Active</label>
                    </div>
                    <div class="col-9">
                        <div class="form-check d-flex align-items-md-start">
                            <asp:CheckBox ID="chkIsActive" runat="server" CssClass="form-check me-2" />
                            <label class="form-check-label" for="chkIsActive">Yes</label>
                        </div>
                    </div>
                </div>


            </div>

            <div class="col-6">
                <div class="row mb-2">
                    <div class="col-3">
                        <label for="txtDesignation" class="form-label">Designation</label>
                    </div>
                    <div class="col-9">
                        <asp:TextBox ID="txtDesignation" runat="server" CssClass="form-control" />
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-3">
                        <label for="txtMobile" class="form-label">Mobile</label>
                    </div>
                    <div class="col-9">
                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" TextMode="Number" />
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-3">
                        <label for="txtPresentAddress" class="form-label">Present Address</label>
                    </div>
                    <div class="col-9">
                        <asp:TextBox ID="txtPresentAddress" runat="server" CssClass="form-control" />
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-3">
                        <label for="txtParmanentAddress" class="form-label">Parmanent Address</label>
                    </div>
                    <div class="col-9">
                        <asp:TextBox ID="txtParmanentAddress" runat="server" CssClass="form-control" />
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-3">
                        <label for="txtNID" class="form-label">NID</label>
                    </div>
                    <div class="col-9">
                        <asp:TextBox ID="txtNID" runat="server" CssClass="form-control" TextMode="Number" />
                    </div>
                </div>

            </div>



            <div class="col-sm-12 mt-4">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-sm" OnClick="btnSubmit_Click" />
            </div>
        </div>




        <hr />
        <h4 class="mt-4 mb-3 text-center">Employee List</h4>
        <asp:GridView ID="gvEmployee" runat="server" AutoGenerateColumns="False" AllowSorting="True" OnSorting="gvEmployee_Sorting" CssClass="table table-bordered"
            DataKeyNames="Id" OnRowEditing="gvEmployee_RowEditing" OnRowUpdating="gvEmployee_RowUpdating" OnRowCreated="gvEmployee_RowCreated"
            OnRowCancelingEdit="gvEmployee_RowCancelingEdit" OnRowDeleting="gvEmployee_RowDeleting" OnRowDataBound="gvEmployee_RowDataBound">
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <span class="align-items-center">SL</span>
                        <%--<asp:LinkButton ID="btnSortId" runat="server" CommandName="Sort" CommandArgument="Id" CssClass="bi bi-arrow-down-up" />--%>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <%-- <HeaderTemplate>
                        <div>
                            <span class="align-items-center">Name</span>
                         <asp:LinkButton ID="btnSortName" runat="server" CommandName="Sort" CommandArgument="Name" CssClass="bi bi-arrow-down-up" />
                        </div>
                    </HeaderTemplate>--%>
                    <%-- <HeaderTemplate>
                        <div>
                            <span class="align-items-baseline">Name</span>
                            
                        </div>
                    </HeaderTemplate>--%>
                    <HeaderTemplate>
                        <div style="display: flex; align-items: center;">
                            <span>Name</span>
                            <input type="text" id="nameSearch" placeholder="Search..." style="display: none; margin-left: 5px;" />
                            <i class="bi bi-search" id="nameSearchIcon" style="cursor: pointer; margin-left: 5px;"></i>
                        </div>
                    </HeaderTemplate>

                    <ItemTemplate>
                        <label>
                            <%# Eval("Name") %>
                        </label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Text='<%# Bind("Name") %>'></asp:TextBox>
                    </EditItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField>
                    <HeaderTemplate>
                        <span class="align-items-center">Gender</span>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <label><%# Eval("Gender") %></label>

                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="drlGender" runat="server" CssClass="form-control" SelectedValue='<%# Bind("Gender") %>'>
                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <HeaderTemplate>
                        <span class=" align-items-center">Designation</span>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <label><%# Eval("Designation") %></label>

                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDesignation" runat="server" CssClass="form-control" Text='<%# Bind("Designation") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <%--<asp:TemplateField>
                    <HeaderTemplate>
                        <span class=" align-items-center">Mobile</span>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <label><%# Eval("Mobile") %></label>

                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" Text='<%# Bind("Mobile") %>'></asp:TextBox>
                    </EditItemTemplate>

                </asp:TemplateField>--%>


                <asp:TemplateField SortExpression="JoiningDate">
                    <HeaderTemplate>
                        <span class="align-items-center">Joining Date</span>
                        <asp:LinkButton ID="btnSortJoiningDate" runat="server" CommandName="Sort" CommandArgument="JoiningDate" CssClass="bi bi-arrow-down-up" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <label><%# Eval("JoiningDate", "{0:yyyy-MM-dd}") %></label>

                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtJoiningDate" runat="server" CssClass="form-control" Text='<%# Bind("JoiningDate", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
                    </EditItemTemplate>

                </asp:TemplateField>

                <%--<asp:TemplateField>
                    <HeaderTemplate>
                        <span class="align-items-center">NID</span>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <label><%# Eval("NID") %></label>

                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNID" runat="server" CssClass="form-control" Text='<%# Bind("NID") %>' TextMode="Number"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>--%>

                <asp:TemplateField>
                    <HeaderTemplate>
                        <span class="align-items-center">Present Address</span>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <label><%# Eval("PresentAddress") %></label>

                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPresentAddress" runat="server" CssClass="form-control" Text='<%# Bind("PresentAddress") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <%--<asp:TemplateField>
                    <HeaderTemplate>
                        <span class="align-items-center">Parmanent Address</span>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <label><%# Eval("ParmanentAddress") %></label>

                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtParmanentAddress" runat="server" CssClass="form-control" Text='<%# Bind("ParmanentAddress") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>--%>

                <%-- <asp:TemplateField>
                    <HeaderTemplate>
                        <span class="align-items-center">Salary</span>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblSalary" runat="server"><%# Eval("Salary") %></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtSalary" runat="server" CssClass="form-control" Text='<%# Bind("Salary") %>' TextMode="Number"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                    </FooterTemplate>
                </asp:TemplateField>--%>


                <asp:TemplateField>
                    <HeaderTemplate>
                        <span class="align-items-center">Photo</span>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <img src='<%# "Uploads/" + Eval("Photo") %>' alt="Photo" width="60" height="60" class="rounded-circle" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:FileUpload ID="fuPhotoEdit" runat="server" CssClass="form-control" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <HeaderTemplate>
                        <span class="align-items-center">Status</span>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <label>
                            <%# Convert.ToBoolean(Eval("IsActive")) 
                             ? "<span class='badge bg-success'>Active</span>" 
                             : "<span class='badge bg-danger'>Inactive</span>" %>
                        </label>

                    </ItemTemplate>
                    <%--<EditItemTemplate>
                        <asp:CheckBox ID="chkIsActive" runat="server" Checked='<%# Bind("IsActive") %>' />
                    </EditItemTemplate>--%>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkIsActive" runat="server" Checked='<%# Bind("IsActive") %>' Text="Active" />
                    </EditItemTemplate>


                </asp:TemplateField>



                <asp:TemplateField>
                    <HeaderTemplate>
                        <span class="align-items-center">Action</span>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="btnViewDetails" ToolTip="View Details" runat="server" 
                            CommandName="ViewDetails" CommandArgument='<%# Eval("Id") %>' OnCommand="btnViewDetails_Command" 
                            CssClass="btn btn-sm btn-primary me-1">
                           <i class="bi bi-eye-fill"></i> View
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CssClass="btn btn-sm btn-primary me-1">
                           <i class="bi bi-pencil-square"></i> Edit
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Are you sure you want to delete this item?');">
                                <i class="bi bi-trash3"></i> Delete
                        </asp:LinkButton>
                    </ItemTemplate>

                    <EditItemTemplate>
                        <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" CssClass="btn btn-sm btn-success me-1">
                            <i class="bi bi-check-circle"></i> Update
                        </asp:LinkButton>

                        <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" CssClass="btn btn-sm btn-secondary">
                                <i class="bi bi-x-square"></i> Cancel
                        </asp:LinkButton>
                    </EditItemTemplate>

                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </div>

    <script>
        $(document).ready(function () {

            // Click on search icon to toggle search box
            $("#nameSearchIcon").on("click", function () {
                $("#nameSearch").toggle().focus();
            });

            // Instant filter on typing
            $("#nameSearch").on("keyup", function () {
                var value = $(this).val().toLowerCase();

                $("#<%= gvEmployee.ClientID %> tr").each(function () {
                    var row = $(this);
                    var nameCell = row.find("td").eq(1); // Name column (2nd col)

                    if (nameCell.length > 0) { // Confirm this is data row
                        var cellText = nameCell.text().toLowerCase();
                        row.toggle(cellText.indexOf(value) > -1);
                    }
                });
            });

        });


    </script>


</asp:Content>

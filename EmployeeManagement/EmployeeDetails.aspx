<%@ Page Title="Employee Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeDetails.aspx.cs" Inherits="EmployeeManagement.EmployeeDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-2">
        <h3 class="mb-4 text-center">Employee Details</h3>

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
                <asp:Button ID="btnBack" runat="server" Text="Back" PostBackUrl="~/Employee.aspx" CssClass="btn btn-secondary btn-sm" />
            </div>
        </div>

    </div>
</asp:Content>

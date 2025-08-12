using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeManagement
{
    public partial class Employee : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["FormSubmitted"] = false;
                LoadEmployees();

                
            }
            if (Session["SuccessMessage"] != null)
            {
                lblMessage.Text = GetAlert(Session["SuccessMessage"].ToString(), "success");
                Session.Remove("SuccessMessage");
            }


        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           
            try
            {
                
                string photoFileName = "";

                if (fuPhoto.HasFile)
                {
                    // Check file size (max 100KB)
                    if (fuPhoto.PostedFile.ContentLength > 102400)
                    {
                        lblMessage.Text = GetAlert("❌ Photo size must be less than 100 KB.", "danger");
                        return;
                    }

                    // Validate extension
                    string extension = Path.GetExtension(fuPhoto.FileName).ToLower();
                    string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };
                    if (!allowedExtensions.Contains(extension))
                    {
                        lblMessage.Text = GetAlert("❌ Only image files (.jpg, .jpeg, .png, .gif) are allowed.", "danger");
                        return;
                    }

                    // Save file
                    photoFileName = Guid.NewGuid().ToString() + extension;
                    string savePath = Server.MapPath("~/Uploads/" + photoFileName);
                    fuPhoto.SaveAs(savePath);
                }


                if (Session["FormSubmitted"] != null && (bool)Session["FormSubmitted"])
                {
                    // Already submitted, skip insert
                    return;
                }

                string query = @"INSERT INTO Employee 
                                (Name, Gender, Designation, Mobile, JoiningDate, NID, PresentAddress, ParmanentAddress, Salary, Photo, IsActive)
                                VALUES (@Name, @Gender, @Designation, @Mobile, @JoiningDate, @NID, @PresentAddress, @ParmanentAddress, @Salary, @Photo, @IsActive)";

                using (SqlConnection con = new SqlConnection(connectionString))
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@Designation", txtDesignation.Text);
                    cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
                    cmd.Parameters.AddWithValue("@JoiningDate", Convert.ToDateTime(txtJoiningDate.Text));
                    cmd.Parameters.AddWithValue("@NID", txtNID.Text);
                    cmd.Parameters.AddWithValue("@PresentAddress", txtPresentAddress.Text);
                    cmd.Parameters.AddWithValue("@ParmanentAddress", txtParmanentAddress.Text);
                    cmd.Parameters.AddWithValue("@Salary", Convert.ToDecimal(txtSalary.Text));
                    cmd.Parameters.AddWithValue("@Photo", photoFileName);
                    cmd.Parameters.AddWithValue("@IsActive", chkIsActive.Checked);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                Session["FormSubmitted"] = true;
                Session["SuccessMessage"] = "✅ Employee added successfully!";
                Response.Redirect(Request.RawUrl);




            }

            catch (Exception ex) 
            {
                lblMessage.Text = GetAlert("❌ Error: " + ex.Message, "danger");


            }

           
        }

      
        private void ClearForm()
        {
            txtName.Text = "";
            ddlGender.SelectedIndex = 0;
            txtDesignation.Text = "";
            txtMobile.Text = "";
            txtJoiningDate.Text = "";
            txtNID.Text = "";
            txtPresentAddress.Text = "";
            txtParmanentAddress.Text = "";
            txtSalary.Text = "";
            chkIsActive.Checked = false;
        }
        private string GetAlert(string message, string type)
        {
            return $@"<div class='alert alert-{type} alert-dismissible fade show' role='alert'>
                {message}
                <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
              </div>";
        }

        private void LoadEmployees(string sortExpression = null, string sortDirection = "ASC")
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Employee", con))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (!string.IsNullOrEmpty(sortExpression))
                {
                    DataView dv = dt.DefaultView;
                    dv.Sort = sortExpression + " " + sortDirection;
                    gvEmployee.DataSource = dv;
                }
                else
                {
                    gvEmployee.DataSource = dt;

                }
                
                gvEmployee.DataBind();
            }
        }


        //RowDataBound
        protected void gvEmployee_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                decimal salary = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Salary"));

                Label lblSalary = e.Row.FindControl("lblSalary") as Label;
                TextBox txtSalary = e.Row.FindControl("txtSalary") as TextBox;

                if (lblSalary != null)
                {
                    if (salary < 20000)
                    {
                        lblSalary.BackColor = System.Drawing.Color.Orange;
                    }
                    else if (salary >= 20000 && salary < 30000)
                    {
                        lblSalary.BackColor = System.Drawing.Color.Green;
                    }
                }
                else if (txtSalary != null)
                {
                    if (salary < 20000)
                    {
                        txtSalary.BackColor = System.Drawing.Color.Orange;
                    }
                    else if (salary >= 20000 && salary < 30000)
                    {
                        txtSalary.BackColor = System.Drawing.Color.LightGreen;
                    }
                }
            }
        }
        //protected void gvEmployee_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        // Try to get the Label or TextBox that shows Salary
        //        Label lblSalary = e.Row.FindControl("lblSalary") as Label;
        //        TextBox txtSalary = e.Row.FindControl("txtSalary") as TextBox;

        //        decimal salary = 0;

        //        if (lblSalary != null)
        //        {
        //            decimal.TryParse(lblSalary.Text, out salary);

        //            if (salary < 20000)
        //            {
        //                lblSalary.BackColor = System.Drawing.Color.Orange;
        //            }
        //            else if (salary >= 20000 && salary < 30000)
        //            {
        //                lblSalary.BackColor = System.Drawing.Color.Green;
        //            }

        //        }
        //        else if (txtSalary != null)
        //        {
        //            decimal.TryParse(txtSalary.Text, out salary);

        //            if (salary < 20000)
        //            {
        //                txtSalary.BackColor = System.Drawing.Color.Orange;
        //            }
        //            else if (salary >= 20000 && salary < 30000)
        //            {
        //                txtSalary.BackColor = System.Drawing.Color.LightGreen;
        //            }

        //        }
        //    }
        //}
        //protected void gvEmployee_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        // Get Salary value from current row
        //        decimal salary = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Salary"));

        //        // Apply color based on salary
        //        if (salary < 20000)
        //        {
        //            e.Row.BackColor = System.Drawing.Color.Orange;
        //        }
        //        else if (salary < 30000)
        //        {
        //            e.Row.BackColor = System.Drawing.Color.LightGreen;
        //        }
        //    }
        //}

        //For Sorting
        protected void gvEmployee_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortDirection = ViewState["SortDirection"] as string ?? "ASC";

            LoadEmployees(e.SortExpression, sortDirection);

            // Toggle sort direction for next click
            ViewState["SortDirection"] = (sortDirection == "ASC") ? "DESC" : "ASC";
        }


        protected void gvEmployee_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvEmployee.EditIndex = e.NewEditIndex;
            LoadEmployees();
        }

        protected void gvEmployee_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvEmployee.EditIndex = -1;
            LoadEmployees();
        }

        //protected void gvEmployee_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    GridViewRow row = gvEmployee.Rows[e.RowIndex];
        //    int id = Convert.ToInt32(gvEmployee.DataKeys[e.RowIndex].Value);

        //    string name = ((TextBox)row.Cells[1].Controls[0]).Text;
        //    string gender = ((TextBox)row.Cells[2].Controls[0]).Text;
        //    string designation = ((TextBox)row.Cells[3].Controls[0]).Text;
        //    string mobile = ((TextBox)row.Cells[4].Controls[0]).Text;

        //    string query = @"UPDATE Employee SET Name=@Name, Gender=@Gender, Designation=@Designation, Mobile=@Mobile WHERE Id=@Id";

        //    using (SqlConnection con = new SqlConnection(connectionString))
        //    using (SqlCommand cmd = new SqlCommand(query, con))
        //    {
        //        cmd.Parameters.AddWithValue("@Id", id);
        //        cmd.Parameters.AddWithValue("@Name", name);
        //        cmd.Parameters.AddWithValue("@Gender", gender);
        //        cmd.Parameters.AddWithValue("@Designation", designation);
        //        cmd.Parameters.AddWithValue("@Mobile", mobile);

        //        con.Open();
        //        cmd.ExecuteNonQuery();
        //    }

        //    gvEmployee.EditIndex = -1;
        //    LoadEmployees();
        //}

        protected void gvEmployee_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvEmployee.Rows[e.RowIndex];
            int id = Convert.ToInt32(gvEmployee.DataKeys[e.RowIndex].Value);

            // Find controls
            TextBox txtName = (TextBox)row.FindControl("txtName");
            DropDownList drlGender = (DropDownList)row.FindControl("drlGender");
            TextBox txtDesignation = (TextBox)row.FindControl("txtDesignation");
            TextBox txtMobile = (TextBox)row.FindControl("txtMobile");
            TextBox txtJoiningDate = (TextBox)row.FindControl("txtJoiningDate");
            TextBox txtNID = (TextBox)row.FindControl("txtNID");
            TextBox txtPresentAddress = (TextBox)row.FindControl("txtPresentAddress");
            TextBox txtParmanentAddress = (TextBox)row.FindControl("txtParmanentAddress");
            TextBox txtSalary = (TextBox)row.FindControl("txtSalary");
            FileUpload fuPhotoEdit = (FileUpload)row.FindControl("fuPhotoEdit");

            // Status checkbox (optional)
            //bool isActive = true;
            CheckBox chkIsActive = (CheckBox)row.FindControl("chkIsActive");
            bool isActive = chkIsActive.Checked;


            // Handle photo upload
            string photoFileName = "";
            if (fuPhotoEdit.HasFile)
            {
                string extension = Path.GetExtension(fuPhotoEdit.FileName).ToLower();
                string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };
                if (allowedExtensions.Contains(extension))
                {
                    photoFileName = Guid.NewGuid().ToString() + extension;
                    string savePath = Server.MapPath("~/Uploads/" + photoFileName);
                    fuPhotoEdit.SaveAs(savePath);
                }
                else
                {
                    // Optional: Show error message if needed
                    // lblMessage.Text = "Invalid file type.";
                    photoFileName = ""; // Skip update if invalid
                }
            }

            string query = @"UPDATE Employee SET 
                        Name=@Name, 
                        Gender=@Gender, 
                        Designation=@Designation, 
                        Mobile=@Mobile, 
                        JoiningDate=@JoiningDate, 
                        NID=@NID, 
                        PresentAddress=@PresentAddress, 
                        ParmanentAddress=@ParmanentAddress, 
                        Salary=@Salary, 
                        IsActive=@IsActive";

            if (!string.IsNullOrEmpty(photoFileName))
            {
                query += ", Photo=@Photo";
            }

            query += " WHERE Id=@Id";

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Gender", drlGender.SelectedValue);
                cmd.Parameters.AddWithValue("@Designation", txtDesignation.Text.Trim());
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                cmd.Parameters.AddWithValue("@JoiningDate", Convert.ToDateTime(txtJoiningDate.Text));
                cmd.Parameters.AddWithValue("@NID", txtNID.Text.Trim());
                cmd.Parameters.AddWithValue("@PresentAddress", txtPresentAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@ParmanentAddress", txtParmanentAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Salary", Convert.ToDecimal(txtSalary.Text));
                cmd.Parameters.AddWithValue("@IsActive", isActive);

                if (!string.IsNullOrEmpty(photoFileName))
                {
                    cmd.Parameters.AddWithValue("@Photo", photoFileName);
                }

                con.Open();
                cmd.ExecuteNonQuery();
            }

            gvEmployee.EditIndex = -1;
            LoadEmployees();
        }

        protected void gvEmployee_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvEmployee.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("DELETE FROM Employee WHERE Id=@Id", con))
            {
                cmd.Parameters.AddWithValue("@Id", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadEmployees();
        }

    }
}
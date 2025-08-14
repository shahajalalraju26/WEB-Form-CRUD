using EmployeeManagement.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeManagement
{
    public partial class EmployeeDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                string empId = Request.QueryString["ID"];
                if(!string.IsNullOrEmpty(empId) )
                {
                    LoadEmployeeDetails(empId);
                    SetReadOnlyMode();


                }
            }

        }

        private void LoadEmployeeDetails(string Id)
        {
            // Example: SQL query to get employee data
            string query = "SELECT * FROM Employee WHERE Id = @Id";
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Id", Id);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        txtName.Text = reader["Name"].ToString();
                        ddlGender.SelectedValue = reader["Gender"].ToString();
                        txtJoiningDate.Text = Convert.ToDateTime(reader["JoiningDate"]).ToString("yyyy-MM-dd");
                        txtSalary.Text = reader["Salary"].ToString();
                        txtDesignation.Text = reader["Designation"].ToString();
                        txtMobile.Text = reader["Mobile"].ToString();
                        txtPresentAddress.Text = reader["PresentAddress"].ToString();
                        txtParmanentAddress.Text = reader["ParmanentAddress"].ToString();
                        txtNID.Text = reader["NID"].ToString();
                        chkIsActive.Checked = Convert.ToBoolean(reader["IsActive"]);
                        // Photo upload/display logic if needed
                    }
                }
            }
        }

        private void SetReadOnlyMode()
        {
            txtName.ReadOnly = true;
            ddlGender.Enabled = false;
            txtJoiningDate.ReadOnly = true;
            txtSalary.ReadOnly = true;
            fuPhoto.Enabled = false;
            chkIsActive.Enabled = false;
            txtDesignation.ReadOnly = true;
            txtMobile.ReadOnly = true;
            txtPresentAddress.ReadOnly = true;
            txtParmanentAddress.ReadOnly = true;
            txtNID.ReadOnly = true;
        }

    }
}
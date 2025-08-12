using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace EmployeeManagement.Models
{
    public class Employee
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Gender { get; set; }
        public string Designation {  get; set; }
        public string Mobile { get; set; }
        public DateTime JoiningDate { get; set; }
        public string NID { get; set; }
        public string PresentAddress { get; set; }
        public string ParmanentAddress { get; set; }
        public decimal Salary { get; set; }
        public string Photo { get; set; }
        public bool IsActive { get; set; }  
    }
}
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AMAR.Web.Models;
using DAL;

namespace AMAR.Web.Pages.Company
{
    public partial class CompanyGroup : System.Web.UI.Page
    {
        private readonly Db _db;
        public CompanyGroup()
        {
            _db = new Db();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            divError.Visible = false;
            divSucc.Visible = false;
            if (!IsPostBack)
            {
                LoadGrd();
            }
        }

        protected void btnCancel_OnClick(object sender, EventArgs e)
        {
            Clear();
        }

        protected void btnSave_OnClick(object sender, EventArgs e)
        {
            if (Validation())
            {
                string CGCode = txtCGCode.Text;
                string CGName = txtCGName.Text;
                string CGAddress = txtCGAddress.Text;
                string CGCountry = txtCGCountry.Text;
                string CGPerson = txtCGPerson.Text;
                string CGCell = txtCGCell.Text;
                string CGEmail = txtCGEmail.Text;
                string CGWeb = txtCGWeb.Text;
                string CGRemarks = txtCGRemarks.Text;


                Helper helper = new Helper();
                string CGUser = "";
                string CGPCIP = "";
                string CGPCName = "";

                string CGPCMac = "";
                string CGStatus = rdYes.Checked ? "Active" : "InActive"; ;

                try
                {
                    CGPCIP = helper.GetIpAddress();
                }
                catch (Exception exception)
                {

                }

                try
                {
                    CGPCName = helper.GetPcName(Request);
                }
                catch (Exception exception)
                {

                }

                try
                {
                    CGPCName = helper.GetMAC();
                }
                catch (Exception exception)
                {

                }


                List<SqlParameter> sqlParameters = new List<SqlParameter>
                {
                    new SqlParameter{Value = txtCGCode.ReadOnly?"Update": "Insert",ParameterName = "@Action"},
                    new SqlParameter{Value = CGCode,ParameterName = "@CGCode"},
                    new SqlParameter{Value = CGName,ParameterName = "@CGName"},
                    new SqlParameter{Value =CGAddress,ParameterName = "@CGAddress"},
                    new SqlParameter{Value = CGCountry,ParameterName = "@CGCountry"},
                    new SqlParameter{Value = CGPerson,ParameterName = "@CGPerson"},
                    new SqlParameter{Value = CGCell,ParameterName = "@CGCell"},
                    new SqlParameter{Value = CGEmail,ParameterName = "@CGEmail"},
                    new SqlParameter{Value = CGWeb,ParameterName = "@CGWeb"},
                    new SqlParameter{Value = CGUser,ParameterName = "@CGUser"},
                    new SqlParameter{Value = CGRemarks,ParameterName = "@CGRemarks"},
                    new SqlParameter{Value = CGStatus,ParameterName = "@CGStatus"},
                    new SqlParameter{Value = CGPCMac,ParameterName = "@CGPCMac"},
                    new SqlParameter{Value = CGPCName,ParameterName = "@CGPCName"},
                    new SqlParameter{Value = CGPCIP,ParameterName = "@CGPCIP"}
                };


                int count = _db.ExecuteNonQuery("SP_CompGroup", sqlParameters);
                if (count > 0)
                {
                    ShowSuccMsg(txtCGCode.ReadOnly ? "Update Succesfully" : "Save Succesfully");
                    Clear();
                }
            }
        }


        protected void btnDelete_OnClick(object sender, EventArgs e)
        {

            if (!txtCGCode.ReadOnly)
            {
                ShowErrorMsg("Select a row to delete");
            }
            else
            {
                List<SqlParameter> sqlParameters = new List<SqlParameter>
                {
                    new SqlParameter{Value = "Delete",ParameterName = "@Action"},
                    new SqlParameter{Value = txtCGCode.Text,ParameterName = "@CGCode"}

                };
                int count = 0;
                try
                {
                    count = _db.ExecuteNonQuery("SP_CompGroup", sqlParameters);
                }
                catch (Exception exception)
                {
                    ShowErrorMsg(exception.Message);
                }
                if (count > 0)
                {
                    ShowSuccMsg("Delete Succesfully");
                    LoadGrd();
                    Clear();
                }
                else
                {
                    ShowErrorMsg("Failed to delete");

                }
            }
        }

        private bool Validation()
        {
            bool result = true;
            string msg = string.Empty;
            if (string.IsNullOrWhiteSpace(txtCGCode.Text))
            {
                msg += "Group code is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtCGName.Text))
            {
                msg += "Group name is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtCGCountry.Text))
            {
                msg += "Country is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtCGAddress.Text))
            {
                msg += "Address is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtCGCell.Text))
            {
                msg += "Cell is empty" + "<br>";
            }
            if (!string.IsNullOrWhiteSpace(txtCGCell.Text))
            {
                if (!Helper.IsPhoneNumber(txtCGCell.Text))
                {
                    msg += "Cell number is not valid" + "<br>";
                }
            }
            if (string.IsNullOrWhiteSpace(txtCGPerson.Text))
            {
                msg += "Contact person is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtCGEmail.Text))
            {
                msg += "Email is empty" + "<br>";
            }
            if (!string.IsNullOrWhiteSpace(txtCGEmail.Text))
            {
                if (!Helper.IsEmail(txtCGEmail.Text))
                {
                    msg += "Email address is not valid" + "<br>";

                }
            }
            if (string.IsNullOrWhiteSpace(txtCGEmail.Text))
            {
                msg += "Website is empty" + "<br>";
            }

            if (!string.IsNullOrWhiteSpace(txtCGCode.Text))
            {
                string query = "Select count(*) from tblCompGroup where CGCode='" + txtCGCode.Text + "'";
                string value = _db.GetSingelValue(query);
                if (!string.IsNullOrEmpty(value) && !txtCGCode.ReadOnly)
                {
                    if (value != "0")
                        msg += "Group code already exists" + "<br>";

                }
            }


            if (!string.IsNullOrWhiteSpace(msg))
            {
                result = false;
                ShowErrorMsg(msg);
            }
            return result;
        }

        private void Clear()
        {
            txtCGCode.Text = string.Empty;
            txtCGName.Text = string.Empty;
            txtCGCountry.Text = string.Empty;
            txtCGAddress.Text = string.Empty;
            txtCGCell.Text = string.Empty;
            txtCGPerson.Text = string.Empty;
            txtCGEmail.Text = string.Empty;
            txtCGWeb.Text = string.Empty;
            txtCGRemarks.Text = string.Empty;
            txtCGCode.ReadOnly = false;
            btnSave.Text = "Save";
        }
        private void ShowErrorMsg(string msg)
        {
            lblError.Text = msg;
            divError.Visible = true;
        }
        private void ShowSuccMsg(string msg)
        {
            lblSuccess.Text = msg;
            divSucc.Visible = true;
        }

        private void LoadGrd()
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter{Value = "Select",ParameterName = "@Action"}
            };
            DataSet ds = null;
            ds = _db.GetDataSet("SP_CompGroup", sqlParameters);
            grdCompanyGroup.DataSource = ds;
            grdCompanyGroup.DataBind();
        }

        protected void grdCompanyGroup_OnRowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";
                e.Row.ToolTip = "Click to select row";
                e.Row.Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.grdCompanyGroup, "Select$" + e.Row.RowIndex);
            }
        }

        protected void grdCompanyGroup_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            var row = grdCompanyGroup.SelectedRow;
            string CgRef = ((HiddenField)row.FindControl("hideCgRef")).Value;
            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter{Value = "Select",ParameterName = "@Action"},
                new SqlParameter{Value = CgRef,ParameterName = "@CGRef"}
            };
            DataSet ds = null;

            try
            {
                ds = _db.GetDataSet("SP_CompGroup", sqlParameters);
            }
            catch (Exception exception)
            {

            }


            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                btnSave.Text = "Update";
                DataRow dr = ds.Tables[0].Rows[0];
                txtCGCode.ReadOnly = true;
                txtCGCode.Text = dr["CGCode"].ToString();
                txtCGName.Text = dr["CGName"].ToString();
                txtCGAddress.Text = dr["CGAddress"].ToString();
                txtCGCountry.Text = dr["CGCountry"].ToString();
                txtCGPerson.Text = dr["CGPerson"].ToString();
                txtCGCell.Text = dr["CGCell"].ToString();
                txtCGEmail.Text = dr["CGEmail"].ToString();
                txtCGWeb.Text = dr["CGWeb"].ToString();
                txtCGRemarks.Text = dr["CGRemarks"].ToString();

                if (dr["CGStatus"].ToString() == "Active")
                {
                    rdYes.Checked = true;
                    rdNo.Checked = false;
                }
                else
                {
                    rdYes.Checked = false;
                    rdNo.Checked = true;
                }
            }

        }
    }
}
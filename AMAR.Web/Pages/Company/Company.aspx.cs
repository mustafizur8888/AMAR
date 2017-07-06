using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AMAR.Web.Models;
using DAL;

namespace AMAR.Web.Pages.Company
{
    public partial class Company : System.Web.UI.Page
    {

        private readonly Db _db;
        private CompanyHelper _companyHelper;
        public Company()
        {
            _db = new Db();
            _companyHelper = new CompanyHelper();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            divError.Visible = false;
            divSucc.Visible = false;
            if (!IsPostBack)
            {
                LoadCompanyGroup();
                ddlCpGroup_OnSelectedIndexChanged(null, null);
            }
        }



        private void LoadCompanyGroup()
        {
            DataSet ds = _companyHelper.GetCompanyGroupList();

            ddlCpGroup.DataSource = ds;
            ddlCpGroup.DataTextField = "CGName";
            ddlCpGroup.DataValueField = "CGRef";
            ddlCpGroup.DataBind();
        }

        private void SetIntialStateOfDll()
        {
            ddlCpGroup.SelectedIndex = 0;
        }
        private void Clear()
        {
            txtCPCode.Text = string.Empty;
            txtCPAddress.Text = string.Empty;
            txtCPName.Text = string.Empty;
            txtCPCountry.Text = string.Empty;
            txtCPWeb.Text = string.Empty;
            txtCPEmail.Text = string.Empty;
            txtCPCell.Text = string.Empty;
            txtCpRemarks.Text = string.Empty;
            txtCPCode.ReadOnly = false;
            txtCPPerson.Text = string.Empty;
            btnSave.Text = "Save";
            //ddlCpGroup.SelectedIndex = 0;
            rdYes.Checked = true;
            ddlCpGroup.Enabled = true;
        }

        protected void btnCancel_OnClick(object sender, EventArgs e)
        {
            Clear();
            SetIntialStateOfDll();
        }

        protected void btnSave_OnClick(object sender, EventArgs e)
        {
            if (Validation())
            {
                string CPCode = txtCPCode.Text;
                string CPName = txtCPName.Text;
                string CPAddress = txtCPAddress.Text;
                string CPCountry = txtCPCountry.Text;
                string CPPerson = txtCPPerson.Text;
                string CPCell = txtCPCell.Text;
                string CPEmail = txtCPEmail.Text;
                string CPWeb = txtCPWeb.Text;
                string CPRemarks = txtCpRemarks.Text;
                string CPCGRef = ddlCpGroup.SelectedValue;
                string CPStatus = rdYes.Checked ? "Active" : "InActive";


                Helper helper = new Helper();
                string CPUser = "";
                string CPPCIP = "";
                string CPPCName = "";
                string CPPCMac = "";

                string CPCGCode = _db.GetSingelValue(@"SELECT [CGCode] FROM[AMIS].[dbo].[tblCompGroup] where CGRef = '" + ddlCpGroup.SelectedValue + "'"
                      );

                try
                {
                    CPPCIP = helper.GetIpAddress();
                }
                catch (Exception exception)
                {

                }

                try
                {
                    CPPCName = helper.GetPcName(Request);
                }
                catch (Exception exception)
                {

                }

                try
                {
                    CPPCName = helper.GetMAC();
                }
                catch (Exception exception)
                {

                }


                List<SqlParameter> sqlParameters = new List<SqlParameter>
                {
                    new SqlParameter{Value = txtCPCode.ReadOnly?"Update": "Insert",ParameterName = "@Action"},
                    new SqlParameter{Value = CPCode,ParameterName = "@CPCode"},
                    new SqlParameter{Value = CPName,ParameterName = "@CPName"},
                    new SqlParameter{Value =CPAddress,ParameterName = "@CPAddress"},
                    new SqlParameter{Value = CPCountry,ParameterName = "@CPCountry"},
                    new SqlParameter{Value = CPPerson,ParameterName = "@CPPerson"},
                    new SqlParameter{Value = CPCell,ParameterName = "@CPCell"},
                    new SqlParameter{Value = CPEmail,ParameterName = "@CPEmail"},
                    new SqlParameter{Value = CPWeb,ParameterName = "@CPWeb"},
                    new SqlParameter{Value = CPUser,ParameterName = "@CPUser"},
                    new SqlParameter{Value = CPRemarks,ParameterName = "@CPRemarks"},
                    new SqlParameter{Value = CPStatus,ParameterName = "@CPStatus"},
                    new SqlParameter{Value = CPPCMac,ParameterName = "@CPPCMac"},
                    new SqlParameter{Value = CPPCName,ParameterName = "@CPPCName"},
                    new SqlParameter{Value = CPPCIP,ParameterName = "@CPPCIP"},
                    new SqlParameter{Value = CPCGRef,ParameterName = "@CPCGRef"},
                    new SqlParameter{Value = CPCGCode,ParameterName = "@CPCGCode"}
                };


                int count = _db.ExecuteNonQuery("SP_Company", sqlParameters);
                if (count > 0)
                {
                    ShowSuccMsg(txtCPCode.ReadOnly ? "Update Succesfully" : "Save Succesfully");
                    Clear();
                    LoadGrd();

                }
            }
        }
        protected void btnDelete_OnClick(object sender, EventArgs e)
        {
            if (!txtCPCode.ReadOnly)
            {
                ShowErrorMsg("Select a row to delete");
            }
            else
            {
                List<SqlParameter> sqlParameters = new List<SqlParameter>
                {
                    new SqlParameter{Value = "Delete",ParameterName = "@Action"},
                    new SqlParameter{Value = txtCPCode.Text,ParameterName = "@CPCode"}

                };
                int count = 0;
                try
                {
                    count = _db.ExecuteNonQuery("SP_Company", sqlParameters);
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

        private void LoadGrd()
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter{Value = "Select",ParameterName = "@Action"},
                new SqlParameter{Value = ddlCpGroup.SelectedValue,ParameterName = "@CPCGRef"},
            };
            DataSet ds = null;
            ds = _db.GetDataSet("SP_Company", sqlParameters);
            grdCompany.DataSource = ds;
            grdCompany.DataBind();
        }

        private bool Validation()
        {
            bool result = true;
            string msg = string.Empty;
            if (string.IsNullOrWhiteSpace(txtCPCode.Text))
            {
                msg += "Company code is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtCPName.Text))
            {
                msg += "Company name is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtCPCountry.Text))
            {
                msg += "Country is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtCPAddress.Text))
            {
                msg += "Address is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtCPCell.Text))
            {
                msg += "Cell is empty" + "<br>";
            }
            if (!string.IsNullOrWhiteSpace(txtCPCell.Text))
            {
                if (!Helper.IsPhoneNumber(txtCPCell.Text))
                {
                    msg += "Cell number is not valid" + "<br>";
                }
            }
            if (string.IsNullOrWhiteSpace(txtCPPerson.Text))
            {
                msg += "Contact person is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtCPEmail.Text))
            {
                msg += "Email is empty" + "<br>";
            }
            if (!string.IsNullOrWhiteSpace(txtCPEmail.Text))
            {
                if (!Helper.IsEmail(txtCPEmail.Text))
                {
                    msg += "Email address is not valid" + "<br>";

                }
            }
            if (string.IsNullOrWhiteSpace(txtCPWeb.Text))
            {
                msg += "Website is empty" + "<br>";
            }

            if (!string.IsNullOrWhiteSpace(txtCPCode.Text))
            {
                string query = "Select count(*) from tblCompany where CPCode='" + txtCPCode.Text + "'";
                string value = _db.GetSingelValue(query);
                if (!string.IsNullOrEmpty(value) && !txtCPCode.ReadOnly)
                {
                    if (value != "0")
                        msg += "Company code already exists" + "<br>";

                }
            }


            if (!string.IsNullOrWhiteSpace(msg))
            {
                result = false;
                ShowErrorMsg(msg);
            }
            return result;
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

        protected void ddlCpGroup_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            LoadGrd();
        }


        protected void grdCompany_OnRowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";
                e.Row.ToolTip = "Click to select row";
                e.Row.Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.grdCompany, "Select$" + e.Row.RowIndex);
            }
        }

        protected void grdCompany_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            var row = grdCompany.SelectedRow;
            string cpref = ((HiddenField)row.FindControl("hideCPRef")).Value;
            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter{Value = "Edite",ParameterName = "@Action"},
                new SqlParameter{Value = cpref,ParameterName = "@CPRef"}
            };
            DataSet ds = null;

            try
            {
                ds = _db.GetDataSet("SP_Company", sqlParameters);
            }
            catch (Exception exception)
            {

            }


            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                btnSave.Text = "Update";
                DataRow dr = ds.Tables[0].Rows[0];
                txtCPCode.ReadOnly = true;
                txtCPCode.Text = dr["CPCode"].ToString();
                txtCPName.Text = dr["CPName"].ToString();
                txtCPAddress.Text = dr["CPAddress"].ToString();
                txtCPCountry.Text = dr["CPCountry"].ToString();
                txtCPPerson.Text = dr["CPPerson"].ToString();
                txtCPCell.Text = dr["CPCell"].ToString();
                txtCPEmail.Text = dr["CPEmail"].ToString();
                txtCPWeb.Text = dr["CPWeb"].ToString();
                txtCpRemarks.Text = dr["CPRemarks"].ToString();
                ddlCpGroup.Enabled = false;
                if (dr["CPStatus"].ToString() == "Active")
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
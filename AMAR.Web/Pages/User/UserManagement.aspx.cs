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

namespace AMAR.Web.Pages.User
{
    public partial class UserManagement : System.Web.UI.Page
    {
        MenuHelper helper = new MenuHelper();
        private readonly Db _db;
        public UserManagement()
        {
            _db = new Db();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            divError.Visible = false;
            divSucc.Visible = false;

          
            if (!IsPostBack)
            {
                loadCP();
                loadCG();
                LoadGrd();
            }

        }

        private void loadCP()
        {
            DataSet ds = null;
            ds = helper.GetUserCompanyList(DropDownValue.All);
            ddlCpCode.DataSource = ds;
            ddlCpCode.DataTextField = "CPCode";
            ddlCpCode.DataValueField = "CPRef";
            ddlCpCode.DataBind();
        }

        private void loadCG()
        {
            DataSet ds = null;
            ds = helper.GetUserCGList(DropDownValue.All);
            ddlCgCode.DataSource = ds;
            ddlCgCode.DataTextField = "CGCode";
            ddlCgCode.DataValueField = "CGRef";
            ddlCgCode.DataBind();
        }

        protected void btnCancel_OnClick(object sender, EventArgs e)
        {
           Clear();
        }

        protected void btnSave_OnClick(object sender, EventArgs e)
        {
            if (Validation())
            {
                string CGCode = String.Empty;
                string CGRef = String.Empty;
                string CPcode = String.Empty;
                string CPRef = ddlCpCode.SelectedValue, ParameterName;
                string UserName = txtUserName.Text;
                string UserPassword = txtpwd.Text;
                string UserEmail = txtUserEmail.Text;
                string userCOde = txtUserCode.Text;
                string userCell = txtUserCell.Text;

                Helper helper = new Helper();
                string User = "";
                string UserPCIP = "";
                string UserPCName = "";

                string UserPCMac = "";
                string UserStatus = rdYes.Checked ? "Active" : "InActive";

                try
                {
                    UserPCIP = helper.GetIpAddress();
                }
                catch (Exception exception)
                {

                }

                try
                {
                    UserPCName = helper.GetPcName(Request);
                }
                catch (Exception exception)
                {

                }

                try
                {
                    UserPCMac = helper.GetMAC();
                }
                catch (Exception exception)
                {

                }


                List<SqlParameter> sqlParameters = new List<SqlParameter>
                {
                    new SqlParameter{Value = ddlCpCode.Enabled?"Insert": "Update",ParameterName = "@Action"},
                    new SqlParameter{Value = ddlCgCode.SelectedValue.ToString(),ParameterName = "@UserCGRef"},
                    new SqlParameter{Value = ddlCgCode.SelectedItem.Text,ParameterName = "@UserCGCode"},
                    new SqlParameter{Value = CPRef,ParameterName = "@UserCPRef",},
                    new SqlParameter{Value = ddlCpCode.SelectedItem.Text,ParameterName = "@UserCPCode"},
                    new SqlParameter{Value = txtUserCode.Text,ParameterName = "@UserCode"},
                    new SqlParameter{Value = txtUserName.Text,ParameterName = "@UserName"},
                    new SqlParameter{Value = txtpwd.Text,ParameterName = "@UserPW"},
                    new SqlParameter{Value = txtUserCell.Text,ParameterName = "@UserCell"},
                    new SqlParameter{Value = txtUserEmail.Text,ParameterName = "@UserEmail"},
                    new SqlParameter{Value = UserPCIP,ParameterName = "@UserPCIP"},
                    new SqlParameter{Value = UserPCName,ParameterName = "@UserPCName"},
                    new SqlParameter{Value = UserPCMac,ParameterName = "@UserMac"},
                    new SqlParameter{Value = UserStatus,ParameterName = "@UserStatus"},
                    new SqlParameter{Value = txtCpRemarks.Text,ParameterName = "@UserRemarks"}
                };
                

                int count = _db.ExecuteNonQuery("SP_Users", sqlParameters);
                if (count > 0)
                {
                    ShowSuccMsg(ddlCpCode.Enabled ? "Save Succesfully" : "Update Succesfully");
                    Clear();
                }
            }
        }
        private void Clear()
        {
            txtUserCode.Text = string.Empty;
            txtCpRemarks.Text = string.Empty;
            txtUserCell.Text = string.Empty;
            txtUserEmail.Text = string.Empty;
            txtUserName.Text = string.Empty;
            txtpwd.Text = string.Empty;
            ddlCpCode.Enabled = true;
            ddlCgCode.Enabled = true;
            btnSave.Text = "Save";
        }
        private void ShowSuccMsg(string msg)
        {
            lblSuccess.Text = msg;
            divSucc.Visible = true;
        }
        protected void btnDelete_OnClick(object sender, EventArgs e)
        {
            if (ddlCgCode.Enabled)
            {
                ShowErrorMsg("Select a row to delete");
            }
            else
            {
                List<SqlParameter> sqlParameters = new List<SqlParameter>
                {
                    new SqlParameter{Value = "Delete",ParameterName = "@Action"},
                    new SqlParameter{Value = txtUserCode.Text,ParameterName = "@UserCode"}

                };
                int count = 0;
                try
                {
                    count = _db.ExecuteNonQuery("SP_Users", sqlParameters);
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

        protected void grdUserList_OnRowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";
                e.Row.ToolTip = "Click to select row";
                e.Row.Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.grdUserList, "Select$" + e.Row.RowIndex);
            }
        }
        private void LoadGrd()
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter{Value = "Select",ParameterName = "@Action"}
            };
            DataSet ds = null;
            ds = _db.GetDataSet("SP_Users", sqlParameters);
            grdUserList.DataSource = ds;
            grdUserList.DataBind();
        }
        protected void grdUserList_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            var row = grdUserList.SelectedRow;
            string UserRef = ((HiddenField)row.FindControl("hideUserRef")).Value;
            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter{Value = "Select",ParameterName = "@Action"},
                new SqlParameter{Value = UserRef,ParameterName = "@UserCGRef"}
            };
            DataSet ds = null;

            try
            {
                ds = _db.GetDataSet("SP_Users", sqlParameters);
            }
            catch (Exception exception)
            {

            }


            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                btnSave.Text = "Update";
                DataRow dr = ds.Tables[0].Rows[0];
                ddlCpCode.Enabled= false;
                ddlCgCode.Enabled= false;
                ddlCpCode.Items.FindByText(dr["UserCPCode"].ToString()).Selected = true;
                ddlCgCode.Items.FindByText(dr["UserCGCode"].ToString()).Selected = true;
                //txtCGCode.Text = dr["UserCGCode"].ToString();
                // txtCGName.Text = dr["UserCPCode"].ToString();
                txtUserName.Text = dr["UserName"].ToString();

                txtUserCell.Text = dr["UserCell"].ToString();
                txtUserEmail.Text = dr["UserEmail"].ToString();
                txtUserCode.Text = dr["UserCode"].ToString();
                txtpwd.Text = dr["UserPW"].ToString();
                txtCpRemarks.Text = dr["UserRemarks"].ToString();
               

                if (dr["UserStatus"].ToString() == "Active")
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

        private bool Validation()
        {
            bool result = true;
            string msg = string.Empty;
            if (string.IsNullOrWhiteSpace(txtUserName.Text))
            {
                msg += "User Name is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtpwd.Text))
            {
                msg += "Password is empty" + "<br>";
            }
            if (!string.IsNullOrWhiteSpace(txtUserEmail.Text))
            {
                if (!Helper.IsEmail(txtUserEmail.Text))
                {
                    msg += "Email address is not valid" + "<br>";

                }
            }
            else
            {
                msg += "Email address is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtUserCode.Text))
            {
                msg += "User Code is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtUserCell.Text))
            {
                msg += "User Cell number is empty" + "<br>";
            }
            if (ddlCgCode.Items.Count == 0)
            {
                msg += "Company Group is empty" + "<br>";
            }
            if (ddlCpCode.Items.Count == 0)
            {
                msg += "Company is empty" + "<br>";
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

    }
}
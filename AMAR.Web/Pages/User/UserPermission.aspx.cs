using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using AMAR.Web.Models;
using DAL;

namespace AMAR.Web.Pages.User
{
    public partial class UserPermission : System.Web.UI.Page
    {
        private CompanyHelper _companyHelper;
        MenuHelper helper = new MenuHelper();
        private Db _db;
        public UserPermission()
        {
            _companyHelper = new CompanyHelper();
            _db = new Db();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            divError.Visible = false;
            divSucc.Visible = false;
            if (!IsPostBack)
            {
                LoadCompanyGroup();
                ddlCpGroup_OnSelectedIndexChanged(null, null);
                LoadMainMenu();

                ddlMenu_OnSelectedIndexChanged(null, null);
            }
        }


        private void LoadCP()
        {
            DataSet ds = null;
            ds = helper.GetUserCompanyList(ddlCpGroup.SelectedValue, DropDownValue.All);
            ddlCompRefNo.DataSource = ds;
            ddlCompRefNo.DataTextField = "CPCode";
            ddlCompRefNo.DataValueField = "CPRef";
            ddlCompRefNo.DataBind();
        }
        private void LoadSubMenu()
        {
            DataSet ds = helper.GetSubMenuList(ddlMenu.SelectedValue, DropDownValue.All);

            ddlSubMenu.DataSource = ds;
            ddlSubMenu.DataTextField = "SMName";
            ddlSubMenu.DataValueField = "RefNo";
            ddlSubMenu.DataBind();



        }
        private void LoadMainMenu()
        {
            DataSet ds = null;
            ds = helper.GetMainMenuList(DropDownValue.All);
            ddlMenu.DataSource = ds;
            ddlMenu.DataTextField = "MenuName";
            ddlMenu.DataValueField = "RefNo";
            ddlMenu.DataBind();
        }
        protected void ddlCpGroup_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            LoadCP();
            ddlCompRefNo_OnSelectedIndexChanged(null, null);

        }
        private void LoadCompanyGroup()
        {
            DataSet ds = _companyHelper.GetCompanyGroupList();

            ddlCpGroup.DataSource = ds;
            ddlCpGroup.DataTextField = "CGName";
            ddlCpGroup.DataValueField = "CGRef";
            ddlCpGroup.DataBind();
        }
        protected void ddlCompRefNo_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            GetUserList();
            ddlUser_OnSelectedIndexChanged(null, null);
        }

        protected void ddlMenu_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            LoadSubMenu();
            ddlSubMenu_OnSelectedIndexChanged(null, null);
        }

        protected void ddlSubMenu_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            LoadGride();
        }

        private void GetUserList()
        {
            UserHelper userHelper = new UserHelper();
            DataSet dataSet = userHelper.GetUserList(ddlCpGroup.SelectedValue, ddlCompRefNo.SelectedValue);
            ddlUser.DataSource = dataSet;
            ddlUser.DataTextField = "UserName";
            ddlUser.DataValueField = "UserRef";
            ddlUser.DataBind();

        }
        protected void ddlUser_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            LoadGride();
        }

        private void LoadGride()
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter{Value = ddlSubMenu.SelectedValue,ParameterName = "@SMRef"},
                new SqlParameter{Value =ddlMenu.SelectedValue,ParameterName = "@MMRef"},
                new SqlParameter{Value = ddlUser.SelectedValue,ParameterName = "@userRef"},
                new SqlParameter{Value = ddlCpGroup.SelectedValue,ParameterName = "@UserCGRef"},
                new SqlParameter{Value = ddlCompRefNo.SelectedValue,ParameterName = "@UserCPRef"},
            };
            DataSet ds = null;
            ds = _db.GetDataSet("Sp_GetUserPermision", sqlParameters);
            grdpermission.DataSource = ds;
            grdpermission.DataBind();
        }

        protected void btnSave_OnClick(object sender, EventArgs e)
        {
            if (Validation())
            {
                Helper helper = new Helper();
                string CGUser = "";
                string CGPCIP = "";
                string CGPCName = "";

                string CGPCMac = "";
               

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



            }
        }
        private bool Validation()
        {
            bool result = true;
            string msg = string.Empty;
            if (ddlSubMenu.Items.Count == 0)
            {
                msg += "Select a sub-menu" + "<br>";
            }
            if (ddlCpGroup.Items.Count == 0)
            {
                msg += "Select a company-group" + "<br>";
            }
            if (ddlMenu.Items.Count == 0)
            {
                msg += "Select a menu" + "<br>";

            }
            if (ddlUser.Items.Count == 0)
            {
                msg += "Select a user" + "<br>";

            }

            if (!string.IsNullOrWhiteSpace(msg))
            {
                result = false;
                ShowErrorMsg(msg);
            }
            return result;
        }
        private void ShowSuccMsg(string msg)
        {
            lblSuccess.Text = msg;
            divSucc.Visible = true;
        }
        private void ShowErrorMsg(string msg)
        {
            lblError.Text = msg;
            divError.Visible = true;
        }

    }
}
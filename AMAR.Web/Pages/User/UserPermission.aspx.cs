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
                LoadCP();
                LoadMainMenu();
                ddlCompRefNo_OnSelectedIndexChanged(null, null);
                ddlMenu_OnSelectedIndexChanged(null, null);
            }
        }


        private void LoadCP()
        {
            DataSet ds = null;
            ds = helper.GetUserCompanyList(DropDownValue.All);
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
        }

        protected void ddlMenu_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            LoadSubMenu();
            ddlSubMenu_OnSelectedIndexChanged(null,null);
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

        }
    }
}
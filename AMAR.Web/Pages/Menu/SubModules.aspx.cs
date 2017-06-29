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

namespace AMAR.Web.Pages.Menu
{
    public partial class SubModules : System.Web.UI.Page
    {
        MenuHelper helper = new MenuHelper();
        Db _db = new Db();
        protected void Page_Load(object sender, EventArgs e)
        {
            divError.Visible = false;
            divSucc.Visible = false;
            if (!IsPostBack)
            {
                LoadMainMenu();
                ddlMenu_OnSelectedIndexChanged(sender, e);
            }
        }

        protected void btnSave_OnClick(object sender, EventArgs e)
        {
            if (Validation())
            {
                Helper helper = new Helper();

                string SubmdCode = txtSubMdCode.Text;
                string SubmdName = txtSubMdName.Text;
                string remarks = txtRemarks.Text;
                string menuIp = string.Empty;
                string menuPcMac = string.Empty;
                string menuPcName = string.Empty;
                string status;
                try
                {
                    menuIp = helper.GetIpAddress();
                }
                catch (Exception exception)
                {
                    menuIp = "pc Ip getting error";
                }

                try
                {
                    menuPcName = helper.GetPcName(Request);
                }
                catch (Exception exception)
                {
                    menuPcName = "pc name not found";
                }

                try
                {
                    menuPcMac = helper.GetMAC();
                }
                catch (Exception exception)
                {
                    menuPcMac = "pc mac not found";
                }
                status = rdYes.Checked ? "Active" : "InActive";
                List<SqlParameter> sqlParameters = new List<SqlParameter>
                {
                    new SqlParameter
                    {
                        Value = txtSubMdCode.ReadOnly?"Update": "Insert",
                        ParameterName = "@Action"
                    },
                    new SqlParameter
                    {
                        Value = SubmdCode,
                        ParameterName = "@MSCode"
                    },
                    new SqlParameter
                    {
                        Value = SubmdName,
                        ParameterName = "@MSName"
                    },
                    new SqlParameter
                    {
                        Value = ddlModule.SelectedItem.Text,
                        ParameterName = "@MdCode"
                    },
                    new SqlParameter
                    {
                        Value = ddlModule.SelectedValue,
                        ParameterName = "@MdRef"
                    },
                    new SqlParameter
                    {
                        Value = "",
                        ParameterName = "@MsUser"
                    },
                    new SqlParameter
                    {
                        Value = menuIp,
                        ParameterName = "@MsPCIP"
                    },
                    new SqlParameter
                    {
                        Value = menuPcName,
                        ParameterName = "@MsPCName"
                    },
                    new SqlParameter
                    {
                        Value = menuPcMac,
                        ParameterName = "@MsPCMac"
                    },
                    new SqlParameter
                    {
                        Value = status,
                        ParameterName = "@MSStatus"
                    },
                    new SqlParameter
                    {
                        Value = remarks,
                        ParameterName = "@MSRemarks"
                    },
                    new SqlParameter
                    {
                        Value = "",
                        ParameterName = "@MSUpdate"
                    },
                    new SqlParameter
                    {
                        Value = "",
                        ParameterName = "@MSDelete"
                    },
                    new SqlParameter
                    {
                        Value = "",
                        ParameterName = "@MSInsert"
                    },
                    new SqlParameter
                    {
                        Value = "",
                        ParameterName = "@MSSelect"
                    },
                    new SqlParameter
                    {
                        Value = "",
                        ParameterName = "@MSImport"
                    },
                    new SqlParameter
                    {
                        Value = "",
                        ParameterName = "@MSExport"
                    }

                };
                int count = _db.ExecuteNonQuery("SP_SubModules", sqlParameters);
                if (count > 0)
                {
                    ShowSuccMsg(txtSubMdCode.ReadOnly ? "Updated Successfully" : "Saved Successfully");
                    Clear();
                    LoadSubModuleList();
                }



            }
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
        private void Clear()
        {
            txtSubMdName.Text = string.Empty;
            txtSubMdCode.Text = string.Empty;
            txtSubMdUrl.Text = string.Empty;
            txtRemarks.Text = string.Empty;
            rdYes.Checked = true;
            rdNo.Checked = false;
            txtSubMdCode.ReadOnly = false;
            ddlSubMenu.Enabled = true;
            ddlMenu.Enabled = true;
            ddlModule.Enabled = true;
        }
        private bool Validation()
        {
            bool result = true;
            string msg = string.Empty;
            if (string.IsNullOrWhiteSpace(txtSubMdCode.Text))
            {
                msg += "SubModule code is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtSubMdName.Text))
            {
                msg += "SubModule name is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtSubMdUrl.Text))
            {
                msg += "SubModule url is empty" + "<br>";
            }
            if (ddlMenu.Items.Count == 0)
            {
                msg += "Select a menu" + "<br>";
            }
            if (ddlSubMenu.Items.Count == 0)
            {
                msg += "Select a sub-menu" + "<br>";
            }
            if (ddlModule.Items.Count == 0)
            {
                msg += "Select a sub-menu" + "<br>";
            }
            if (!string.IsNullOrWhiteSpace(msg))
            {
                result = false;
                ShowErrorMsg(msg);
            }
            return result;
        }
        protected void btnCancel_OnClick(object sender, EventArgs e)
        {
            Clear();
            ddlMenu.SelectedIndex = 0;
            ddlMenu_OnSelectedIndexChanged(null, null);
            ddlSubMenu_OnSelectedIndexChanged(null, null);
            ddlModule_OnSelectedIndexChanged(null, null);
        }

        protected void ddlMenu_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            LoadSubMenu();
            ddlSubMenu_OnSelectedIndexChanged(sender, e);

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
        protected void ddlSubMenu_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            LoadModule();
            ddlModule_OnSelectedIndexChanged(null,null);
        }

        private void LoadModule()
        {
            DataSet ds = helper.GetModuleList(ddlSubMenu.SelectedValue, DropDownValue.All);

            ddlModule.DataSource = ds;
            ddlModule.DataTextField = "MdName";
            ddlModule.DataValueField = "RefNo";
            ddlModule.DataBind();
        }

        protected void ddlModule_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            LoadSubModuleList();
        }
        private void LoadSubModuleList()
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter{Value = "Select",ParameterName = "@Action"},
                new SqlParameter{Value = ddlModule.SelectedValue,ParameterName = "@MdRef"},
            };
            DataSet ds = null;
            ds = _db.GetDataSet("SP_SubModules", sqlParameters);
            grdSubModules.DataSource = ds;
            grdSubModules.DataBind();
        }
       
        protected void btnEdit_OnClick(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            string mdCode = ((Label)gvr.FindControl("lblMdCode")).Text;
            string mdRemarks = ((HiddenField)gvr.FindControl("hidRemarks")).Value;
            string url = ((HiddenField)gvr.FindControl("hidMdUrl")).Value;
            string mdName = ((Label)gvr.FindControl("lblMdName")).Text;
            string status = ((Label)gvr.FindControl("lblStatus")).Text;
            ddlSubMenu.Enabled = false;
            ddlMenu.Enabled = false;
            ddlModule.Enabled = false;
            txtSubMdCode.ReadOnly = true;
            if (status == "Active")
            {
                rdYes.Checked = true;
                rdNo.Checked = false;
            }
            else
            {
                rdYes.Checked = false;
                rdNo.Checked = true;
            }
            txtSubMdCode.Text = mdCode;
            txtSubMdName.Text = mdName;
            txtSubMdUrl.Text = url;
            txtRemarks.Text = mdRemarks;


        }

        protected void btnDelete_OnClick(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            string mdCode = ((Label)gvr.FindControl("lblMdCode")).Text;
            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter{Value = "Delete",ParameterName = "@Action"},
                new SqlParameter{Value = mdCode,ParameterName = "@MSCode"}

            };

            int count = 0;
            try
            {
                count = _db.ExecuteNonQuery("SP_SubModules", sqlParameters);
            }
            catch (Exception exception)
            {
                ShowErrorMsg(exception.Message);
            }
            if (count > 0)
            {
                ShowSuccMsg("Delete successfully");
                LoadSubModuleList();
            }
            else
            {
                ShowErrorMsg("Failed to delete");
            }


        }

      
    }
}
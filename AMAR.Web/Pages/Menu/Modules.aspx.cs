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
    public partial class Modules : System.Web.UI.Page
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

                string mdCode = txtMdCode.Text;
                string mdName = txtMdName.Text;
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
                        Value = txtMdCode.ReadOnly?"Update": "Insert",
                        ParameterName = "@Action"
                    },
                    new SqlParameter
                    {
                        Value = mdCode,
                        ParameterName = "@MdCode"
                    },
                    new SqlParameter
                    {
                        Value = mdName,
                        ParameterName = "@MdName"
                    },
                    new SqlParameter
                    {
                        Value = "",
                        ParameterName = "@MdUser"
                    },
                    new SqlParameter
                    {
                        Value = menuIp,
                        ParameterName = "@MdPCIP"
                    },
                    new SqlParameter
                    {
                        Value = menuPcName,
                        ParameterName = "@MdPCName"
                    },
                    new SqlParameter
                    {
                        Value = menuPcMac,
                        ParameterName = "@MdPCMac"
                    },
                    new SqlParameter
                    {
                        Value = status,
                        ParameterName = "@MdStatus"
                    },
                    new SqlParameter
                    {
                        Value = remarks,
                        ParameterName = "@MdRemarks"
                    },
                    new SqlParameter
                    {
                        Value = "",
                        ParameterName = "@SmCode"
                    },  new SqlParameter
                    {
                        Value = ddlSubMenu.SelectedValue,
                        ParameterName = "@SmRef"
                    },
                    new SqlParameter
                    {
                        Value = txtMdUrl.Text,
                        ParameterName = "@MdUrl"
                    }, new SqlParameter
                    {
                        Value = ddlMenu.SelectedValue,
                        ParameterName = "@MMRef"
                    }
                };
                int count = _db.ExecuteNonQuery("SP_Modules", sqlParameters);
                if (count > 0)
                {
                    ShowSuccMsg("Saved Successfully");
                    Clear();
                    LoadModuleList();
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
            txtMdName.Text = string.Empty;
            txtMdCode.Text = string.Empty;
            txtMdUrl.Text = string.Empty;
            txtRemarks.Text = string.Empty;
            rdYes.Checked = true;
            rdNo.Checked = false;
            txtMdCode.ReadOnly = false;
            ddlSubMenu.Enabled = true;
            ddlMenu.Enabled = true;
        }
        private bool Validation()
        {
            bool result = true;
            string msg = string.Empty;
            if (string.IsNullOrWhiteSpace(txtMdCode.Text))
            {
                msg += "Module code is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtMdName.Text))
            {
                msg += "Module name is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtMdUrl.Text))
            {
                msg += "Module url is empty" + "<br>";
            }
            if (ddlMenu.Items.Count == 0)
            {
                msg += "Select a menu" + "<br>";
            }
            if (ddlSubMenu.Items.Count == 0)
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
            LoadModuleList();
        }

        private void LoadModuleList()
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter{Value = "Select",ParameterName = "@Action"},
                new SqlParameter{Value = ddlSubMenu.SelectedValue,ParameterName = "@SMRef"},
                new SqlParameter{Value = ddlMenu.SelectedValue,ParameterName = "@MMRef"},
            };
            DataSet ds = null;
            ds = _db.GetDataSet("SP_Modules", sqlParameters);
            grdModules.DataSource = ds;
            grdModules.DataBind();
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
            txtMdCode.ReadOnly = true;
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
            txtMdCode.Text = mdCode;
            txtMdName.Text = mdName;
            txtMdUrl.Text = url;
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
                new SqlParameter{Value = mdCode,ParameterName = "@MdCode"}
              
            };

            int count = 0;
            try
            {
                count= _db.ExecuteNonQuery("SP_Modules", sqlParameters);
            }
            catch (Exception exception)
            {
                ShowErrorMsg(exception.Message);
            }
            if (count>0)
            {
                ShowSuccMsg("Delete successfully");
                LoadModuleList();
            }
            else
            {
                ShowErrorMsg("Failed to delete");
            }


        }
    }
}
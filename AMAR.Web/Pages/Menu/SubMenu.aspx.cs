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
    public partial class SubMenu : System.Web.UI.Page
    {
        private Db _db = new Db();
        string MenuCode = String.Empty;
        string MenuRef = String.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            divError.Visible = false;
            divSucc.Visible = false;
            if (!IsPostBack)
            {
                loadDropDownMenu();
                ddlMenu_OnSelectedIndexChanged(null, null);
               
            }
        }

        private void GetSubMenuList()
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter
                {
                    Value = "Select",
                    ParameterName = "@Action"
                },
                new SqlParameter
                {
                    Value = ddlMenu.SelectedValue,
                    ParameterName = "@MenuRef"
                }
            };
            DataSet ds = null;
            ds = _db.GetDataSet("SP_SubMenu", sqlParameters);
            grdSubMenu.DataSource = ds;
            grdSubMenu.DataBind();
        }

        private void loadDropDownMenu()
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter
                {
                    Value = "getmenu",
                    ParameterName = "@Type"
                },

            };
            DataSet dsMenuDataSet = _db.GetDataSet("sp_GetMenuName", sqlParameters);
            if (dsMenuDataSet != null && dsMenuDataSet.Tables[0].Rows.Count > 0)
            {
                ddlMenu.DataSource = dsMenuDataSet;
                ddlMenu.DataTextField = "MenuCode";
                ddlMenu.DataValueField = "RefNo";
                ddlMenu.DataBind();
            }
        }

        protected void btnSave_OnClick(object sender, EventArgs e)
        {
            if (Validation())
            {
                Helper helper = new Helper();

                string SubmenuCode = txtSmcode.Text;
                string SubmenuName = txtSmName.Text;
                string remarks = txtRemarks.Text;
                string menuIp = string.Empty;
                string menuPcMac = string.Empty;
                string menuPcName = string.Empty;

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
                string status = rdYes.Checked ? "Active" : "InActive";
                List<SqlParameter> sqlParameters = new List<SqlParameter>
                {
                    new SqlParameter
                    {
                        Value = txtSmcode.ReadOnly?"Update": "Insert",
                        ParameterName = "@Action"
                    },
                    new SqlParameter
                    {
                        Value = SubmenuCode,
                        ParameterName = "@SubMenuCode"
                    },
                    new SqlParameter
                    {
                        Value = SubmenuName,
                        ParameterName = "@SubMenuName"
                    },
                    new SqlParameter
                    {
                        Value = "",
                        ParameterName = "@SMUser"
                    },
                    new SqlParameter
                    {
                        Value =ddlMenu.SelectedItem.Text,
                        ParameterName = "@MenuCode"
                    },
                    new SqlParameter
                    {
                        Value = ddlMenu.SelectedValue.ToUpper(),
                        ParameterName = "@MenuRef"
                    },
                    new SqlParameter
                    {
                        Value = menuIp,
                        ParameterName = "@SMPCIP"
                    },
                    new SqlParameter
                    {
                        Value = menuPcName,
                        ParameterName = "@SMPCName"
                    },
                    new SqlParameter
                    {
                        Value = menuPcMac,
                        ParameterName = "@SMPCMac"
                    },
                    new SqlParameter
                    {
                        Value = status,
                        ParameterName = "@SMStatus"
                    },
                    new SqlParameter
                    {
                        Value = remarks,
                        ParameterName = "@SMRemarks"
                    }

                };
                int count = _db.ExecuteNonQuery("SP_SubMenu", sqlParameters);
                if (count > 0)
                {
                    ShowSuccMsg(txtSmcode.ReadOnly ? "Updated Successfully" : "Saved Successfully");
                    Clear();
                    loadDropDownMenu();
                    GetSubMenuList();

                }
            }
         
        }

        private void Clear()
        {
            txtSmName.Text = string.Empty;
            txtSmcode.Text = string.Empty;
            txtRemarks.Text = string.Empty;
            rdYes.Checked = true;
            rdNo.Checked = false;
            txtSmcode.ReadOnly = false;
        }


        private bool Validation()
        {
            bool result = true;
            string msg = string.Empty;
            if (string.IsNullOrWhiteSpace(txtSmName.Text))
            {
                msg += "SubMenu name is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtSmcode.Text))
            {
                msg += "SubMenu code name is empty" + "<br>";
            }
            if (!string.IsNullOrWhiteSpace(txtSmcode.Text))
            {
                string query = "Select count(*) from tblSubMenu where SMCode='" + txtSmcode.Text + "'";
                string value = _db.GetSingelValue(query);
                if (!string.IsNullOrEmpty(value))
                {
                    if (value != "0")
                    {
                        msg += "SubMenu code already exists" + "<br/>";
                    }
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

        protected void btnEdit_OnClick(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            string SubmenuCode = ((Label)gvr.FindControl("lblSubMenuCode")).Text;
            string SubmenuRemarks = ((HiddenField)gvr.FindControl("hidRemarks")).Value;
            string SubmenuName = ((Label)gvr.FindControl("lblSubMenuName")).Text;
            string Substatus = ((Label)gvr.FindControl("lblSubStatus")).Text;
            MenuCode = ((HiddenField)gvr.FindControl("hidMenuCode")).Value;
            MenuRef = ((HiddenField)gvr.FindControl("hidMenuRef")).Value;
            if (Substatus == "Active")
            {
                rdYes.Checked = true;
                rdNo.Checked = false;
            }
            else
            {
                rdYes.Checked = false;
                rdNo.Checked = true;
            }
            txtSmcode.Text = SubmenuCode;
            txtSmName.Text = SubmenuName;
            txtRemarks.Text = SubmenuRemarks;
            txtSmcode.ReadOnly = true;
        }

        protected void btnDelete_OnClick(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            string SubmenuCode = ((Label)gvr.FindControl("lblSubMenuCode")).Text;
            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter
                {
                    Value = "Delete",
                    ParameterName = "@Action"
                },
                new SqlParameter
                {
                    Value = SubmenuCode,
                    ParameterName = "@SubMenuCode"
                }
            };

            int count = 0;
            try
            {
                count = _db.ExecuteNonQuery("SP_SubMenu", sqlParameters);
            }
            catch (Exception exception)
            {
                ShowErrorMsg(exception.Message);
            }

            if (count > 0)
            {
                ShowSuccMsg("Delete Successfully");
                loadDropDownMenu();
                GetSubMenuList();
            }
            else
            {
                ShowErrorMsg("Failed To Delete");
            }

        }

        protected void btnCancel_OnClick(object sender, EventArgs e)
        {
            Clear();
        }

        protected void ddlMenu_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            GetSubMenuList();
        }
    }
}
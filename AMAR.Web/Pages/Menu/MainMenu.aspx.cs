using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AMAR.Web.Models;
using DAL;

namespace AMAR.Web.Pages.Menu
{
    public partial class MainMenu : System.Web.UI.Page
    {
        private Db _db = new Db();
        protected void Page_Load(object sender, EventArgs e)
        {
            divError.Visible = false;
            divSucc.Visible = false;

            if (!IsPostBack)
            {
                GetMenuList();
            }
        }
        private string GetMAC()
        {
            string macAddresses = "";

            foreach (NetworkInterface nic in NetworkInterface.GetAllNetworkInterfaces())
            {
                if (nic.OperationalStatus == OperationalStatus.Up)
                {
                    macAddresses += nic.GetPhysicalAddress().ToString();
                    break;
                }
            }
            return macAddresses;
        }

        protected void btnSave_OnClick(object sender, EventArgs e)
        {
            if (Validation())
            {
                Helper helper = new Helper();

                string menuCode = txtMenuCode.Text;
                string menuName = txtMenuName.Text;
                string remarks = txtRemarks.Text;
                string menuIp = string.Empty;
                string menuPcMac = string.Empty;
                string menuPcName = string.Empty;

                if (!string.IsNullOrWhiteSpace(txtMenuCode.Text))
                {
                    string query = "Select count(*) from tblMainMenu where MenuCode='" + txtMenuCode.Text + "'";
                    string value = _db.GetSingelValue(query);
                    if (!string.IsNullOrEmpty(value) && !txtMenuCode.ReadOnly)
                    {
                        if (value != "0")
                        {
                            ShowErrorMsg("Menu code already exists" + "<br/>");
                            return;
                        }

                    }
                }



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
                        Value = txtMenuCode.ReadOnly?"Update": "Insert",
                        ParameterName = "@Action"
                    },
                    new SqlParameter
                    {
                        Value = menuCode,
                        ParameterName = "@MenuCode"
                    },
                    new SqlParameter
                    {
                        Value = menuName,
                        ParameterName = "@MenuName"
                    },
                    new SqlParameter
                    {
                        Value = "",
                        ParameterName = "@MenuUser"
                    },
                    new SqlParameter
                    {
                        Value = menuIp,
                        ParameterName = "@MenuPCIP"
                    },
                    new SqlParameter
                    {
                        Value = menuPcName,
                        ParameterName = "@MenuPCName"
                    },
                    new SqlParameter
                    {
                        Value = menuPcMac,
                        ParameterName = "@MenuPCMac"
                    },
                    new SqlParameter
                    {
                        Value = status,
                        ParameterName = "@MenuStatus"
                    },
                    new SqlParameter
                    {
                        Value = remarks,
                        ParameterName = "@MenuRemarks"
                    }
                };
                int count = _db.ExecuteNonQuery("SP_MainMenu", sqlParameters);
                if (count > 0)
                {
                    ShowSuccMsg("Saved Successfully");
                    Clear();
                    GetMenuList();
                }

            }
        }

        private void GetMenuList()
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
                        Value = "",
                        ParameterName = "@MenuCode"
                    },
                    new SqlParameter
                    {
                        Value = "",
                        ParameterName = "@MenuName"
                    },
                    new SqlParameter
                    {
                        Value = "",
                        ParameterName = "@MenuUser"
                    },
                    new SqlParameter
                    {
                        Value = "",
                        ParameterName = "@MenuPCIP"
                    },
                    new SqlParameter
                    {
                        Value = "",
                        ParameterName = "@MenuPCName"
                    },
                    new SqlParameter
                    {
                        Value = "",
                        ParameterName = "@MenuPCMac"
                    },
                    new SqlParameter
                    {
                        Value = "",
                        ParameterName = "@MenuStatus"
                    },
                    new SqlParameter
                    {
                        Value = "",
                        ParameterName = "@MenuRemarks"
                    }
                };
            DataSet ds = null;
            ds = _db.GetDataSet("SP_MainMenu", sqlParameters);
            grdMenu.DataSource = ds;
            grdMenu.DataBind();
        }

        private bool Validation()
        {
            bool result = true;
            string msg = string.Empty;
            if (string.IsNullOrWhiteSpace(txtMenuCode.Text))
            {
                msg += "Menu code is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtMenuName.Text))
            {
                msg += "Menu name is empty" + "<br>";
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
            txtMenuName.Text = string.Empty;
            txtMenuCode.Text = string.Empty;
            txtRemarks.Text = string.Empty;
            rdYes.Checked = true;
            rdNo.Checked = false;
            txtMenuCode.ReadOnly = false;
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
            string menuCode = ((Label)gvr.FindControl("lblMenuCode")).Text;
            string menuRemarks = ((HiddenField)gvr.FindControl("hidRemarks")).Value;
            string menuName = ((Label)gvr.FindControl("lblMenuName")).Text;
            string status = ((Label)gvr.FindControl("lblStatus")).Text;

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
            txtMenuCode.Text = menuCode;
            txtMenuName.Text = menuName;
            txtRemarks.Text = menuRemarks;
            txtMenuCode.ReadOnly = true;

        }

        protected void btnDelete_OnClick(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            string menuCode = ((Label)gvr.FindControl("lblMenuCode")).Text;
            List<SqlParameter> sqlParameters = new List<SqlParameter>
                {
                    new SqlParameter
                    {
                        Value = "Delete",
                        ParameterName = "@Action"
                    },
                    new SqlParameter
                    {
                        Value = menuCode,
                        ParameterName = "@MenuCode"
                    }
                };

            int count = 0;
            try
            {
                count = _db.ExecuteNonQuery("SP_MainMenu", sqlParameters);
            }
            catch (Exception exception)
            {
                ShowErrorMsg(exception.Message);
            }

            if (count > 0)
            {
                ShowSuccMsg("Delete Successfully");
                GetMenuList();
            }
            else
            {
                ShowErrorMsg("Failed To Delete");
            }

        }
    }
}
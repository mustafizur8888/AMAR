using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace AMAR.Web.Pages.Menu
{
    public partial class Login : System.Web.UI.Page
    {
        private Db _db = new Db();
        protected void Page_Load(object sender, EventArgs e)
        {
            divError.Visible = false;
            //divSucc.Visible = false;
            if (!IsPostBack)
            {
               
            }
        }

        protected void loging_OnClick(object sender, EventArgs e)
        {
           

            bool flag = false;
            flag = checkPwd();
            if (flag)
            {
                divError.Visible = false;
                Response.Redirect("MainMenu.aspx");
               
            }
            else
            {
                //Response.Write("<script>alert('Wrong Info Given!!!!!');</script>");
                divError.Visible = true;
            }

        }

        private bool checkPwd()
        {
            string Name = txtUname.Value.ToString();
            string password = txtpwd.Value.ToString();

            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter
                {
                    Value = Name,
                    ParameterName = "@username"
                },
                new SqlParameter
                {
                    Value = password,
                    ParameterName = "@password"
                },

            };
            DataSet exists = _db.GetDataSet("sp_Login", sqlParameters);
            try
            {
                if (exists != null && exists.Tables[0].Rows.Count > 0)
                {
                    return true;
                }
                else
                {
                    return false;

                }
            }
            catch
            {
                return false;
            }
           

        }
    }
}
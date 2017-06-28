using System;
using System.Data;
using DAL;

namespace AMAR.Web
{
    public partial class Site : System.Web.UI.MasterPage
    {

        private Db _db = new Db();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMenu();
            }

        }

        private void LoadMenu()
        {
           
            string menu = string.Empty;
            string sideMenu = string.Empty;
            DataSet ds = _db.GetDataSet("EXEC sp_getMenuSubMenuName");

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    menu +=
                        " <li class='dropdown' onclick=hhh('" + dr["RefNo"].ToString() + "')><a href='#' class='dropdown-toggle' data-toggle='dropdown'>" +
                        dr["Mname"] +
                        "<b class='caret'></b></a>" +
                        "<ul class='dropdown-menu'>";
                    DataSet dsSubmenuu = _db.GetDataSet("EXEC sp_getMenuSubMenuName 'menu','" + dr["RefNo"].ToString() + "'");
                    foreach (DataRow subMenuList in dsSubmenuu.Tables[0].Rows)
                    {
                        menu += "<li><a href = '#' >" + subMenuList["SMName"] + "</a></li>";
                        sideMenu += "<li class='" + dr["RefNo"].ToString() + "' style='display:none'><a href='#'>" +
                                    subMenuList["SMName"] +
                                    "</a></li>";
                        menuSide.Text = sideMenu;
                    }
                    menu += " </ul>" + "</li>";
                }
            }


            DataSet dsNoSubmenu = _db.GetDataSet("EXEC sp_getMenuSubMenuName '" + "noSubmenu" + "'");
            if (dsNoSubmenu != null && dsNoSubmenu.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in dsNoSubmenu.Tables[0].Rows)
                {
                    menu += "<li>" +
                        "<a href = '#' data-scroll>" +
                        "<span class='fa fa-anchor solo'>"
                        + dr["Mname"].ToString() +
                        "</span></a></li>";

                }
            }
            menuList.Text = menu;

        }
    }
}
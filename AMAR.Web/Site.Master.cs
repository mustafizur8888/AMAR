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
                        #region upsubmenu
                        //onlyForUpMenu
                        sideMenu += "<li class='" + dr["RefNo"].ToString() + "' style='display:none'><a href='#'>" +
                                    subMenuList["SMName"] +
                                    "</a></li>";
                       

                        #endregion
                        DataSet dsModule = _db.GetDataSet("EXEC sp_geModuleName 'menu','" + subMenuList["RefNo"].ToString() + "'");
                        if (dsModule != null && dsModule.Tables[0].Rows.Count > 0)
                        {
                            menu +=
                                " <li class='dropdown' onclick=hhh('" + subMenuList["RefNo"].ToString() + "')><a href='#' class='dropdown-toggle' data-toggle='dropdown'>" +
                                subMenuList["SMName"] + "<b class='caret'></b></a>" +
                                "<ul class='dropdown-menu'>";
                            foreach (DataRow dataRow in dsModule.Tables[0].Rows)
                            {
                                menu += "<li><a href ='" + dataRow["MdUrl"] + "'>" + dataRow["MdName"] + "</a></li>";
                                sideMenu += "<li class='" + subMenuList["RefNo"].ToString() + "' style='display:none'><a href='#'>" +
                                            dataRow["MdName"] +
                                            "</a></li>";

                            }
                            menu += " </ul></ li > ";
                        }
                        else
                        {
                            menu += "<li><a href = '#' >" + subMenuList["SMName"] + "</a></li>";
                        }

                       // 

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
            menuSide.Text = sideMenu;

        }
    }
}
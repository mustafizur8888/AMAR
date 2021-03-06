﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using DAL;

namespace AMAR.Web.Models
{
    public enum DropDownValue
    {
        [field: Description("Active")]
        Active,
        [field: Description("InActive")]
        InActive,
        [field: Description("All")]
        All,

    };
    public class MenuHelper
    {
        private readonly Db _db;
        public MenuHelper()
        {
            _db = new Db();
        }
        public DataSet GetMainMenuList(DropDownValue value)
        {
            DataSet ds = null;
            ds = _db.GetDataSet("Sp_GetMainMenuList", new List<SqlParameter>
            {
                new SqlParameter { Value = value.ToString(), ParameterName = "@Type" ,DbType = DbType.String}
            });
            return ds;
        }

        public DataSet GetUserCompanyList(string cgref,DropDownValue value)
        {
            DataSet ds = null;
            ds = _db.GetDataSet("Sp_GetUserCompnay", new List<SqlParameter>
            {
                new SqlParameter { Value = value.ToString(), ParameterName = "@Type" ,DbType = DbType.String},
                new SqlParameter { Value = cgref, ParameterName = "@MainMenuRefNo" ,DbType = DbType.String}
            });
            return ds;
        }
        public DataSet GetUserCGList(DropDownValue value)
        {
            DataSet ds = null;
            ds = _db.GetDataSet("Sp_GetCGList", new List<SqlParameter>
            {
                new SqlParameter { Value = value.ToString(), ParameterName = "@Type" ,DbType = DbType.String},
                new SqlParameter { Value = "", ParameterName = "@MainMenuRefNo" ,DbType = DbType.String}
            });
            return ds;
        }
        public DataSet GetSubMenuList(string mainMenuRefNo, DropDownValue value)
        {
            DataSet ds = new DataSet();
            ds = _db.GetDataSet("Sp_GetSubMenuList", new List<SqlParameter>
            {
                new SqlParameter {Value = value.ToString(), ParameterName = "@Type"},
                new SqlParameter {Value = mainMenuRefNo, ParameterName = "@MainMenuRefNo"}
            });
            return ds;

        }
        public DataSet GetModuleList(string mainMenuRefNo, DropDownValue value)
        {
            DataSet ds = new DataSet();
            ds = _db.GetDataSet("Sp_GetModuleList", new List<SqlParameter>
            {
                new SqlParameter{Value = value.ToString(),ParameterName = "@Type" },
                new SqlParameter{Value = mainMenuRefNo,ParameterName = "@SubMenuRefNo"}
            });
            return ds;
        }
    }
}
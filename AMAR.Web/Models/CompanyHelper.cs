using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using DAL;

namespace AMAR.Web.Models
{
    public class CompanyHelper
    {
        private readonly Db _db;
        public CompanyHelper()
        {
            _db = new Db();
        }

        public DataSet GetCompanyGroupList()
        {
            DataSet ds = new DataSet();
            ds = _db.GetDataSet("SP_Company", new List<SqlParameter>
            {
                new SqlParameter{Value = "FCGRef",ParameterName = "@Action" }
            });
            return ds;
        }
    }
}
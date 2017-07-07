using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using DAL;

namespace AMAR.Web.Models
{
    public class UserHelper
    {

        private Db _db;

        public UserHelper()
        {
            _db = new Db();
        }
        public DataSet GetUserList(string UserCGRef, string UserCPRef)
        {
            DataSet ds = null;
            ds = _db.GetDataSet("SP_GetUserList", new List<SqlParameter>
            {
                new SqlParameter { Value = UserCGRef, ParameterName = "@UserCGRef"},
                new SqlParameter { Value = UserCPRef, ParameterName = "@UserCPRef" }
            });
            return ds;
        }
    }
}
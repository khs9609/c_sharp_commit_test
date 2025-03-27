using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DBCon.Account;

namespace DBCon.Context
{
    public class LoginContext : DbCon
    {
        private const string connectionStringName = "HRDB";

        public LoginContext()
            : base(connectionStringName) { }

        // 나중에는 webMethod를 통해 받는 법으로 // ajax.URL = gWebInfo.AppWebURL + 'IF/FrontIF/PopupAgreeResponse.aspx/SetPopupAgree';
        public bool AccountCheck(AccountEntity entity)
        {
            using (DbCommand cmd = DB.GetStoredProcCommand("sp_AccountCheck"))
            {
                try
                {
                    DB.AddInParameter(cmd, "@UserID", DbType.String, entity.UserID);
                    DB.AddInParameter(cmd, "@UserPW", DbType.String, entity.UserPW);

                    var result = DB.ExecuteScalar(cmd);

                    return Convert.ToInt32(result) == 1;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DBCon.Account;
using System.ComponentModel;

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

        public List<AccountEntity> GetUserInfo(string UserID)
        {
            using (DbCommand cmd = DB.GetStoredProcCommand("sp_GetUserInfo"))
            {
                List<AccountEntity> UserList = new List<AccountEntity>();
                AccountEntity entity = new AccountEntity();

                try
                {
                    DB.AddInParameter(cmd, "@UserID", DbType.String, UserID.ToString());

                    using (DataSet ds = DB.ExecuteDataSet(cmd))
                    {
                        if(ds != null)
                        {
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                DataRow row = ds.Tables[0].Rows[0];

                                entity.UserID = row["UserID"].ToString();
                                entity.UserName = row["UserName"].ToString();
                                entity.Email = row["EmailAddress"].ToString();
                            }
                        }

                        UserList.Add(entity);

                        return UserList;
                    }

                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    }
}

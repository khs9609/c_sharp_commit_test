using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBCon;
using DBCon.Context;
using DBCon.Account;

namespace WebApplication1.Login
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public void UserCheck ()
        {
            using (LoginContext lc = new LoginContext())
            {
                AccountEntity entity = new AccountEntity();
                entity.UserID = txt_ID.Text;
                entity.UserPW = txt_PW.Text;

                bool result = lc.AccountCheck(entity);

                if (result) { 
                    Response.Redirect("../Pages/Front/Main.aspx");        
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(typeof(System.Web.UI.Page), "scriptKey", "<script>alert('fail login');</script>", false);
                }
            }
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            UserCheck();
        }
    }
}
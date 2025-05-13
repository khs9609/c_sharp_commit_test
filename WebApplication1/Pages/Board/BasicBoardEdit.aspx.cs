using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBCon.Account;
using DBCon.Board;
using DBCon.Context;

namespace WebApplication1.Pages.Board
{
    public partial class BasicBoardEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserInfoSet();

            if (Request.Params["ItemID"].ToString() == "" || Request.Params["ItemID"].ToString() == null)
            {

            }
        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            BoardContext context = new BoardContext();
            BoardEntity entity = new BoardEntity();

            entity.Title = WebUtility.HtmlEncode(txt_Title.Text);
            entity.Contents = WebUtility.HtmlEncode(txt_Content.Text);
            entity.CreateUserID = Session["LoginUserID"].ToString();
            entity.CreateUserName = hdf_UserName.Value;

            context.BoardInsert(entity);

            Response.Redirect("BasicBoard_2.aspx", true);

            //Page.ClientScript.RegisterStartupScript(GetType(), "renderScript", "alert('저장에 실패하였습니다.'); return false();", true);
            //validateRequest="false"

            /*
            data = data.Replace("<", "&lt;");
            data = data.Replace(">", "&gt;");
            data = data.Replace("\"", "&quot;");
            data = data.Replace("'", "&#39;");
            data = data.Replace("\n", "<br />"); 
            */
        }

        public void BoardBind()
        {
            BoardContext context = new BoardContext();
        }

        /// <summary>
        /// 게시글 저장에 필요한 사용자 정보 Set
        /// </summary>
        public void UserInfoSet()
        {
            // 
            using (LoginContext userContext = new LoginContext())
            {
                try
                {
                    if (Session["LoginUserID"].ToString() != "" && Session["LoginUserID"].ToString() != null)
                    {
                        var UserInfo = userContext.GetUserInfo(Session["LoginUserID"].ToString());
                        hdf_UserName.Value = UserInfo[0].UserName;
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
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBCon.Board;
using DBCon.Context;

namespace WebApplication1.Pages.Board
{
    public partial class BasicBoardView : System.Web.UI.Page
    {
        public bool CreateUserYN = false;
        
        public int g_ItemID { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            BoardBind();

        }

        public void BoardBind()
        {
            g_ItemID = Convert.ToInt32(Request.Params["ItemID"]);

            BoardContext context = new BoardContext();
            BoardEntity entity = new BoardEntity { ItemID = g_ItemID };

            var boardList = context.BoardView(entity);

            if(boardList != null && boardList.Count > 0)
            {
                var board = boardList[0];

                // [1] 게시물 정보 Bind
                lb_Title.Text = WebUtility.HtmlEncode(board.Title);
                lb_Contents.Text = WebUtility.HtmlEncode(board.Contents).Replace("\r\n", "\n").Replace("\n", "<br/>");
                lb_CreateUserName.Text = board.CreateUserName;
                lb_CreateDT.Text = board.CreateDT.ToString("yyyy-MM-dd HH:mm");


                // [2] 사용자와 작성자 일치하는지 확인
                if (Session["LoginUserID"].ToString() == board.CreateUserID.ToString())
                {
                    CreateUserYN = true;
                }
            }
        }

        protected void btn_Delete_Click(object sender, EventArgs e)
        {
            BoardContext ctx = new BoardContext();
            BoardEntity entity = new BoardEntity();

            entity.ItemID = g_ItemID;

            ctx.BoardDelete(entity, Session["LoginUserID"].ToString());
            Response.Redirect("BasicBoard_2.aspx", true);
        }

        protected void btn_Modify_Click(object sender, EventArgs e)
        {
            var ItemID = Request.Params["ItemID"].ToString();
            Response.Redirect("BasicBoardEdit.aspx?ItemID="+ ItemID, false);
        }
    }
}
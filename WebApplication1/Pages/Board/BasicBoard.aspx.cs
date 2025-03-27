using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBCon.Context;
using DBCon.Board;

namespace WebApplication1.Pages.Board
{
    public partial class BasicBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BoardList();
            }
        }

        public void BoardList()
        {
            BoardContext context = new BoardContext();
            List<BoardEntity> boardlist = context.BoardList(new BoardEntity());

            GridViewBoard.DataSource = boardlist;
            GridViewBoard.DataBind();
        }
    }
}
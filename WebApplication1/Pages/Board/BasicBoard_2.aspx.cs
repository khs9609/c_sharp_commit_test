using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBCon.Context;
using DBCon.Board;

namespace WebApplication1.Pages.Board
{
    public partial class BasicBoard_2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BoardDataBind();
            }
        }

        public void BoardDataBind()
        {
            BoardContext context = new BoardContext();
            List<BoardEntity> list = context.BoardList(new BoardEntity());

            rptBasicBoard.DataSource = list;
            rptBasicBoard.DataBind();
        }
    }
}
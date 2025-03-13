using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Practice
{
    public partial class postback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("IsPostBack:" + IsPostBack + "<br/>");
            Response.Write("page_Load() progress <br/>");
            if(!IsPostBack)
            {
                name.Text = "KIM";
                age.Text = "20";
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            Response.Write("btn_click() progress <br/>");

            Response.Write("Name : " + name.Text + "<br/>");
            Response.Write("Age : " + age.Text + "<br/>");
        }
    }
}
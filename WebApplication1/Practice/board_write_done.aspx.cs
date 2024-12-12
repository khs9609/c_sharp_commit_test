using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Practice
{
    public partial class board_write_done : System.Web.UI.Page
    {
        public void Page_Load(object sender, EventArgs e)
        {
            string name = Request["name"];
            string title = Request["title"];
            string content = Request["content"];
            string password = Request["password"];

            Response.Write("Name : " + name + "<hr/>");
            Response.Write("Title : " + title + "<hr/>");
            Response.Write("Content : " + content + "<hr/>");
            Response.Write("Password : " + password + "<hr/>");
            
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Practice
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            for (int i = 1; i <= 9; i++)
            {
                // "2 x i = ?"
                string output = "2 x " + i + " = " + 2 * i;
                Response.Write(output + "<br>");
            }
        }
    }
}
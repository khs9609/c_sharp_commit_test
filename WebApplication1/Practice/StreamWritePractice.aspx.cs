using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Practice
{
    public partial class StreamWritePractice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string count_path = @"D:\HYOSKIM\Dummy";
            StreamWriter sw = File.CreateText(count_path);
            sw.Close();
        }
    }
}
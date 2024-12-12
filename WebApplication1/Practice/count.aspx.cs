using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Practice
{
    public partial class count : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string count_path = @"c:\home\count.txt";
            int new_count = 1;
            
            //StreamWriter sw = File.CreateText(count_path);

            //sw.Write("Text 입력 테스트");
            //sw.Close();

            if (!File.Exists(count_path))
            {
                StreamWriter sw = File.CreateText(count_path);
                sw.WriteLine("1");
                sw.Close();
            }
            else
            {
                StreamReader sr = new StreamReader(count_path);
                string now_count = sr.ReadLine();
                sr.Close();

                new_count = Int32.Parse(now_count)+1;
                StreamWriter sw = File.CreateText(count_path);
                sw.WriteLine(new_count);
                sw.Close (); 
            }

            Response.Write(new_count);
            
        }
    }
}
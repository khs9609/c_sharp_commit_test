using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DBCon
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string _con = ConfigurationManager.ConnectionStrings["HRDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = _con;

                con.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "Select * from tb_user";

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    string userid = reader.GetString(0);
                    string username  = reader.GetString(1);

                    Console.WriteLine("{0}, {1}", userid, username);
                }

                reader.Close();

                Console.ReadLine();
            }
        }
    }
}

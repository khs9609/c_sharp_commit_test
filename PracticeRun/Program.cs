using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace PracticeRun
{
    internal class Program
    {
        static void Main(string[] args)
        {
            PR_Tuple pt = new PR_Tuple();
            int year = pt.TP_Year;
            int month = pt.TP_Month;

            Console.WriteLine($"year right: {year} / {month}");
            Console.Read();
        }
    }
}

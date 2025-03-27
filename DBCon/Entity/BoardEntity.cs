using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DBCon.Board
{
    public class BoardEntity
    {
        public string BoardID { get; set; }
        public int ItemID { get; set; }
        public string Title { get; set; }
        public string Contents { get; set; }
        public string CreateUserID  { get; set; }
        public string CreateUserName { get; set; }
        public DateTime CreateDT { get; set; }
    }
}

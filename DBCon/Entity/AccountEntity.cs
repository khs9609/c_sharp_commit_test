using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DBCon.Account
{
    public class AccountEntity
    {
        public string UserID { get; set; }
        public string UserPW { get; set; }

        public string UserName { get; set; }
        public string Email {  get; set; }
    }
}

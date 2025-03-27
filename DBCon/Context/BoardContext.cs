using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DBCon.Board;

namespace DBCon.Context
{
    public class BoardContext : DbCon
    {
        private const string connectionStringName = "Board";

        public BoardContext() 
            : base(connectionStringName) { }

        public List<BoardEntity> BoardList(BoardEntity entity)
        {
            // 전체 출력 테스트
            string query = "SELECT * FROM tb_Board ORDER BY ItemID desc";
            List<BoardEntity> boardList = new List<BoardEntity>();

            using (DbCommand cmd = DB.GetSqlStringCommand(query))
            {
                using (IDataReader reader = DB.ExecuteReader(cmd))
                {
                    while (reader.Read())
                    {
                        BoardEntity boardEntity = new BoardEntity
                        {
                            ItemID = reader.GetInt32(reader.GetOrdinal("ItemID")),
                            Title = reader.GetString(reader.GetOrdinal("Title")),
                            Contents = reader.GetString(reader.GetOrdinal("Contents")),
                            CreateUserName = reader.GetString(reader.GetOrdinal("CreateUserName")),
                            CreateDT = reader.GetDateTime(reader.GetOrdinal("CreateDT"))
                        };

                        boardList.Add(boardEntity);
                    }
                }
            }

            return boardList;
        }
    }
}

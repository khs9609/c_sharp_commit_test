using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DBCon.Account;
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


        public List<BoardEntity> BoardView(BoardEntity entity)
        {
            List<BoardEntity> boardList = new List<BoardEntity>();
            using (DbCommand cmd = DB.GetStoredProcCommand("sp_Board_GetBoardItem"))
            {
                DB.AddInParameter(cmd, "@itemID", DbType.String, entity.ItemID);

                using (DataSet ds = DB.ExecuteDataSet(cmd))
                {
                    if(ds != null)
                    {
                        if(ds.Tables[0].Rows.Count > 0)
                        {
                            DataRow row = ds.Tables[0].Rows[0];
                            entity.Title = row["Title"] == DBNull.Value ? String.Empty : row["Title"].ToString();
                            entity.CreateUserID = row["CreateUserID"] == DBNull.Value ? String.Empty : row["CreateUserID"].ToString();
                            entity.CreateUserName = row["CreateUserName"] == DBNull.Value ? String.Empty : row["CreateUserName"].ToString();
                            entity.CreateDT = row["CreateDT"] == DBNull.Value ? DateTime.MinValue : Convert.ToDateTime(row["CreateDT"]);
                            entity.Contents = row["Contents"] == DBNull.Value ? String.Empty : row["Contents"].ToString();
                        }
                    }
                    boardList.Add(entity);
                }
            }

            return boardList;
        }


        public void BoardInsert(BoardEntity entity)
        {
            List<BoardEntity> InsertItemList = new List<BoardEntity>();
            using (DbCommand cmd = DB.GetStoredProcCommand("sp_Board_InsertItem"))
            {
                try
                {
                    DB.AddInParameter(cmd, "@Title", DbType.String, entity.Title);
                    DB.AddInParameter(cmd, "@Contents", DbType.String, entity.Contents);
                    DB.AddInParameter(cmd, "@UserID", DbType.String, entity.CreateUserID);
                    DB.AddInParameter(cmd, "@UserName", DbType.String, entity.CreateUserName);

                    DB.ExecuteNonQuery(cmd);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

        public void BoardDelete (BoardEntity entity, string UserID)
        {
            List<BoardEntity> list = new List<BoardEntity>();
            using (DbCommand cmd = DB.GetStoredProcCommand("sp_Board_DeleteItem"))
            {
                try
                {
                    DB.AddInParameter(cmd, "@UserID", DbType.String, UserID);
                    DB.AddInParameter(cmd, "@ItemID", DbType.String, entity.ItemID);

                    DB.ExecuteNonQuery(cmd);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    }
}

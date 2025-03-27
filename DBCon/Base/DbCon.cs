using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;

namespace DBCon
{
    public class DbCon : IDisposable
    {
        string connectionStringKey = ConfigurationManager.ConnectionStrings["HRDB"].ConnectionString;

        private SqlDatabase db  = null;


        /// <summary>
        /// Database에 접근
        /// </summary>
        protected SqlDatabase DB
        {
            get 
            {
                return db;
            }
            set 
            {
                this.db = value;
            }   
        }

        public DbCon()
        {
            DatabaseProviderFactory factory = new DatabaseProviderFactory();
            DatabaseFactory.SetDatabaseProviderFactory(factory,false);
            this.db = (SqlDatabase)DatabaseFactory.CreateDatabase(connectionStringKey);
        }

        public DbCon(string connectionString)
        {
            string connString = ConfigurationManager.ConnectionStrings[connectionString]?.ConnectionString;
            //if (string.IsNullOrEmpty(connectionString))
            if (string.IsNullOrEmpty(connString))
            {
                throw new ArgumentNullException("The value can not be null or an empty string.", "connectionString");
            }
            DatabaseProviderFactory factory = new DatabaseProviderFactory();
            DatabaseFactory.SetDatabaseProviderFactory(factory, false);
            this.db = (SqlDatabase)DatabaseFactory.CreateDatabase(connectionString);
        }

        #region IDisposable Support

        private bool disposedValue;

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    // TODO: 관리형 상태(관리형 개체)를 삭제합니다.
                }

                // TODO: 비관리형 리소스(비관리형 개체)를 해제하고 종료자를 재정의합니다.
                // TODO: 큰 필드를 null로 설정합니다.
                disposedValue = true;
            }
        }

        // // TODO: 비관리형 리소스를 해제하는 코드가 'Dispose(bool disposing)'에 포함된 경우에만 종료자를 재정의합니다.
        // ~DbCon()
        // {
        //     // 이 코드를 변경하지 마세요. 'Dispose(bool disposing)' 메서드에 정리 코드를 입력합니다.
        //     Dispose(disposing: false);
        // }

        public void Dispose()
        {
            // 이 코드를 변경하지 마세요. 'Dispose(bool disposing)' 메서드에 정리 코드를 입력합니다.
            Dispose(disposing: true);
            GC.SuppressFinalize(this);
        }

        #endregion
        
        


    }
}

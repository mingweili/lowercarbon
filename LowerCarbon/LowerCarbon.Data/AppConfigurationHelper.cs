/*
 * 许强
 */ 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace LowerCarbon.Data
{
    public class AppConfigurationHelper
    {
        private static string GetConnectionStringsConfig(string connectionName)
        {
            string connectionString =
                ConfigurationManager.ConnectionStrings[connectionName].ConnectionString;
            
            return connectionString;
        }

        // 注意检查返回值，如果找不到相应的配置文件的话，返回值为空
        public static string GetAppConfig(string strKey)
        {
            foreach (string key in ConfigurationManager.AppSettings)
            {
                if (key == strKey)
                {
                    return ConfigurationManager.AppSettings[strKey];
                }
            }
            return null;
        }

    }
}

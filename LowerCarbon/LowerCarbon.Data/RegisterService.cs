using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;

using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using ImagineCupDB;

namespace LowerCarbon.Data
{
    public class RegisterService
    {
        /// <summary>
        /// 将用户信息插入数据库中
        /// </summary>
        /// <param name="name"></param>
        /// <param name="password"></param>
        /// <param name="time"></param>
        public void Register(string username,  string mail, string password, DateTime time) 
        {
            ImagineCupDBDataContext context = new ImagineCupDBDataContext();
            string no = Guid.NewGuid().ToString("N");

            context.RegisterUser(no, username, password, mail, DateTime.Now);
        }

        /// <summary>
        /// 返回true表示能够使用，否则表示不能使用
        /// </summary>
        /// <param name="mail"></param>
        /// <returns></returns>
        /*public bool IsValidateUserEmail(string mail)
        {
            
            ImagineCupDBDataContext context = new ImagineCupDBDataContext();

            context.ObjectTrackingEnabled = false;

            int isValidate = context.IsValidateEmail(mail);
            
 
            // 不使用linq
            bool isValidate = false;
            int result = -1;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ImagineCupConnectionString"].ToString()))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("IsValidateUserEmail", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter[] spr ={ new SqlParameter("@mail",SqlDbType.VarChar, 32) };

                spr[0].Value = mail;

                foreach (SqlParameter p in spr)
                {
                    cmd.Parameters.Add(p);
                }

                cmd.Parameters.Add(new SqlParameter("@result", SqlDbType.Int));
                cmd.Parameters["@result"].Direction = ParameterDirection.ReturnValue;

                cmd.ExecuteNonQuery();

                result = int.Parse(cmd.Parameters["@result"].Value.ToString());

            }


            return ((isValidate == 1) ? false : true);
        }*/

        /// <summary>
        /// 返回true表示能够使用，否则表示不能使用
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        public bool IsValidateUserName(string username)
        {
            ImagineCupDBDataContext context = new ImagineCupDBDataContext();

            int validate = context.IsValidateUserName(username);

            return ( (validate == 1) ? false : true );
        }

    }
}

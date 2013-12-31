using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace LowerCarbon.DBOp.Operations
{
    public class RankDBOperation : IDBOp
    {
        public static DataTable GetUserScoreRange()
        {
            //从买家购物信息中按照买家ID分组，按照组的大小排序，输出买家名称及购买次数
            var result = from history in context.PURCHASES_HISTORY
                         group history by history.CONSUMER_NO into h
                         orderby h.Count() descending
                         select new
                         {
                             id_name_sex_score = from user in context.CONSUMER
                                                 where user.CONSUMER_NO == h.Key
                                                 select new { user.CONSUMER_NO, user.CONSUMER_NAME, user.CONSUMER_SEX, user.CONSUMER_POINTS },
                             sum = h.Count()
                         };


            DataTable table = new DataTable();
            table.Columns.Add("UserID");
            table.Columns.Add("UserName");
            table.Columns.Add("UserSex");
            table.Columns.Add("UserScore");
            table.Columns.Add("UserTradeTimes");

            foreach (var v in result)
            {
                DataRow row = table.NewRow();
                row["UserID"] = v.id_name_sex_score.Single().CONSUMER_NO;
                row["UserName"] = v.id_name_sex_score.Single().CONSUMER_NAME;
                row["UserSex"] = v.id_name_sex_score.Single().CONSUMER_SEX == null ? true : v.id_name_sex_score.Single().CONSUMER_SEX;
                row["UserScore"] = v.id_name_sex_score.Single().CONSUMER_POINTS == null ? 0 : v.id_name_sex_score.Single().CONSUMER_POINTS;
                row["UserTradeTimes"] = v.sum;

                table.Rows.Add(row);
            }

            return table;
        }

        public static DataTable GetFeedbackRange()
        {
            //从数据库的两个表中读取“爱心树的全部信息和对应捐赠者的名字”
            var result = (from consumer in context.CONSUMER
                          from trees in context.LOVE_TREE
                          where trees.CONSUMER_NO == consumer.CONSUMER_NO
                          select new { trees, consumer.CONSUMER_NAME });

            DataTable table = new DataTable();

            table.Columns.Add("TreeID", typeof(String));
            table.Columns.Add("ConsumerName", typeof(String));
            table.Columns.Add("TreeSignature", typeof(String));
            table.Columns.Add("TreeLocation", typeof(String));
            table.Columns.Add("TreeAge", typeof(short));
            table.Columns.Add("TreeState", typeof(short));
            table.Columns.Add("TreePurchasesTime", typeof(String));
            table.Columns.Add("TreePlantTime", typeof(String));

            foreach (var r in result)
            {
                DataRow row = table.NewRow();
                row["ConsumerName"] = r.CONSUMER_NAME;
                row["TreeID"] = r.trees.TREE_NO;
                row["TreeSignature"] = r.trees.TREE_SLOGAN == null ? "" : r.trees.TREE_SLOGAN;
                row["TreeLocation"] = r.trees.TREE_LOCATION == null ? "" : r.trees.TREE_LOCATION;
                row["TreeAge"] = r.trees.TREE_AGE == null ? 0 : r.trees.TREE_AGE;
                row["TreeState"] = r.trees.TREE_STATE == null ? 0 : r.trees.TREE_STATE;
                row["TreePurchasesTime"] = r.trees.TREE_PURCHASES_TIME == null ? DateTime.Now : r.trees.TREE_PURCHASES_TIME;
                row["TreePlantTime"] = r.trees.TREE_PLANT_TIME == null ? DateTime.Now : r.trees.TREE_PLANT_TIME;

                table.Rows.Add(row);
            }

            return table;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace LowerCarbon.Web
{
    public partial class LoveTree : System.Web.UI.Page
    {
        string treeID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                reset();
            }
        }

        protected void GridView1_PageIndexChanged(object sender, EventArgs e)
        {
            reset();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            
            this.GridView1.PageIndex = e.NewPageIndex;

            reset();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label3.Text = GridView1.SelectedRow.Cells[1].Text.ToString().Trim();
            EditTree.Style["display"] = "block";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string treeplace = TreePlace.Text.ToString().Trim();
                string treeDate = TreeDate.Text.ToString().Trim();
                string tree_no = Label3.Text.ToString().Trim();

                string sql = string.Format("update imaginecup.dbo.love_tree set tree_location='{0}',TREE_PURCHASES_TIME='{1}',tree_state=1 where tree_no='{2}';", treeplace, treeDate, tree_no);
                string connectionString = ConfigurationManager.ConnectionStrings["ImagineCupConnectionString"].ToString();
                SqlConnection sc = new SqlConnection(connectionString);

                SqlCommand sqlcmd = new SqlCommand();
                sqlcmd.CommandText = sql;
                sqlcmd.CommandType = CommandType.Text;
                sc.Open();
                sqlcmd.Connection = sc;
                sqlcmd.ExecuteNonQuery();
                sc.Close();
                EditTree.Style["display"] = "none";
                //更新显示
                reset();
            }
        }

        private void reset()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ImagineCupConnectionString"].ToString();
            SqlConnection sc = new SqlConnection(connectionString);
            SqlCommand sqlcmd = new SqlCommand();
            sqlcmd.CommandText = "SELECT LOVE_TREE.TREE_NO, LOVE_TREE.TREE_SLOGAN,CONSUMER.CONSUMER_NAME FROM LOVE_TREE INNER JOIN CONSUMER ON LOVE_TREE.CONSUMER_NO = CONSUMER.CONSUMER_NO WHERE(LOVE_TREE.TREE_STATE = 0)";
            sqlcmd.CommandType = CommandType.Text;
            sc.Open();
            sqlcmd.Connection = sc;
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = sqlcmd;
            DataSet dateSet = new DataSet();
            sda.Fill(dateSet, "lovetree");
            GridView1.DataSource = dateSet;
            GridView1.DataBind();
        }
    }
}
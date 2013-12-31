using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.Linq;

using ImagineCupDB;

using Top.Api;
using Top.Api.Domain;
using Top.Api.Parser;
using Top.Api.Request;
using Top.Api.Response;
using Top.Api.Util;
using LowerCarbon.DBOp;


namespace LowerCarbon.Web.WebServices
{
    /// <summary>
    /// topServices 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消对下行的注释。
    // [System.Web.Script.Services.ScriptService]
    public class topServices : System.Web.Services.WebService
    {

        [WebMethod]
        public string confirmTid(string tid, string topSession, string consumerNo)
        {
            string resultString = "抱歉您输入的订单号有误，请检查后重新输入";

            try 
            {
                IDBOp.context.Refresh(RefreshMode.KeepChanges);
                Table<PURCHASES_HISTORY> purchasesHistoryTable = IDBOp.context.GetTable<PURCHASES_HISTORY>();
                PURCHASES_HISTORY purchasesHistoryGot =
                    (from temPurchasesHistory in purchasesHistoryTable
                     where temPurchasesHistory.BUSINESS_NO == tid
                     select temPurchasesHistory).SingleOrDefault();

                if (purchasesHistoryGot == null)
                {

                    DefaultTopClient topClient = new DefaultTopClient("http://gw.api.taobao.com/router/rest", "12177007", "99682c06fe60b2ec30f1ff96f2af5ccd");
                    TradeGetRequest req = new TradeGetRequest();
                    req.Fields = "title, buyer_nick, num_iid, num,created, price,status";
                    req.Tid = long.Parse(tid);
                    TradeGetResponse response = topClient.Execute(req, topSession);
                    Trade tradeGot = response.Trade;

                    if (tradeGot != null)
                    {
                        if (tradeGot.NumIid == 8777995574)
                        {
                            PURCHASES_HISTORY newPurchasesHistory = new PURCHASES_HISTORY();

                            newPurchasesHistory.HISTORY_NO = System.Guid.NewGuid().ToString("N");
                            newPurchasesHistory.BUSINESS_NO = tid;
                            newPurchasesHistory.CONSUMER_NO = consumerNo;
                            newPurchasesHistory.GOODS_NO = "1c3585e5057a4943957a29cffdf1018c";

                            newPurchasesHistory.CONSUMER_TIME = DateTime.Parse(tradeGot.Created);
                            newPurchasesHistory.CONSUMPTION = (short)tradeGot.Num;
                            if (tradeGot.Status != "WAIT_BUYER_PAY")
                            {
                                newPurchasesHistory.TRANSACTIONS_STATE = 1;

                                for (int i = 0; i < tradeGot.Num; i++)
                                {
                                    LOVE_TREE newLoveTree = new LOVE_TREE();
                                    newLoveTree.TREE_NO = System.Guid.NewGuid().ToString("N");
                                    newLoveTree.CONSUMER_NO = "1c3585e5057a4943957a29cffdf1018c";
                                    newLoveTree.TREE_STATE = 0;
                                    IDBOp.context.GetTable<LOVE_TREE>().InsertOnSubmit(newLoveTree);
                                }
                                IDBOp.context.SubmitChanges();
                            }
                            else
                            {
                                newPurchasesHistory.TRANSACTIONS_STATE = 0;
                            }

                            purchasesHistoryTable.InsertOnSubmit(newPurchasesHistory);
                            IDBOp.context.SubmitChanges();







                        }
                        else if (tradeGot.NumIid == 8846002070)
                        {
                            PURCHASES_HISTORY newPurchasesHistory = new PURCHASES_HISTORY();

                            newPurchasesHistory.HISTORY_NO = System.Guid.NewGuid().ToString("N");
                            newPurchasesHistory.BUSINESS_NO = tid;
                            newPurchasesHistory.CONSUMER_NO = consumerNo;
                            newPurchasesHistory.GOODS_NO = "48bb73463249448f88f04eda44251a1f";

                            newPurchasesHistory.CONSUMER_TIME = DateTime.Parse(tradeGot.Created);
                            newPurchasesHistory.CONSUMPTION = (short)tradeGot.Num;
                            if (tradeGot.Status != "WAIT_BUYER_PAY")
                            {
                                newPurchasesHistory.TRANSACTIONS_STATE = 1;
                            }
                            else
                            {
                                newPurchasesHistory.TRANSACTIONS_STATE = 0;
                            }

                            purchasesHistoryTable.InsertOnSubmit(newPurchasesHistory);
                            IDBOp.context.SubmitChanges();

                            resultString = "您购买的" + tradeGot.Title + "已经提交成功";
                        }
                    }

                }
            }
            catch(Exception e)
            {

            }



            return resultString;
        }

        [WebMethod]
        public void refreshTid(string topSession, string consumerNo)
        {
            IDBOp.context.Refresh(RefreshMode.KeepChanges);
            Table<PURCHASES_HISTORY> purchasesHistoryTable = IDBOp.context.GetTable<PURCHASES_HISTORY>();
            IEnumerable<PURCHASES_HISTORY> purchasesHistoryGot =
                (from temPurchasesHistory in purchasesHistoryTable
                 where (temPurchasesHistory.CONSUMER_NO == consumerNo
                 && temPurchasesHistory.TRANSACTIONS_STATE == 0)
                 select temPurchasesHistory);

            foreach (PURCHASES_HISTORY temPurchasesHistory in purchasesHistoryGot)
            {
                DefaultTopClient topClient = new DefaultTopClient("http://gw.api.taobao.com/router/rest", "12177007", "99682c06fe60b2ec30f1ff96f2af5ccd");
                TradeGetRequest req = new TradeGetRequest();
                req.Fields = "title, buyer_nick, num_iid, num,created, price,status";
                req.Tid = long.Parse(temPurchasesHistory.BUSINESS_NO.Trim());
                TradeGetResponse response = topClient.Execute(req, topSession);
                Trade tradeGot = response.Trade;

                if (tradeGot.Status != "WAIT_BUYER_PAY")
                {
                    temPurchasesHistory.TRANSACTIONS_STATE = 1;

                    if (temPurchasesHistory.GOODS_NO == "1c3585e5057a4943957a29cffdf1018c")
                    {
                        for (int i = 0; i < tradeGot.Num; i++)
                        {
                            LOVE_TREE newLoveTree = new LOVE_TREE();
                            newLoveTree.TREE_NO = System.Guid.NewGuid().ToString("N");
                            newLoveTree.CONSUMER_NO = "1c3585e5057a4943957a29cffdf1018c";
                            newLoveTree.TREE_STATE = 0;
                            IDBOp.context.GetTable<LOVE_TREE>().InsertOnSubmit(newLoveTree);
                        }
                    }
                }
                else
                {
                    temPurchasesHistory.TRANSACTIONS_STATE = 0;
                }

                IDBOp.context.SubmitChanges();

            }

        }
    }
}

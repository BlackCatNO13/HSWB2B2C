using Himall.Core;
using Himall.IServices;
using Himall.Model;
using Himall.Web.Framework;
using Hishop.Weixin.MP.Api;
using Hishop.Weixin.MP.Util;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Himall.Web.Areas.Web.Controllers
{
    public class WXController : BaseController
    {
        // GET: Web/WX
        public void Index(long shopId=1)
        {
            WXShopInfo vShopSetting = ServiceHelper.Create<IVShopService>().GetVShopSetting(shopId);
            string token=vShopSetting.Token;
            string echoStr = Request.QueryString["echoStr"];
            if (CheckSignature(token))
            {
                if (!string.IsNullOrEmpty(echoStr))
                {
                    Response.Write(echoStr);
                    Response.End();
                }
            }

        }
        private bool CheckSignature(string WeChat_Token)
        {
        
          
            //从微信服务器接收传递过来的数据
            string signature = Request.QueryString["signature"]; //微信加密签名
            string timestamp = Request.QueryString["timestamp"];//时间戳
            string nonce = Request.QueryString["nonce"];//随机数
            string[] ArrTmp = { WeChat_Token, timestamp, nonce };
            Array.Sort(ArrTmp);     //字典排序
            string tmpStr = string.Join("", ArrTmp);//将三个字符串组成一个字符串
            tmpStr = FormsAuthentication.HashPasswordForStoringInConfigFile(tmpStr, "SHA1");//进行sha1加密
            tmpStr = tmpStr.ToLower();
            //加过密的字符串与微信发送的signature进行比较，一样则通过微信验证，否则失败。
            if (tmpStr == signature)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

    }
}
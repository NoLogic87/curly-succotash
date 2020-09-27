using Android.OS;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.IO;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Xml;

namespace Phoneword
{
    class ApiSwap
    {


        /// <summary>
        /// 登陆方法
        /// </summary>
        /// <param name="UserAccount">用户账号</param>
        /// <param name="PWD">密码</param>
        /// <param name="EnterpriseNickName">企业账号</param>
        /// <returns></returns>
        public static JObject login(string UserAccount, string PWD, string EnterpriseNickName)
        {
            string guid = Guid.NewGuid().ToString("N");
            string key = CreatMD5($"M=2001&GUIDKEY={guid}");
            JObject @object = new JObject
            {
                { "M", 2001 },
                { "EnterpriseNickName",EnterpriseNickName},
                { "UserAccount",UserAccount},
                { "PWD",CreatMD5(PWD)},
                { "GUIDKEY",guid},
                { "KEY",key},
                { "AppID",0}
            };
            JObject brr = ApiCall(@object);
            return brr;
        }


        //返回录音文件位置
        public static string  Flier()
        {
            string Brand = (Build.Brand).ToUpper();//厂商信息
            _ = Build.Model;//手机型号
            Java.IO.File file = Android.OS.Environment.ExternalStorageDirectory;
            Java.IO.File child = null;
            switch (Brand)
            {
                case "XIAOMI":
                    child = new Java.IO.File(file, child: "MIUI/sound_recorder/call_rec");
                    break;
                case "HUAWEI":
                    child = new Java.IO.File(file, child: "record");
                    break;
                case "SAMSUNG":
                    child = new Java.IO.File(file, child: "Sounds");
                    break;
                case "MEIZU":
                    child = new Java.IO.File(file, child: "Recorder");
                    break;
                case "OPPO":
                    child = new Java.IO.File(file, child: "Recording");
                    break;
                case "VIVO":
                    child = new Java.IO.File(file, child: "Record/Call");
                    break;
            }
            return child.Path;
        }


        /// <summary>
        /// 接口调用
        /// </summary>
        /// <param name="object"></param>
        /// <returns></returns>
        public static JObject ApiCall(JObject @object)
        {

            JObject xml = new JObject
            {
                {"M",(string)@object["M"]},
                { "AppID","0"},
                { "EnterpriseID",(string)@object["EnterpriseID"]},
                {"PWD", (string)@object["PWD"]},
                { "UserAccount",(string)@object["UserAccount"]},
                { "Edition",(string)@object["Edition"]},
                { "KEY",(string)@object["KEY"]},
                { "GUIDKEY",(string)@object["GUIDKEY"]},
                { "LoginKey",(string)@object["LoginKey"]},
                { "Data", (string)@object["Data"]==null? null:JObject.Parse(@object["Data"].ToString())},
            };
            JObject Xml = new JObject
            {
                { "xml",xml}
            };


            XmlDocument document = JsonConvert.DeserializeXmlNode(Xml.ToString());
            string content = document.InnerXml;

            string data = Diaoyon("http://recodenew.58ygd.com/RecordApi/Api.aspx", content);

            if (data.Contains("4002"))
            {
                JObject crr = login("user", "user123", "");
                if (crr["State"].ToString() == "1000")
                {
                    xml["LoginKey"] = crr["LoginKey"].ToString();
                    Xml = new JObject
                    {
                        { "xml",xml}
                    };
                    document = JsonConvert.DeserializeXmlNode(Xml.ToString());
                    content = document.InnerXml;
                    data = Diaoyon("http://recodenew.58ygd.com/RecordApi/Api.aspx", content);
                }
            }

            try
            {
                JObject arr = JObject.Parse(data);
                return arr;
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// 文件转base64
        /// </summary>
        /// <returns>base64字符串</returns>
        public string FileToBase64String(FileStream fsForRead)
        {
            string base64Str = "";
            try
            {
                //读写指针移到距开头10个字节处
                fsForRead.Seek(0, SeekOrigin.Begin);
                byte[] bs = new byte[fsForRead.Length];
                int log = Convert.ToInt32(fsForRead.Length);
                //从文件中读取10个字节放到数组bs中
                fsForRead.Read(bs, 0, log);
                base64Str = Convert.ToBase64String(bs);
                return base64Str;
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
                Console.ReadLine();
                return base64Str;
            }
            finally
            {
                fsForRead.Close();
            }
        }


        /// <summary>
        /// MD5加密字符串
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public static string CreatMD5(string name)
        {
            string result = string.Empty;
            MD5 md5 = MD5.Create();
            byte[] bytes = md5.ComputeHash(Encoding.UTF8.GetBytes(name));
            for (int i = 0; i < bytes.Length; i++)
            {
                result = result + bytes[i].ToString("X").PadLeft(2, '0');
            }
            return result.ToUpper();
        }


        private static string _Input_Charset = "utf-8";// System.Text.Encoding.Default.BodyName;//
        /// <summary>
        /// 将内容传到指定的页面，并返回页面的返回值。
        /// </summary>
        /// <param name="sUrl">指定请求的页面路径。</param>
        /// <param name="sContent">传过去的值。</param>
        private static string Diaoyon(string sUrl, string sContent, bool isPost = true, bool isXml = true)
        {
            HttpWebRequest myReq = null;
            StreamReader readStream = null;
            WebResponse myResp = null;
            try
            {
                Encoding encode = Encoding.GetEncoding(_Input_Charset);//"utf-8"
                byte[] arrB = encode.GetBytes(sContent);
                myReq = (HttpWebRequest)WebRequest.Create(sUrl);
                if (isXml)
                    myReq.ContentType = "text/xml";
                else
                    myReq.ContentType = "application/x-www-form-urlencoded";
                myReq.ContentLength = arrB.Length;
                if (isPost)
                {
                    myReq.Method = "POST";
                    Stream outStream = myReq.GetRequestStream();
                    outStream.Write(arrB, 0, arrB.Length);
                    outStream.Close();
                }
                else
                {
                    myReq.Method = "GET";
                }
                myResp = myReq.GetResponse();
                Stream ReceiveStream = myResp.GetResponseStream();
                readStream = new StreamReader(ReceiveStream, encode);// Encoding.UTF8
                Char[] read = new Char[256];
                int count = readStream.Read(read, 0, 256);
                string strRes = null;
                while (count > 0)
                {
                    strRes += new String(read, 0, count);
                    count = readStream.Read(read, 0, 256);
                }
                return strRes;
            }
            catch (Exception e2)
            {
                return e2.ToString();
            }
            finally
            {
                if (readStream != null)
                {
                    readStream.Close();
                }
                if (myResp != null)
                {
                    myResp.Close();
                }
            }
        }
    }
}
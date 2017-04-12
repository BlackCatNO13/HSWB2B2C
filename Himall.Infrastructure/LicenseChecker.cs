using Himall.Core.Helper;
using System;
using System.IO;
using System.IO.Compression;
using System.Net;
using System.Runtime.InteropServices;
using System.Text;

namespace Himall.Infrastructure
{
    public static class LicenseChecker
    {
        public static bool Check(out string Msg, string host)
        {
            Msg = "";
            return true;
        }

        private static string smethod_0(string string_0, string string_1)
        {
            string str = string.Empty;
            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(new Uri(string_0));
                byte[] bytes = Encoding.UTF8.GetBytes(string_1);
                request.Method = "POST";
                request.ContentType = "application/x-www-form-urlencoded";
                request.ContentLength = bytes.Length;
                using (Stream stream = request.GetRequestStream())
                {
                    stream.Write(bytes, 0, bytes.Length);
                }
                using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
                {
                    using (Stream stream2 = response.GetResponseStream())
                    {
                        Encoding encoding = Encoding.UTF8;
                        Stream stream3 = stream2;
                        if (response.ContentEncoding.ToLower() == "gzip")
                        {
                            stream3 = new GZipStream(stream2, CompressionMode.Decompress);
                        }
                        else if (response.ContentEncoding.ToLower() == "deflate")
                        {
                            stream3 = new DeflateStream(stream2, CompressionMode.Decompress);
                        }
                        using (StreamReader reader = new StreamReader(stream3, encoding))
                        {
                            return reader.ReadToEnd();
                        }
                    }
                }
            }
            catch (Exception exception)
            {
                str = string.Format("获取信息错误：{0}", exception.Message);
            }
            return str;
        }

        private static string smethod_1(string string_0)
        {
            return SecureHelper.MD5(SecureHelper.MD5(string_0) + string_0);
        }
    }
}

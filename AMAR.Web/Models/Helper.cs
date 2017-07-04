using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.NetworkInformation;
using System.Text.RegularExpressions;
using System.Web;
using DAL;

namespace AMAR.Web.Models
{
    
    public class Helper
    {


        private Db _db;
        public Helper()
        {
            _db = new Db();
        }
        public string GetMAC()
        {
            string macAddresses = "";

            foreach (NetworkInterface nic in NetworkInterface.GetAllNetworkInterfaces())
            {
                if (nic.OperationalStatus == OperationalStatus.Up)
                {
                    macAddresses += nic.GetPhysicalAddress().ToString();
                    break;
                }
            }
            return macAddresses;
        }


        public string GetPcName(HttpRequest request)
        {
            return (Dns.GetHostEntry(request.ServerVariables["remote_addr"]).HostName);
        }

        public string GetIpAddress()
        {
            return HttpContext.Current.Request.UserHostAddress.ToString();
        }

        public static bool IsPhoneNumber(string number)
        {
            return number.All(char.IsDigit); 
            //return Regex.Match(number, @"^\+?(\d[\d-. ]+)?(\([\d-. ]+\))?[\d-. ]+\d$").Success;
        }

        public static bool IsEmail(string email)
        {
            return new EmailAddressAttribute().IsValid(email);
        }
    }
}
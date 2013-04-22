using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentNHibernate.Mapping;

namespace UDS.Data.Map
{
    public class OnlineMap: ClassMap<Online>
    {
        public OnlineMap()
        {
            Id(x => x.UserName, "UserName").GeneratedBy.Assigned();

            Map(x => x.LoginTime, "LoginTime");
            Map(x => x.ActiveTime, "ActiveTime");
            Map(x => x.IpAddr, "IpAddr").Length(50);
            Map(x => x.AuthKey, "AuthKey").Length(30);
            Map(x => x.ActiveNodeID, "ActiveNodeID");

            Table("UDS_Online");
        }
    }
}

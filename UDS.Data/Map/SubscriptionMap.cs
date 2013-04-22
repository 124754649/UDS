using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentNHibernate.Mapping;

namespace UDS.Data.Map
{
    public class SubscriptionMap: ClassMap<Subscription>
    {
        public SubscriptionMap()
        {
            Id(x => x.ID, "ID").GeneratedBy.Native("Subscription_Seq");

            Map(x => x.ClassID, "ClassID");
            Map(x => x.StaffID, "Staff_ID");
            Map(x => x.SubscribeDate, "SubscribeDate");

            Table("UDS_Subscription");
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentNHibernate.Mapping;

namespace UDS.Data.Map
{
    public class ActivityMap: ClassMap<Activity>
    {
        public ActivityMap()
        {
            CompositeId()
                .KeyProperty(x => x.ActID, "Act_ID")
                .KeyProperty(x => x.ProcID, "Proc_ID");

            Table("UDS_Activity");
        }
    }
}

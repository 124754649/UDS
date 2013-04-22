using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentNHibernate.Mapping;

namespace UDS.Data.Map
{
    public class ActionMap: ClassMap<Action>
    {
        public ActionMap()
        {
            Id(x => x.ID, "Act_ID").GeneratedBy.Native("Action_Seq");

            Map(x => x.Name, "Act_Name").Length(50).Nullable();
            Map(x => x.Desc, "Act_Desc").Length(500).Nullable();

            Table("UDS_Action");
        }
    }
}

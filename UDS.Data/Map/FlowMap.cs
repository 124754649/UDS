using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentNHibernate.Mapping;

namespace UDS.Data.Map
{
    public class FlowMap: ClassMap<Flow>
    {
        public FlowMap()
        {
            Id(x => x.ID, "Flow_ID").GeneratedBy.Native("Flow_Seq");

            Map(x => x.Name, "Flow_Name").Length(300).Nullable();
            Map(x => x.BuildDate, "Build_Date").Nullable();
            Map(x => x.Builder, "Builder").Nullable();
            Map(x => x.Remark, "Remark").Length(500).Nullable();
            Map(x => x.StyleID, "Style_ID");

            Table("UDS_Flow");
        }
    }
}

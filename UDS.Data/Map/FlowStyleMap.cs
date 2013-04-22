using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentNHibernate.Mapping;

namespace UDS.Data.Map
{
    public class FlowStyleMap: ClassMap<FlowStyle>
    {
        public FlowStyleMap()
        {
            Id(x => x.ID, "Style_ID").GeneratedBy.Native("FlowStyle_Seq");

            Map(x => x.Name, "Style_Name").Length(50).Nullable();
            Map(x => x.Remark, "Style_Remark").Length(500).Nullable();
            Map(x => x.Template, "Template").Length(100).Nullable();

            Table("UDS_Flow_Style");
        }
    }
}

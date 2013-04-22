using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentNHibernate.Mapping;

namespace UDS.Data.Map
{
    public class ClassMap: ClassMap<Class>
    {
        public ClassMap()
        {
            Id(x => x.ID, "ClassID").GeneratedBy.Native("Class_Seq");

            Map(x => x.Name, "ClassName").Length(500).Nullable();
            Map(x => x.Remark, "ClassRemark").Length(500).Nullable();
            Map(x => x.Type, "ClassType");
            Map(x => x.ParentID, "ClassParentID");
            Map(x => x.AddedBy, "ClassAddedBy").Length(50);
            Map(x => x.AddedDate, "ClassAddedDate");
            Map(x => x.Status, "Status");

            Table("UDS_Class");
        }
    }
}

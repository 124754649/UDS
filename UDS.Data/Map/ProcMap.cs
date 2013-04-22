using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentNHibernate.Mapping;

namespace UDS.Data.Map
{
    public class ProcMap: ClassMap<Proc>
    {
        public ProcMap()
        {
            Id(x => x.ID, "Proc_ID").GeneratedBy.Native("Proc_Seq");

            Map(x => x.Name, "Proc_Name").Length(50).Nullable();
            Map(x => x.Desc, "Proc_Desc").Length(500).Nullable();

            Table("UDS_Proc");
        }
    }
}

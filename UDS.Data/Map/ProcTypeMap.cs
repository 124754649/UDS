using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentNHibernate.Mapping;

namespace UDS.Data.Map
{
    public class ProcTypeMap: ClassMap<ProcTypes>
    {
        public ProcTypeMap()
        {
            CompositeId()
                .KeyProperty(x => x.ProcID, "proc_id")
                .KeyProperty(x => x.ProcType, "proc_type");

            Table("UDS_Proc_Type");
        }
    }
}

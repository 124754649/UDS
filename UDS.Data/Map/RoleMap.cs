using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentNHibernate.Mapping;

namespace UDS.Data.Map
{
    public class RoleMap: ClassMap<Role>
    {
        public RoleMap()
        {
            Id(x => x.ID, "Role_ID").GeneratedBy.Native("role_seq");

            Map(x => x.Name, "Role_Name");
            Map(x => x.Description, "Role_Description").Length(500).Nullable();

            Table("UDS_Role");
        }
    }
}

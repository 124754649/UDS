using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentNHibernate.Mapping;

namespace UDS.Data.Map
{
    public class RoleStaffMap: ClassMap<RoleStaff>
    {
        public RoleStaffMap()
        {
            CompositeId()
                .KeyProperty(x => x.RoleID, "Role_ID")
                .KeyProperty(x => x.StaffID, "Staff_ID");

            Table("UDS_Staff_In_Role");
        }
    }
}

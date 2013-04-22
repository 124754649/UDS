using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentNHibernate.Mapping;

namespace UDS.Data.Map
{
    public class TeamStaffMap: ClassMap<TeamStaff>
    {
        public TeamStaffMap()
        {
            CompositeId()
                .KeyProperty(x => x.StaffID, "Staff_ID")
                .KeyProperty(x => x.TeamID, "Team_ID");

            Map(x => x.MemberType, "Member_type");

            Table("UDS_Staff_In_Team");
        }
    }
}

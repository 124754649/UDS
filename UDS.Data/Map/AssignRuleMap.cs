using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentNHibernate.Mapping;

namespace UDS.Data.Map
{
    public class AssignRuleMap: ClassMap<AssignRule>
    {
        public AssignRuleMap()
        {
            Id(x => x.RuleID, "Rule_ID").GeneratedBy.Native("AssignRule_Seq");

            Map(x => x.ActID, "Act_ID");
            Map(x => x.BaseOn, "Based_On");
            Map(x => x.PositionID, "Position_ID");
            Map(x => x.TeamID, "Team_ID");
            Map(x => x.RoleID, "Role_ID");
            Map(x => x.StaffID, "Staff_ID");

            Table("UDS_Assgn_Rule");
        }
    }
}

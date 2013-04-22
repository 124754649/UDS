using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentNHibernate.Mapping;

namespace UDS.Data.Map
{
    public class TeamInfoMap: ClassMap<TeamInfo>
    {
        public TeamInfoMap()
        {
            Id(x => x.TeamID, "TeamID").GeneratedBy.Assigned();

            Map(x => x.Scale, "Scale").Scale(18).Precision(0);
            Map(x => x.StartDate, "StartDate");
            Map(x => x.EndDate, "EndDate");

            Table("UDS_TeamInfo");
        }
    }
}

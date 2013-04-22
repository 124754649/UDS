using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentNHibernate.Mapping;

namespace UDS.Data.Map
{
    public class TeamMap: ClassMap<Team>
    {
        public TeamMap()
        {
            Id(x => x.ID, "Team_ID").GeneratedBy.Native("Team_Seq");

            Map(x => x.Super_ID, "Super_Team_ID");
            Map(x => x.Name, "Team_Name").Length(255).Nullable();
            Map(x => x.Description, "Team_Description").Length(500).Nullable();

            Table("UDS_Team");
        }
    }
}

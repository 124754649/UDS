using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentNHibernate.Mapping;

namespace UDS.Data.Map
{
    public class PositionMap: ClassMap<Position>
    {
        public PositionMap()
        {
            Id(x => x.ID, "Position_ID").GeneratedBy.Native("position_seq");

            Map(x => x.Super_ID, "Super_Position_ID");
            Map(x => x.Name, "Position_Name").Length(255).Nullable();
            Map(x => x.Description, "Position_Description").Length(500).Nullable();
            Map(x => x.Department_ID, "Department_ID");

            Table("UDS_Position");
        }
    }
}

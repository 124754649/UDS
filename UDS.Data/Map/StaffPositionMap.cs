using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentNHibernate.Mapping;

namespace UDS.Data.Map
{
    public class StaffPositionMap: ClassMap<StaffPosition>
    {
        public StaffPositionMap()
        {
            CompositeId()
                .KeyProperty(x => x.StaffID, "Staff_ID")
                .KeyProperty(x => x.PositionID, "Position_ID");

            Table("UDS_Staff_In_Position");
        }
    }
}

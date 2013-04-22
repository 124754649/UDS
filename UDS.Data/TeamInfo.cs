using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace UDS.Data
{
    [DataContract]
    public class TeamInfo
    {
        [DataMember]
        private int teamID;

        public virtual int TeamID
        {
            get { return teamID; }
            set { teamID = value; }
        }

        [DataMember]
        private double scale;

        public virtual double Scale
        {
            get { return scale; }
            set { scale = value; }
        }

        [DataMember]
        private DateTime startDate;

        public virtual DateTime StartDate
        {
            get { return startDate; }
            set { startDate = value; }
        }

        [DataMember]
        private DateTime endDate;

        public virtual DateTime EndDate
        {
            get { return endDate; }
            set { endDate = value; }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace UDS.Data
{
    [DataContract]
    public class TeamStaff
    {
        [DataMember]
        private int staffID;

        public virtual int StaffID
        {
            get { return staffID; }
            set { staffID = value; }
        }

        [DataMember]
        private int teamID;

        public virtual int TeamID
        {
            get { return teamID; }
            set { teamID = value; }
        }

        [DataMember]
        private int memberType;

        public virtual int MemberType
        {
            get { return memberType; }
            set { memberType = value; }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace UDS.Data
{
    [DataContract]
    public class AssignRule
    {
        [DataMember]
        private int ruleID;

        public virtual int RuleID
        {
            get { return ruleID; }
            set { ruleID = value; }
        }

        [DataMember]
        private int actID;

        public virtual int ActID
        {
            get { return actID; }
            set { actID = value; }
        }

        [DataMember]
        private int baseOn;

        public virtual int BaseOn
        {
            get { return baseOn; }
            set { baseOn = value; }
        }

        [DataMember]
        private int positionID;

        public virtual int PositionID
        {
            get { return positionID; }
            set { positionID = value; }
        }

        [DataMember]
        private int teamID;

        public virtual int TeamID
        {
            get { return teamID; }
            set { teamID = value; }
        }

        [DataMember]
        private int roleID;

        public virtual int RoleID
        {
            get { return roleID; }
            set { roleID = value; }
        }

        [DataMember]
        private int staffID;

        public virtual int StaffID
        {
            get { return staffID; }
            set { staffID = value; }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace UDS.Data
{
    [DataContract]
    public class Subscription
    {
        [DataMember]
        private int iD;

        public virtual int ID
        {
            get { return iD; }
            set { iD = value; }
        }

        [DataMember]
        private int classID;

        public virtual int ClassID
        {
            get { return classID; }
            set { classID = value; }
        }

        [DataMember]
        private int staffID;

        public virtual int StaffID
        {
            get { return staffID; }
            set { staffID = value; }
        }

        [DataMember]
        private DateTime subscribeDate;

        public virtual DateTime SubscribeDate
        {
            get { return subscribeDate; }
            set { subscribeDate = value; }
        }
    }
}

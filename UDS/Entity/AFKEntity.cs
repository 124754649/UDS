using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace UDS.Entity
{
    [DataContract]
    public class AFKEntity
    {
        [DataMember]
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        [DataMember]
        private string duration;

        public string Duration
        {
            get { return duration; }
            set { duration = value; }
        }
        [DataMember]
        private string remark;

        public string Remark
        {
            get { return remark; }
            set { remark = value; }
        }
        [DataMember]
        private string reason;

        public string Reason
        {
            get { return reason; }
            set { reason = value; }
        }
        [DataMember]
        private int startingHour;

        public int StartingHour
        {
            get { return startingHour; }
            set { startingHour = value; }
        }
        [DataMember]
        private int startingMinute;

        public int StartingMinute
        {
            get { return startingMinute; }
            set { startingMinute = value; }
        }
        [DataMember]
        private int expiringHour;

        public int ExpiringHour
        {
            get { return expiringHour; }
            set { expiringHour = value; }
        }
        [DataMember]
        private int expiringMinute;

        public int ExpiringMinute
        {
            get { return expiringMinute; }
            set { expiringMinute = value; }
        }
    }
}
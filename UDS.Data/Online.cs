using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace UDS.Data
{
    [DataContract]
    public class Online
    {
        [DataMember]
        private string userName;

        public virtual string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        [DataMember]
        private DateTime loginTime;

        public virtual DateTime LoginTime
        {
            get { return loginTime; }
            set { loginTime = value; }
        }

        [DataMember]
        private DateTime activeTime;

        public virtual DateTime ActiveTime
        {
            get { return activeTime; }
            set { activeTime = value; }
        }

        [DataMember]
        private string ipAddr;

        public virtual string IpAddr
        {
            get { return ipAddr; }
            set { ipAddr = value; }
        }

        [DataMember]
        private string authKey;

        public virtual string AuthKey
        {
            get { return authKey; }
            set { authKey = value; }
        }

        [DataMember]
        private int activeNodeID;

        public virtual int ActiveNodeID
        {
            get { return activeNodeID; }
            set { activeNodeID = value; }
        }
    }
}

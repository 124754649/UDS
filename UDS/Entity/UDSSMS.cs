using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace UDS.Entity
{
    [DataContract]
    public class UDSSMS
    {
        [DataMember]
        private string id;

        public string Id
        {
            get { return id; }
            set { id = value; }
        }

        [DataMember]
        private string senderRealName;

        public string SenderRealName
        {
            get { return senderRealName; }
            set { senderRealName = value; }
        }

        [DataMember]
        private string content;

        public string Content
        {
            get { return content; }
            set { content = value; }
        }

        [DataMember]
        private string sendTime;

        public string SendTime
        {
            get { return sendTime; }
            set { sendTime = value; }
        }

        [DataMember]
        private string sender;

        public string Sender
        {
            get { return sender; }
            set { sender = value; }
        }

        [DataMember]
        private string receiverRealName;

        public string ReceiverRealName
        {
            get { return receiverRealName; }
            set { receiverRealName = value; }
        }

        [DataMember]
        private string type;

        public string Type
        {
            get { return type; }
            set { type = value; }
        }

        [DataMember]
        private bool isRead;

        public bool IsRead
        {
            get { return isRead; }
            set { isRead = value; }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace UDS.Entity
{
    [DataContract]
    public class UDSBulletin
    {
        [DataMember]
        private int bulletinid;

        public int Bulletinid
        {
            get { return bulletinid; }
            set { bulletinid = value; }
        }

        [DataMember]
        private string subject;

        public string Subject
        {
            get { return subject; }
            set { subject = value; }
        }

        [DataMember]
        private string contents;

        public string Contents
        {
            get { return contents; }
            set { contents = value; }
        }

        [DataMember]
        private string createtime;

        public string Createtime
        {
            get { return createtime; }
            set { createtime = value; }
        }

        [DataMember]
        private string sendtime;

        public string Sendtime
        {
            get { return sendtime; }
            set 
            { 
                sendtime = value;
                isSend = !string.IsNullOrEmpty(value);
            }
        }

        [DataMember]
        private int readcount;

        public int Readcount
        {
            get { return readcount; }
            set 
            { 
                readcount = value;
                if (0 == readcount)
                    isRead = false;
                else
                    isRead = true;
            }
        }

        [DataMember]
        private bool isSend;

        public bool IsSend
        {
            get { return isSend; }
            set { isSend = value; }
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
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace UDS.Entity
{
    [DataContract]
    public class UDSBulletinAttaches
    {
        [DataMember]
        private int bulletinid;

        public int Bulletinid
        {
            get { return bulletinid; }
            set { bulletinid = value; }
        }

        [DataMember]
        private int attachmentid;

        public int Attachmentid
        {
            get { return attachmentid; }
            set { attachmentid = value; }
        }

        [DataMember]
        private string attachmentname;

        public string Attachmentname
        {
            get { return attachmentname; }
            set { attachmentname = value; }
        }

        [DataMember]
        private string attachmentpath;

        public string Attachmentpath
        {
            get { return attachmentpath; }
            set { attachmentpath = value; }
        }
    }
}
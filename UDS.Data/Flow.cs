using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace UDS.Data
{
    [DataContract]
    public class Flow
    {
        [DataMember]
        private int iD;

        public virtual int ID
        {
            get { return iD; }
            set { iD = value; }
        }

        [DataMember]
        private string name;

        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        [DataMember]
        private DateTime buildDate;

        public virtual DateTime BuildDate
        {
            get { return buildDate; }
            set { buildDate = value; }
        }

        [DataMember]
        private string builder;

        public virtual string Builder
        {
            get { return builder; }
            set { builder = value; }
        }

        [DataMember]
        private string remark;

        public virtual string Remark
        {
            get { return remark; }
            set { remark = value; }
        }

        [DataMember]
        private int styleID;

        public virtual int StyleID
        {
            get { return styleID; }
            set { styleID = value; }
        }
    }
}

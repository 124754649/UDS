using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace UDS.Data
{
    [DataContract]
    public class Proc
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
        private string desc;

        public virtual string Desc
        {
            get { return desc; }
            set { desc = value; }
        }
    }
}

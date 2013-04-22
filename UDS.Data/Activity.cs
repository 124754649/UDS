using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace UDS.Data
{
    [DataContract]
    public class Activity
    {
        [DataMember]
        private int actID;

        public virtual int ActID
        {
            get { return actID; }
            set { actID = value; }
        }

        [DataMember]
        private int procID;

        public virtual int ProcID
        {
            get { return procID; }
            set { procID = value; }
        }
    }
}

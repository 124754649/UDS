using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace UDS.Data
{
    [DataContract]
    public class ProcType
    {
        [DataMember]
        private int procID;

        public virtual int ProcID
        {
            get { return procID; }
            set { procID = value; }
        }

        [DataMember]
        private int procType;

        public virtual int ProcType
        {
            get { return procType; }
            set { procType = value; }
        }
    }
}

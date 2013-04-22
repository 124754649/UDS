using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace UDS.Data
{
    [DataContract]
    public class Role
    {
        [DataMember]
        private int id;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        [DataMember]
        private string name;

        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        [DataMember]
        private string description;

        public virtual string Description
        {
            get { return description; }
            set { description = value; }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace UDS.Data
{
    [DataContract]
    public class Position
    {
        [DataMember]
        private int id;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        [DataMember]
        private int super_ID;

        public virtual int Super_ID
        {
            get { return super_ID; }
            set { super_ID = value; }
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

        [DataMember]
        private int department_ID;

        public virtual int Department_ID
        {
            get { return department_ID; }
            set { department_ID = value; }
        }
    }
}

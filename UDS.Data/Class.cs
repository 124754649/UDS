using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace UDS.Data
{
    [DataContract]
    public class Class
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
        private string remark;

        public virtual string Remark
        {
            get { return remark; }
            set { remark = value; }
        }

        [DataMember]
        private int type;

        public virtual int Type
        {
            get { return type; }
            set { type = value; }
        }

        [DataMember]
        private int parentID;

        public virtual int ParentID
        {
            get { return parentID; }
            set { parentID = value; }
        }

        [DataMember]
        private string addedBy;

        public virtual string AddedBy
        {
            get { return addedBy; }
            set { addedBy = value; }
        }

        [DataMember]
        private DateTime addedDate;

        public virtual DateTime AddedDate
        {
            get { return addedDate; }
            set { addedDate = value; }
        }

        [DataMember]
        private int status;

        public virtual int Status
        {
            get { return status; }
            set { status = value; }
        }
    }
}

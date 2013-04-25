using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace UDS.Data
{
    [DataContract]
    public class RoleStaff
    {
        [DataMember]
        private int staffID;

        public virtual int StaffID
        {
            get { return staffID; }
            set { staffID = value; }
        }

        [DataMember]
        private int roleID;

        public virtual int RoleID
        {
            get { return roleID; }
            set { roleID = value; }
        }
    }
}

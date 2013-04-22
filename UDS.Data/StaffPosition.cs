using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace UDS.Data
{
    [DataContract]
    public class StaffPosition
    {
        [DataMember]
        private int staffID;

        public virtual int StaffID
        {
            get { return staffID; }
            set { staffID = value; }
        }

        [DataMember]
        private int positionID;

        public virtual int PositionID
        {
            get { return positionID; }
            set { positionID = value; }
        }
    }
}

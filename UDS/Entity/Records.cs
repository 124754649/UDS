using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace UDS.Entity
{
    [DataContract]
    public class Records
    {
        [DataMember]
        private int page;

        public int Page
        {
            get { return page; }
            set { page = value; }
        }

        [DataMember]
        private int rows;

        public int Rows
        {
            get { return rows; }
            set { rows = value; }
        }

        [DataMember]
        private object datas;

        public object Datas
        {
            get { return datas; }
            set { datas = value; }
        }
    }
}
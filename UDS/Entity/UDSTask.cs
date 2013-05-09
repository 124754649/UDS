using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace UDS.Entity
{
    [DataContract]
    public class UDSTask
    {
        [DataMember]
        private int id;

        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        [DataMember]
        private string subject;

        public string Subject
        {
            get { return subject; }
            set { subject = value; }
        }

        [DataMember]
        private string cooperatorList;

        public string CooperatorList
        {
            get { return cooperatorList; }
            set { cooperatorList = value; }
        }

        [DataMember]
        private DateTime date;

        public DateTime Date
        {
            get { return date; }
            set { date = value; }
        }

        [DataMember]
        private bool isConfirm;

        public bool IsConfirm
        {
            get { return isConfirm; }
            set { isConfirm = value; }
        }

        [DataMember]
        private string arrangedBy;

        public string ArrangedBy
        {
            get { return arrangedBy; }
            set { arrangedBy = value; }
        }

        [DataMember]
        private int type;

        public int Type
        {
            get { return type; }
            set { type = value; }
        }

        [DataMember]
        private int projectID;

        public int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
        }

        [DataMember]
        private int beginPeriodID;

        public int BeginPeriodID
        {
            get { return beginPeriodID; }
            set { beginPeriodID = value; }
        }

        [DataMember]
        private int endPeriodID;

        public int EndPeriodID
        {
            get { return endPeriodID; }
            set { endPeriodID = value; }
        }

        [DataMember]
        private string endTime;

        public string EndTime
        {
            get { return endTime; }
            set { endTime = value; }
        }

        public override string ToString()
        {
            if (beginPeriodID == 0 && endPeriodID == 0)
            {
                if (endTime != "")
                    return DateTime.Parse(endTime).ToShortTimeString();
                else
                    return "-";

            }
            else
            {
                int b = beginPeriodID;
                int e = endPeriodID;
                DateTime dt = new DateTime(1999, 1, 1, 8, 0, 0, 0);
                TimeSpan ts = new TimeSpan(0, 0, (b - 1) * 30, 0, 0);
                DateTime bt = dt.Add(ts);
                DateTime et = bt.Add(new TimeSpan(0, 0, (e - b + 1) * 30, 0, 0));
                return bt.ToShortTimeString() + "-" + et.ToShortTimeString();
            }
        }

        [DataMember(Name = "period")]
        public string Period
        {
            get
            {
                return this.ToString();
            }
        }
    }
}
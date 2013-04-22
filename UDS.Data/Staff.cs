using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace UDS.Data
{
    [DataContract]
    public class Staff
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
        private string password;

        public virtual string Password
        {
            get { return password; }
            set { password = value; }
        }

        [DataMember]
        private string realName;

        public virtual string RealName
        {
            get { return realName; }
            set { realName = value; }
        }

        [DataMember]
        private bool sex;

        public virtual bool Sex
        {
            get { return sex; }
            set { sex = value; }
        }

        [DataMember]
        private string eMail;

        public virtual string EMail
        {
            get { return eMail; }
            set { eMail = value; }
        }

        [DataMember]
        private string status;

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        [DataMember]
        private DateTime registedDate;

        public virtual DateTime RegistedDate
        {
            get { return registedDate; }
            set { registedDate = value; }
        }

        [DataMember]
        private bool dimission;

        public virtual bool Dimission
        {
            get { return dimission; }
            set { dimission = value; }
        }

        [DataMember]
        private string phone;

        public virtual string Phone
        {
            get { return phone; }
            set { phone = value; }
        }

        [DataMember]
        private string mobile;

        public virtual string Mobile
        {
            get { return mobile; }
            set { mobile = value; }
        }

        [DataMember]
        private DateTime birthday;

        public virtual DateTime Birthday
        {
            get { return birthday; }
            set { birthday = value; }
        }

        [DataMember]
        private int style;

        public virtual int Style
        {
            get { return style; }
            set { style = value; }
        }

        [DataMember]
        private bool isNeedKey;

        public virtual bool IsNeedKey
        {
            get { return isNeedKey; }
            set { isNeedKey = value; }
        }

        [DataMember]
        private int caste;

        public virtual int Caste
        {
            get { return caste; }
            set { caste = value; }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace UDS.Entity
{
    [DataContract]
    public class UDSAssetManagement
    {
        [DataMember]
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        [DataMember]
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        [DataMember]
        private string code;

        public string Code
        {
            get { return code; }
            set { code = value; }
        }

        [DataMember]
        private string specification;

        public string Specification
        {
            get { return specification; }
            set { specification = value; }
        }

        [DataMember]
        private int number;

        public int Number
        {
            get { return number; }
            set { number = value; }
        }

        [DataMember]
        private decimal totalPrice;

        public decimal TotalPrice
        {
            get { return totalPrice; }
            set { totalPrice = value; }
        }

        [DataMember]
        private decimal taxRate;

        public decimal TaxRate
        {
            get { return taxRate; }
            set { taxRate = value; }
        }

        [DataMember]
        private string location;

        public string Location
        {
            get { return location; }
            set { location = value; }
        }

        [DataMember]
        private DateTime? startUsingTime;

        public DateTime? StartUsingTime
        {
            get { return startUsingTime; }
            set { startUsingTime = value; }
        }

        [DataMember]
        private DateTime? buyingTime;

        public DateTime? BuyingTime
        {
            get { return buyingTime; }
            set { buyingTime = value; }
        }

        [DataMember]
        private int status;

        public int Status
        {
            get { return status; }
            set { status = value; }
        }

        [DataMember]
        private string usingMan;

        public string UsingMan
        {
            get { return usingMan; }
            set { usingMan = value; }
        }

        [DataMember]
        private string remark;

        public string Remark
        {
            get { return remark; }
            set { remark = value; }
        }
    }
}
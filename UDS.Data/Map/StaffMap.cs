using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentNHibernate.Mapping;

namespace UDS.Data.Map
{
    public class StaffMap: ClassMap<Staff>
    {
        public StaffMap()
        {
            Id(x => x.ID, "Staff_ID").GeneratedBy.Native("staff_seq");

            Map(x => x.Name, "Staff_Name").Length(50);
            Map(x => x.Password, "Password").Length(255).Nullable();
            Map(x => x.RealName, "RealName").Length(50).Nullable();
            Map(x => x.Sex, "Sex").Nullable();
            Map(x => x.EMail, "Email").Length(500).Nullable();
            Map(x => x.Status, "Status").Length(50).Nullable();
            Map(x => x.RegistedDate, "RegistdDate").Nullable();
            Map(x => x.Dimission, "Dimission").Nullable();
            Map(x => x.Phone, "Phone").Length(50).Nullable();
            Map(x => x.Mobile, "Mobile").Length(50).Nullable();
            Map(x => x.Birthday, "Birthday").Nullable();
            Map(x => x.Style, "Style").Nullable();
            Map(x => x.IsNeedKey, "IsNeedKey").Nullable();
            Map(x => x.Caste, "Caste").Nullable();

            Table("UDS_Staff");
        }
    }
}

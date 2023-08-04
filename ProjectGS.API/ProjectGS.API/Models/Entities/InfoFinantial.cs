using ProjectGS.API.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace ProjectGS.API.Models.Entities
{
    public class InfoFinantial
    {

        public string InfoFinantialId { get; set; }
        public string DepartmentId { get; set; }
        public Department Department { get; set; }
        public string CostCenterId { get; set; }
        public CostCenter CostCenter { get; set; }
        public string CCtrSO { get; set; }
        public double AvaragePrice { get; set; }
        public double PriceHour { get; set; }
        public string SMT { get; set; }
        public long CountryId { get; set; }
        public Country Country { get; set; }
        public string OrgLevel { get; set; }
        public DateTime InitialValidity { get; set; }
        public DateTime FinalValidity { get; set; }
        public bool Status { get; set; }


        public InfoFinantial()
        {
            InfoFinantialId = Guid.NewGuid().ToString();
        }
    }
}

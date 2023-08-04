using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using ProjectGS.API.Models.Entities;
using ProjectGS.API.Services.Interfaces;

namespace ProjectGS.API.Services.Classes
{
    
    public class ImprovementService : IImprovementService
    {
        private readonly HttpClient _client;

        public ImprovementService(HttpClient client)
        {
            _client = client;
        }

        public async Task<bool> PostImproveOnJira(Improvement improve)
        {
            bool majorBenefitMonetary = improve.MajorBenefits.Name == "Time" || improve.MajorBenefits.Name == "Cost reduction" ? true : false;

            //endpoint
            var endpoint = new Uri("https://rb-tracker.bosch.com/tracker/rest/api/2/issue/");

            //body
            var body = new
            {

                fields = new
                {
                    summary = improve.Summary,
                    description = improve.Description,
                    issuetype = new
                    {
                        id = 4
                    },
                    project = new
                    {
                        id = "50541",
                        projectCategory = new
                        {
                            id = 10160
                        }
                    },
                    customfield_14326 = new
                    {
                        value = improve.Department.CurrentOrganization.Name
                    },
                    customfield_10594 = improve.Department!.Name,
                    duedate = improve.DueDate.ToString("yyyy-MM-dd"),
                    customfield_12209 = new[]
                   {
                        new { value = improve.Region }
                    },
                    customfield_39603 = new
                    {
                        name = improve.CipPex
                    },
                    assignee = new
                    {
                        name = improve.Assignee
                    },
                    customfield_39606 = new
                    {
                        value = improve.IdeaSource.InternallySolvable ? "Yes" : "No"
                    },
                    customfield_35328 = new[]
                   {
                        new { value = improve.MajorBenefits.Name }
                    },
                    customfield_12173 = improve.Department.CostCenter.Code,
                    customfield_32297 = majorBenefitMonetary ? improve.Currency : null,
                    customfield_13526 = majorBenefitMonetary ? improve.EstimatedHours : null,
                    customfield_35330 = majorBenefitMonetary ? improve.EstimatedSaving : null,
                    customfield_42391 = majorBenefitMonetary ? improve.MonetaryBenefit : null,

                }
            };

            //auhtorization
            var authenticationString = "ANG7CA:Muzambinho-13";
            var base64String = Convert.ToBase64String(
               System.Text.Encoding.ASCII.GetBytes(authenticationString));

            _client.DefaultRequestHeaders.Add("Authorization", $"Basic {base64String}");
            var response = await _client.PostAsJsonAsync(endpoint, body);

            if (response.IsSuccessStatusCode) return true;
            return false;
        }
    }
}

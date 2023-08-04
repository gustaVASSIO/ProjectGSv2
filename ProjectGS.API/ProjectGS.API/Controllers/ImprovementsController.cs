using AutoMapper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OData.Query;
using Microsoft.EntityFrameworkCore;
using ProjectGS.API.Data.ValueObjects;
using ProjectGS.API.Models.Entities;
using ProjectGS.API.Repository.Interfaces;
using ProjectGS.API.Services.Interfaces;
using System.Globalization;
using System.Net.Http.Headers;

namespace ProjectGS.API.Controllers
{
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    [ApiController]
    public class ImprovementsController : ControllerBase
    {
        private IUnitOfWork uow;
        private const int FTE = 176;
        private IMapper _mapper;
        private IImprovementService _service;

        public ImprovementsController(IUnitOfWork uow, IMapper mapper, IImprovementService service)
        {
            this.uow = uow ?? throw new ArgumentNullException(nameof(uow));
            _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
            _service = service ?? throw new ArgumentNullException(nameof(service));
        }

        [HttpGet]
        [EnableQuery]
        public async Task<ActionResult> GetImprovements()
        {
            var improvements = await  uow.ImproveRepository.Get()
                .Include(x => x.MajorBenefits)
                .Include(x => x.SourceType)
                .Include(x => x.IdeaSource)
                .Include(x => x.Department)
                .ToListAsync();
            
            return Ok(improvements);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<ImprovementVO>> GetImprovement(string id)
        {
            var improvement = await uow.ImproveRepository.Get()
                .Where(x => x.ImprovementId == id)
                .Include(x => x.MajorBenefits)
                .Include(x => x.SourceType)
                .Include(x => x.IdeaSource)
                .Include(x => x.Department)
                .Include(x => x.Department.CurrentOrganization)
                .Include(x => x.Department.Process)
                .Include(x => x.Department.CostCenter)
                .Include(x => x.User)
                .FirstOrDefaultAsync();

            if (improvement == null)
                return BadRequest("Improve not found");
            var vo = _mapper.Map<ImprovementVO>(improvement);

            return Ok(vo);
        }

        [HttpGet("Peeding")]
        public async Task<ActionResult<IEnumerable<ImprovementVO>>> GetImprovesPeeding()
        {
            List<ImprovementVO> improvementVOs = new List<ImprovementVO>();
                
            var improvements = await uow.ImproveRepository.Get()
                .Where(x =>x.StatusImprovement ==  false)
                .Include(x => x.Department)
                .Include(x => x.MajorBenefits)
                .Include(x => x.User)
                .ToListAsync();

            foreach (var imp in improvements)
            {
                improvementVOs.Add(_mapper.Map<ImprovementVO>(imp));
            }
            

            return Ok(improvementVOs);
        }

        [HttpGet("Reporter/{id}")]
        public async Task<ActionResult<IEnumerable<Improvement>>> GetImprovesByUserId(string id)
        {
            var improves = await uow.ImproveRepository.GetImprovesByUserId(id);
            return Ok(improves);
        }

        [HttpGet("ComputerUsername")]
        public ActionResult GetUsernameComputer()
        {
            return Ok(Environment.UserName);
        }

        [HttpPost]
        public async Task<ActionResult> PostImprovement(ImprovementVO vo)
        {
            var improve = _mapper.Map<Improvement>(vo);
            uow.ImproveRepository.Insert(improve);

            try
            {
                await uow.Commit();
            }
            catch (DbUpdateException e)
            {
                uow.Dispose();
                return BadRequest("Fail insert improve");
                //throw e;
            }
            return CreatedAtAction("GetImprovement", new { id = improve.ImprovementId }, improve);
        }
        
        [HttpPut("{id}")]
        public async Task<ActionResult> PutImprovement(string id, ImprovementVO vo)
        {
            if(id != vo.ImprovementId)
                return BadRequest("Id mismactch");

            if (!await VerifyImprovementExist(id))
                return BadRequest("Improve not found");

            var improve = _mapper.Map<Improvement>(vo);

            uow.ImproveRepository.Update(improve);

            try
            { 
                await uow.Commit();
            }
            catch (DbUpdateException)
            {
                return BadRequest("Error in update improve");
            }

            return NoContent();
        }

        [HttpPatch("Approve/{id}")]
        public async Task<ActionResult> PatchImproveStatusApproved(string id)
        {
            var improve = await uow.ImproveRepository.Get()
                .Include(x => x.MajorBenefits)
                .Include(x => x.SourceType)
                .Include(x => x.IdeaSource)
                .Include(x => x.Department)
                .Include(x => x.Department.CurrentOrganization)
                .Include(x => x.Department.Process)
                .Include(x => x.Department.CostCenter)
                .Include(x => x.User)
                .FirstOrDefaultAsync(x => x.ImprovementId == id);
            
            if (improve == null)
                return BadRequest("Improve not found");

            bool status =  await _service.PostImproveOnJira(improve);

            if (!status) return BadRequest("Something goes wrong during the creation of this improve on Jira, verify the informations and try again"); 

            improve.StatusImprovement = true;
            uow.ImproveRepository.Update(improve);

            await uow.Commit();

            return NoContent();

        }


        [HttpGet("TesteJira")]
        public async Task<ActionResult> GetImproveJira()
        {
            var endpoint = new Uri("https://rb-tracker.bosch.com/tracker/rest/api/2/issue/IMPROVE-13217");
            var authenticationString = "ANG7CA:Muzambinho-13";
            var base64String = Convert.ToBase64String(
               System.Text.Encoding.ASCII.GetBytes(authenticationString));

            var requestMessage = new HttpRequestMessage(HttpMethod.Get, endpoint);
            requestMessage.Headers.Authorization =
               new AuthenticationHeaderValue("Basic", base64String);

            using (var client = new HttpClient())
            {
                var resutl  = await client.SendAsync(requestMessage);
                var json = await resutl.Content.ReadAsStringAsync();
                return Ok(json);
            }

        }

        private async Task<bool> VerifyImprovementExist(string id)
        {
            var improve = await uow.ImproveRepository.Get()
                .Where(x => x.ImprovementId == id).FirstOrDefaultAsync();

            if (improve == null)
                return false;
            return true;
        }



    }
}

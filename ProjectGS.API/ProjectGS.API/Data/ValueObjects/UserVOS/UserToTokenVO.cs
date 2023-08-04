using Microsoft.AspNetCore.SignalR;

namespace ProjectGS.API.Data.ValueObjects.UserVOS
{
    public class UserToTokenVO
    {
        public string UserId { get; set; }
        public string UserName { get; set; }
        public string Role { get; set; }
    }
}

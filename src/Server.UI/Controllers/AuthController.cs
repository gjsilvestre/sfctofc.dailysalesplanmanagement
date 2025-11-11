using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SFCTOFC.DailySalesPlanManagementDomain.Identity;
using SFCTOFC.DailySalesPlanManagementInfrastructure.Services.Identity;

namespace SFCTOFC.DailySalesPlanManagementServer.UI.Controllers;

[ApiController]
[Microsoft.AspNetCore.Mvc.Route("api/[controller]")]
public class AuthController : ControllerBase
{
    private readonly IConfiguration _configuration;
    private readonly UserManager<ApplicationUser> _userManager;
    private readonly SignInManager<ApplicationUser> _signInManager;

    public AuthController(UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager, IConfiguration configuration)
    {
        _userManager = userManager;
        _signInManager = signInManager;
        _configuration = configuration;
    }

    [HttpPost("login")]
    public async Task<IActionResult> Login([FromBody] LoginRequest request)
    {
        Console.WriteLine($"Login endpoint hit for user: {request.UserName}");

        var user = await _userManager.FindByNameAsync(request.UserName);
        if (user == null)
            return Unauthorized(new { message = "User not found." });

        if (!user.IsActive)
            return Unauthorized(new { message = "Account inactive." });

        var isValid = await _userManager.CheckPasswordAsync(user, request.Password);
        if (!isValid)
            return Unauthorized(new { message = "Invalid password." });

        var token = JwtTokenGenerator.Generate(user, _configuration);

        return Ok(new
        {
            message = "Login successful",
            token,
            user = new
            {
                user.Id,
                user.UserName,
                user.Email,
                user.DisplayName
            }
        });
    }
}

public class LoginRequest
{
    public string UserName { get; set; } = string.Empty;
    public string Password { get; set; } = string.Empty;
}


using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using SFCTOFC.DailySalesPlanManagementApplication;
using SFCTOFC.DailySalesPlanManagementDomain.Identity;
using SFCTOFC.DailySalesPlanManagementInfrastructure;
using SFCTOFC.DailySalesPlanManagementInfrastructure.Extensions;
using SFCTOFC.DailySalesPlanManagementInfrastructure.Persistence;
using SFCTOFC.DailySalesPlanManagementServer.UI;

//var builder = WebApplication.CreateBuilder(args);
//builder.RegisterSerilog();
//builder.WebHost.UseStaticWebAssets();
//builder.Logging.AddFilter("LuckyPennySoftware.MediatR.License", LogLevel.None);

//builder.Services
//    .AddApplication()
//    .AddInfrastructure(builder.Configuration)
//    .AddServerUI(builder.Configuration);
//var app = builder.Build();
//app.UseStaticFiles();
//app.ConfigureServer(builder.Configuration);

//await app.InitializeDatabaseAsync().ConfigureAwait(false);
//app.InitializeCacheFactory();
//await app.RunAsync().ConfigureAwait(false);


var builder = WebApplication.CreateBuilder(args);
builder.RegisterSerilog();
builder.WebHost.UseStaticWebAssets();
builder.Logging.AddFilter("LuckyPennySoftware.MediatR.License", LogLevel.None);

builder.Services
    .AddApplication()
    .AddInfrastructure(builder.Configuration)
    .AddServerUI(builder.Configuration);

builder.Services.AddControllers()
    .AddJsonOptions(options =>
    {
        options.JsonSerializerOptions.PropertyNamingPolicy = null;
    });

//builder.Services.AddAuthentication()
//    .AddJwtBearer(JwtBearerDefaults.AuthenticationScheme, options =>
//    {
//        var jwtSettings = builder.Configuration.GetSection("JwtSettings");
//        options.TokenValidationParameters = new TokenValidationParameters
//        {
//            ValidateIssuer = true,
//            ValidateAudience = true,
//            ValidateLifetime = true,
//            ValidateIssuerSigningKey = true,
//            ValidIssuer = jwtSettings["Issuer"],
//            ValidAudience = jwtSettings["Audience"],
//            IssuerSigningKey = new SymmetricSecurityKey(
//                Encoding.UTF8.GetBytes(jwtSettings["Key"]!)
//            )
//        };
//    });

//builder.Services.AddAuthentication(options =>
//{
//    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
//    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
//})
//.AddJwtBearer(options =>
//{
//    var jwtSettings = builder.Configuration.GetSection("JwtSettings");
//    options.TokenValidationParameters = new TokenValidationParameters
//    {
//        ValidateIssuer = true,
//        ValidateAudience = true,
//        ValidateLifetime = true,
//        ValidateIssuerSigningKey = true,
//        ValidIssuer = jwtSettings["Issuer"],
//        ValidAudience = jwtSettings["Audience"],
//        IssuerSigningKey = new SymmetricSecurityKey(
//            Encoding.UTF8.GetBytes(jwtSettings["Key"]!)
//        )
//    };
//});

builder.Services.AddAuthorization();
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", b =>
        b.AllowAnyOrigin()
         .AllowAnyMethod()
         .AllowAnyHeader());
});

var app = builder.Build();

// Correct order:
app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();
app.UseCors("AllowAll");
app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();
app.MapFallbackToFile("index.html");

app.ConfigureServer(builder.Configuration);

await app.InitializeDatabaseAsync().ConfigureAwait(false);
app.InitializeCacheFactory();

app.Use(async (context, next) =>
{
    Console.WriteLine($"{context.Request.Method} {context.Request.Path}");
    await next();
});

await app.RunAsync().ConfigureAwait(false);

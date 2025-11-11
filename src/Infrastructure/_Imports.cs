// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.

global using System.Security.Claims;
global using AutoMapper;
global using AutoMapper.QueryableExtensions;
global using SFCTOFC.DailySalesPlanManagementApplication.Common.Interfaces;
global using SFCTOFC.DailySalesPlanManagementApplication.Common.Interfaces.Identity;
global using SFCTOFC.DailySalesPlanManagementApplication.Common.Models;
global using SFCTOFC.DailySalesPlanManagementInfrastructure.Persistence;
global using SFCTOFC.DailySalesPlanManagementInfrastructure.Persistence.Extensions;
global using SFCTOFC.DailySalesPlanManagementInfrastructure.Services;
global using SFCTOFC.DailySalesPlanManagementInfrastructure.Services.Identity;
global using SFCTOFC.DailySalesPlanManagementDomain.Entities;
global using Microsoft.AspNetCore.Components.Authorization;
global using Microsoft.AspNetCore.Identity;
global using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
global using Microsoft.EntityFrameworkCore;
global using Microsoft.Extensions.DependencyInjection;
global using Microsoft.Extensions.Logging;
global using Microsoft.Extensions.Options;
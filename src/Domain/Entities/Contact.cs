// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.

using SFCTOFC.DailySalesPlanManagementDomain.Common.Entities;

namespace SFCTOFC.DailySalesPlanManagementDomain.Entities;

public class Contact : BaseAuditableEntity
{
    public string? Name { get; set; }
    public string? Description { get; set; }
    public string? Email { get; set; }
    public string? PhoneNumber { get; set; }
    public string? Country { get; set; }
   
}

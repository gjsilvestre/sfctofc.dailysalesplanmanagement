// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.Tenants.Commands.AddEdit;

public class AddEditTenantCommandValidator : AbstractValidator<AddEditTenantCommand>
{
    public AddEditTenantCommandValidator()
    {
        RuleFor(v => v.Name)
            .MaximumLength(256)
            .NotEmpty();
    }
}
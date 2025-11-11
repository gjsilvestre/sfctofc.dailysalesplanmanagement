// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.Products.Commands.Delete;

public class DeleteProductCommandValidator : AbstractValidator<DeleteProductCommand>
{
    public DeleteProductCommandValidator()
    {
        RuleFor(v => v.Id).NotNull().ForEach(v => v.NotEqual(0));
    }
}
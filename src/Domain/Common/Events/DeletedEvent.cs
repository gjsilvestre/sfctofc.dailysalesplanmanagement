// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.


// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.

using SFCTOFC.DailySalesPlanManagementDomain.Common.Entities;

namespace SFCTOFC.DailySalesPlanManagementDomain.Common.Events;

public class DeletedEvent<T> : DomainEvent where T : IEntity
{
    public DeletedEvent(T entity)
    {
        Entity = entity;
    }

    public T Entity { get; }
}
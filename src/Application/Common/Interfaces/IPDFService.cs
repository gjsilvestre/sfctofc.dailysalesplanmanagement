// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.

namespace SFCTOFC.DailySalesPlanManagementApplication.Common.Interfaces;

public interface IPDFService
{
    Task<byte[]> ExportAsync<TData>(IEnumerable<TData> data
        , Dictionary<string, Func<TData, object?>> mappers
        , string title, PdfOrientation orientation);
    //Task<byte[]> ExportCustomLayoutAsync<TData>(TData data, string title);
}

public enum PdfOrientation
{
    Portrait,
    Landscape
}
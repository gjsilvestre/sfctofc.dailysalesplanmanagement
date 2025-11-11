using System;

using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using QuestPDF.Fluent;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;
using Document = QuestPDF.Fluent.Document;

namespace SFCTOFC.DailySalesPlanManagementInfrastructure.Services
{
    public class JobRequestPDFService : IPDFCustom
    {
        private const int MarginPTs = 39;
        private const string FontFamilyName = Fonts.Arial;
        private const float FontSize = 10F;

        public async Task<byte[]> ExportCustomAsync<TData>(
            IEnumerable<TData> data,
            Dictionary<string, Func<TData, object?>> mappers,
            string title,
            PdfOrientation orientation)
        {
            var stream = new MemoryStream();
            var dataList = data?.ToList() ?? new List<TData>();

            Document.Create(container =>
            {
                container.Page(page =>
                {
                    page.Size(orientation == PdfOrientation.Landscape
                        ? PageSizes.A4.Landscape()
                        : PageSizes.A4.Portrait());

                    page.Margin(MarginPTs);
                    page.PageColor(Colors.White);
                    page.DefaultTextStyle(x => x.FontSize(FontSize).FontFamily(FontFamilyName));

                    //  HEADER!

                    page.Header().Element(container =>
                    {
                        container
                            .PaddingBottom(5)
                            .Height(50)
                            .Row(row =>
                            {
                                // 🔹 Left cell: Logo (fixed width)
                                row.ConstantItem(86).AlignLeft().AlignTop()
                                    .PaddingLeft(-5)
                                    .PaddingTop(-15)
                                    .Image("wwwroot/img/sucere_foods_corporation_logo1.jpg", ImageScaling.FitWidth);
                                // 🔹 Center cell: Company Info
                                row.RelativeItem().AlignCenter().Column(col =>
                                {
                                    col.Item().AlignCenter().Text("SUCERE FOODS CORPORATION")
                                        .FontSize(9).Bold().FontColor(Colors.Black);
                                    col.Item().AlignCenter().Text("First Bulacan Industrial City, Barangay Tikay City of Malolos, Bulacan, Philippines")
                                        .FontSize(7).FontColor(Colors.Grey.Darken1);
                                    col.Item().AlignCenter().Text("Tel. Nos. (044) 796-1060 / 796-1047")
                                        .FontSize(7).FontColor(Colors.Grey.Darken1);
                                    //col.Item().AlignCenter().Text($"Printed on: {DateTime.Now:MMMM dd, yyyy hh:mm tt}")
                                    //    .FontSize(7)
                                    //    .FontColor(Colors.Grey.Darken1);
                                });

                                // 🔹 Right cell (spacer to balance layout)
                                row.ConstantItem(70); // acts like invisible space for visual centering
                            });
                    });





                    var firstItem = dataList.FirstOrDefault();
                    var referenceNo = firstItem?.GetType().GetProperty("RefId")?.GetValue(firstItem, null)?.ToString() ?? "N/A";
                    var requestor = firstItem?.GetType().GetProperty("Requestor")?.GetValue(firstItem, null)?.ToString() ?? "N/A";
                    var reqtype = firstItem?.GetType().GetProperty("Reason")?.GetValue(firstItem, null)?.ToString() ?? "N/A";
                    var status = firstItem?.GetType().GetProperty("ApprovalStatus")?.GetValue(firstItem, null)?.ToString() ?? "N/A";
                    var description = firstItem?.GetType().GetProperty("RequestDetails")?.GetValue(firstItem, null)?.ToString() ?? "N/A";
                    var createdValue = firstItem?.GetType().GetProperty("Created")?.GetValue(firstItem, null);
                    DateTime parsedDate;

                    string dateRequested;

                    if (createdValue != null && DateTime.TryParse(createdValue.ToString(), out parsedDate))
                    {
                        dateRequested = parsedDate.ToString("MMMM dd, yyyy"); // ✅ or your preferred format
                        Debug.WriteLine(dateRequested);
                    }
                    else
                    {
                        dateRequested = "N/A";
                    }


                    // 🔹 SECTION TITLE AND DETAILS!
                    page.Content().PaddingVertical(1).Column(col =>
                    {
                        // Define a fixed width for the right column (Ref No + Date)
                        const float rightColumnWidth = 230; // adjust if needed

                        // 🔹 First Row: JOB REQUEST title (left) + Reference No (right)
                        col.Item()
                            .PaddingTop(2)
                            .PaddingBottom(10)
                            .AlignMiddle()
                            .Row(row =>
                            {
                                // Left side: title box
                                row.AutoItem().Element(x => x
                                    .Background(Colors.Black)
                                    .PaddingVertical(5)
                                    .PaddingHorizontal(8)
                                    .AlignLeft()
                                    .Text(title)
                                    .FontSize(10)
                                    .Bold()
                                    .FontColor(Colors.White)
                                );

                                // Right side: Reference No 
                                //row.ConstantItem(rightColumnWidth).AlignRight().Text(referenceNo)
                                row.RelativeItem()
                                    .AlignRight()
                                    .Text(referenceNo)

                                    .FontSize(12)
                                    .Bold()
                                    .FontColor(Colors.Red.Medium);
                            });


                        // 🔹 Second Row: Requestor (left) + Date (right)
                        col.Item()
                            .PaddingBottom(10)
                            .Row(row =>
                            {
                                // Left: Requestor
                                row.RelativeItem().Row(left =>
                                {
                                    left.ConstantItem(100).Text("Requestor:").FontSize(9);
                                    left.RelativeItem().Text(requestor).FontSize(9).Bold();
                                });
                                

                                row.RelativeItem().AlignRight().Row(right =>
                                {
                                    //right.ConstantItem(0).Text("Date:").FontSize(9);
                                    right.ConstantItem(140).PaddingLeft(50).Text("Date:").FontSize(9);
                                    right.RelativeItem(70).Text(dateRequested).FontSize(9);
                                });
                            });


                        // 🔹 Third Row: Request Type + Status
                        col.Item()
                            .PaddingBottom(10)
                            .Row(row =>
                        {
                            row.RelativeItem().Column(left =>
                            {
                                left.Item()
                                     .PaddingBottom(10)
                                    .Row(r =>
                                {
                                    r.ConstantItem(100).Text("Request Type:").FontSize(9);
                                    r.RelativeItem().Text(reqtype).FontSize(9);
                                });

                                left.Item()
                                   
                                    .Row(r =>
                                {
                                    r.ConstantItem(100).Text("Status:").FontSize(9);
                                    r.RelativeItem().Text(status).FontSize(9);
                                });
                            });
                        });

                        // 🔹 Description Header (acts like a table header)
                        col.Item()
                            .Background(Colors.Grey.Lighten2) // light gray header background
                            //.Border(1)
                            //.BorderColor(Colors.Grey.Darken1)
                            .PaddingVertical(5)
                            .PaddingHorizontal(8)
                            .AlignMiddle()
                            .AlignLeft()
                            .Text("Description")
                            .Bold()
                            .FontSize(9)
                            .FontColor(Colors.Black);

                        // 🔹 Description Content (text under the header)
                        col.Item()
                            //.Border(1)
                            //.BorderColor(Colors.Grey.Lighten1)
                            .Padding(8)
                            .PaddingBottom(100)
                            .Text(description ?? "N/A")
                            .FontSize(9)
                            .FontColor(Colors.Black);

                    
                        // 🔹 Signature Section (Prepared By, Checked By, Recommended By, Approved By)
                        col.Item()
                            .PaddingTop(20) // space above the section
                            .PaddingBottom(10)
                            .Row(row =>
                            {
                               
                                // Make 4 equal columns
                                row.RelativeItem().Column(col1 =>
                                {
                                    col1.Item().Text("Prepared By:").SemiBold().FontSize(9);
                                    //col1.Item().PaddingTop(30).Text("____________________").FontSize(10); // signature line
                                });

                                row.RelativeItem().Column(col2 =>
                                {
                                    col2.Item().Text("Checked By:").SemiBold().FontSize(9);
                                    //col2.Item().PaddingTop(30).Text("____________________").FontSize(10);
                                });

                                row.RelativeItem().Column(col3 =>
                                {
                                    col3.Item().Text("Recommended By:").SemiBold().FontSize(9);
                                    //col3.Item().PaddingTop(30).Text("____________________").FontSize(10);
                                });

                                row.RelativeItem().Column(col4 =>
                                {
                                    col4.Item().Text("Approved By:").SemiBold().FontSize(9);
                                    //col4.Item().PaddingTop(30).Text("____________________").FontSize(10);
                                });
                            });


                    });




                    //  FOOTER!!
                    page.Footer().PaddingTop(10).Row(row =>
                    {
                        // Left side: Printed on
                        row.RelativeItem().AlignLeft().Text($"Printed on: {DateTime.Now:MMMM dd, yyyy hh:mm tt}")
                            .FontSize(7)
                            .FontColor(Colors.Grey.Darken1);

                        // Right side: Page X of Y
                        row.RelativeItem().AlignRight().Text(x =>
                        {
                            x.CurrentPageNumber().FontSize(7).FontColor(Colors.Grey.Darken1);
                            x.Span(" of ").FontSize(7).FontColor(Colors.Grey.Darken1);
                            x.TotalPages().FontSize(7).FontColor(Colors.Grey.Darken1);
                        });
                    });
                });
            }).GeneratePdf(stream);

            return await Task.FromResult(stream.ToArray());
        }

        //  CELL STYLE HERE
        private static IContainer BlockCell(IContainer container, bool isEven)
        {
            var bgColor = isEven ? Colors.Grey.Lighten4 : Colors.White;
            return container
                .Background(bgColor)
                .PaddingVertical(3)
                .PaddingHorizontal(5)
                .AlignMiddle();
        }

        private static IContainer BlockHeader(IContainer container)
        {
            return container
                .Background(Colors.Grey.Lighten2)
                .PaddingVertical(4)
                .PaddingHorizontal(5)
                .AlignLeft()
                .Border(0.5f)
                .BorderColor(Colors.Grey.Lighten2);
        }
    }
}

using QuestPDF.Fluent;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;
using Document = QuestPDF.Fluent.Document;


namespace SFCTOFC.DailySalesPlanManagementInfrastructure.Services;

public class PDFService : IPDFService
{
    private const int MarginPTs = 39;
    private const string FontFamilyName = Fonts.Arial;
    private const float FontSize = 10F;
    private const int MaxCharsPerCell = 80;
    private const int MinCharsPerCell = 10;



    public async Task<byte[]> ExportAsync<TData>(
        IEnumerable<TData> data,
        Dictionary<string, Func<TData, object?>> mappers,
        string title,
        PdfOrientation orientation)

    {
        var stream = new MemoryStream();

        Document.Create(container =>
        {
            container.Page(page =>
            {
                page.Size(orientation == PdfOrientation.Landscape
                 ? PageSizes.A4.Landscape()
                 : PageSizes.A4.Portrait());

                page.Margin(MarginPTs);
                //page.Size(PageSizes.A4);   
                //page.Margin(15);          

                page.PageColor(Colors.White);
                page.DefaultTextStyle(x => x.FontSize(FontSize).FontFamily(FontFamilyName));

                //  HEADER DESIGN
                page.Header().Row(row =>
                {
                    //row.RelativeItem(1).Image("wwwroot/img/logo1.png").FitWidth();
                    row.RelativeItem().Column(col =>
                    {
                        col.Item()
                       .PaddingTop(15)
                       .PaddingBottom(2)
                       .Row(row =>
                       {

                           row.AutoItem().Element(x => x
                               //.Background(Colors.Black)
                               //.PaddingVertical(5)
                               //.PaddingHorizontal(8)
                               .AlignLeft()
                               .Text(title)
                               .FontSize(12)
                               .Bold()
                               .FontColor(Colors.Black)
                           );
                       });
                        col.Item().AlignLeft().Text("Sucere Foods Corporation").FontSize(7).FontColor(Colors.Grey.Darken1);
                        //col.Item().AlignCenter().Text("130-A 20th Avenuew, Tagumpay 1109 Quezon City NCR, Second District Philippines").FontSize(7).FontColor(Colors.Grey.Darken1);
                        col.Item().AlignLeft().Text("First Bulacan Industrial City, Barangay Tikay City of Malolos, Bulacan,  Philippines").FontSize(7).FontColor(Colors.Grey.Darken1);
                        col.Item().PaddingBottom(15).AlignLeft().Text("Tel. Nos. (044) 796-1060 / 796-1047").FontSize(7).FontColor(Colors.Grey.Darken1);
                        //col.Item()
                        //     .PaddingBottom(20)
                        //     .AlignLeft()
                        //     .Text("VAT Reg. TIN: 002-263-988-00000")
                        //     .FontSize(7)
                        //     .FontColor(Colors.Grey.Darken1);
                        //col.Item().AlignCenter().Text($"Generated on {DateTime.Now:MMMM dd, yyyy HH:mm}")
                        //    .FontSize(9).FontColor(Colors.Grey.Darken1);
                    });
                });

                //  CONTENT DESIGN
                page.Content().PaddingVertical(1).Column(col =>
                {
                    col.Item().AlignLeft().Text($"Printed on: {DateTime.Now:MMMM dd, yyyy hh:mm tt}").FontSize(7).FontColor(Colors.Grey.Darken1);

                    col.Item().Element(section =>
                    {
                        section.Table(table =>
                        {
                            var headers = mappers.Keys.ToList();
                            var dataList = data.ToList();

                            table.ColumnsDefinition(columns =>
                            {
                                foreach (var header in headers)
                                {
                                    if (header.Contains("Description", StringComparison.OrdinalIgnoreCase))
                                        columns.RelativeColumn(3);
                                    else if (header.Contains("Task", StringComparison.OrdinalIgnoreCase))
                                        columns.RelativeColumn(3);
                                    else
                                        columns.RelativeColumn(1); 
                                }
                            });

                            table.Header(header =>
                            {
                                foreach (var h in headers)
                                {
                                    header.Cell().Element(x => BlockHeader(x)
                                        .PaddingVertical(3)
                                        .PaddingHorizontal(4))
                                        .AlignLeft()
                                        .AlignTop()
                                        .Text(h)
                                        .FontSize(9)
                                        .Bold()
                                        .FontColor(Colors.Black);
                                }
                            });

                            foreach (var item in dataList)
                            {
                                //rowIndex++;
                                //bool isEven = rowIndex % 2 == 0;
                                var values = headers.Select(h => mappers[h](item));

                                foreach (var value in values)
                                {
                                    table.Cell().Element(c => BlockCell(c, false))
                                        .PaddingTop(3)
                                        .AlignLeft()
                                        .AlignTop()
                                        .Text($"{value}")
                                        .FontSize(9)
                                        .FontColor(Colors.Black);

                                }
                            }
                        });
                    });
                });

                //  FOOTER HERE
                page.Footer().PaddingTop(10).AlignRight().Text(x =>
                {
                    //x.Span("Page ").FontSize(9);
                    x.CurrentPageNumber().FontSize(9).FontColor(Colors.Grey.Darken1);
                    x.Span(" of ").FontSize(9).FontColor(Colors.Grey.Darken1);
                    x.TotalPages().FontSize(9).FontColor(Colors.Grey.Darken1);
                    //x.Span("  |  © 2025 Sucere Foods Corporation").FontColor(Colors.Grey.Darken1).FontSize(9);
                });
            });
        }).GeneratePdf(stream);

        return await Task.FromResult(stream.ToArray());
    }

    // CELL STYLE HERE
    private static IContainer BlockCell(IContainer container, bool isEven)
    {
        var bgColor = isEven ? Colors.Grey.Lighten4 : Colors.White;
        return container
            .Background(bgColor)
            .PaddingVertical(3)
            .PaddingHorizontal(5)
            .AlignLeft()
            .AlignTop();
            //.AlignMiddle();
    }

    private static IContainer BlockHeader(IContainer container)
    {
        return container
            .Background(Colors.Grey.Lighten2)
            .PaddingVertical(4)
            .PaddingHorizontal(5)
            .AlignLeft()
            .AlignTop()
            .Border(0.5f)
            .BorderColor(Colors.Grey.Lighten2);

    }

}

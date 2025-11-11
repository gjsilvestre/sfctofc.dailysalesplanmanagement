using System.Collections;
using System.Text;
using SFCTOFC.DailySalesPlanManagementApplication.Features.Marketing.MRKSalesToTrade.Caching;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace SFCTOFC.DailySalesPlanManagementApplication.Features.Marketing.MRKSalesToTrade.Queries.GetAll;


public class GetSalesToTradeKPISPQuery : IRequest<Result<string>>
{
    public DateTime? FromDate { get; set; }
    public DateTime? ToDate { get; set; }
    public string? Distributor { get; set; }
    public string? Region { get; set; }
    public string? Report { get; set; }
    public string? Username { get; set; }
    public IEnumerable<string>? Tags => SalesToTradeKPICacheKey.Tags;
}

public class GetSalesToTradeKPISPQueryHandler : IRequestHandler<GetSalesToTradeKPISPQuery, Result<string>>
{
    private readonly IStringLocalizer<GetSalesToTradeKPISPQueryHandler> _localizer;
    private readonly IDatabaseService _databaseService;
    public GetSalesToTradeKPISPQueryHandler(
        IStringLocalizer<GetSalesToTradeKPISPQueryHandler> localizer,
        IDatabaseService databaseService
    )
    {
        _localizer = localizer;
        _databaseService = databaseService;
    }
    public async Task<Result<string>> Handle(GetSalesToTradeKPISPQuery request, CancellationToken cancellationToken)
    {
        try
        {
            string _repoert = request.Report;

            var strTableWidth = (5 * 500) + 600;
            var strTableSpan = 5;

            var strTableFormat1 = $"width={strTableWidth}";
            var strTableFormat2 = $"width={strTableWidth} colspan=\"$strTableSpan\"";
            var strFontStyle1 = "font-family:Arial,'Luxi Sans',Helvetica;";
            var strFontStyle2 = "font-family:Arial,'Luxi Sans',Helvetica;font-weight:bold;";
            var strStyle1 = $"style=\"{strFontStyle1};font-size:8pt;\"";
            var strStyle2 = $"style=\"{strFontStyle2};font-size:8pt;\"";
            var strStyle3 = $"style=\"{strFontStyle2};font-size:10pt;\"";
            var strStyle13 = $"style=\"{strFontStyle2};font-size:8pt;color:#FFF;\"";
            var strStyle16 = "style=\"min-width:80px;font-family:Arial,'Luxi Sans',Helvetica;font-weight:bold;font-size:8pt;color:#FFF;\"";
            var strStyle17 = "style=\"min-width:80px;font-family:Arial,'Luxi Sans',Helvetica;font-size:8pt;padding:10px;\"";
            var strStyle18 = "style=\"min-width:80px;font-family:Arial,'Luxi Sans',Helvetica;font-weight:bold;font-size:8pt;border-bottom: 1pt solid black;\"";

            var strDataAlign = "left";

            var sb = new StringBuilder();

            sb.AppendLine("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">");
            sb.AppendLine("<link rel=\"shortcut icon\" href=\"../AssetImages/wcsfavicon.ico\" />");
            sb.AppendLine($"<head><title>{ _repoert }</title></head>");
            sb.AppendLine($"<table border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"1\" {strTableFormat1}>");
            sb.AppendLine(" <tr>");
            sb.AppendLine($" <td align=\"{strDataAlign}\" {""}>&nbsp;</td>");
            sb.AppendLine(" </tr>");
            sb.AppendLine(" <tr>");
            sb.AppendLine($" <td align=\"{strDataAlign}\" {strStyle2} {strTableFormat2}>{"SUCERE FOODS CORPORATION"}</td>");
            sb.AppendLine(" </tr>");
            sb.AppendLine(" <tr>");
            sb.AppendLine($" <td align=\"{strDataAlign}\" {strStyle3} {strTableFormat2}>{"SALES TO TRADE KPI REPORT"}</td>");
            sb.AppendLine(" </tr>");
            sb.AppendLine(" <tr>");
            sb.AppendLine($" <td align=\"{strDataAlign}\" {strStyle1} {strTableFormat2}>{"as of " + DateTime.Now + " (" + request.Distributor + ")"}");
            sb.AppendLine(" </td>");
            sb.AppendLine(" </tr>");
            sb.AppendLine(" <tr>");
            sb.AppendLine($" <td align=\"{strDataAlign}\" style =\"font-size:20pt\" {strTableFormat1}>&nbsp;</td>");
            sb.AppendLine(" </tr>");
            sb.AppendLine("</table>");

            string strPrinted = DateTime.Now.ToString("r");
            sb.AppendLine($"<table border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"1\" {strTableFormat1}>");
            sb.AppendLine(" <tr>");
            sb.AppendLine($" <td {strTableFormat2} {strStyle1}>Printed By : {request.Username}</td>");
            sb.AppendLine(" </tr>");
            sb.AppendLine(" <tr>");
            sb.AppendLine($" <td {strTableFormat2} {strStyle1}>{strPrinted}</td>");
            sb.AppendLine(" </tr>");
            sb.AppendLine(" <tr>");
            sb.AppendLine($" <td {strTableFormat2} {strStyle1}>&nbsp;</td>");
            sb.AppendLine(" </tr>");
            sb.AppendLine("</table>");

            sb.AppendLine($" <table border=\"0\" align=\"center\" {strTableFormat1} cellpadding=\"0\" cellspacing=\"1\"> ");
            sb.AppendLine($" <tr height=\"30\" bgcolor=\"#0A3766\"> ");
            sb.AppendLine($" <td align=\"center\" width=\"150\" {strStyle16} > { request.FromDate + "-" + request.ToDate } </td> ");
            sb.AppendLine($" <td align=\"center\" width=\"150\" {strStyle16} >BAKING</td> ");
            sb.AppendLine($" <td align=\"center\" width=\"150\" {strStyle16} >BARLINE</td> ");
            sb.AppendLine($" <td align=\"center\" width=\"150\" {strStyle16} >CHOCOLATE</td> ");
            sb.AppendLine($" <td align=\"center\" width=\"150\" {strStyle16} >GUMMY</td> ");
            sb.AppendLine($" <td align=\"center\" width=\"150\" {strStyle16} >MARSHMALLOW</td> ");
            sb.AppendLine($" <td align=\"center\" width=\"150\" {strStyle16} >PANNING</td> ");
            sb.AppendLine($" <td align=\"center\" width=\"150\" {strStyle16} >PROMO</td> ");
            sb.AppendLine($" <td align=\"center\" width=\"150\" {strStyle16} >RICE CRISPIES</td> ");
            sb.AppendLine($" <td align=\"center\" width=\"150\" {strStyle16} >SPECIALTY</td> ");
            sb.AppendLine($" <td align=\"center\" width=\"150\" {strStyle16} >TOFC CHOCOLATES</td> ");
            sb.AppendLine($" <td align=\"center\" width=\"150\" {strStyle16} >TOTAL</td> ");
            sb.AppendLine($" </tr> ");
            
            #region DEFAULT CHANNELS

            DataTable resDefaultChannels = new DataTable();
            DictionaryEntry[] paramDefaultChannels = new DictionaryEntry[]
            {
                new DictionaryEntry("@DateFrom", request.FromDate),
                new DictionaryEntry("@DateTo", request.ToDate),
                new DictionaryEntry("@Distributor", request.Distributor),
                new DictionaryEntry("@Region", request.Region),
                new DictionaryEntry("@Mode", "DEFAULTCHANNELS")
            };

            resDefaultChannels = await _databaseService.ExecuteStoredProcedureAsync("SP_MarketingSalesToTrade", paramDefaultChannels);

            #endregion

            #region KPI BY CHANNELS

            DataTable resChannelsVolAmt = new DataTable();
            DictionaryEntry[] paramChannelsVolAmt = new DictionaryEntry[]
            {
                new DictionaryEntry("@DateFrom", request.FromDate),
                new DictionaryEntry("@DateTo", request.ToDate),
                new DictionaryEntry("@Distributor", request.Distributor),
                new DictionaryEntry("@Region", request.Region),
                new DictionaryEntry("@Mode", "CHANNELVOLUMEINAMOUNT")
            };

            resChannelsVolAmt = await _databaseService.ExecuteStoredProcedureAsync("SP_MarketingSalesToTrade", paramChannelsVolAmt);

            #endregion

            sb.AppendLine($" <tr height=\"20\" bgcolor=\"#0A3766\"> ");
            sb.AppendLine($" <td align=\"center\" rowspan=\"2\" width=\"320\" {strStyle16} >Sales Revenue in Pesos </td> ");

            //Percentage Share and Subtotals
            sb.AppendLine($@" <td align=""center"" width=""150"" {strStyle16}>{resChannelsVolAmt.AsEnumerable().FirstOrDefault(r => (r["ChannelType"]?.ToString() ?? "") == "AAA_% SHARE")?["BAKING"]?.ToString() ?? ""}</td>");
            sb.AppendLine($@" <td align=""center"" width=""150"" {strStyle16}>{resChannelsVolAmt.AsEnumerable().FirstOrDefault(r => (r["ChannelType"]?.ToString() ?? "") == "AAA_% SHARE")?["BARLINE"]?.ToString() ?? ""}</td>");
            sb.AppendLine($@" <td align=""center"" width=""150"" {strStyle16}>{resChannelsVolAmt.AsEnumerable().FirstOrDefault(r => (r["ChannelType"]?.ToString() ?? "") == "AAA_% SHARE")?["CHOCOLATE"]?.ToString() ?? ""}</td>");
            sb.AppendLine($@" <td align=""center"" width=""150"" {strStyle16}>{resChannelsVolAmt.AsEnumerable().FirstOrDefault(r => (r["ChannelType"]?.ToString() ?? "") == "AAA_% SHARE")?["GUMMY"]?.ToString() ?? ""}</td>");
            sb.AppendLine($@" <td align=""center"" width=""150"" {strStyle16}>{resChannelsVolAmt.AsEnumerable().FirstOrDefault(r => (r["ChannelType"]?.ToString() ?? "") == "AAA_% SHARE")?["MARSHMALLOW"]?.ToString() ?? ""}</td>");
            sb.AppendLine($@" <td align=""center"" width=""150"" {strStyle16}>{resChannelsVolAmt.AsEnumerable().FirstOrDefault(r => (r["ChannelType"]?.ToString() ?? "") == "AAA_% SHARE")?["PANNING"]?.ToString() ?? ""}</td>");
            sb.AppendLine($@" <td align=""center"" width=""150"" {strStyle16}>{resChannelsVolAmt.AsEnumerable().FirstOrDefault(r => (r["ChannelType"]?.ToString() ?? "") == "AAA_% SHARE")?["PROMO"]?.ToString() ?? ""}</td>");
            sb.AppendLine($@" <td align=""center"" width=""150"" {strStyle16}>{resChannelsVolAmt.AsEnumerable().FirstOrDefault(r => (r["ChannelType"]?.ToString() ?? "") == "AAA_% SHARE")?["RICE CRISPIES"]?.ToString() ?? ""}</td>");
            sb.AppendLine($@" <td align=""center"" width=""150"" {strStyle16}>{resChannelsVolAmt.AsEnumerable().FirstOrDefault(r => (r["ChannelType"]?.ToString() ?? "") == "AAA_% SHARE")?["SPECIALTY"]?.ToString() ?? ""}</td>");
            sb.AppendLine($@" <td align=""center"" width=""150"" {strStyle16}>{resChannelsVolAmt.AsEnumerable().FirstOrDefault(r => (r["ChannelType"]?.ToString() ?? "") == "AAA_% SHARE")?["TOFC CHOCOLATE"]?.ToString() ?? ""}</td>");
            sb.AppendLine($@" <td align=""center"" width=""150"" {strStyle16}>{resChannelsVolAmt.AsEnumerable().FirstOrDefault(r => (r["ChannelType"]?.ToString() ?? "") == "AAA_% SHARE")?["TOTAL"]?.ToString() ?? ""}</td>");
            sb.AppendLine($@" </tr> ");
            sb.AppendLine($" <tr height=\"20\" bgcolor=\"#0A3766\"> ");
            sb.AppendLine($@" <td align=""center"" width=""150"" {strStyle16}>{Convert.ToDecimal(resChannelsVolAmt.AsEnumerable().FirstOrDefault(r => (r["ChannelType"]?.ToString() ?? "") == "ZZZ_SUBTOTAL")?["BAKING"] ?? 0):N2}</td>");
            sb.AppendLine($@" <td align=""center"" width=""150"" {strStyle16}>{Convert.ToDecimal(resChannelsVolAmt.AsEnumerable().FirstOrDefault(r => (r["ChannelType"]?.ToString() ?? "") == "ZZZ_SUBTOTAL")?["BARLINE"] ?? 0):N2}</td>");
            sb.AppendLine($@" <td align=""center"" width=""150"" {strStyle16}>{Convert.ToDecimal(resChannelsVolAmt.AsEnumerable().FirstOrDefault(r => (r["ChannelType"]?.ToString() ?? "") == "ZZZ_SUBTOTAL")?["CHOCOLATE"] ?? 0):N2}</td>");
            sb.AppendLine($@" <td align=""center"" width=""150"" {strStyle16}>{Convert.ToDecimal(resChannelsVolAmt.AsEnumerable().FirstOrDefault(r => (r["ChannelType"]?.ToString() ?? "") == "ZZZ_SUBTOTAL")?["GUMMY"] ?? 0):N2}</td>");
            sb.AppendLine($@" <td align=""center"" width=""150"" {strStyle16}>{Convert.ToDecimal(resChannelsVolAmt.AsEnumerable().FirstOrDefault(r => (r["ChannelType"]?.ToString() ?? "") == "ZZZ_SUBTOTAL")?["MARSHMALLOW"] ?? 0):N2}</td>");
            sb.AppendLine($@" <td align=""center"" width=""150"" {strStyle16}>{Convert.ToDecimal(resChannelsVolAmt.AsEnumerable().FirstOrDefault(r => (r["ChannelType"]?.ToString() ?? "") == "ZZZ_SUBTOTAL")?["PANNING"] ?? 0):N2}</td>");
            sb.AppendLine($@" <td align=""center"" width=""150"" {strStyle16}>{Convert.ToDecimal(resChannelsVolAmt.AsEnumerable().FirstOrDefault(r => (r["ChannelType"]?.ToString() ?? "") == "ZZZ_SUBTOTAL")?["PROMO"] ?? 0):N2}</td>");
            sb.AppendLine($@" <td align=""center"" width=""150"" {strStyle16}>{Convert.ToDecimal(resChannelsVolAmt.AsEnumerable().FirstOrDefault(r => (r["ChannelType"]?.ToString() ?? "") == "ZZZ_SUBTOTAL")?["RICE CRISPIES"] ?? 0):N2}</td>");
            sb.AppendLine($@" <td align=""center"" width=""150"" {strStyle16}>{Convert.ToDecimal(resChannelsVolAmt.AsEnumerable().FirstOrDefault(r => (r["ChannelType"]?.ToString() ?? "") == "ZZZ_SUBTOTAL")?["SPECIALTY"] ?? 0):N2}</td>");
            sb.AppendLine($@" <td align=""center"" width=""150"" {strStyle16}>{Convert.ToDecimal(resChannelsVolAmt.AsEnumerable().FirstOrDefault(r => (r["ChannelType"]?.ToString() ?? "") == "ZZZ_SUBTOTAL")?["TOFC CHOCOLATE"] ?? 0):N2}</td>");
            sb.AppendLine($@" <td align=""center"" width=""150"" {strStyle16}>{Convert.ToDecimal(resChannelsVolAmt.AsEnumerable().FirstOrDefault(r => (r["ChannelType"]?.ToString() ?? "") == "ZZZ_SUBTOTAL")?["TOTAL"] ?? 0):N2}</td>");
            sb.AppendLine($@" </tr> ");

            foreach (DataRow row in resDefaultChannels.Rows)
            {
                
            }

            foreach (DataRow row in resDefaultChannels.Rows)
            {

            }

            string strReport = sb.ToString();
            byte[] result = Encoding.UTF8.GetBytes(strReport);

            return await Result<string>.SuccessAsync(strReport);

            
        }
        catch (Exception)
        {
            throw;
        }
    }
}
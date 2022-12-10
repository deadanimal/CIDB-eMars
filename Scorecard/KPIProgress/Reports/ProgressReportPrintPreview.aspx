<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProgressReportPrintPreview.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.KPIProgress.Reports.ProgressReportPrintPreview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title runat="server" id="title"></title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        table, td, th {
            border: 1px solid black;
        }

        th, td {
            padding: 5px;
            text-align: left;
        }

        .space {
            width: 200px;
            display: inline-block;
        }

        @media print {
            #printPageButton {
                display: none;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false"
                ItemType="MAT.App.Scorecard.Reports.Datasource.KpiProgressReport"
                DefaultMode="ReadOnly" SelectMethod="fvParent_SelectItem">
                <ItemTemplate>
                    <div class="form-group m-form__group mat-form-group" style="text-align: center; font-size: xx-large;">
                        <%# "Progress Report " +  Item.Period %>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <div class="space">
                            <MAT:Label runat="server" Text='<%# Item.ThrustTitle %>'></MAT:Label>
                        </div>
                        <span>:</span>
                        <MAT:Label runat="server" Text='<%# Item.ThrustName %>'></MAT:Label>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <div class="space">
                            <MAT:Label runat="server" Text='<%# Item.InitiativeTitle %>'></MAT:Label>
                        </div>
                        <span>:</span>
                        <MAT:Label runat="server" Text='<%# Item.InitiativeName %>'></MAT:Label>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <div class="space">
                            <MAT:Label runat="server" Text='<%# Item.SubInitiativeTitle %>'></MAT:Label>
                        </div>
                        <span>:</span>
                        <MAT:Label runat="server" Text='<%# Item.SubInitiativeName %>'></MAT:Label>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <div class="space">
                            <MAT:Label runat="server" Text="KPI"></MAT:Label>
                        </div>
                        <span>:</span>
                        <MAT:Label runat="server" Text='<%# Item.MasterKpi %>'></MAT:Label>

                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <div class="space">
                            <MAT:Label runat="server" Text="SUB-KPI"></MAT:Label>
                        </div>
                        <span>:</span>
                        <MAT:Label runat="server" Text='<%# Item.SubKpi %>'></MAT:Label>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <div class="space">
                            <MAT:Label runat="server" Text="KPI LEADER"></MAT:Label>
                        </div>
                        <span>:</span>
                        <MAT:Label runat="server" Text='<%# Item.KpiLeader %>'></MAT:Label>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <div class="space">
                            <MAT:Label runat="server" Text="OWNER"></MAT:Label>
                        </div>
                        <span>:</span>
                        <MAT:Label runat="server" Text='<%# Item.Owner %>'></MAT:Label>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <div class="space">
                            <MAT:Label runat="server" Text="OFFICER IN-CHARGE"></MAT:Label>
                        </div>
                        <span>:</span>
                        <MAT:Label runat="server" Text='<%# Item.Oic %>'></MAT:Label>
                    </div>
                    <br />
                    <div style="border: 1px solid black; padding: 10px;">
                        <%# Item.ReportContent %>
                    </div>
                </ItemTemplate>
            </MAT:FormView>
        </div>
    </form>
    <button id="printPageButton" onclick="window.print();">Click here to print</button>
</body>
</html>

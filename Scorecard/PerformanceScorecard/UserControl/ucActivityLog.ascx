<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucActivityLog.ascx.cs" Inherits="MAT.WebApp.App.Scorecard.PerformanceScorecard.UserControl.ucActivityLog" %>

<Metronic:GridView runat="server" ID="gvList" SelectMethod="gvList_GetData"
    ItemType="MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.ActivityLogViewModel">
    <Columns>
        <MAT:BoundField DataField="EffectiveDate" HeaderText="EffectiveDate" DataFormatString="{0:dd/MM/yyyy}"></MAT:BoundField>
        <MAT:EnumBoundField DataField="FieldName" HeaderText="FieldName" EnumName="MAT.App.Scorecard.Enumerate.FieldType"></MAT:EnumBoundField>
        <MAT:BoundField DataField="Keyword" HeaderText="Keyword"></MAT:BoundField>
        <MAT:TemplateField HeaderText="OldData">
            <ItemTemplate>
                <%# ConvertData(Item.OldData.ToString(), (byte)Item.FieldName) %>
            </ItemTemplate>
        </MAT:TemplateField>
        <MAT:TemplateField HeaderText="NewData">
            <ItemTemplate>
                <%# ConvertData(Item.NewData.ToString(), (byte)Item.FieldName) %>
            </ItemTemplate>
        </MAT:TemplateField>
        <MAT:TemplateField HeaderText="ActionDateBy" SortExpression="ActionDate">
            <ItemTemplate>
                <%# !string.IsNullOrEmpty(Convert.ToString(Item.ActionDate)) ? (Eval("ActionDate", "{0:dd/MM/yyyy HH:mm:ss}") + " / " + Eval("ActionBy")) : "" %>
            </ItemTemplate>
        </MAT:TemplateField>
    </Columns>
</Metronic:GridView>

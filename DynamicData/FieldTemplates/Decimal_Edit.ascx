<%@ Control Language="C#" CodeBehind="Decimal_Edit.ascx.cs" Inherits="MAT.WebApp.App.Decimal_EditField" %>

<Metronic:TextBox ID="TextBox1" runat="server" Text='<%# FieldValueEditString%>' Columns="10"></Metronic:TextBox>

<asp:CompareValidator runat="server" ID="CompareValidator1" ControlToValidate="TextBox1" Display="Dynamic"
    Operator="DataTypeCheck" Type="Double" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
<asp:RangeValidator runat="server" ID="RangeValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="TextBox1" Type="Double"
    Enabled="false" EnableClientScript="true" MinimumValue="0" MaximumValue="100" Display="Dynamic" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="TextBox1" Display="Dynamic" />


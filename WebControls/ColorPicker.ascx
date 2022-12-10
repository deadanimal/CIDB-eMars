<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ColorPicker.ascx.cs" Inherits="MAT.WebApp.App.ColorPicker" %>

<Metronic:TextBox runat="server" ID="txtText" BorderStyle="Solid" Width="18px" Mandatory="true" style="display: inline;"></Metronic:TextBox><%--<asp:Image runat="server" ID="imgIndicator" />--%>
<asp:ImageButton runat="server" ID="imgcolorpicker" ImageUrl="~/Images/cp_button.png" />
<AjaxControlToolkit:ColorPickerExtender runat="server" ID="colorpickerextender1" TargetControlID="txtText"
    PopupButtonID="imgcolorpicker" OnClientColorSelectionChanged="colorChanged" />

<script type="text/javascript">
    function colorChanged(sender) {
    sender.get_element().style.color =
       "#" + sender.get_selectedColor();
    sender.get_element().style.backgroundColor =
       "#" + sender.get_selectedColor();
}
</script>
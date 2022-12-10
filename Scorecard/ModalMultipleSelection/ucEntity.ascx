<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucEntity.ascx.cs" Inherits="MAT.WebApp.App.Scorecard.ModalMultipleSelection.ucEntity" %>

<asp:UpdatePanel runat="server" ID="upParent" UpdateMode="Conditional">
    <ContentTemplate>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <MAT:Literal runat="server" ID="ltText"></MAT:Literal>
                    <asp:ImageButton runat="server" ID="btnShow" ImageUrl="~/Images/search.gif" CausesValidation="false" OnClick="btnShow_Click" />
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
<div style="display: none;">
    <asp:LinkButton ID="hidButton" runat="server">LinkButton</asp:LinkButton>
</div>
<MAT:Panel ID="pnlModalPopup" Width="880px" runat="server" Style="display: none" SkinID="ModalPopup">
    <MAT:Panel ID="pnlModalPopupHeader" runat="server" SkinID="ModalPopupHeader">
        <table border="0" width="100%" cellpadding="0" cellspacing="1">
            <tr>
                <td>
                    <MAT:Literal ID="ltTitle" runat="server" Text="SearchEntity"></MAT:Literal>
                </td>
                <td align="right">
                    <asp:LinkButton ID="btnModalClose" runat="server">X</asp:LinkButton>
                </td>
            </tr>
        </table>
    </MAT:Panel>
    <br />
    <MAT:Panel ID="Panel3" runat="server">
        <asp:UpdatePanel ID="UpdatePanelForm" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table width="100%" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="50%">
                            <table class="defaultTable" width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="formLabel">
                                        <MAT:Literal ID="ltEntityCode" runat="server" Text="EntityCode"></MAT:Literal>
                                    </td>
                                    <td class="topPadding">&nbsp;:&nbsp;
                                    </td>
                                    <td class="formText">
                                        <MAT:TextBox ID="txtEntityCode" runat="server"></MAT:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="50%">
                            <table class="defaultTable" width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="formLabel">
                                        <MAT:Literal ID="Literal1" runat="server" Text="EntityName"></MAT:Literal>
                                    </td>
                                    <td class="topPadding">&nbsp;:&nbsp;
                                    </td>
                                    <td class="formText">
                                        <MAT:TextBox ID="txtEntityName" runat="server"></MAT:TextBox>
                                        <MAT:Button ID="btnSearch" runat="server" Text="Search" CausesValidation="false" OnClick="btnSearch_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <br />
                <div align="right">
                    <MAT:Button ID="btnSelect" runat="server" Text="Select" OnClick="btnSelect_Click" />
                </div>
                <Metronic:GridView ID="gvListing" runat="server" DataSourceID="odsListing" DataKeyNames="EntityID,Code,Name" Width="100%" AllowSorting="true" AllowPaging="true" OnDataBound="gvListing_DataBound">
                    <Columns>
                        <MAT:TemplateField>
                            <HeaderTemplate>
                                <asp:CheckBox ID="cbAll" runat="server" onclick="checkAll(this);" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="cbCheck" runat="server" />
                            </ItemTemplate>
                        </MAT:TemplateField>
                        <MAT:BoundField DataField="Code" HeaderText="EntityCode" SortExpression="Code" />
                        <MAT:BoundField DataField="Name" HeaderText="EntityName" SortExpression="Name" />
                    </Columns>
                </Metronic:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </MAT:Panel>
</MAT:Panel>
<AjaxControlToolkit:ModalPopupExtender ID="ModalPopupExtender" runat="server" TargetControlID="hidButton" PopupControlID="pnlModalPopup" CancelControlID="btnModalClose" BackgroundCssClass="modalBackground">
</AjaxControlToolkit:ModalPopupExtender>
<asp:ObjectDataSource ID="odsListing" runat="server" SelectMethod="Entity" TypeName="MAT.App.Scorecard.ODS.ModalMultipleSelection" OnSelecting="odsListing_Selecting" OnSelected="odsListing_Selected">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtEntityCode" Name="code" PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="txtEntityName" Name="name" PropertyName="Text" Type="String" />
        <asp:Parameter Name="includeIds" Type="Object" />
    </SelectParameters>
</asp:ObjectDataSource>
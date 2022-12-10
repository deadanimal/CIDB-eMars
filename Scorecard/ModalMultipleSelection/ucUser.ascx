<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucUser.ascx.cs" Inherits="MAT.WebApp.App.Scorecard.ModalMultipleSelection.ucUser" %>

<asp:UpdatePanel runat="server" ID="upParent" UpdateMode="Conditional">
    <ContentTemplate>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td valign="top">
                    <MAT:Literal runat="server" ID="ltText"></MAT:Literal>&nbsp;
                    <asp:ImageButton runat="server" ID="btnShow" ImageUrl="~/Images/search.gif" CausesValidation="false" OnClick="btnShow_Click" />
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
<div style="display: none;">
    <asp:LinkButton runat="server" ID="hidButton">LinkButton</asp:LinkButton>
</div>
<MAT:Panel ID="pnlModalPopup" Width="1024px" runat="server" Style="display: none" SkinID="ModalPopup">
    <MAT:Panel ID="pnlModalPopupHeader" runat="server" SkinID="ModalPopupHeader">
        <table border="0" width="100%" cellpadding="0" cellspacing="1">
            <tr>
                <td>
                    <MAT:Literal ID="ltTitle" runat="server" Text="SearchUser"></MAT:Literal>
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
                                        <MAT:Literal ID="Literal1" runat="server" Text="Name"></MAT:Literal>
                                    </td>
                                    <td class="topPadding">&nbsp;:&nbsp;
                                    </td>
                                    <td class="formText">
                                        <MAT:TextBox ID="txtName" runat="server"></MAT:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="50%">
                            <table class="defaultTable" width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="formLabel">
                                        <MAT:Literal ID="ltEntityName" runat="server" Text="EntityName"></MAT:Literal>
                                    </td>
                                    <td class="topPadding">&nbsp;:&nbsp;
                                    </td>
                                    <td class="formText">
                                        <MAT:DropDownList ID="ddlEntity" runat="server" DataSourceID="odsEntity" DataTextField="Value" DataValueField="Key"></MAT:DropDownList>
                                        <MAT:Button ID="btnSearch" runat="server" Text="Search" CausesValidation="false" OnClick="btnSearch_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <br />
                <div align="right">
                    <MAT:Button ID="btnSelect" runat="server" Text="Select"
                        OnClick="btnSelect_Click" />
                </div>
                <Metronic:GridView ID="gvListing" runat="server" DataSourceID="odsListing" DataKeyNames="UserId,DisplayName" AllowSorting="true" AllowPaging="true" OnDataBound="gvListing_DataBound">
                    <Columns>
                        <MAT:TemplateField>
                            <HeaderTemplate>
                                <asp:CheckBox ID="cbAll" runat="server" onclick="checkAll(this);" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="cbCheck" runat="server" />
                            </ItemTemplate>
                        </MAT:TemplateField>
                        <MAT:BoundField DataField="DisplayName" HeaderText="Name" SortExpression="DisplayName" />
                        <MAT:BoundField DataField="EntityName" HeaderText="EntityName" SortExpression="EntityName" />
                    </Columns>
                </Metronic:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </MAT:Panel>
</MAT:Panel>
<AjaxControlToolkit:ModalPopupExtender runat="server" ID="ModalPopupExtender" TargetControlID="hidButton" PopupControlID="pnlModalPopup"
    CancelControlID="btnModalClose" BackgroundCssClass="modalBackground">
</AjaxControlToolkit:ModalPopupExtender>
<MAT:ObjectDataSource runat="server" ID="odsListing" SelectMethod="User" TypeName="MAT.App.Scorecard.ODS.ModalMultipleSelection"
    OnSelecting="odsListing_Selecting" OnSelected="odsListing_Selected">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtName" Name="name" PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="ddlEntity" Name="entityId" PropertyName="Text" DbType="Guid" />
        <asp:Parameter Name="includeIds" Type="Object" />
    </SelectParameters>
</MAT:ObjectDataSource>
<asp:ObjectDataSource ID="odsEntity" runat="server" SelectMethod="ListEntityDropDown" TypeName="MAT.App.General.Entity.DropDown">
    <SelectParameters>
        <asp:Parameter Name="defaultText" Type="Object" DefaultValue="1" />
    </SelectParameters>
</asp:ObjectDataSource>

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="simpleEmployeeList.ascx.cs" Inherits="MAT.WebApp.App.Scorecard.Employee.simpleEmployeeList" %>

<asp:UpdatePanel ID="upMain" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <MAT:Panel ID="cpFilter" runat="server" TargetControlID="pnlFilterBody" />
        <asp:Panel ID="pnlFilterBody" runat="server" SkinID="FilterBody">
            <table class="filterTable">
                <tr>
                    <td>
                        <table class="defaultTable">
                            <tr>
                                <td class="formLabel">
                                    <MAT:Literal ID="Literal3" runat="server" Text="Name"></MAT:Literal>
                                </td>
                                <td class="topPadding">&nbsp;:&nbsp;
                                </td>
                                <td>
                                    <MAT:TextBox ID="txtName" runat="server"></MAT:TextBox>
                                    <MAT:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <%--<td width="50%">
                        <table class="defaultTable">

                            <tr>
                                <td class="formLabel">
                                    <MAT:Literal ID="Literal1" runat="server" Text="Status %>"></MAT:Literal>
                                </td>
                                <td class="topPadding">&nbsp;:&nbsp;
                                </td>
                                <td>
                                    <MAT:WebDropDownList ID="ddlStatus" runat="server" DataSourceID="odsStatus"></MAT:WebDropDownList>
                                    <MAT:Button ID="btnSearch" runat="server" Text="Search %>"
                                        OnClick="btnSearch_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>--%>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <div align="right">
            <MAT:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" ButtonType="Insert" />
        </div>
        <MAT:GridView ID="gvListing" runat="server" DataSourceID="odsListing" DataKeyNames="EmployeeId"
            OnSelectedIndexChanged="gvListing_SelectedIndexChanged" PagerType="DropDownList" EnableViewState="false">
            <Columns>
                <MAT:CommandField ShowSelectButton="true" SelectText="Select" HeaderStyle-Width="50px" />
                <MAT:BoundField DataField="DisplayName" HeaderText="Name" SortExpression="DisplayName" />
                <MAT:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <MAT:BoundField DataField="EntityName" HeaderText="Entity" SortExpression="EntityName" />
                <MAT:EnumBoundField DataField="EmployeeStatus" HeaderText="Status" SortExpression="EmployeeStatus"
                    EnumName="MAT.App.Scorecard.Employee.Enumerate.EmployeeStatus" />
            </Columns>
        </MAT:GridView>
        <MAT:ObjectDataSource ID="odsListing" runat="server" SelectMethod="ListEmployee"
            TypeName="MAT.App.Scorecard.Employee.ODS.Employee">
            <SelectParameters>
                <asp:ControlParameter Name="displayName" Type="String" ControlID="txtName" PropertyName="Text" />
            </SelectParameters>
        </MAT:ObjectDataSource>
        <asp:ObjectDataSource ID="odsStatus" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="EnumDropdown" TypeName="MAT.App.Common.ODS.Shared">
            <SelectParameters>
                <asp:Parameter Name="defaultText" Type="Object" DefaultValue="1" />
                <asp:Parameter Name="enumFullName" Type="String" DefaultValue="MAT.App.Scorecard.Employee.Enumerate.EmployeeStatus" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>

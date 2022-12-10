<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCodeMasterIndex.ascx.cs" Inherits="MAT.WebApp.App.Administration.General.CodeMaster.UserControl.ucCodeMasterIndex" %>
<asp:UpdatePanel ID="upParent" runat="server" UpdateMode="Always">
    <ContentTemplate>
        <Metronic:SearchPanel ID="SearchPanel" runat="server" AssociatedGridViewId="GridView1" AddNavigateUrl="Add.aspx">
            <SearchTemplate>
                <div class="row">
                    <div class="col-md-6">
                         <div class="form-group m-form__group mat-form-group" id="divCode" runat="server">
                            <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="Code" Text="Code" />
                            <div class="col-sm-7">
                                <Metronic:TextBox ID="Code" runat="server"></Metronic:TextBox>
                            </div>
                        </div>
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="Name" Text="Name" />
                            <div class="col-sm-7">
                                <Metronic:TextBox ID="Name" runat="server"></Metronic:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                         <div class="form-group m-form__group mat-form-group">
                        </div>
                        <div class="col-sm-12">
                            <div class="pull-right">
                                <Metronic:LinkButton ID="btnSearch" runat="server" SkinID="ButtonSearch" CausesValidation="false" OnClick="btnSearch_Click"></Metronic:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </SearchTemplate>
        </Metronic:SearchPanel>

        <div class="table-responsive">
            <Metronic:GridView ID="GridView1" runat="server" ItemType="MAT.App.General.CodeMaster.CodeMasterViewModel" DataKeyNames="CodeMasterId"
                SelectMethod="GridView1_GetData">
                <Columns>
                    <MAT:TemplateField HeaderStyle-Width="25px">
                        <ItemTemplate>
                            <div class="action-buttons">
                                <Metronic:LinkButton ID="btnView" runat="server" SkinID="ButtonViewIcon" CommandArgument='<%# Item.CodeMasterId %>'
                                    OnClick="btnView_Click"></Metronic:LinkButton>
                            </div>
                        </ItemTemplate>
                    </MAT:TemplateField>
                    <MAT:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
                    <MAT:BoundField DataField="Desc" HeaderText="Name" SortExpression="Desc" />
                    <MAT:BoundField DataField="SeqNo" HeaderText="Sequence" SortExpression="SeqNo" />
                </Columns>
                <PagerStyle CssClass="m-datatable__pager" />
            </Metronic:GridView>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>









<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="MAT.WebApp.App.Workflow.Sequence.Edit" %>

<%@ Register Src="~/Workflow/Sequence/UserControl/ucWorkflowSequenceAssignment.ascx" TagName="WorkflowSequenceAssignment" TagPrefix="UserControl" %>
<%@ Register Src="~/Workflow/Sequence/UserControl/ucWorkflowSequenceEmailNotification.ascx" TagName="WorkflowSequenceEmailNotification" TagPrefix="UserControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton ID="btnSave" runat="server" SkinID="ButtonSave" AssociatedFormViewId="fvWorkflowSequence" FunctionAccessControlCode="Edit" CommandName="Update"></Metronic:FormViewButton>
    <Metronic:FormViewButton ID="btnDelete" runat="server" SkinID="ButtonDelete" AssociatedFormViewId="fvWorkflowSequence" FunctionAccessControlCode="Delete" CommandName="Delete" CausesValidation="false"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="btnBack" runat="server" SkinID="ButtonBack" OnClick="btnBack_Click" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView ID="fvWorkflowSequence" runat="server" RenderOuterTable="false" DataKeyNames="WorkflowSequenceId" DefaultMode="Edit"
        ItemType="MAT.App.Workflow.Sequence.WorkflowSequenceViewModel" SelectMethod="fvWorkflowSequence_GetItem" UpdateMethod="fvWorkflowSequence_UpdateItem"
        DeleteMethod="fvWorkflowSequence_DeleteItem" OnItemUpdating="fvWorkflowSequence_ItemUpdating" OnDataBound="fvWorkflowSequence_DataBound">
        <EditItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="SequenceNo" AssociatedControlID="SequenceNo" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="SequenceNo" ID="SequenceNo" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Name" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="Name" ID="Name" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="WorkflowActions" AssociatedControlID="WorkflowActions" />
                                <div class="col-sm-7">
                                    <Metronic:MultiSelect runat="server" ID="WorkflowActions" SelectMethod="WorkflowAction_Select" DataTextField="Value" DataValueField="Key"></Metronic:MultiSelect>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="ManualAssignment" AssociatedControlID="ManualAssignment" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="ManualAssignment" ID="ManualAssignment" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
<div class="m-portlet--tabs">
                    <div class="m-portlet__head">
                        <div class="m-portlet__head-tools">
                            <ul class="nav nav-tabs m-tabs-line m-tabs-line--primary m-tabs-line--2x" role="tablist" id="myTabs">
                                <li class="nav-item m-tabs__item">
                                    <a class="nav-link m-tabs__link active show" data-toggle="tab" href="#assignments" role="tab" aria-selected="true">
                                        <i class="la la-users"></i>
                                        <MAT:Label ID="Label1" runat="server" Text="Assignments"></MAT:Label>
                                    </a>
                                </li>
                                <li class="nav-item m-tabs__item">
                                    <a class="nav-link m-tabs__link" data-toggle="tab" href="#emailnotifications" role="tab" aria-selected="false">
                                        <i class="la la-envelope"></i>
                                        <MAT:Label ID="Label2" runat="server" Text="EmailNotifications"></MAT:Label>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
    <div class="m-portlet__body">
                        <div class="tab-content">
                            <div class="tab-pane active show" id="assignments" role="tabpanel">
                               <UserControl:WorkflowSequenceAssignment ID="WorkflowSequenceAssignment1" runat="server" Value='<%# Bind("Assignments") %>'
                                    WorkflowType='<%# GetDataCache<MAT.App.Workflow.WorkflowViewModel>().WorkflowType %>' />
                            </div>
                            <div class="tab-pane" id="emailnotifications" role="tabpanel">
                                <UserControl:WorkflowSequenceEmailNotification ID="WorkflowSequenceEmailNotification1" runat="server" Value='<%# Bind("EmailNotifications") %>'
                                    WorkflowType='<%# GetDataCache<MAT.App.Workflow.WorkflowViewModel>().WorkflowType %>' />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </EditItemTemplate>
    </MAT:FormView>

    <%--use to keep tab index--%>
    <asp:HiddenField ID="TabIndex" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
    <script type="text/javascript">
        function setTabIndex(value) {
            $('#<%= TabIndex.ClientID %>').val(value);
        }

        $('#myTabs a').click(function (e) {
            e.preventDefault();
            setTabIndex($(this).attr('href'));
        })

        // set startup tab
        $('#myTabs a[href="<%= TabIndex.Value %>"]').tab('show');  
    </script>
</asp:Content>

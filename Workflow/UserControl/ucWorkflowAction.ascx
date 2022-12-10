<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucWorkflowAction.ascx.cs" Inherits="MAT.WebApp.App.Workflow.UserControl.ucWorkflowAction" %>
<div class="m-portlet">
    <div class="m-portlet__head">
        <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
                <h3 class="m-portlet__head-text">
                    <MAT:Literal runat="server" Text="Workflow Action"></MAT:Literal>
                </h3>
            </div>
        </div>
    </div>
    <div class="m-portlet__body">
        <div role="form" runat="server" id="divForm">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group m-form__group mat-form-group">
                        <label class="col-sm-5 col-form-label"><%: MAT.Resources.GlobalResource.Action %></label>
                        <div class="col-sm-7">
                            <Metronic:DropDownList ID="ddlWorkflowAction" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="ddlWorkflowAction_Get"
                                OnSelectedIndexChanged="ddlWorkflowAction_SelectedIndexChanged" Mandatory="true" AutoPostBack="true">
                            </Metronic:DropDownList>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <label class="col-sm-5 col-form-label"><%: MAT.Resources.GlobalResource.Remark %></label>
                        <div class="col-sm-7">
                            <Metronic:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Rows="5"></Metronic:TextBox>
                        </div>
                    </div>
                    <div id="divManualAssignment" runat="server" class="m-form__group mat-form-group" visible="false">
                        <label class="col-sm-5 col-form-label"><%: MAT.Resources.GlobalResource.AssignTo %></label>
                        <div class="col-sm-7">
                            <Metronic:DropDownList ID="ddlAssignTo" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="ddlAssignTo_Get" Mandatory="true">
                            </Metronic:DropDownList>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <div class="col-sm-12">
                            <div class="pull-right">
                                <Metronic:LinkButton ID="btnSubmit" runat="server" SkinID="ButtonFreeText" Text="Submit"
                                    OnClick="btnSubmit_Click"></Metronic:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSchedule.ascx.cs" Inherits="MAT.WebApp.App.Scorecard.UserControl.ucSchedule" %>

<div class="pull-right">
    <Metronic:LinkButton runat="server" ID="btnUpdateSchedule" SkinID="ButtonFreeText" 
        Text="Update" ValidationGroup="UpdateSchedule" OnClick="btnUpdateSchedule_Click">
    </Metronic:LinkButton>
</div>
<asp:UpdatePanel runat="server" ID="up">
    <ContentTemplate>
        <MAT:FormView runat="server" ID="fvParentSchedule" RenderOuterTable="false" DefaultMode="ReadOnly"
            SelectMethod="fvParentSchedule_SelectItem"
            ItemType="MAT.App.Scorecard.Scorecard.Shared.ScheduleViewModel">
            <ItemTemplate>
                <div class="m-section">
                    <h3 class="m-section__heading" style="padding-top: calc(0.65rem + 1px);">Progress Submission Schedule</h3>
                    <div class="m-section__content">
                        <div class="m-demo__perview">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" Text='<%# string.Format("Submission Due Date for {0} Progress", (MAT.App.Scorecard.Enumerate.ScorecardFrequency)ScorecardFrequency) %>'></MAT:Label>&nbsp;
                                        <MAT:Label runat="server" Text='<%# Item.SubmissionDueDate %>' Font-Bold="true"></MAT:Label>&nbsp;
                                        <MAT:Label runat="server" Text='<%# string.Format(" Days After Previous {0} End", (MAT.App.Scorecard.Enumerate.ScorecardFrequency)ScorecardFrequency) %>'></MAT:Label>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" Text='<%# string.Format("Approval Due Date for {0} Progress", (MAT.App.Scorecard.Enumerate.ScorecardFrequency)ScorecardFrequency) %>'></MAT:Label>&nbsp;
                                        <MAT:Label runat="server" Text='<%# Item.ApprovalDueDate %>' Font-Bold="true"></MAT:Label>&nbsp;
                                        <MAT:Label runat="server" Text='<%# string.Format(" Days After Previous {0} End", (MAT.App.Scorecard.Enumerate.ScorecardFrequency)ScorecardFrequency) %>'></MAT:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="m-section">
                    <h3 class="m-section__heading" style="padding-top: calc(0.65rem + 1px);">Notification Schedule (Before <%= ScorecardFrequency %> end)</h3>
                    <div class="m-section__content">
                        <div class="m-demo__perview">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" Text="SubmissionReminder"></MAT:Label>&nbsp;:&nbsp;
                                        <MAT:Label runat="server" Text='<%# Item.SubmissionReminderBeforeDue %>' Font-Bold="true"></MAT:Label>&nbsp;
                                        days before (NOTE : use comma ',' as separator if more than 1 day)
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" Text="ApprovalReminder"></MAT:Label>&nbsp;:&nbsp;
                                        <MAT:Label runat="server" Text='<%# Item.ApprovalReminderBeforeDue %>' Font-Bold="true"></MAT:Label>&nbsp;
                                        days before (NOTE : use comma ',' as separator if more than 1 day)
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="m-section">
                    <h3 class="m-section__heading">Notification Schedule (After due date)</h3>
                    <div class="m-section__content">
                        <div class="m-demo__perview">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" Text="SubmissionReminder"></MAT:Label>&nbsp;:&nbsp;
                                        <MAT:Label runat="server" Text='<%# (MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.NotificationScheduleType)Item.SubmissionReminderType %>'></MAT:Label>&nbsp;
                                        <MAT:Label runat="server" Text='<%# Item.SubmissionReminderDayOfWeek.HasValue ? string.Format("on {0}", (System.DayOfWeek)Item.SubmissionReminderDayOfWeek.Value) : string.Empty %>'
                                            Visible='<%# Item.SubmissionReminderType == MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.NotificationScheduleType.EveryWeek %>'></MAT:Label>
                                        <MAT:Label runat="server" Text='<%# Item.SubmissionReminderDay.HasValue ? string.Format("on {0} day", Item.SubmissionReminderDay.Value) : string.Empty %>'
                                            Visible='<%# Item.SubmissionReminderType == MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.NotificationScheduleType.EveryMonth %>'></MAT:Label>
                                    </div>

                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" Text="ApprovalReminder"></MAT:Label>&nbsp;:&nbsp;
                                        <MAT:Label runat="server" Text='<%# (MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.NotificationScheduleType)Item.ApprovalReminderType %>'></MAT:Label>&nbsp;
                                        <MAT:Label runat="server" Text='<%# Item.ApprovalReminderDayOfWeek.HasValue ? string.Format("on {0}", (System.DayOfWeek)Item.SubmissionReminderDayOfWeek.Value) : string.Empty %>'
                                            Visible='<%# Item.ApprovalReminderType == MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.NotificationScheduleType.EveryWeek %>'></MAT:Label>
                                        <MAT:Label runat="server" Text='<%# Item.ApprovalReminderDay.HasValue ? string.Format("on {0} day", Item.ApprovalReminderDay.Value) : string.Empty %>'
                                            Visible='<%# Item.ApprovalReminderType == MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.NotificationScheduleType.EveryMonth %>'></MAT:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            <EditItemTemplate>
                <div class="m-section">
                    <h3 class="m-section__heading" style="padding-top: calc(0.65rem + 1px);">Progress Submission Schedule</h3>
                    <div class="m-section__content">
                        <div class="m-demo__preview">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" Style="padding-top: calc(0.65rem + 1px);" Text='<%# string.Format("Submission Due Date for {0} Progress", (MAT.App.Scorecard.Enumerate.ScorecardFrequency)ScorecardFrequency) %>'></MAT:Label>&nbsp;
                                        <Metronic:TextBox runat="server" ID="SubmissionDueDate" Style="min-width: 30px; max-width: 60px;" TextMode="Number" Text='<%# Item.SubmissionDueDate %>' ValidationGroup="UpdateSchedule"></Metronic:TextBox>&nbsp;
                                        <MAT:Label runat="server" Style="padding-top: calc(0.65rem + 1px);" Text='<%# string.Format(" Days After Previous {0} End", (MAT.App.Scorecard.Enumerate.ScorecardFrequency)ScorecardFrequency) %>'></MAT:Label>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" Style="padding-top: calc(0.65rem + 1px);" Text='<%# string.Format("Approval Due Date for {0} Progress", (MAT.App.Scorecard.Enumerate.ScorecardFrequency)ScorecardFrequency) %>'></MAT:Label>&nbsp;
                                        <Metronic:TextBox runat="server" ID="ApprovalDueDate" Style="min-width: 30px; max-width: 60px;" TextMode="Number" Text='<%# Item.ApprovalDueDate %>' ValidationGroup="UpdateSchedule"></Metronic:TextBox>&nbsp;
                                        <MAT:Label runat="server" Style="padding-top: calc(0.65rem + 1px);" Text='<%# string.Format(" Days After Previous {0} End", (MAT.App.Scorecard.Enumerate.ScorecardFrequency)ScorecardFrequency) %>'></MAT:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="m-section">
                    <h3 class="m-section__heading" style="padding-top: calc(0.65rem + 1px);">Notification Schedule (Before <%= ScorecardFrequency %> end)</h3>
                    <div class="m-section__content">
                        <div class="m-demo__perview">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" Text="SubmissionReminder" Style="padding-top: calc(0.65rem + 1px);"></MAT:Label>&nbsp;
                                        <Metronic:TextBox runat="server" ID="SubmissionReminderBeforeDue" Style="min-width: 60px; max-width: 120px;" Text='<%# BindItem.SubmissionReminderBeforeDue %>' ValidationGroup="UpdateSchedule"></Metronic:TextBox>
                                        <div style="padding-top: calc(0.65rem + 1px);">&nbsp;days before (NOTE : use comma ',' as separator if more than 1 day)</div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" Text="ApprovalReminder" Style="padding-top: calc(0.65rem + 1px);"></MAT:Label>&nbsp;
                                        <Metronic:TextBox runat="server" ID="ApprovalReminderBeforeDue" Style="min-width: 60px; max-width: 120px;" Text='<%# BindItem.ApprovalReminderBeforeDue %>' ValidationGroup="UpdateSchedule"></Metronic:TextBox>
                                        <div style="padding-top: calc(0.65rem + 1px);">&nbsp;days before (NOTE : use comma ',' as separator if more than 1 day)</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="m-section">
                    <h3 class="m-section__heading" style="padding-top: calc(0.65rem + 1px);">Notification Schedule (After due date)</h3>
                    <div class="m-section__content">
                        <div class="m-demo__perview">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" Text="SubmissionReminder" Style="padding-top: calc(0.65rem + 1px);"></MAT:Label>&nbsp;
                                        <Metronic:DropDownList runat="server" ID="SubmissionReminderType" DataTextField="Value" DataValueField="Key" SelectMethod="ReminderType_Get"
                                            OnSelectedIndexChanged="SubmissionReminderType_SelectedIndexChanged" AutoPostBack="true" Text='<%# (byte)Item.SubmissionReminderType %>'
                                            Width="20%" ValidationGroup="UpdateSchedule">
                                        </Metronic:DropDownList>
                                        <div runat="server" id="divSubmissionReminderDayOfWeek" style="display: inherit;"
                                            visible='<%# Item.SubmissionReminderType == MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.NotificationScheduleType.EveryWeek %>'>
                                            <MAT:Label runat="server" Text="On" Style="padding-top: calc(0.65rem + 1px); padding-left: 2px; padding-right: 2px;"></MAT:Label>
                                            <Metronic:DropDownList runat="server" ID="SubmissionReminderDayOfWeek" DataTextField="Value" DataValueField="Key"
                                                SelectMethod="DayOfWeek_Get" Text='<%# (byte)Item.SubmissionReminderDayOfWeek %>' Width="250px" ValidationGroup="UpdateSchedule">
                                            </Metronic:DropDownList>
                                        </div>
                                        <div runat="server" id="divSubmissionReminderDay" style="display: inherit;"
                                            visible='<%# Item.SubmissionReminderType == MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.NotificationScheduleType.EveryMonth %>'>
                                            <MAT:Label runat="server" Text="On" Style="padding-top: calc(0.65rem + 1px); padding-left: 2px; padding-right: 2px;"></MAT:Label>
                                            <Metronic:TextBox runat="server" ID="SubmissionReminderDay" Style="min-width: 30px; max-width: 60px;" Text='<%# Item.SubmissionReminderDay %>' ValidationGroup="UpdateSchedule"></Metronic:TextBox>
                                            <MAT:Label runat="server" Text="Day" Style="padding-top: calc(0.65rem + 1px); padding-left: 2px; padding-right: 2px;"></MAT:Label>
                                        </div>
                                    </div>

                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" Text="ApprovalReminder" Style="padding-top: calc(0.65rem + 1px);"></MAT:Label>&nbsp;
                                        <Metronic:DropDownList runat="server" ID="ApprovalReminderType" DataTextField="Value" DataValueField="Key" SelectMethod="ReminderType_Get"
                                            OnSelectedIndexChanged="ApprovalReminderType_SelectedIndexChanged" AutoPostBack="true" Text='<%# (byte)Item.ApprovalReminderType %>'
                                            Width="20%" ValidationGroup="UpdateSchedule">
                                        </Metronic:DropDownList>
                                        <div runat="server" id="divApprovalReminderDayOfWeek" style="display: inherit;"
                                            visible='<%# Item.ApprovalReminderType == MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.NotificationScheduleType.EveryWeek %>'>
                                            <MAT:Label runat="server" Text="On" Style="padding-top: calc(0.65rem + 1px); padding-left: 2px; padding-right: 2px;"></MAT:Label>
                                            <Metronic:DropDownList runat="server" ID="ApprovalReminderDayOfWeek" DataTextField="Value" DataValueField="Key"
                                                SelectMethod="DayOfWeek_Get" Text='<%# (byte)Item.ApprovalReminderDayOfWeek %>' Width="250px" ValidationGroup="UpdateSchedule">
                                            </Metronic:DropDownList>
                                        </div>
                                        <div runat="server" id="divApprovalReminderDay" style="display: inherit;"
                                            visible='<%# Item.ApprovalReminderType == MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.NotificationScheduleType.EveryMonth %>'>
                                            <MAT:Label runat="server" Text="On" Style="padding-top: calc(0.65rem + 1px); padding-left: 2px; padding-right: 2px;"></MAT:Label>
                                            <Metronic:TextBox runat="server" ID="ApprovalReminderDay" Style="min-width: 30px; max-width: 60px;" Text='<%# Item.ApprovalReminderDay %>' ValidationGroup="UpdateSchedule"></Metronic:TextBox>
                                            <MAT:Label runat="server" Text="Day" Style="padding-top: calc(0.65rem + 1px); padding-left: 2px; padding-right: 2px;"></MAT:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </EditItemTemplate>
        </MAT:FormView>
    </ContentTemplate>
</asp:UpdatePanel>

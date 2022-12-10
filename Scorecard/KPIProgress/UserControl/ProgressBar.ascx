<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProgressBar.ascx.cs" Inherits="MAT.WebApp.App.Scorecard.KPIProgress.UserControl.ProgressBar" %>

<style>
    .prog {
        display: flex;
        height: 1.5rem;
        overflow: hidden;
        font-size: 1rem;
        background-color: #ffffff;
        border-radius: 0.25rem;
        margin-bottom: 5px;
        min-height: 20px;
        align-items: center;
    }

    .leader-progress {
        font-size: 17px;
        padding-left: 18px;
        padding-right: 18px;
        vertical-align: middle;
        width: 100%;
        padding: 10px 10px 10px 10px;
    }
</style>

<div class="row">
    <div class="leader-progress">
        <div class="prog">
            <%# DisplayOverallLabel() %>
            <a href="#" style="font-size: 18px;">
                <i class="ace-icon fa fa-info-circle" data-toggle="modal" data-target="#barmodalpanel"></i>
            </a>
        </div>
        <div class="prog" style="margin-top: 5px;">
            <%# DisplayOverallProgress() %>
        </div>
        <div class="prog" style="margin-bottom: 5px;">
            <%# DisplayOverallSplit() %>
        </div>
        <div class="prog">
            <%# DisplayThisYearLabel() %>
            <a href="#" style="font-size: 18px;">
                <i class="ace-icon fa fa-info-circle" data-toggle="modal" data-target="#barmodalpanel"></i>
            </a>
        </div>
        <div class="prog" style="margin-top: 5px;">
            <%# DisplayThisYear() %>
        </div>
        <div class="prog" style="margin-bottom: 5px;">
            <%# DisplayThisYearSplit() %>
        </div>
    </div>
</div>

<div class="modal fade" id="barmodalpanel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="smaller lighter blue no-margin">Performance Calculation
                </h3>
                <button id="btnModalClose" type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
            </div>
            <div class="modal-body">
                <ul>
                    <li>Weighed Performance = Sum((Progress / Target) * Weight)
                    </li>
                    <li>Non-Weighed Performance = Total Progress / Total Target
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

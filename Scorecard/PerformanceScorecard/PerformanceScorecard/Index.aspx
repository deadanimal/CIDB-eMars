<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.PerformanceScorecard.PerformanceScorecard.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .easyPieChart, .easy-pie-chart {
            position: relative;
            text-align: center;
        }

        .percentage {
            font-size: 14px;
            font-weight: bold;
            display: inline-block;
            vertical-align: top;
        }

        .easyPieChart canvas, .easy-pie-chart canvas {
            position: absolute;
            top: 0;
            left: 0;
        }

        audio, canvas, progress, video {
            display: inline-block;
            vertical-align: baseline;
        }

        .progress {
            border-radius: 0;
            -webkit-box-shadow: none;
            box-shadow: none;
            background: #e9e9e9;
            height: 18px;
        }

        .progress-bar {
            float: left;
            width: 0%;
            height: 100%;
            font-size: 12px;
            line-height: 20px;
            color: #fff;
            text-align: center;
            -webkit-box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.15);
            box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.15);
            -webkit-transition: width 0.6s ease;
            -o-transition: width 0.6s ease;
            transition: width 0.6s ease;
        }

        .progress[data-percent]:after {
            display: inline-block;
            content: attr(data-percent);
            color: #000000;
            position: absolute;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
            line-height: 16px;
            text-align: center;
            font-size: 12px;
        }

        .position-relative, .pos-rel {
            position: relative;
        }

        .widget-box[class*="widget-color-"] > .widget-header {
            color: #FFF;
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
        }

        .pricing-box .widget-header {
            border-radius: 25px;
            text-align: center;
            padding-left: 0;
        }

        .widget-box {
            padding: 0;
            border-top-left-radius: 25px;
            border-top-right-radius: 25px;
            -webkit-box-shadow: none;
            box-shadow: none;
            margin: 3px 0;
            border: 1px solid #CCC;
        }

        .widget-body {
            background-color: #FFF;
        }

        .widget-main {
            padding: 12px;
        }

        .widget-main {
            padding: 12px;
        }

        .pricing-box .price {
            border-radius: 25px;
            font-size: 22px;
            line-height: 20px;
            height: auto;
            text-align: center;
            color: #555;
        }

        .toproundedcorner {
            background-color: lightgray;
            border-top-left-radius: 25px;
            border-top-right-radius: 25px;
        }

        .bottomroundedcorner {
            border-bottom-left-radius: 25px;
            border-bottom-right-radius: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:LinkButton runat="server" ID="btnAdd" SkinID="ButtonAdd" PostBackUrl="Add.aspx" FunctionAccessControlCode="Create" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-portlet">
        <div class="m-portlet__body">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="Status" AssociatedControlID="Status"></MAT:Label>
                        <div class="col-sm-8">
                            <Metronic:DropDownList runat="server" ID="Status" SelectMethod="Status_Get" DataTextField="Value" DataValueField="Key"
                                OnSelectedIndexChanged="Status_SelectedIndexChanged" AutoPostBack="true">
                            </Metronic:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="Scorecard" AssociatedControlID="ddlScorecard"></MAT:Label>
                        <div class="col-sm-8">
                            <Metronic:DropDownList runat="server" ID="ddlScorecard" SelectMethod="Scorecard_Get" DataTextField="Value" DataValueField="Key"
                                OnSelectedIndexChanged="ddlScorecard_SelectedIndexChanged" AutoPostBack="true">
                            </Metronic:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="m-portlet">
        <div class="m-portlet__head">
            <div class="m-portlet__head-caption">
                <div class="m-portlet__head-title">
                    <h3 class="m-portlet__head-text">
                        <a runat="server" id="scorecardLink">
                            <span id="scorecardName" runat="server"></span>
                        </a>
                    </h3>
                </div>
            </div>
        </div>
        <div class="m-portlet__body">
            <div class="row">
                <asp:Repeater runat="server" ID="rptList" SelectMethod="rptList_GetData" ItemType="MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.ScorecardKpiViewModel">
                    <ItemTemplate>
                        <div class="col-xs-6 col-sm-4 pricing-box">
                            <%--<div class="widget-box" runat="server" visible='<%# !string.IsNullOrEmpty(Item.Name) %>'>--%>
                            <div class="widget-box" runat="server">
                                <div class="widget-header">
                                    <a href='<%# string.Format("View.aspx?id={0}", Item.ScorecardId) %>' class="btn btn-block btn-primary toproundedcorner" style="border-color: lightgray; color: black;">
                                        <span><%# Item.Code + " " + Item.Name %></span>
                                    </a>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <ul class="list-unstyled spaced2">
                                            <%# DisplayInit(Item.Childs) %>
                                        </ul>
                                        <hr>
                                        <div class="price">
                                            <div class="easy-pie-chart percentage" data-size="69" data-color="#ECCB71" data-percent="<%#(Item.Score??0) %>" style="height: 69px; width: 69px; line-height: 68px;">
                                                <span class="percent"><%# (Item.Score??0).ToString("##0.##") %></span>%
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
    <script type="text/javascript" src="../../../Scripts/jquery.easypiechart.js"></script>
    <script type="text/javascript">
        jQuery(function ($) {
            var barColor = '#5867dd';
            var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
            var size = parseInt($(this).data('size')) || 50;
            $('.easy-pie-chart.percentage').each(function () {
                $(this).easyPieChart({
                    barColor: barColor,
                    trackColor: trackColor,
                    scaleColor: false,
                    lineCap: 'butt',
                    lineWidth: parseInt(size / 10),
                    animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,//don't animate for IE8 (too slow)
                    size: size
                });
            });
        })
    </script>
</asp:Content>

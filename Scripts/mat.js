﻿function ShowSystemMessage(title, message) {
    $(document.body).append('<div id="system-message"><p>' + message + '</p></div>');

    $.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
        _title: function (title) {
            var $title = this.options.title || '&nbsp;'
            if (("title_html" in this.options) && this.options.title_html == true)
                title.html($title);
            else title.text($title);
        }
    }));

    $("#system-message").dialog({
        modal: true,
        title: "<div class='widget-header widget-header-small'><h4 class='smaller'><i class='ace-icon fa fa-check'></i> " + title + "</h4></div>",
        title_html: true,

    });
};

function copyToClipboard(element) {
    var $temp = $("<input>");
    $("body").append($temp);
    $temp.val($(element).text()).select();
    document.execCommand("copy");
    $temp.remove();
}

$(document).ready(function () {
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

    // reinitialize ace controls if postback from update panel
    function EndRequestHandler(sender, args) {
        initializeAceControls();
        ApplyMatValidation();
        MetronicControls.init();
    }
});

jQuery(function ($) {
    initializeAceControls();
    ApplyMatValidation();
});

function initializeAceControls() {
    //  $.fn.datepicker.defaults.format = "dd/mm/yyyy";
    //  $('.input-daterange').datepicker({ autoclose: true });
    //  $('.date-picker').datepicker({ autoclose: true, todayHighlight: true }).next().on(ace.click_event, function () {
    //      $(this).prev().focus();
    //  }
    //  );
    //  $('.date-picker-month-year').datepicker({ format: "M yyyy", autoclose: true, minViewMode: 1 });
    //  $('.time-picker').timepicker({ minuteStep: 1, showSeconds: true, showMeridian: false }).next().on(ace.click_event, function () {
    //      $(this).prev().focus();
    //  });

    //  // masking control
    //  //$.mask.definitions['~'] = '[+-]';
    //  $(".input-mask-nric").mask("000000-00-0000");
    //  $('.input-mask-phone').mask('009-00000009');
    //  $('.input-mask-mobilephone').mask('009-00000009');

    //  // select2.js
    //  var s = $('select.select2').css('width', '100%').select2({ allowClear: true });
    //  // resize select2 control while resizing
    //  $(window)
    //.off('resize.select2')
    //.on('resize.select2', function () {
    //    $('.select2').each(function () {
    //        var $this = $(this);
    //        if ($this.parent().hasClass('input-group')) { // if there is input group class element enclosed it, move up a level as the width is not accurate
    //            if ($this.parent().parent().width() > 70)
    //                $this.css({ 'width': $this.parent().parent().width() - 32 }); // minus input-group addon width
    //        }
    //        else {
    //            if ($this.parent().width() > 70) {
    //                $this.css({ 'width': $this.parent().width() });
    //            }
    //        }
    //    })
    //}).trigger('resize.select2');

    //  // popover
    //  $('[data-rel=popover]').popover({ container: 'body' });

    //  // wysiwyg (Editor)
    //  var wysiwyg = $('.wysiwyg-editor').ace_wysiwyg();

    //  // load default value
    //  var hidDefault = $(wysiwyg).data("hid");
    //  var encodedStr = $('#' + hidDefault).val();
    //  var decoded = $("<div/>").html(encodedStr).text();
    //  $(wysiwyg).html(decoded);

    //  wysiwyg.on('blur', function () {
    //      // save changes into hidden field
    //      var hid = $(this).data("hid");

    //      $('#' + hid).val($('<div/>').text($(this).html()).html());
    //  });
    //  wysiwyg.prev().addClass('wysiwyg-style2');

    //  // tag on click copy
    //  $('.copyTag').css('cursor', 'pointer').click(function () {
    //      copyToClipboard($(this));

    //      var backgroundColor = $(this).css("backgroundColor");
    //      var borderColor = $(this).css("borderColor");
    //      var color = $(this).css("color");
    //      $(this).animate({ backgroundColor: '#edf3ea', borderColor: '#9fbf92', color: '#7b9e6c' }, 500);
    //      $(this).animate({ backgroundColor: backgroundColor, borderColor: borderColor, color: color }, 2000);
    //  });

    //  // multiselect - chosen
    //  if (!ace.vars['touch']) {
    //      var chosen = $('.chosen-select').chosen({ allow_single_deselect: true, search_contains: true, display_selected_options: false });

    //      //resize the chosen on window resize
    //      $(window)
    //      .off('resize.chosen')
    //      .on('resize.chosen', function () {
    //          $('.chosen-select').each(function () {
    //              var $this = $(this);
    //              if ($this.parent().hasClass('input-group')) { // if there is input group class element enclosed it, move up a level as the width is not accurate
    //                  $this.next().css({ 'width': $this.parent().parent().width() - 32 });// minus input-group addon width
    //              }
    //              else {
    //                  $this.next().css({ 'width': $this.parent().width() });
    //              }
    //          })
    //      }).trigger('resize.chosen');
    //      //resize chosen on sidebar collapse/expand
    //      $(document).on('settings.ace.chosen', function (e, event_name, event_val) {
    //          if (event_name != 'sidebar_collapsed') return;
    //          $('.chosen-select').each(function () {
    //              var $this = $(this);
    //              $this.next().css({ 'width': $this.parent().width() });
    //          })
    //      });

    //      // hack: to always keep the selection open when item is selected
    //      var autoClose = false;
    //      $('.chosen-select').each(function () {
    //          var chosenData = $(this).data('chosen');
    //          var chosen_resultSelect_fn = chosenData.result_select;

    //          chosenData.result_select = function (evt) {
    //              var resultHighlight = null;

    //              if (autoClose === false) {
    //                  evt['metaKey'] = true;
    //                  evt['ctrlKey'] = true;

    //                  resultHighlight = chosenData.result_highlight;
    //              }

    //              var stext = chosenData.get_search_text();

    //              var result = chosen_resultSelect_fn.call(chosenData, evt);

    //              if (autoClose === false && resultHighlight !== null)
    //                  resultHighlight.addClass('result-selected');

    //              this.search_field.val(stext);
    //              this.winnow_results();
    //              this.search_field_scale();

    //              return result;
    //          };
    //      });

    //      // resize chosen in tabs
    //      $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    //          $('.tab-pane .chosen-select').each(function () {
    //              var $this = $(this);
    //              if ($this.parent().hasClass('input-group')) { // if there is input group class element enclosed it, move up a level as the width is not accurate
    //                  $this.next().css({ 'width': $this.parent().parent().width() - 32 });// minus input-group addon width
    //              }
    //              else {
    //                  $this.next().css({ 'width': $this.parent().width() });
    //              }
    //          })
    //      });
    //  }
}

var tag_input = $('.input-tags');
try {
    tag_input.tag(
        {
            placeholder: 'Enter tags ...'
            //enable typeahead by specifying the source array
            //source: ace.vars['US_STATES'],//defined in ace.js >> ace.enable_search_ahead
            /**
            //or fetch data from database, fetch those that match "query"
            source: function(query, process) {
              $.ajax({url: 'remote_source.php?q='+encodeURIComponent(query)})
              .done(function(result_items){
                process(result_items);
              });
            }
            */
        }
    )

    //programmatically add a new
    //var $tag_obj = $('.input-tags').data('tag');
    //$tag_obj.add('Programmatically Added');
}
catch (e) {
    //display a textarea for old IE, because it doesn't support this plugin or another one I tried!
    tag_input.after('<textarea id="' + tag_input.attr('id') + '" name="' + tag_input.attr('name') + '" rows="3">' + tag_input.val() + '</textarea>').remove();
    //$('#form-field-tags').autosize({append: "\n"});
}

(function ($) {
    //$.fn.matNotification = function (options) {
    //    // merge the default plugin settings with the custom options
    //    options = $.extend({}, $.fn.matNotification.defaults, options || {});

    //    return $(this).each(function () {
    //        var baseUrl = options.baseUrl;
    //        var notificationUrl = options.notificationUrl;
    //        var element = $(this);

    //        // 20171108 cw : disable refresh to avoid heavy query on database
    //        //var _this = this,
    //        //    interval = setInterval(updateTimer, 5000);

    //        updateTimer();

    //        function updateTimer() {
    //            $.getJSON(baseUrl, function (data) {
    //                $(element).empty();

    //                var count = 0;
    //                $.each(data, function (id, event) {
    //                    count += event.MessageCount;
    //                    $(element).append(
    //                        $('<li>').append(
    //                            $('<a>').attr('href', notificationUrl + '?type=' + event.NotificationType).append(
    //                                $('<div>').attr('class', 'clearfix').append(
    //                                    $('<span>').attr('class', 'pull-left').append(
    //                                        $('<i>').attr('class', 'btn btn-xs no-hover fa ' + event.IconColorCss + ' ' + event.IconCss)
    //                                    ).append(event.Message)
    //                                ).append($('<span>').attr('class', 'pull-right badge ' + event.BadgeCss).append('+' + event.MessageCount))
    //                        )));
    //                });

    //                // update counter
    //                $(options.notificationCount).text(count);

    //                return this;
    //            })
    //        }
    //    });
    //};

    //$.fn.countTo.defaults = {
    //    from: 0,  // the number the element should start at
    //    to: 100,  // the number the element should end at
    //    speed: 1000,  // how long it should take to count between the target numbers
    //    refreshInterval: 100,  // how often the element should be updated
    //    decimals: 0,  // the number of decimal places to show
    //    onUpdate: null,  // callback method for every time the element is updated,
    //    onComplete: null,  // callback method for when the element finishes updating
    //};
})(jQuery);

function GetAutoCompleteList(searchType, applicationAlias, filters) {

    var url;
    if (applicationAlias == '')
        url = '/api/AutoComplete/list?searchType=' + searchType + '&query=%QUERY&filters=' + filters;
    else
        url = '/' + applicationAlias + '/api/AutoComplete/list?searchType=' + searchType + '&query=%QUERY';

    var tags = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('text'),
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        cache: false,
        remote: {
            url: url,
            transform: function (list) {
                // Map the remote source JSON array to a JavaScript object array
                return $.map(list, function (obj) {
                    return {
                        Text: obj.Text,
                        Value: obj.Value
                    };
                });
            },
            wildcard: '%QUERY'
        }
    });
    tags.initialize();
    return tags.ttAdapter();
}

function InitializeTagsInput(inputCtrlId, valueCtrlId, btnCtrlId, searchType, applicationAlias, filtersCtrlId) {
    $(inputCtrlId).tagsinput({
        itemValue: 'Value',
        itemText: 'Text',
        maxTags: 1,
        typeaheadjs: [
            {
                highlight: true,
                minLength: 1,
                hint: false
            },
            {
                name: 'Tags',
                displayKey: 'Text',
                source: GetAutoCompleteList(searchType, applicationAlias, $(filtersCtrlId).val()),
                limit: 20
            }],
        freeInput: false
    });

    var tagsinputgroup = $(inputCtrlId).parent();
    var currentValue = $(valueCtrlId).val();
    if (currentValue != '' && currentValue != null) {
        var obj = JSON.parse(currentValue);
        $(inputCtrlId).tagsinput('add', obj);
        tagsinputgroup.find('.bootstrap-tagsinput').css('padding-bottom', '4px');
        tagsinputgroup.find('.twitter-typeahead').css('display', 'none');
    }
    else {
        tagsinputgroup.find('.bootstrap-tagsinput').css('padding-bottom', '0px');
        tagsinputgroup.find('.twitter-typeahead').css('display', 'inline-block');
    }

    $(inputCtrlId).on('itemAdded', function (event) {
        // event.item: contains the item
        $(valueCtrlId).val(JSON.stringify(event.item));
        __doPostBack(btnCtrlId, '');
    });

    $(inputCtrlId).on('itemRemoved', function (event) {
        // event.item: contains the item
        $(valueCtrlId).val('');
        __doPostBack(btnCtrlId, '');
    });
}
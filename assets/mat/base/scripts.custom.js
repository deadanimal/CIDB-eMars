function showButtonLoader(button, causeValidation, validationGroup) {
    var btn = $(button);
    if (causeValidation == true) {
        if (Page_ClientValidate(validationGroup))
            btn.addClass('m-loader m-loader--right m-loader--light disabled');
    }
    else {
        btn.addClass('m-loader m-loader--right m-loader--light disabled');
    }
}

/*!
 * jQuery Validate Unobtrusive Bootstrap MyAdamas 0.1
 * to handle validation UI due to .Net Validator control does not comply to bootstrap
 */

(function ($) {
    if (window.ValidatorUpdateDisplay) {
        var proxied = window.ValidatorUpdateDisplay;

        window.ValidatorUpdateDisplay = function () {
            onBefore(arguments);

            var result = proxied.apply(this, arguments);

            onAfter(arguments);

            return result;
        };

        var onBefore = function (arguments) {
        };

        var onAfter = function (arguments) {
            var control = document.getElementById(arguments[0].controltovalidate);
            if (control == null) return;

            var validators = control.Validators;
            var isValid = true;

            for (var i = 0; i < validators.length; i++) {
                if (!validators[i].isvalid) {
                    isValid = false;
                    break;
                }
            }

            if (isValid) {
                $(control).removeClass('has-danger');

                var group = $(control).closest('.form-group');
                if (group && group.length > 0) group.addClass('has-success').removeClass('has-danger');

                var inputgroup = $(control).closest('.input-group');
                if (inputgroup && inputgroup.length > 0) inputgroup.addClass('has-success').removeClass('has-danger');

            } else {
                $(control).addClass('has-danger');

                var group = $(control).closest('.form-group');
                if (group && group.length > 0) group.addClass('has-danger').removeClass('has-success');

                var inputgroup = $(control).closest('.input-group');
                if (inputgroup && inputgroup.length > 0) inputgroup.addClass('has-danger').removeClass('has-success');
            }
        };
    }
})(jQuery);

/* Gridview Checkbox */
function Check_Click(objRef) {
    //Get the Row based on checkbox
    var row = objRef.parentNode.parentNode.parentNode;
    //Get the reference of GridView
    var GridView = row.parentNode;

    //Get all input elements in Gridview
    var inputList = GridView.getElementsByTagName("input");

    for (var i = 0; i < inputList.length; i++) {
        //The First element is the Header Checkbox
        var headerCheckBox = inputList[0];

        //Based on all or none checkboxes
        //are checked check/uncheck Header Checkbox
        var checked = true;
        if (inputList[i].type == "checkbox" && inputList[i] != headerCheckBox) {
            if (!inputList[i].checked) {
                checked = false;
                break;
            }
        }
    }
    headerCheckBox.checked = checked;

}

function checkAll(objRef) {
    var GridView = objRef.parentNode.parentNode.parentNode.parentNode;
    var inputList = GridView.getElementsByTagName("input");
    for (var i = 0; i < inputList.length; i++) {
        //Get the Cell To find out ColumnIndex
        var row = inputList[i].parentNode.parentNode;
        if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
            if (objRef.checked) {
                //If the header checkbox is checked
                //check all checkboxes
                inputList[i].checked = true;
            }
            else {
                //If the header checkbox is checked
                //uncheck all checkboxes
                inputList[i].checked = false;
            }
        }
    }
}

function metronicCheckClick(objRef) {
    //Get the Row based on checkbox
    var row = objRef.parentNode.parentNode.parentNode.parentNode;
    //Get the reference of GridView
    var GridView = row.parentNode;

    //Get all input elements in Gridview
    var inputList = GridView.getElementsByTagName("input");

    for (var i = 0; i < inputList.length; i++) {
        //The First element is the Header Checkbox
        var headerCheckBox = inputList[0];

        //Based on all or none checkboxes
        //are checked check/uncheck Header Checkbox
        var checked = true;
        if (inputList[i].type == "checkbox" && inputList[i] != headerCheckBox) {
            if (!inputList[i].checked) {
                checked = false;
                break;
            }
        }
    }
    headerCheckBox.checked = checked;

}

function metronicCheckAll(objRef) {
    var GridView = objRef.parentNode.parentNode.parentNode.parentNode.parentNode;
    var inputList = GridView.getElementsByTagName("input");
    for (var i = 0; i < inputList.length; i++) {
        //Get the Cell To find out ColumnIndex
        var row = inputList[i].parentNode.parentNode;
        if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
            if (objRef.checked) {
                //If the header checkbox is checked
                //check all checkboxes
                inputList[i].checked = true;
            }
            else {
                //If the header checkbox is checked
                //uncheck all checkboxes
                inputList[i].checked = false;
            }
        }
    }
}

function copyToClipboard(element) {
    var $temp = $("<input>");
    $("body").append($temp);
    $temp.val($(element).text()).select();
    document.execCommand("copy");
    $temp.remove();
}

function bootstrapNotify(message, state) {
    var content = {};

    content.message = message;
    var delay = 2000;
    if (state == 'danger') delay = 0;

    var notify = $.notify(content, {
        type: state,
        allow_dismiss: true,
        newest_on_top: true,
        mouse_over: true,
        delay: delay
    });
}

function sweetConfirm(obj, showLoader) {
    swal({
        title: 'Are you sure want to continue?',
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes'
    }).then(function (result) {
        if (result.value) {
            eval($(obj).attr('href'));
            if (showLoader) showButtonLoader(obj, true, '');
        }
    });
}

function customSweetConfirm(obj, showLoader, title) {
    swal({
        title: title + ' Are you sure to continue?',
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes'
    }).then(function (result) {
        if (result.value) {
            eval($(obj).attr('href'));
            if (showLoader) showButtonLoader(obj, true, '');
        }
    });
}

//== Metronic Controls Class definition
var MetronicControls = function () {
    return {
        init: function () {
            // select2
            $("select.m-select2").each(function () {
                var placeholder = $(this).attr('placeholder');
                var allowClear = $(this).attr('allowClear');
                if (placeholder == undefined)
                    placeholder = "Nothing Selected";
                if (allowClear == 'true' || allowClear == undefined)
                    allowClear = true;
                else
                    allowClear = false;

                var select2 = $(this).select2({
                    placeholder: placeholder,
                    allowClear: allowClear
                });

                if (select2.attr('max-width') != null) {
                    select2.next().css('max-width', select2.attr('max-width'));
                }

                var flex = select2.attr('data-flex');
                if (flex == 'true') {
                    select2.next().addClass('select2-flex');
                }
            });

            $('.m_selectpicker').selectpicker();

            // calendar
            $.fn.datepicker.defaults.format = "dd/mm/yyyy";
            $('.date-picker').datepicker({
                todayBtn: "linked",
                clearBtn: true,
                todayHighlight: true,
                autoclose: true,
                orientation: "bottom left",
                templates: {
                    leftArrow: '<i class="la la-angle-left"></i>',
                    rightArrow: '<i class="la la-angle-right"></i>'
                }
            });

            $('.month-picker').datepicker({
                clearBtn: true,
                orientation: "bottom left",
                autoclose: true,
                templates: {
                    leftArrow: '<i class="la la-angle-left"></i>',
                    rightArrow: '<i class="la la-angle-right"></i>'
                },
                format: 'mm/yyyy',
                startView: 1,
                minViewMode: 'months'
            });

            // date range
            $('.input-daterange').datepicker({
                todayBtn: "linked",
                clearBtn: true,
                todayHighlight: true,
                autoclose: true,
                orientation: "bottom left",
                templates: {
                    leftArrow: '<i class="la la-angle-left"></i>',
                    rightArrow: '<i class="la la-angle-right"></i>'
                }
            });

            $('.summernote').each(function (i, obj) {
                var hid = $(obj).data("hid");

                var summernote = $(obj).summernote({
                    height: 150,
                    callbacks: {
                        onChange: function (contents, $editable) {
                            $('#' + hid).val($("<div/>").text(contents).html());
                        }
                    }
                });

                // load default value
                var encodedStr = $('#' + hid).val();
                if (encodedStr.length > 0) {

                    $(obj).summernote('code', $("<div/>").html(encodedStr).text());
                }
            });

            $('.copyTag').css('cursor', 'pointer').click(function () {
                copyToClipboard($(this));
                bootstrapNotify('Tag is copied to clipboard.', 'info');
            });

            //baguetteBox.run('.photoGallery');
        }
    };
}();

//== Initialization
$(document).ready(function () {
    MetronicControls.init();

    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

    function BeginRequestHandler(sender, args) {
        mApp.blockPage({
            overlayColor: '#000000',
            type: 'loader',
            state: 'success'
        });
    }

    function EndRequestHandler(sender, args) {
        // reinitialize metronic controls if postback from update panel
        MetronicControls.init();

        // remove loading icon
        $(".m-loader.m-loader--right.m-loader--light.disabled").each(function () {
            $(this).removeClass('m-loader m-loader--right m-loader--light disabled').attr('disabled', '');
        });

        mApp.unblockPage();
    }
});

function InitializeAutoComplete(applicationAlias, inputCtrlId, idCtrlId, textCtrlId, postbackUniqueCtrlId, searchType, sid, filters) {
    var url;

    if (applicationAlias == '')
        url = '/api/AutoComplete/search?searchType=' + searchType + '&sid=' + sid + '&filters=' + filters;
    else
        url = '/' + applicationAlias + '/api/AutoComplete/search?searchType=' + searchType + '&sid=' + sid + '&filters=' + filters;

    var select2 = $("#" + inputCtrlId).select2({
        placeholder: "Enter text to search",
        allowClear: true,
        ajax: {
            url: url,
            dataType: 'json',
            delay: 250,
            type: "GET",
            data: function (term) {
                return {
                    query: term.term
                };
            },
            processResults: function (data, params) {
                return {
                    results: data.results
                };
            },
        },
        minimumInputLength: 2
    });

    var flex = select2.attr('data-flex');
    if (flex == 'true') {
        select2.next().addClass('select2-flex');
    }

    $('#' + inputCtrlId).on('select2:select', function (e) {
        $('#' + idCtrlId).val(e.params.data.id);
        $('#' + textCtrlId).val(e.params.data.text);
        if (postbackUniqueCtrlId != '') {
            __doPostBack(postbackUniqueCtrlId, '');
        }
    });

    $('#' + inputCtrlId).on('select2:unselect', function (e) {
        $('#' + idCtrlId).val('');
        $('#' + textCtrlId).val('');
        if (postbackUniqueCtrlId != '') {
            __doPostBack(postbackUniqueCtrlId, '');
        }
    });

    var id = $('#' + idCtrlId).val();
    var text = $('#' + textCtrlId).val();
    if (id != '') {
        var option = new Option(text, id, true, true);
        $('#' + inputCtrlId).append(option);
    }
}

function CheckOtherIsCheckedByGVID(rb, gvid) {
    var isChecked = rb.checked;
    var currentRdbID = rb.id;
    var parent = document.getElementById(gvid);
    var items = parent.getElementsByTagName('input');

    for (i = 0; i < items.length; i++) {
        if (items[i].id != currentRdbID && items[i].type == "radio") {
            if (items[i].checked) {
                items[i].checked = false;
            }
        }
    }
}

function FormartNumberWithComma(yourNumber) {
    //Seperates the components of the number
    var n = yourNumber.toString().split(".");
    //Comma-fies the first part
    n[0] = n[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    //Combines the two sections
    return n.join(".");
}
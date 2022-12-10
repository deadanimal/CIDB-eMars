/*!
 * jQuery Validate Unobtrusive Bootstrap MyAdamas 0.1
 * to handle validation UI due to .Net Validator control does not comply to bootstrap
 */

(function ($) {
})(jQuery);

function ApplyMatValidation() {
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
                $(control).removeClass('has-error').removeClass('has-danger');

                var group = $(control).closest('.form-group');
                if (group && group.length > 0) group.addClass('has-success').removeClass('has-error').removeClass('has-danger');

                var group2 = $(control).closest('.mat-form-group');
                if (group2 && group2.length > 0) group2.addClass('has-success').removeClass('has-error').removeClass('has-danger');

                var inputgroup = $(control).closest('.input-group');
                if (inputgroup && inputgroup.length > 0) inputgroup.addClass('has-success').removeClass('has-error').removeClass('has-danger');

            } else {
                $(control).addClass('has-error').addClass('has-danger');

                var group = $(control).closest('.form-group');
                if (group && group.length > 0) group.addClass('has-error').addClass('has-danger').removeClass('has-success');

                var group2 = $(control).closest('.mat-form-group');
                if (group2 && group2.length > 0) group2.addClass('has-error').addClass('has-danger').removeClass('has-success');

                var inputgroup = $(control).closest('.input-group');
                if (inputgroup && inputgroup.length > 0) inputgroup.addClass('has-error').addClass('has-danger').removeClass('has-success');
            }
        };
    }
}

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
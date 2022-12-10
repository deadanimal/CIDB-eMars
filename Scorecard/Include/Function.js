var lastMouseX;
var lastMouseY;
var curPopupWindow = null;

var count = 0;
var temp

function ShowConfirmation(msg) {
    Page_ClientValidate();
    if (Page_IsValid) return confirm(msg);
    return false;
}

function ShowSaveConfirmation() {
    Page_ClientValidate();
    if (Page_IsValid) return confirm("Confirm to save?");
    return false;
}
function ShowSaveConfirmation(validationGroup) {
    Page_ClientValidate(validationGroup);
    if (Page_IsValid) return confirm("Confirm to save?");
    return false;
}
function ShowDeleteConfirmation() {
    return confirm("Are you sure?");
}

function __doMyPostBack(eventTarget, eventArgument) {
    __doPostBack('ctl00$ContentPlaceHolder1$' + eventTarget, eventArgument);
}

function presubmit() {
    temp = setInterval('disableForm();', 10);
}

function disableForm() {
    if (count == 0) {
        count = 1;
        return true;
    }
    else {
        for (x = 0; x < document.forms[0].length; x++)
            document.forms[0].elements[x].disabled = true;

        var input = document.forms[0].getElementsByTagName("a");

        var count = input.length;

        for (var i = 0; i < count; i++)
            document.forms[0].getElementsByTagName("a")[i].onclick = function () { return false };

        clearInterval(temp);
    }
}

function toggle(e, i, path) {

    if (document.getElementById(e).style.display == "none") {
        document.getElementById(e).style.display = "";
        document.getElementById(i).src = path + "images/exp_minus.gif";
        document.getElementById(i).alt = "Collapse"
    }
    else {
        document.getElementById(e).style.display = "none";
        document.getElementById(i).src = path + "images/exp_plus.gif";
        document.getElementById(i).alt = "Expend"
    }
} //end toggle


//url = targetPath
//pWidth = popup window width (integer)
//pHeight = popup window height (integer)
//scroll = scrolling or not (YES | NO)
//closeOnLoseFocus = auto close popup windows (True | False)
//E.g. openPopup('http://www.MyAdamas.com', 500, 500, 'NO', true)
function openPopup(url, pWidth, pHeight, scroll, closeOnLoseFocus) {

    lastMouseX = (screen.width - pWidth) / 2
    lastMouseY = (screen.height - pHeight) / 2

    var features = "width=" + pWidth + ",height=" + pHeight + ",resizable=no,toolbar=no,status=no,scrollbars=" + scroll + ",menubar=no,directories=no,location=no,dependant=yes"

    closePopup();

    features += "screenX=" + lastMouseX + ",left=" + lastMouseX + "screenY=" + lastMouseY + ",top=" + lastMouseY;

    if (closeOnLoseFocus) {
        curPopupWindow = window.open(url, '_blank', features, false);
        curPopupWindow.focus();
    } else {
        // assign the open window to a dummy var so when closePopup() is called it won't be assigned to curPopupWindow
        win = window.open(url, '_blank', features, false);
        win.focus();
    }
}

function closePopup() {
    if (curPopupWindow != null) {

        if (!curPopupWindow.closed) {
            curPopupWindow.close();
        }
        curPopupWindow = null;
    }
}

function setFocus() {
    var sidebarSearch;
    // search for a tabIndexed field to focus on
    for (var firstIndex = 1; firstIndex < 5; firstIndex++) {
        var nextIndex = firstIndex;
        for (var frm = 0; frm < document.forms.length; frm++) {
            for (var fld = 0; fld < document.forms[frm].elements.length; fld++) {
                var elt = document.forms[frm].elements[fld];
                //alert(document.forms[frm].elements.length)
                //alert(elt.id)
                //alert(fld)
                //alert(elt.disabled)
                if (elt.tabIndex != nextIndex) continue;
                if ((elt.type == "text" || elt.type == "textarea" || elt.type == "password")
                    && elt.name != "sbstr" && elt.name.indexOf("owner") != 0 && elt.disabled != true) {
                    try {
                        elt.focus();
                        if (elt.type == "text") {
                            elt.select();
                        }
                        return true;
                    }
                    catch (e) {
                    }
                } else {
                    nextIndex++;
                    fld = 0;
                }
            }
        }
    }

    // failed to find a tabIndexed field, try to find the field based on it's natural position.
    for (var frm = 0; frm < document.forms.length; frm++) {
        for (var fld = 0; fld < document.forms[frm].elements.length; fld++) {
            var elt = document.forms[frm].elements[fld];
            // skip buttons, radio, or check-boxes
            // to skip "select" types, remove from if statement
            if (elt.disabled == false) {
                if (elt.type == "text" || elt.type == "textarea" || elt.type == "password") {
                    if (elt.name == "sbstr" && document.forms[frm].name == "sbsearch") {
                        sidebarSearch = elt;
                    } else if (elt.name.indexOf("owner") != 0) {
                        try {
                            elt.focus();
                            // select text in text field or textarea
                            if (elt.type == "text") {
                                elt.select();
                            }
                            return true;
                        }
                        catch (e) {
                        }
                    }
                }
            }
        }
    }

    return true;
}

function mask(str, textbox, loc, delim) {
    var locs = loc.split(',');

    for (var i = 0; i <= locs.length; i++) {
        for (var k = 0; k <= str.length; k++) {
            if (k == locs[i]) {
                if (str.substring(k, k + 1) != delim) {
                    if (event.keyCode != 8) { //backspace
                        str = str.substring(0, k) + delim + str.substring(k, str.length);
                    }
                }
            }
        }
    }

    textbox.value = str
}

function roundToPennies(n) {
    pennies = n * 100;

    pennies = Math.round(pennies);

    strPennies = "" + pennies;
    len = strPennies.length;

    first = strPennies.substring(0, len - 2) + ".";
    last = strPennies.substring(len - 2, len);

    if (first == ".")
        first = "0."

    if (last.length == 1)
        last += "0";

    return first + last;
}

function ConvertToNumber(value) {
    return (value == null) ? 0.00 : Number(value);
}

function ConvertToInteger(value) {
    return (value == '' || isNaN(value) || value == null) ? 0 : parseInt(value);
}

function ConvertToNumberWithThousandSep(value) {
    value = ReplaceThousandSeparator(value);
    return (value == null) ? 0.00 : Number(value);
}

function ReplaceThousandSeparator(value) {
    return value.replace(new RegExp(",", "g"), "");
}

function formatThousandSeparator(ctr, decpoint, separator) {
    // check for missing parameters and use defaults if so
    if (arguments.length == 2) {
        separator = ",";
    }
    if (arguments.length == 1) {
        separator = ",";
        decpoint = ".";
    }

    //replace separator
    var value = ctr.value.replace(new RegExp(separator, "g"), "")

    // separate the whole number and the fraction if possible
    a = value.split(decpoint);
    x = a[0]; // decimal
    y = a[1]; // fraction

    if (typeof (x) != "undefined") {
        var regexp = new RegExp("\\B(\\d{3})(" + separator + "|$)");
        do {
            x = x.replace(regexp, separator + "$1");
        }
        while (x.search(regexp) >= 0)

        // add the fraction back in, if it was there
        if (typeof (y) != "undefined")
            x += decpoint + y;
    }
    ctr.value = x;
}

function GetMaxLength(targetField) {
    return targetField.exMaxLen;
}

//
// Limit the text input in the specified field.
//
function LimitInput(targetField, sourceEvent) {
    var isPermittedKeystroke;
    var enteredKeystroke;
    var maximumFieldLength;
    var currentFieldLength;
    var inputAllowed = true;
    var selectionLength = parseInt(GetSelectionLength(targetField));

    if (GetMaxLength(targetField) != null) {
        // Get the current and maximum field length
        currentFieldLength = parseInt(targetField.value.length);
        maximumFieldLength = parseInt(GetMaxLength(targetField));

        // Allow non-printing, arrow and delete keys
        enteredKeystroke = window.event ? sourceEvent.keyCode : sourceEvent.which;
        isPermittedKeystroke = ((enteredKeystroke < 32)
            || (enteredKeystroke >= 33 && enteredKeystroke <= 40)
            || (enteredKeystroke == 46))

        // Decide whether the keystroke is allowed to proceed
        if (!isPermittedKeystroke) {
            if ((currentFieldLength - selectionLength) >= maximumFieldLength) {
                inputAllowed = false;
            }
        }

        // Force a trim of the textarea contents if necessary
        if (currentFieldLength > maximumFieldLength) {
            targetField.value = targetField.value.substring(0, maximumFieldLength)
        }
    }

    sourceEvent.returnValue = inputAllowed;
    return (inputAllowed);
}

//
// Limit the text input in the specified field.
//
function LimitPaste(targetField, sourceEvent) {
    var clipboardText;
    var resultantLength;
    var maximumFieldLength;
    var currentFieldLength;
    var pasteAllowed = true;
    var selectionLength = GetSelectionLength(targetField);

    if (GetMaxLength(targetField) != null) {
        // Get the current and maximum field length
        currentFieldLength = parseInt(targetField.value.length);
        maximumFieldLength = parseInt(GetMaxLength(targetField));

        clipboardText = window.clipboardData.getData("Text");
        resultantLength = currentFieldLength + clipboardText.length - selectionLength;
        if (resultantLength > maximumFieldLength) {
            pasteAllowed = false;
        }
    }

    sourceEvent.returnValue = pasteAllowed;
    return (pasteAllowed);
}

//
// Returns the number of selected characters in 
// the specified element
//
function GetSelectionLength(targetField) {
    if (targetField.selectionStart == undefined) {
        return document.selection.createRange().text.length;
    }
    else {
        return (targetField.selectionEnd - targetField.selectionStart);
    }
}


/* Start TreeView CheckBox */

function OnCheckBoxCheckChanged(evt) {
    var src = window.event != window.undefined ? window.event.srcElement : evt.target;
    var isChkBoxClick = (src.tagName.toLowerCase() == "input" && src.type == "checkbox");
    if (isChkBoxClick) {
        var parentTable = GetParentByTagName("table", src);
        var nxtSibling = parentTable.nextSibling;
        if (nxtSibling && nxtSibling.nodeType == 1)//check if nxt sibling is not null & is an element node 
        {
            if (nxtSibling.tagName.toLowerCase() == "div") //if node has children 
            {
                //check or uncheck children at all levels 
                CheckUncheckChildren(parentTable.nextSibling, src.checked);
            }
        }
        //check or uncheck parents at all levels 
        CheckUncheckParents(src, src.checked);
    }
}
function CheckUncheckChildren(childContainer, check) {
    var childChkBoxes = childContainer.getElementsByTagName("input");
    var childChkBoxCount = childChkBoxes.length;
    for (var i = 0; i < childChkBoxCount; i++) {
        childChkBoxes[i].checked = check;
    }
}
function CheckUncheckParents(srcChild, check) {
    var parentDiv = GetParentByTagName("div", srcChild);
    var parentNodeTable = parentDiv.previousSibling;

    if (parentNodeTable) {
        var checkUncheckSwitch;

        if (check) //checkbox checked 
        {
            var isAllSiblingsChecked = AreAllSiblingsChecked(srcChild);
            if (isAllSiblingsChecked)
                checkUncheckSwitch = true;
            else
                return; //do not need to check parent if any(one or more) child not checked 
        }
        else //checkbox unchecked 
        {
            checkUncheckSwitch = false;
        }

        var inpElemsInParentTable = parentNodeTable.getElementsByTagName("input");
        if (inpElemsInParentTable.length > 0) {
            var parentNodeChkBox = inpElemsInParentTable[0];
            parentNodeChkBox.checked = checkUncheckSwitch;
            //do the same recursively 
            CheckUncheckParents(parentNodeChkBox, checkUncheckSwitch);
        }
    }
}
function AreAllSiblingsChecked(chkBox) {
    var parentDiv = GetParentByTagName("div", chkBox);
    var childCount = parentDiv.childNodes.length;
    for (var i = 0; i < childCount; i++) {
        if (parentDiv.childNodes[i].nodeType == 1) //check if the child node is an element node 
        {
            if (parentDiv.childNodes[i].tagName.toLowerCase() == "table") {
                var prevChkBoxs = parentDiv.childNodes[i].getElementsByTagName("input");
                for (var j = 0; j < prevChkBoxs.length; j++) {
                    //if any of sibling nodes are not checked, return false 
                    if (!prevChkBoxs[j].checked) {
                        return false;
                    }
                }
            }
        }
    }
    return true;
}
//utility function to get the container of an element by tagname 
function GetParentByTagName(parentTagName, childElementObj) {
    var parent = childElementObj.parentNode;
    while (parent.tagName.toLowerCase() != parentTagName.toLowerCase()) {
        parent = parent.parentNode;
    }
    return parent;
}

/* End TreeView CheckBox */




function Right(str, num) {
    return str.substring(str.length - num);  // pull out right num
}

function padl(n, w, c) {
    n = String(n);
    while (n.length < w)
        n = c + n;
    return n;
}


function OnTreeClick(evt) {
    var src = window.event != window.undefined ? window.event.srcElement : evt.target;
    var isChkBoxClick = (src.tagName.toLowerCase() == "input" && src.type == "checkbox");

    if (isChkBoxClick) {
        var parentTable = GetParentByTagName("table", src);
        var nxtSibling = parentTable.nextSibling;

        if (nxtSibling && nxtSibling.nodeType == 1)//check if nxt sibling is not null & is an element node
        {
            if (nxtSibling.tagName.toLowerCase() == "div") //if node has children
            {
                //check or uncheck children at all levels
                CheckUncheckChildren(parentTable.nextSibling, src.checked);
            }
        }

        //check or uncheck parents at all levels
        CheckUncheckParents(src, src.checked);
    }
}

function CheckUncheckChildren(childContainer, check) {
    var childChkBoxes = childContainer.getElementsByTagName("input");
    var childChkBoxCount = childChkBoxes.length;
    for (var i = 0; i < childChkBoxes.length; i++) {
        childChkBoxes[i].checked = check;
    }
}

function CheckUncheckParents(srcChild, check) {
    var parentDiv = GetParentByTagName("div", srcChild);
    var parentNodeTable = parentDiv.previousSibling;

    if (parentNodeTable) {
        var checkUncheckSwitch;

        if (check) //checkbox checked
        {
            var isAllSiblingsChecked = AreAllSiblingsChecked(srcChild);
            if (isAllSiblingsChecked)
                checkUncheckSwitch = true;
            else
                return; //do not need to check parent if any(one or more) child not checked
        }
        else //checkbox unchecked
        {
            checkUncheckSwitch = false;
        }

        var inpElemsInParentTable = parentNodeTable.getElementsByTagName("input");
        if (inpElemsInParentTable.length > 0) {
            var parentNodeChkBox = inpElemsInParentTable[0];
            parentNodeChkBox.checked = checkUncheckSwitch;
            //do the same recursively
            CheckUncheckParents(parentNodeChkBox, checkUncheckSwitch);
        }
    }
}

function AreAllSiblingsChecked(chkBox) {
    var parentDiv = GetParentByTagName("div", chkBox);
    var childCount = parentDiv.childNodes.length;
    for (var i = 0; i < parentDiv.childNodes.length; i++) {
        if (parentDiv.childNodes[i].nodeType == 1) //check if the child node is an element node
        {
            if (parentDiv.childNodes[i].tagName.toLowerCase() == "table") {
                var prevChkBox = parentDiv.childNodes[i].getElementsByTagName("input")[0];
                //if any of sibling nodes are not checked, return false
                if (!prevChkBox.checked) {
                    return false;
                }
            }
        }
    }
    return true;
}

//utility function to get the container of an element by tagname
function GetParentByTagName(parentTagName, childElementObj) {
    var parent = childElementObj.parentNode;
    while (parent.tagName.toLowerCase() != parentTagName.toLowerCase()) {
        parent = parent.parentNode;
    }
    return parent;
}



/* Gridview Checkbox */
function Check_Click(objRef) {
    //Get the Row based on checkbox
    var row = objRef.parentNode.parentNode;
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
    var GridView = objRef.parentNode.parentNode.parentNode;
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


/* Ajax Calendar Extender - Month picker */

function modifyCalToMonthSelectionDelegates(cal) {
    if (cal == null)
        return;

    //need to modify the original delegate of the month cell.
    cal._cell$delegates = {
        mouseover: Function.createDelegate(cal, cal._cell_onmouseover),
        mouseout: Function.createDelegate(cal, cal._cell_onmouseout),


        click: Function.createDelegate(cal, function (e) {
            /// <summary>
            /// Handles the click event of a cell
            /// </summary>
            /// <param name="e" type="Sys.UI.DomEvent">The arguments for the event</param>

            e.stopPropagation();
            e.preventDefault();

            if (!cal._enabled) return;

            var target = e.target;
            var visibleDate = cal._getEffectiveVisibleDate();
            Sys.UI.DomElement.removeCssClass(target.parentNode, "ajax__calendar_hover");
            switch (target.mode) {
                case "prev":
                case "next":
                    cal._switchMonth(target.date);
                    break;
                case "title":
                    switch (cal._mode) {
                        case "days": cal._switchMode("months"); break;
                        case "months": cal._switchMode("years"); break;
                    }
                    break;
                case "month":
                    if (target.parentNode.className != "ajax__calendar_invalid") {
                        //if the mode is month, then stop switching to day mode.
                        if (target.month == visibleDate.getMonth()) {
                        } else {
                            cal._visibleDate = target.date;
                        }
                        cal.set_selectedDate(target.date);
                        cal._switchMonth(target.date);
                        cal._blur.post(true);
                        cal.raiseDateSelectionChanged();
                    }
                    break;
                case "year":
                    if (target.date.getFullYear() == visibleDate.getFullYear()) {
                        cal._switchMode("months");
                    } else {
                        cal._visibleDate = target.date;
                        cal._switchMode("months");
                    }
                    break;
                case "today":
                    cal.set_selectedDate(target.date);
                    cal._switchMonth(target.date);
                    cal._blur.post(true);
                    cal.raiseDateSelectionChanged();
                    break;
            }


        })
    }
}

function changeCalMonthCellHandlers(cal) {
    if (cal._monthsBody) {
        //remove the old handler of each month body.
        for (var i = 0; i < cal._monthsBody.rows.length; i++) {
            var row = cal._monthsBody.rows[i];
            for (var j = 0; j < row.cells.length; j++) {
                $common.removeHandlers(row.cells[j].firstChild, cal._cell$delegates);
            }
        }
        //add the new handler of each month body.
        for (var i = 0; i < cal._monthsBody.rows.length; i++) {
            var row = cal._monthsBody.rows[i];
            for (var j = 0; j < row.cells.length; j++) {
                //if (row.cells[j].className != "ajax__calendar_invalid")
                $addHandlers(row.cells[j].firstChild, cal._cell$delegates);
            }
        }
    }
}

function onMonthCalendarShown(sender, args) {
    //set the default mode to month
    sender._switchMode("months", true);
    changeCalMonthCellHandlers(sender);
}


/* Color Picker */
function colorChanged(sender) {
    sender.get_element().style.color =
        "#" + sender.get_selectedColor();
    sender.get_element().style.backgroundColor =
        "#" + sender.get_selectedColor();
}

/* scorecard function */
function SetValueEquallyIntoTextBox(panelId, total, type) {
    //Number = 1,
    //Decimal = 2
    var textBoxes = $('#' + panelId + " :input[type=text]");

    if (textBoxes == null || textBoxes.length == 0 || total == null || total.length == 0 || type == "3" || type == "4")
        return;

    var v;
    try {
        v = ConvertToNumber(total);
    }
    catch (ex) {
        return;
    }

    var splitValue = v / textBoxes.length;
    if (type == "1")
        splitValue = splitValue.toFixed(0); // number
    else if (type == "2")
        splitValue = splitValue.toFixed(2); // decimal

    textBoxes.each(function (index) { $(this).val(splitValue); });
}

function SumAndSetTotal(panelId, totalId, type) {
    //Number = 1,
    //Decimal = 2,
    //Date = 3,
    //Percentage = 4
    var textBoxes = $('#' + panelId + " :input[type=text]");
    var totalCtrl = $('#' + totalId);

    if (textBoxes == null || textBoxes.length == 0 || totalCtrl == null || type == "3")
        return;

    var total = 0;
    var count = 0;

    textBoxes.each(function (index) {
        var value = $(this).val();
        if (value == 0 || value.length == 0) value = 0;
        total += parseFloat(value);
        count += 1;
    });
    if (type == "1")
        totalCtrl.text(total.toFixed(0)); // number
    else if (type == "2")
        totalCtrl.text(total.toFixed(2)); // decimal
    else if (type == "4") {
        totalCtrl.text((total / count).toFixed(2)); // percentage
    }
}
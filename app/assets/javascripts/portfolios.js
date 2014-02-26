/**
 * Created by duanewittaker on 2/23/14.
 */


/*var usedmethodFieldsUI = {
 init: function() {
 $('#addButton').on('click', function() {
 formHandler.appendFields();
 formHandler.hideForm();
 });
 }
 };*/

// Set up the UI/UX for the ships screens.  This object sets up all the functionality we need to:
//  1.  Bind to the "click" event of the "#addButton" on the modal form.
//  2.  Append data from the modal form to the usedmethods table.
//  3.  Hide the modal form when the user is done entering data.
//
// If any other events need to be wired up, the init function would be the place to put them.
var xxusedmethodFieldsUI = {
    init: function() {
        // Configuration for the jQuery validator plugin:
        // Set the error messages to appear under the element that has the error.  By default, the
        // errors appear in the all-too-familiar bulleted-list.
        // Other configuration options can be seen here:  https://github.com/victorjonsson/jQuery-Form-Validator
        var validationSettings = {
            //validateOnBlur : true,
            errorMessagePosition : 'element'
        };

        $.validate(false, validationSettings);

        // Run validation on an input element when it loses focus.
        //$('#new-usedmethod-fields').validateOnBlur();
        //$('#new_subject').validateOnBlur();

        $('#addButton').on('click', function(e) {
            // If the form validation on our usedmethods modal "form" fails, stop everything and prompt the user
            // to fix the issues.

            //var isValid = $('#new-usedmethod-fields').validate(false, validationSettings);
            //var isValid = $.validate(false, validationSettings);

            //alert(isValid);
            //var isValid = $('#new_subject').validate(false, validationSettings);
            //if(!isValid) {
            //    e.stopPropagation();

            //    return false;
            //}

            // This is the code from previous posts...
            formHandler.appendFields();
            formHandler.hideForm();
        });
    }
};

var formHandler = {
    // Public method for adding a new row to the table.
    appendFields: function() {
        // Get a handle on all the input fields in the form and detach them from the DOM (we will attach them later).
        var inputFields = $(cfg.formId + ' ' + cfg.inputFieldClassSelector);
        inputFields.detach();

        // Build the row and add it to the end of the table.
        rowBuilder.addRow(cfg.getTBodySelector(), inputFields);

        // Add the "Remove" link to the last cell.
        rowBuilder.link.appendTo($('tr:last td:last'));
    },

    // Public method for hiding the data entry fields.
    hideForm: function() {
        $(cfg.formId).modal('hide');
    }
};

var cfg = {
    formId: '#new-usedmethod-fields',
    tableId: '#usedmethods-table',
    inputFieldClassSelector: '.field',
    getTBodySelector: function() {
        return this.tableId + ' tbody';
    }
};


//----------------------------------------------------------------
//----------------------------------------------------------------
//----------------------------------------------------------------

// Provides functionality to append new rows to the Pilots table and hide the modal form for adding new Pilots.
// NOTE:  The "appendFields" function depends on the rowBuilder to handle building the HTML for the new row.
var formHandler = {
    // Public method for adding a new row to the table.
    appendFields: function () {
        // Get a handle on all the input fields in the form and detach them from the DOM (we'll attach them later).
        var inputFields = $(cfg.formId + ' ' + cfg.inputFieldClassSelector);
        inputFields.detach();

        // Build the row and add it to the end of the table.
        rowBuilder.addRow(cfg.getTBodySelector(), inputFields);

        // Add the "Remove" link to the last cell.
        rowBuilder.link.clone().appendTo($('tr:last td:last'));
    },

    // Public method for hiding the data entry fields.
    hideForm: function() {
        $(cfg.formId).modal('hide');
    }
};

// Provides functionality for building the HTML that represents a new <TR> for the Modules table.
var rowBuilder = function() {
    // Private property that define the default <TR> element text.
    var row = $('<tr>', { class: 'fields' });

    // Public property that describes the "Remove" link.
    var btxt = $('<b>', { class: 'icon-remove' });
    btxt = btxt.append('x');
    var link = $('<a>', {
        href: '#',
        onclick: 'remove_fields(this); return false;',
        title: 'Delete this Method.'
    }).append(btxt) ;
    /*
     var link = $('<a>', {
     href: '#',
     onclick: 'remove_fields(this); return false;',
     title: 'Delete this Module.'
     }).append($('<b>', { class: 'icon-remove' })) ;
     */

    // A private method for building a <TR> w/the required data.
    var buildRow = function(fields) {
        var newRow = row.clone();

        $(fields).map(function() {
            $(this).removeAttr('class');
            var td = $('<td/>').append($(this));
            td.appendTo(newRow);
        });

        return newRow;
    }

    // A public method for building a row and attaching it to the end of a <TBODY> element.
    var attachRow = function(tableBody, fields) {
        var row = buildRow(fields);
        $(row).appendTo($(tableBody));
    }

    // Only expose public methods/properties.
    return {
        addRow: attachRow,
        link: link
    }
}();
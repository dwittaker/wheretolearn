


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
    formId: '#new-subject_module-fields',
    tableId: '#subject_modules-table',
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
        title: 'Delete this Module.'
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

$(document).ready(function () {

        $(".grid").wookmark({


            align: 'left',
            autoResize: true,
            comparator: null,
            container: $('#grid-container'),
            direction: undefined,
            ignoreInactiveItems: true,
            itemWidth: 300,
            fillEmptySpace: false,
            flexibleWidth: 1,
            offset: 5,
            onLayoutChanged: undefined,
            outerOffset: 0,
            possibleFilters: [],
            resizeDelay: 50,
            verticalOffset: undefined
        });

});
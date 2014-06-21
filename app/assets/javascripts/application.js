// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//


//= require jquery
//= require jquery_ujs
//= require jquery.hotkeys
//= require twitter/bootstrap
//= require masonry/jquery.masonry
//= require masonry/jquery.event-drag
//= require masonry/jquery.imagesloaded.min
//= require masonry/jquery.infinitescroll.min
//= require masonry/modernizr-transitions
//= require masonry/box-maker
//= require masonry/jquery.loremimages.min
//= require bootstrap-wysiwyg
//= require_tree .

//



function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
}

/*function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regex = new RegExp("new_" + association, "g");
    $(link).parent().after(content.replace(regex, new_id));
    $('#new-subject_module-fields').modal('show');
}*/
/*
function add_fields2(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g")
    $(link).up().insert({
        before: content.replace(regexp, new_id)
    });
}*/

/*
function remove_fields(link) {
  $(link).previous("input[type=hidden]").value = "1";
  $(link).up(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).up().insert({
    before: content.replace(regexp, new_id)
  });
}*/

$(document).ready(function () {
    //$('.dropdown-toggle').dropdown();
    $('.navbar .dropdown').hover(function() {
        $(this).find('.dropdown-menu').first().stop(true, true).delay(0).slideDown();
    }, function() {
        $(this).find('.dropdown-menu').first().stop(true, true).delay(0).slideUp()
    });

    $(function() {
        $('.datepicker').datepicker({dateFormat: 'yy-mm-dd'});


       // $(".grid").wookmark({
       //     offset: 5,
       //     autoResize: true
       // });
    });
});
function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}
/*
function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}*/

function add_fields2(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association + "_" + association, "g");
    content = content.replace(regexp, new_id);

    var regexp2 = new RegExp("new_" + association + "\\]\\[" + association , "g");
    content = content.replace(regexp2, new_id);

    //$(link).parent().parent().parent().after(content);
    var tblnm = "#" + association + "-table";
    $(tblnm + " tr:last").after(content);
}
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require jquery-ui
// require autocomplete-rails
//= require bootstrap
//= require turbolinks
//= require_tree .

// $(document).ready(function() {
//  $('#extended_search').hide();
// });


function toggle_extended_search() {
	if($('#extended_search_link').hasClass("extended_search_on")) {
		$('#extended_search_link').text("Erweiterte Suche");
		$('#extended_search_link').removeClass("extended_search_on");
		$('#extended_search').hide();
		$('#simple_search').removeClass("left_col").addClass("center_col");
	} else {
		$('#extended_search_link').addClass("extended_search_on");
		$('#extended_search_link').text("Erweiterte Suche schliessen");
		$('#extended_search').show();
		$('#simple_search').removeClass("center_col").addClass("left_col");
	}
}


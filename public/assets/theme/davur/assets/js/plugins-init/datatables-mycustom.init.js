
(function($) {
    "use strict"
    var table = $('.table').DataTable({
		paging:false,
		language: {
			paginate: {
				next: '<i class="fa fa-angle-double-right" aria-hidden="true"></i>',
				previous: '<i class="fa fa-angle-double-left" aria-hidden="true"></i>' 
			}
		}
    });	
})(jQuery);

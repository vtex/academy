$(document).ready(function() {
	$('.countdown-container').countdown({
		date: "April 10, 2015 08:00:00",
		render: function(data) {
		  var el = $(this.el);
		  el.empty()
		    .append("<div class='digit'>" + this.leadingZeros(data.days, 3) + " <span>dias</span></div>")
		    .append("<div class='digit'>" + this.leadingZeros(data.hours, 2) + " <span>horas</span></div>")
		    .append("<div class='digit'>" + this.leadingZeros(data.min, 2) + " <span>minutos</span></div>")
		    .append("<div class='digit'>" + this.leadingZeros(data.sec, 2) + " <span>segundos</span></div>");
		}
	});

    //section in viewport?
    $(window).bind("scroll load", function(event) {
    	var n = $(".numbers-content");
    	if ( $(".graph-main:in-viewport").length ) {
    		n.addClass("active");
    		n.removeClass("disabled");
    	} else {
    		n.addClass("disabled");
    		n.removeClass("active");
    	}
    });
    $(window).bind("scroll load", function(event) {
    	var m = $("#media");
    	if ( $("#media:in-viewport").length ) {
    		m.addClass("active");
    	}
    });

	//Detecting if images are loaded
	$(".hero").each(function(i, img) {
	    var bi = $(this).css("background-image").match(/url\(["']?([^()]*)["']?\)/).pop();
	    var image = new Image();
	    // $(image).error(function() {
	    //     var which_fail = bi;
	    //     alert(which_fail+" fail");
	    // });
	    $(image).attr("src", bi);
	    $(this).addClass("ready");
	});


$('[data-toggle="popover"]').popover();


});//document ready

//register scroll
$(".btn-register").on('click', function() {
	$("#register").velocity("scroll", { 
		duration: 800,
		complete: function() {$("#mce-EMAIL").focus();}
	});
	return false;
})

//popovers

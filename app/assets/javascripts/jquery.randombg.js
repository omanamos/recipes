/**
 * jQuery random background changer
 * @name Random Background Changer
 * @author Charles Harvey - http://www.charles-harvey.co.uk
 * @version 0.1
 * @date September 4 2009
 * @category jQuery plugin
 * @copyright (c) 2009 Charles Harvey
 */


(function($) {

	$.randombg = {
		defaults: {
			directory: "../../images/backgrounds/",
			howmany: 3

		}
	}
    $.fn.extend({
        randombg:function(config) {
            var config = $.extend({}, $.randombg.defaults, config);
			return this.each(function() {
		
				var directory = config.directory, howmany = config.howmany;

				var which = Math.floor(Math.random()*howmany)+1;
				$(this).css({"background-image" : "url(" + directory + which + ".jpg)"});
			  
            })
        }
    })
    
    $.randompic = {
		defaults: {
			directory: "../../images/banners/",
			howmany: 2

		}
	}
    $.fn.extend({
        randompic:function(config) {
            var config = $.extend({}, $.randompic.defaults, config);
			return this.each(function() {
		
				var directory = config.directory, howmany = config.howmany;

				var which = Math.floor(Math.random()*howmany)+1;
				$(this).attr('src', directory + 'nomnom_banner' + which + '.jpg')
			  
            })
        }
    })
})(jQuery);
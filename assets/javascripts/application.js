(function(){this.Minder={}}).call(this),function(){Minder.hashLinks=function(e){var n;return n=$.extend({$element:$(".js-hashLink"),$card:$(".card"),cardNode:".card",elementNode:".js-hashLink",activeClass:"is-active",hiddenClass:"is-hidden"},e),n.$element.each(function(){return $(this).on("click",function(e){var a;return e.preventDefault(),a=$(this).attr("href").replace("#",""),$(n.elementNode).parent().removeClass(n.activeClass),$(this).parent().addClass(n.activeClass),$(n.cardNode).removeClass(n.hiddenClass),n.$card.not(n.cardNode+"--"+a).addClass(n.hiddenClass)})})}}.call(this),function(){jQuery(function(){return Minder.hashLinks()})}.call(this),function(){}.call(this);
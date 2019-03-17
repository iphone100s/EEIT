
					$(".house").each(function(){
					      var $house = $(this);
					      $house.find("option").each(function() {
					        text = $(this).text();
					        if ($house.find("option:contains(" + text + ")").length > 1)
					         $house.find("option:contains(" + text + "):gt(0)").remove();
					       });
					      });

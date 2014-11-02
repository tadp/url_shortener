$(document).ready ->
	$('.new_shortener').on "ajax:error", (e, xhr, status, error) ->
		debugger
		return
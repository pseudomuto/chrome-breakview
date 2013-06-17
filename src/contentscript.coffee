chrome.extension.onRequest.addListener (request, sender, sendResponse) ->
	if request.method? 
		console.log "Got message: #{request.method}"
		
		breakpoints = []
		elements = document.getElementById('chrome-breakpoints').children
		
		breakpoints.push { name: x.name, value: x.value } for x in elements		
		sendResponse { breakpoints: breakpoints }

shouldShow = ->
	true

# start it all up if we should be shown
if shouldShow()
	chrome.extension.sendRequest {}, (response) ->
chrome.extension.onRequest.addListener (request, sender, sendResponse) ->
	if request.method? 
		console.log "Got message: #{request.method}"
		sendResponse {}

chrome.extension.sendRequest {}, (response) ->
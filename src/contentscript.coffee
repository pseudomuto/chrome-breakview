shouldRun = ->
	# window.chrome_breakview is ""
	true

if shouldRun()
	chrome.extension.sendRequest {}, (response) ->
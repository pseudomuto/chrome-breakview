chrome.tabs.getSelected null, (tab) ->
	chrome.tabs.sendRequest tab.id, { method: "popupLoaded", tabid: tab.id }, (response) ->
		# expecting object from content script		
		console.log "Content Script returned to me"

		elem = document.getElementById("points")

		for item in response.breakpoints
			li = document.createElement "option"
			li.setAttribute "value", item.value
			li.text = item.name
			elem.appendChild li
		
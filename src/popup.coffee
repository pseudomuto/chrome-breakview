chrome.tabs.getSelected null, (tab) ->
	chrome.tabs.sendRequest tab.id, { method: "popupLoaded", tabid: tab.id }, (response) ->
		# expecting object from content script
		document.getElementById("title").innerHTML = "Aha!";
		console.log "Content Script returned to me"
chrome.tabs.getSelected null, (tab) ->
	chrome.tabs.sendRequest tab.id, { method: "popupLoaded", tabid: tab.id }, (response) ->

		elem = document.getElementById("points")
		elem.addEventListener "change", (e) ->
			return if @value is ""

			state = { state: "maximized" }
			if @value isnt "max"
				state = { width: parseInt @value }

			chrome.windows.getCurrent null, (win) ->
				chrome.windows.update win.id, state, ->
					window.close()

			true			

		for item in response.breakpoints
			li = document.createElement "option"
			li.setAttribute "value", item.value
			li.text = item.name
			elem.appendChild li
		
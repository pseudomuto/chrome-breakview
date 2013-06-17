
# Listen for the breakpoints script to send a message to the background page.
chrome.extension.onRequest.addListener (request, sender, sendResponse) -> 		
	#if sender.tab?
	console.log "Working on tab with id #{sender.tab.id}"
	chrome.pageAction.show sender.tab.id 

	sendResponse {}
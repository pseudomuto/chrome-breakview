# chrome-breakview

A breakpoint viewer for Chrome. Quickly resize to one of your defined breakpoints for testing your responsive web site.

## Usage

The is a Page Action extension (icon will be in the address bar). The icon will only show up, if your page has an element with id "chrome-breakpoints" defined that has children for each of your defined breakpoints. For example:

	<div id="chrome-breakpoints">
		<input type="hidden" name="small" value="320" />
		<input type="hidden" name="medium" value="640" />
		<input type="hidden" name="large" value="960" />
	</div>

When you select the page action, you will be presented with a popup that lets you select which breakpoint you would like to resize to. Selecting a breakpoint will resize the browser window and refresh the page.

__*I realize that rendering DOM elements for breakpoints is less that ideal. This will be addressed in the near future.*__

## Contributors

You will need node.js and coffeescript to contribute to this project. There is a Cakefile with build and watch tasks which generate the extension file in `./build` (ignored by `.gitignore`). You can then add this folder to Chrome's extensions (in Developer mode) for testing.

For testing purposes, there is a sample_page.html file in the root directory which will trigger the extension.

With that, fork away...looking forward to pull requests!
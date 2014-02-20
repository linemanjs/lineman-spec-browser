# lineman-spec-browser

Test your lineman app with a browser.

Install the plugin

```
$ npm install lineman-spec-browser --save-dev
```

Add a test like this one to `spec-browser/hello-world-spec.coffee`:

``` coffeescript
describe '/', ->
  When -> browser.visit("")
  Then -> browser.hasTextOnPage("Hello, World!")
```

Run your tests in Chrome (default):

```
$ lineman grunt specBrowser
```

Run your tests in a different browser (see the webdriver-sync project for supported options):

```
$ BROWSER=PhantomJS lineman grunt specBrowser --stack
```

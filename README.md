# lineman-spec-browser

Test your lineman app with a browser.

Install the plugin

```
$ npm install lineman-spec-browser --save-dev
```

Create a test in a directory called "spec-browser":

```
$ mkdir spec-browser
$ echo "describe '/', ->
  When -> browser.visit('')
  Then -> browser.hasTextOnPage('Hello, World!')
" > spec-browser/hello-world-spec.coffee
```

To run your tests in Chrome:

```
$ lineman grunt specBrowser
```

To run your tests in a different browser (see the webdriver-sync project for supported options):

```
$ BROWSER=PhantomJS lineman grunt specBrowser
```

## Choosing your lineman project

By default, the plugin will spawn a `lineman run` process at the outset o f each test run. This slows startup down quite a bit, however. Instead, if you were to start a lineman server in another shell like this:

```
$ LINEMAN_ENV=test WEB_PORT=8001 lineman run
```

Then the plugin will see the other server and infer that it doesn't need to spawn a new one.

### Customizing that port

By default, the lineman plugin will try to start (or will look for) a Lineman server at port 8001 (being an increment over the default lineman dev server, which has always run at 8000). If you'd like to run on a different port, just set the `WEB_PORT` environment variable for the task:

```
$ WEB_PORT=8933 lineman grunt specBrowser
```




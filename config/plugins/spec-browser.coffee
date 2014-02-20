module.exports = (lineman) ->
  app = lineman.config.application


  files:
    spec:
      browser:
        helpers: [
          "spec-browser/helpers/start-lineman.coffee"
          "spec-browser/helpers/**/*.{js,coffee}"
        ]
        specs: ["spec-browser/**/*.{js,coffee}"]
  config:
    specBrowser:
      default:
        options:
          helpers: "<%= files.spec.browser.helpers %>"
          specs: "<%= files.spec.browser.specs %>"
          minijasminenode:
            defaultTimeoutInterval: 20000
            onComplete: ->
              global.currentLineman?.kill()
              global.browser?.quit()

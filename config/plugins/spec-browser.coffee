module.exports = (lineman) ->
  app = lineman.config.application
  thisDir = __dirname

  files:
    spec:
      browser:
        root: "spec-browser"
        helpers: [
          "#{__dirname}/../../helpers/start-lineman.coffee"
          "#{__dirname}/../../helpers/browser.coffee"
          "<%= files.spec.browser.root %>/helpers/**/*.{js,coffee}"
        ]
        specs: ["<%= files.spec.browser.root %>/**/*.{js,coffee}"]
  config:
    specBrowser:
      options:
        helpers: "<%= files.spec.browser.helpers %>"
        specs: "<%= files.spec.browser.specs %>"
        minijasminenode:
          defaultTimeoutInterval: 20000
          showColors: true
          onComplete: ->
            global.currentLineman?.kill()
            global.browser?.quit()
      default: {}

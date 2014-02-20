webdriverSync = require('webdriver-sync')
By = webdriverSync.By

browserName = process.env.BROWSER || "Chrome"

global.browser = new webdriverSync["#{browserName}Driver"]()

browser.wd = webdriverSync
browser.By = webdriverSync.By

browser.eval = (code) ->
  browser.executeScript("return #{code}")

browser.visit = (path) ->
  browser.get("http://localhost:#{process.env.WEB_PORT}/#{path}")

browser.hasTextOnPage = (text) ->
  escapedText = text.replace(/'/g, "\\'")
  browser.findElements(By.xpath("//*[contains(text(),'#{escapedText}')]")).length > 0

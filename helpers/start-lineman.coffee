spawn = require("child_process").spawn
http = require("http")

process.env.LINEMAN_ENV = "test"
process.env.WEB_PORT = port = process.env.WEB_PORT || 8001

started = false
beforeEach (done) ->
  done() if started

  http.get("http://localhost:#{port}", (res) ->
    console.log("A server appears to already be running on port #{port}.")
    started = true
    done()
  ).on 'error', ->
    global.currentLineman = lineman = spawn("lineman", ["run"])

    lineman.stdout.on "data", (data) ->
      if data.toString().indexOf("Waiting...") != -1
        console.log("Started a Lineman server (LINEMAN_ENV=test, WEB_PORT=#{port}).")
        started = true
        done()

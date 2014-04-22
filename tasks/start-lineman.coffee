http = require 'http'

module.exports = (grunt) ->

  grunt.registerTask 'startLineman', 'starts an instance of lineman if one is not running', ->

    process.env.WEB_PORT = port = process.env.WEB_PORT || 8001
    process.env.LINEMAN_ENV = "test"

    done = @async()
    http.get("http://localhost:#{port}", (res) ->
      console.log 'A server appears to already be running on port #{port}.'
      done()
    ).on 'error', (err) ->

      global.currentLineman = lineman = grunt.util.spawn
        cmd: "lineman"
        args: ["run"]
        opts:
          detached: true

      lineman.stdout.on "data", (data) ->
        if ~data.toString().indexOf("Waiting...")
          console.log("Started a Lineman server on port #{port}.")
          done()

      process.on 'exit', ->
        # Quit browser
        global.browser?.quit()

        # If we started a lineman process, kill it and
        # any child node processes
        console.log 'Shutting down lineman'
        lineman.kill()
        require('child_process').exec('pkill node', ->)


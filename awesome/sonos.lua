---------------------------------------------------------------------------
-- @author John Hamelink <john@johnhamelink.com>
-- @copyright 2013 John Hamelink
-- @release v1.0
---------------------------------------------------------------------------

-- http://lua-users.org/wiki/FileInputOutput

-- We need the unix socket library
socket      = require("socket")
socket.unix = require("socket.unix")

-- see if the file exists
function file_exists(file)
  local f = io.open(file, "r")
  if f then f:close() end
  return f ~= nil
end

function doSonosNowPlaying()

    local success, status = pcall(runSonosNowPlaying)

    if success then
        return status
    else
        return ""
    end
end

function runSonosNowPlaying()
    sock = "/tmp/sonos.sock"
    c = assert(socket.unix())
    c:connect(sock)
    c:send("now_playing\n")

    local line, err = c:receive()
    c:close()
    return "<span color=\"#1B9BE0\">Sonos:</span> <span color=\"#737373\">" .. line .. "</span> <span color=\"#4F4F4F\">|</span> "
end

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

---------------------------------------------------------------------------
-- @author John Hamelink <john@johnhamelink.com>
-- @copyright 2013 John Hamelink
-- @release v1.0
---------------------------------------------------------------------------

-- http://lua-users.org/wiki/FileInputOutput

-- We need the unix socket library
function doGpu()

  local script = io.popen("/home/john/.config/awesome/scripts/gpu.sh")
  local ret = script:read("*a")
  script:close()
  return "<span color=\"#1B9BE0\">GPU:</span> <span color=\"#737373\">" .. ret .. "</span>"

end


-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

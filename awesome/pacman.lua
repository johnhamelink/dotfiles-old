---------------------------------------------------------------------------
-- @author John Hamelink <john@johnhamelink.com>
-- @copyright 2013 John Hamelink
-- @release v1.0
---------------------------------------------------------------------------

-- http://lua-users.org/wiki/FileInputOutput

-- see if the file exists
function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

-- get all lines from a file, returns an empty
-- list/table if the file does not exist
function lines_from(file)
  if not file_exists(file) then return {} end
  lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

function doPacman()

    -- tests the functions above
    local file = '/tmp/paconkystatus'
    local lines = lines_from(file)
    local ret = ""

    -- print all line numbers and their contents
    for k,v in pairs(lines) do
        ret = ret .. v
    end

    if ret ~= "" then
        ret = "<span color='#1B9BE0'>Pacman:</span> " .. ret
        return ret
    end
    return ""

end

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

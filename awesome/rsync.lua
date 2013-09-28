---------------------------------------------------------------------------
-- @author John Hamelink <john@johnhamelink.com>
-- @copyright 2013 John Hamelink
-- @release v1.0
---------------------------------------------------------------------------

function doSync ()
    local script = io.popen("/home/john/.config/awesome/scripts/rsync.sh")
    local ret = script:read("*a")
    script:close()
    return ret
end

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

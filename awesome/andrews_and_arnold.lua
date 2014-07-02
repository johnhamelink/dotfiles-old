---------------------------------------------------------------------------
-- @author John Hamelink <john@johnhamelink.com>
-- @copyright 2014 John Hamelink
-- @release v1.0
-- 
-- Instructions:
--  * Create a base64 encoded string of "<your AA username>:<your AA password>"
--    (minus the brackets) and add it to the authorisation variable
--
---------------------------------------------------------------------------

require "json"
local http  = require 'ssl.https'
local ltn12 = require 'ltn12'

local authorisation = os.getenv("ANDREWS_AND_ARNOLD_BASIC_AUTH_HASH")
local cap           = (tonumber(os.getenv("ANDREWS_AND_ARNOLD_USAGE_LIMIT")) * 100000)


function getQuota ()
    local response_body = {}
    local status = http.request{
      url = "https://chaos.aa.net.uk/info?JSON=1",
      method = "GET",
      headers = { ["Authorization"] = "Basic " .. authorisation },
      sink = ltn12.sink.table(response_body)
    }

    local response = json.decode(table.concat(response_body))["login"][1]["broadband"][1]
    local quota_left = response["quota_left"]
    local usage = string.format("%.2f", ((tonumber(quota_left) / cap) / 100))
    return "<span color=\"#1B9BE0\">ISP Quota:</span> <span color=\"#737373\">" .. usage .. "%</span> <span color=\"#4F4F4F\">|</span> "
end

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

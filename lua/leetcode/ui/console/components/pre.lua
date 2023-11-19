local log = require("leetcode.logger")
local Text = require("leetcode-ui.component.text")
local Group = require("leetcode-ui.component.group")

local NuiText = require("nui.text")
local NuiLine = require("nui.line")

---@class lc.Result.Pre
local pre = {}
pre.__index = pre

---@param title? NuiLine|NuiText
---@param lines NuiLine[]
---
---@return lc-ui.Text
function pre:init(title, lines)
    local text = Text:init({})
    if title then text:append({ title, NuiLine() }) end

    for _, line in ipairs(lines) do
        local new_line = NuiLine({ NuiText("\t▎\t", "leetcode_indent") })
        new_line:append(line)
        text:append(new_line)
    end

    return text
end

return pre

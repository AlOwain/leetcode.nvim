local config = require("leetcode.config")
local Pre = require("leetcode.ui.console.components.pre")
local t = require("leetcode.translator")

local Line = require("leetcode-ui.component.line")

local stdout = {}

---@param output string
---
---@return lc-ui.Lines | nil
function stdout:init(output)
    local output_list = vim.split(output or "", "\n", { trimempty = true })
    if vim.tbl_isempty(output_list) then return end

    local tbl = {}
    for i = 1, #output_list, 1 do
        local line = Line()
        line:append(output_list[i])
        table.insert(tbl, line)
    end

    return Pre:init(Line():append((" %s"):format(t("Stdout")), "leetcode_alt"), tbl)
end

return stdout

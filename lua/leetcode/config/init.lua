local template = require("leetcode.config.template")

---@class lc.Settings
local config = {
    default = template, ---@type lc.UserConfig Default User configuration
    user = template, ---@type lc.UserConfig User configuration

    name = "leetcode.nvim",
    domain = "https://leetcode.com",
    debug = true,
    notify = false,
    lang = "cpp",
}

---@class lc.UserAuth
---@field name string
---@field is_signed_in boolean
---@field is_premium boolean
---@field id integer
config.auth = nil

config.default = template ---@type lc.UserConfig Default User configuration
config.user = template ---@type lc.UserConfig User configuration

---Merge configurations into default configurations and set it as user configurations.
---
---@param cfg lc.UserConfig Configurations to be merged.
function config.apply(cfg)
    config.user = vim.tbl_deep_extend("force", config.default, cfg)

    local ok, notify = pcall(require, "notify")
    if ok then
        vim.notify = notify
        config.notify = true
    end

    config.domain = "https://leetcode." .. config.user.domain
    config.lang = config.user.lang

    vim.api.nvim_set_hl(0, "LeetCodePTag", { link = "Comment" })
    vim.api.nvim_set_hl(0, "LeetCodeEmTag", { italic = true })
    vim.api.nvim_set_hl(0, "LeetCodeStrongTag", { bold = true })
    vim.api.nvim_set_hl(0, "LeetCodeCodeTag", { link = "DiagnosticHint" })
    vim.api.nvim_set_hl(0, "LeetCodeSupTag", { link = "MatchParen" })
    vim.api.nvim_set_hl(0, "LeetCodePreTag", { link = "@text" })
end

return config

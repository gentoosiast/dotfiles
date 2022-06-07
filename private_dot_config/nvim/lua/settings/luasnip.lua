-- https://github.com/L3MON4D3/LuaSnip

local ls = require'luasnip'
local s = ls.snippet
local c = ls.choice_node
local f = ls.function_node
local i = ls.insert_node
local t = ls.text_node

ls.snippets = {
    all = {
        s("tstamp", { t(os.date("%d %b %Y %H:%M %Z")) }),
        s("trchoice", c(1, {
            t("Ugh boring, a text node"),
            i(nil, "At least I can edit something now..."),
            f(function(args) return "Still only counts as text!!" end, {})
        }))
    }
}


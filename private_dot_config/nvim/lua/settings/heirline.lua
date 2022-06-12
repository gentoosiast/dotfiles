-- https://github.com/rebelot/heirline.nvim

local conditions = require'heirline.conditions'
local utils = require'heirline.utils'

local colors = {
    -- everforest medium dark colors
    bg0 = '#2f383e',
    bg1 = '#374247',
    bg2 = '#404c51',
    bg3 = '#4a555b',
    bg4 = '#525c62',
    bg5 = '#596763',
    bg_visual = '#573e4c',
    bg_red = '#544247',
    bg_green = '#445349',
    bg_blue = '#3b5360',
    bg_yellow = '#504f45',
    
    fg = '#d3c6aa',
    red = '#e67e80',
    orange = '#e69875',
    yellow = '#dbbc7f',
    green = '#a7c080',
    aqua = '#83c092',
    blue = '#7fbbb3',
    purple = '#d699b6',
    grey0 = '#7a8478',
    grey1 = '#859289',
    grey2 = '#9da9a0',
    statusline1 = '#a7c080',
    statusline2 = '#d3c6aa',
    statusline3 = '#e67e80',
    none = 'NONE'
}

local ViMode = {
    init = function(self)
        self.mode = vim.fn.mode(1)
    end,

    static = {
        mode_colors = {
            n = colors.red,
            v = colors.aqua,
            V = colors.aqua,
            ["\22"] = colors.aqua,
            s = colors.purple,
            S = colors.purple,
            ["\19"] = colors.purple,
            i = colors.green,
            R = colors.orange,
            c = colors.orange,
            r = colors.orange,
            ["!"] = colors.red,
            t = colors.red,
        }
    },

    provider = function(self)
        return "%2( " .. string.upper(self.mode) .. " %)"
    end,

    hl = function(self)
        local mode = self.mode:sub(1, 1)
        return { fg = colors.bg0, bg = self.mode_colors[mode], bold = true, }
    end,
}

local FileNameBlock = {
    init = function(self)
        -- full filename with path for the current buffer
        self.filename = vim.api.nvim_buf_get_name(0)
    end,
}

local FileType = {
    provider = function()
        return vim.bo.filetype
    end,

    hl = { fg = utils.get_highlight("Type").fg, bold = true },
}

local FileIcon = {
    init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color = require'nvim-web-devicons'.get_icon_color(filename, extension, { default = true })
    end,

    provider = function(self)
        return self.icon and (" " .. self.icon)
    end,

    hl = function(self)
        return { fg = self.icon_color }
    end
}

local FileName = {
    provider = function(self)
        local filename = vim.fn.fnamemodify(self.filename, ":.")
        if filename == "" then return "[No Name]" end
        if not conditions.width_percent_below(#filename, 0.25) then
            filename = vim.fn.pathshorten(filename)
        end
        
        return filename
    end,

    hl = { fg = colors.green },
}

local FileFlags = {
    -- {
    --     provider = function() if vim.bo.modified then return "[+]" end end,
    --     hl = { fg = colors.green }
    -- }, {
    {
        provider = function() if (not vim.bo.modifiable) or vim.bo.readonly then return "" end end,
        hl = { fg = colors.orange }
    }
}

local FileNameModifier = {
    hl = function()
        if vim.bo.modified then
            return { fg = colors.yellow, bold = true, force = true }
        end
    end,
}

local FileEncoding = {
    provider = function()
        local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc
        --return enc ~= 'utf-8'
        return enc
    end
}

local FileFormat = {
    provider = function()
        local fmt = vim.bo.fileformat
        -- return fmt ~= 'unix'
        return fmt
    end
}

FileNameBlock = utils.insert(FileNameBlock, utils.insert(FileNameModifier, FileName), FileIcon, unpack(FileFlags), { provider = '%<' })

local Spell = {
    condition = function()
        return vim.wo.spell
    end,

    provider = 'SPL',
    hl = { fg = colors.orange }
}

local Ruler = {
    -- :h 'statusline'
    provider = "%7(%l/%3L%):%2c %P",
}

local HelpFileName = {
    condition = function()
        return vim.bo.filetype == "help"
    end,

    provider = function()
        local filename = vim.api.nvim_buf_get_name(0)
        return vim.fn.fnamemodify(filename, ":t")
    end,

    hl = { fg = colors.blue },
}

local Git = {
    condition = conditions.is_git_repo,

    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
    end,

    hl = { fg = colors.green },

    {
        -- git branch name
        provider = function(self)
            return " " .. self.status_dict.head
        end,
        hl = { bold = true }
    },
}

local LSP = {
    init = function(self)
        self.diagnostics = require'lsp-status'.diagnostics()
    end,

    {
        provider = function(self)
            return self.diagnostics.errors ~= 0 and "e" .. self.diagnostics.errors
        end,

        hl = { bg = colors.bg_red }
    },

    {
        provider = function(self)
            return self.diagnostics.warnings ~= 0 and "w" .. self.diagnostics.warnings
        end,

        hl = { bg = colors.bg_yellow }
    },

    {
        provider = function(self)
            return self.diagnostics.info ~= 0 and "i" .. self.diagnostics.info
        end,

        hl = { bg = colors.bg_green }
    },

    {
        provider = function(self)
            return self.diagnostics.hints ~= 0 and "h" .. self.diagnostics.hints
        end,

        hl = { bg = colors.bg_blue }
    },
}

local GPS = {
    condition = require'nvim-gps'.is_available,
    provider = require'nvim-gps'.get_location,
    hl = { fg = "gray" },
}

local Align = { provider = "%=" }
local Space = { provider = " " }
 
local DefaultStatusline = {
    ViMode,
    Space,
    FileNameBlock,
    Space,
    FileType,
    Space,
    FileEncoding,
    Space,
    FileFormat,
    Space,
    Git,
    Space,
    GPS,
    Align,
    LSP,
    Space,
    Spell,
    Ruler
}

local SpecialStatusline = {
    condition = function()
        return conditions.buffer_matches({
            buftype = { "nofile", "prompt", "help", "quickfix" },
            filetype = { "^git.*", "fugitive" },
        })
    end,

    HelpFileName, Space, FileType, Align
}

local statusline = {
    hl = function()
        if conditions.is_active() then
            return {
                fg = utils.get_highlight("StatusLine").fg,
                bg = utils.get_highlight("StatusLine").bg
            }
        else
            return {
                fg = utils.get_highlight("StatusLineNC").fg,
                bg = utils.get_highlight("StatusLineNC").bg
            }
        end
    end,

    init = utils.pick_child_on_condition,

    SpecialStatusline, DefaultStatusline
}

require'heirline'.setup(statusline)


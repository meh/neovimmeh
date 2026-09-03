-- [nfnl] fnl/plugin/lualine.fnl
local lualine = require("lualine")
local session = require("auto-session.lib")
local noice = require("noice")
local timer = vim.loop.new_timer()
local function _1_()
  return vim.cmd("redrawtabline")
end
timer:start(0, 500, vim.schedule_wrap(_1_))
vim.cmd("set guioptions-=e\n          set showtabline=2")
local function session0()
  return session0.current_session_name(true)
end
local function battery_icon(charge)
  local case_2_ = {charge}
  local and_3_ = ((_G.type(case_2_) == "table") and (nil ~= case_2_[1]))
  if and_3_ then
    local c = case_2_[1]
    and_3_ = (c <= 20)
  end
  if and_3_ then
    local c = case_2_[1]
    return "\238\131\160"
  else
    local and_5_ = ((_G.type(case_2_) == "table") and (nil ~= case_2_[1]))
    if and_5_ then
      local c = case_2_[1]
      and_5_ = (c <= 40)
    end
    if and_5_ then
      local c = case_2_[1]
      return "\238\131\165"
    else
      local and_7_ = ((_G.type(case_2_) == "table") and (nil ~= case_2_[1]))
      if and_7_ then
        local c = case_2_[1]
        and_7_ = (c <= 60)
      end
      if and_7_ then
        local c = case_2_[1]
        return "\238\131\164"
      else
        local and_9_ = ((_G.type(case_2_) == "table") and (nil ~= case_2_[1]))
        if and_9_ then
          local c = case_2_[1]
          and_9_ = (c <= 80)
        end
        if and_9_ then
          local c = case_2_[1]
          return "\238\131\163"
        else
          local and_11_ = ((_G.type(case_2_) == "table") and (nil ~= case_2_[1]))
          if and_11_ then
            local c = case_2_[1]
            and_11_ = (c <= 95)
          end
          if and_11_ then
            local c = case_2_[1]
            return "\238\131\162"
          else
            local _ = case_2_
            return "\238\131\161"
          end
        end
      end
    end
  end
end
local function read_file(path, fmt)
  local f = io.open(path)
  if f then
    local f0 = f
    local function close_handlers_13_(ok_14_, ...)
      f0:close()
      if ok_14_ then
        return ...
      else
        return error(..., 0)
      end
    end
    local function _15_()
      return f0:read(fmt)
    end
    local _17_
    do
      local t_16_ = _G
      if (nil ~= t_16_) then
        t_16_ = t_16_.package
      else
      end
      if (nil ~= t_16_) then
        t_16_ = t_16_.loaded
      else
      end
      if (nil ~= t_16_) then
        t_16_ = t_16_.fennel
      else
      end
      _17_ = t_16_
    end
    local or_21_ = _17_ or _G.debug
    if not or_21_ then
      local function _22_()
        return ""
      end
      or_21_ = {traceback = _22_}
    end
    return close_handlers_13_(_G.xpcall(_15_, or_21_.traceback))
  else
    return nil
  end
end
local function battery()
  local charge = read_file("/sys/class/power_supply/BAT0/capacity", "n")
  if charge then
    if (charge == 100) then
      return ""
    else
      return string.format("%d %s", charge, battery_icon(charge))
    end
  else
    return nil
  end
end
local function battery_color()
  local charge = read_file("/sys/class/power_supply/BAT0/capacity", "n")
  if (charge and (charge <= 20)) then
    return {bg = 52, fg = 255}
  else
    return nil
  end
end
local recording = {noice.api.statusline.mode.get, cond = noice.api.statusline.mode.has, color = {fg = "#ffffff"}}
local theme = {normal = {a = {bg = 240, fg = 255, gui = "bold"}, b = {bg = 237, fg = 255, gui = "bold"}, c = {bg = 234, fg = 245}}, insert = {a = {bg = 124, fg = 255, gui = "bold"}, b = {bg = 88, fg = 255, gui = "bold"}, c = {bg = 52, fg = 255}}, visual = {a = {bg = 255, fg = "black"}, b = {bg = 250, fg = "black"}, c = {bg = 246, fg = "black"}}, replace = {a = {bg = "black", fg = "black"}, b = {bg = "black", fg = "black"}, c = {bg = "black", fg = "black"}}, command = {a = {bg = 237, fg = 255, gui = "bold"}, b = {bg = 235, fg = 255, gui = "bold"}, c = {bg = 232, fg = 245}}, inactive = {a = {bg = 238, fg = 255}, b = {bg = 235, fg = 255}, c = {bg = 232, fg = 245}}}
local function _27_(str)
  return str:sub(1, 1)
end
return lualine.setup({extensions = {"fugitive", "nvim-tree", "quickfix", "toggleterm"}, options = {component_separators = {left = "\226\148\130", right = "\226\148\130"}, section_separators = {left = "", right = ""}, disabled_filetypes = {"pi-chat-prompt", "pi-chat-history"}, theme = theme, icons_enabled = false}, sections = {lualine_a = {{"mode", fmt = _27_}}, lualine_b = {"branch", "diff"}, lualine_c = {{"diagnostics", symbols = {error = "x", warn = "!", info = "i", hint = "?"}}, {"filename", path = 1}}, lualine_x = {recording, "filetype"}, lualine_y = {"progress"}, lualine_z = {"location"}}, inactive_sections = {lualine_a = {}, lualine_b = {"branch", "diff"}, lualine_c = {{"filename", path = 1}}, lualine_x = {"filetype"}, lualine_y = {"location"}, lualine_z = {}}, tabline = {lualine_a = {}, lualine_b = {{"buffers", show_filename_only = false}}, lualine_c = {}, lualine_x = {{"navic", color_correction = "dynamic"}}, lualine_y = {{"jobs", show_empty = false}, "tabs"}, lualine_z = {session0, {battery, color = battery_color}}}})

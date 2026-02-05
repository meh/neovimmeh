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
local function battery()
  local capacity = io.open("/sys/class/power_supply/BAT0/capacity")
  local function close_handlers_13_(ok_14_, ...)
    capacity:close()
    if ok_14_ then
      return ...
    else
      return error(..., 0)
    end
  end
  local function _15_()
    local charge = capacity:read("n")
    if (charge == 100) then
      return ""
    else
      return string.format("%d %s", charge, battery_icon(charge))
    end
  end
  local _18_
  do
    local t_17_ = _G
    if (nil ~= t_17_) then
      t_17_ = t_17_.package
    else
    end
    if (nil ~= t_17_) then
      t_17_ = t_17_.loaded
    else
    end
    if (nil ~= t_17_) then
      t_17_ = t_17_.fennel
    else
    end
    _18_ = t_17_
  end
  local or_22_ = _18_ or _G.debug
  if not or_22_ then
    local function _23_()
      return ""
    end
    or_22_ = {traceback = _23_}
  end
  return close_handlers_13_(_G.xpcall(_15_, or_22_.traceback))
end
local function battery_color()
  local capacity = io.open("/sys/class/power_supply/BAT0/capacity")
  local function close_handlers_13_(ok_14_, ...)
    capacity:close()
    if ok_14_ then
      return ...
    else
      return error(..., 0)
    end
  end
  local function _25_()
    local charge = capacity:read("n")
    if (charge <= 20) then
      return {bg = 52, fg = 255}
    else
      return nil
    end
  end
  local _28_
  do
    local t_27_ = _G
    if (nil ~= t_27_) then
      t_27_ = t_27_.package
    else
    end
    if (nil ~= t_27_) then
      t_27_ = t_27_.loaded
    else
    end
    if (nil ~= t_27_) then
      t_27_ = t_27_.fennel
    else
    end
    _28_ = t_27_
  end
  local or_32_ = _28_ or _G.debug
  if not or_32_ then
    local function _33_()
      return ""
    end
    or_32_ = {traceback = _33_}
  end
  return close_handlers_13_(_G.xpcall(_25_, or_32_.traceback))
end
local recording = {noice.api.statusline.mode.get, cond = noice.api.statusline.mode.has, color = {fg = "#ffffff"}}
local theme = {normal = {a = {bg = 240, fg = 255, gui = "bold"}, b = {bg = 237, fg = 255, gui = "bold"}, c = {bg = 234, fg = 245}}, insert = {a = {bg = 124, fg = 255, gui = "bold"}, b = {bg = 88, fg = 255, gui = "bold"}, c = {bg = 52, fg = 255}}, visual = {a = {bg = 255, fg = "black"}, b = {bg = 250, fg = "black"}, c = {bg = 246, fg = "black"}}, replace = {a = {bg = "black", fg = "black"}, b = {bg = "black", fg = "black"}, c = {bg = "black", fg = "black"}}, command = {a = {bg = 237, fg = 255, gui = "bold"}, b = {bg = 235, fg = 255, gui = "bold"}, c = {bg = 232, fg = 245}}, inactive = {a = {bg = 238, fg = 255}, b = {bg = 235, fg = 255}, c = {bg = 232, fg = 245}}}
local function _34_(str)
  return str:sub(1, 1)
end
return lualine.setup({extensions = {"fugitive", "nvim-tree", "quickfix", "toggleterm"}, options = {component_separators = {left = "\226\148\130", right = "\226\148\130"}, section_separators = {left = "", right = ""}, theme = theme, icons_enabled = false}, sections = {lualine_a = {{"mode", fmt = _34_}}, lualine_b = {"branch", "diff"}, lualine_c = {{"diagnostics", symbols = {error = "x", warn = "!", info = "i", hint = "?"}}, {"filename", path = 1}}, lualine_x = {recording, "filetype"}, lualine_y = {"progress"}, lualine_z = {"location"}}, inactive_sections = {lualine_a = {}, lualine_b = {"branch", "diff"}, lualine_c = {{"filename", path = 1}}, lualine_x = {"filetype"}, lualine_y = {"location"}, lualine_z = {}}, tabline = {lualine_a = {}, lualine_b = {{"buffers", show_filename_only = false}}, lualine_c = {}, lualine_x = {{"navic", color_correction = "dynamic"}}, lualine_y = {"tabs"}, lualine_z = {session0, {battery, color = battery_color}}}})

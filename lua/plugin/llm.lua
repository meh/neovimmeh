-- [nfnl] fnl/plugin/llm.fnl
local _local_1_ = require("config.util")
local remap = _local_1_.remap
local on_monitor_3f = _local_1_["on-monitor?"]
local pi = require("pi")
return pi.setup({spinner = "classic", panels = {history = {title = "\207\128"}, prompt = {title = "prompt"}, attachments = {title = "files"}}, labels = {user_message = ">", agent_response = "<", system_error = "\243\177\154\159", tool = "\226\151\143", tool_success = "\226\156\148", tool_failure = "\226\156\150", steer_message = ">", follow_up_message = ">", thinking = "<", attachment = ">", attachments = ">", error = "!"}, expand_startup_details = false})

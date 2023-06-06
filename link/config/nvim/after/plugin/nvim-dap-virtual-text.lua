local status, vt = pcall(require, "nvim-dap-virtual-text")
if (not status) then return end

vt.setup {}

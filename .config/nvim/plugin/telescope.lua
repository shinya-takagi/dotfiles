-- Setup for telescope plugin

local status_ok, telescope = pcall(require, 'telescope')
if (not status_ok) then return end


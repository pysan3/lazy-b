local global_req, global_mod = pcall(require, "a-plugin")

vim.print(string.format([[B: global_req: %s]], global_req))
vim.print(string.format([[B: global_mod: %s]], vim.inspect(global_mod)))
if global_req and global_mod then
  local global_res = { pcall(global_mod.say, [[B: Hello from build.lua global!]]) }
  vim.print(string.format([[B: global_res: %s]], vim.inspect(global_res)))
end

vim.schedule(function()
  local local_req, local_mod = pcall(require, "a-plugin")
  vim.print(string.format([[B: local_req: %s]], local_req))
  vim.print(string.format([[B: local_mod: %s]], vim.inspect(local_mod)))

  if local_req and local_mod then
    local local_res = { pcall(local_mod.say, [[B: Hello from build.lua schedule!]]) }
    vim.print(string.format([[B: local_res: %s]], vim.inspect(local_res)))
  end
end)

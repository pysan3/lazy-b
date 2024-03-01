local global_req, global_mod = pcall(require, "a-plugin")

vim.print(string.format([[B: global_req: %s]], global_req))
vim.print(string.format([[B: global_mod: %s]], vim.inspect(global_mod)))
if global_req and global_mod then
  local global_res = { pcall(global_mod.say, [[B: Hello from init.lua global!]]) }
  vim.print(string.format([[B: global_res: %s]], vim.inspect(global_res)))
end

return {
  setup = function()
    local setup_req, setup_mod = pcall(require, "a-plugin")
    vim.print(string.format([[B: setup_req: %s]], setup_req))
    vim.print(string.format([[B: setup_mod: %s]], vim.inspect(setup_mod)))

    if setup_req and setup_mod then
      local setup_res = { pcall(setup_mod.say, [[B: Hello from init.lua setup!]]) }
      vim.print(string.format([[B: setup_res: %s]], vim.inspect(setup_res)))
    end
  end,
}

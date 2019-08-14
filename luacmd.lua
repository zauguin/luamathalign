local func_tbl = lua.get_functions_table()
local set_lua = token.set_lua
local new_luafunction = luatexbase.new_luafunction
return function(name, func, ...)
  local idx = new_luafunction(name)
  set_lua(name, idx, ...)
  func_tbl[idx] = func
end

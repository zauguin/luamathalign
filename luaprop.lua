return function(namespace)
  return {
    query = function(n)
      local p = node.getproperty(n)
      return p and p[namespace]
    end,
    get = function(n, ...)
      local p = node.getproperty(n)
      if not p then
        p = {}
        node.setproperty(n, p)
      end
      local n = p[namespace]
      if nil == p[namespace] then
        local d = select('#', ...) ~= 0 and ... or {}
        n, p[namespace] = d, d
      end
      return n
    end,
    set = function(n, v)
      local p = node.getproperty(n)
      if not p then
        p = {}
        node.setproperty(n, p)
      end
      local old = p[namespace]
      p[namespace] = v
      return old
    end,
  }
end

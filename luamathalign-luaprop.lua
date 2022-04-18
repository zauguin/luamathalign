----Copyright (C) 2019--2022 by Marcel Krueger
---
--- This file may be distributed and/or modified under the
--- conditions of the LaTeX Project Public License, either
--- version 1.3c of this license or (at your option) any later
--- version. The latest version of this license is in:
---
--- http://www.latex-project.org/lppl.txt
---
--- and version 1.3 or later is part of all distributions of
--- LaTeX version 2005/12/01 or later.
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

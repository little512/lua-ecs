-- is held in an entity with no behavior, only states are stored.

local component = {}

function component.new(comp)
    for _ in ipairs(comp) do
        error("Component should not have continuous elements (should be dictionary)")
    end

    comp.__component = true

    if not getmetatable(comp) then
        setmetatable(comp, {
            __index = component;
            __newindex = function() return error("Cannot write to read-only component.") end;
        })
    else
        error("Component table passed in should not have metatable attached.")
    end

    return comp -- you shouldn't have a reference to the original table unless it's a template table copy
end

return component

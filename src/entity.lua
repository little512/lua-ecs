-- stores a group of components

local entity = {}
entity.__index = entity

function entity.new()
    local self = setmetatable({
        components = {}
    }, entity)

    return self
end

function entity:addComponent(name, component)
    if component.__component then
        self.components[name] = component
    else
        error("Cannot add non-component item to entity.")
    end
end

function entity:removeComponent(name)
    self.components[name] = nil
end

return entity

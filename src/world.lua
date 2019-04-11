-- holds collections of systems and entities

local world = {}
world.__index = world

function world.new()
    local self = setmetatable({
        systems = {};
        entities = {};
    }, world)

    return self
end

function world:addSystem(name, system)
    self.systems[name] = system
end

function world:addEntity(name, entity)
    self.entities[name] = entity
end

function world:removeSystem(name)
    self.systems[name] = nil
end

function world:removeEntity(name)
    self.entities[name] = nil
end

function world:step(dt)
    for _, system in pairs(self.systems) do
        system:behave(dt)
    end
end

return world

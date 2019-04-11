-- has behavior, but has no states

local system = {}
system.__index = system

function system.new()
    local self = setmetatable({
        behaviors = {}
    }, system)

    return self
end

function system:addBehavior(behavior)
    table.insert(self.behaviors, behavior)
end

function system:behave(dt)
    for _, behavior in ipairs(self.behaviors) do
        behavior.process(dt)
    end
end

return system

-- performs operations on components

local behavior = {}

function behavior.new(entities, _process,  ...)
    -- behavior behavior.new(table<entity> entities, function process, string... subscribed_components)
    -- void process(string component_name, int deltaTick)
    local subscribed_components = {...}

    local self = {
        process = function(dt)
            for _, entity in ipairs(entities) do
                for _, component_name in ipairs(subscribed_components) do
                    if entity.components[component_name] then
                        entity.components[component_name] = _process(entity.components[component_name], dt)
                    end
                end
            end
        end
    }

    return self
end

return behavior

local ecs = require("init")

local world = ecs.world.new()

local john = ecs.entity.new()

john:addComponent("information", ecs.component.new({
    name = "John";
    age = 20;
    phrase = "Hello.";
}))

world:addEntity("entityJohn", john)

local bob = ecs.entity.new()

bob:addComponent("information", ecs.component.new({
    name = "Bob";
    age = 22;
    phrase = "Hi.";
}))

world:addEntity("entityBob", bob)

local age = ecs.system.new()

age:addBehavior(ecs.behavior.new(
    {john, bob},
    function(information, dt)
        print(("%s says: \"%s\""):format(information.name, information.phrase))
        information.age = information.age + dt
        print(("%s's age is %d"):format(information.name, information.age))
        return information -- overwrite the previous "information" component
    end,
    "information") -- you can have the same behavior for multiple components of multiple entities
)

world:addSystem("systemAge", age)

for _ = 1, 10 do
    world:step(1)
end

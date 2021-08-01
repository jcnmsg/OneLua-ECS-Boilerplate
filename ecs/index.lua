return {
    Entity = dofile('./ecs/entity.lua'),
    Component = dofile("./ecs/component.lua"),
    System = dofile("./ecs/system.lua"),
    World = dofile("./ecs/world.lua")
}
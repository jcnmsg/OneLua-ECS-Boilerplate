return {
    Components = {
        Body = dofile('./lib/components/body.lua'),
        Fill = dofile('./lib/components/fill.lua')
    },
    Systems = {
        Renderer = dofile("./lib/systems/renderer.lua")
    },
    Entities = {
        Rectangle = dofile("./lib/entities/rectangle.lua")
    }
}
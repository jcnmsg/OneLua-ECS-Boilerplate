# OneLua ECS Boilerplate

A simple boilerplate for making PSP games using the [Entity–component–system](https://en.wikipedia.org/wiki/Entity_component_system) architectural pattern with [OneLua](http://onelua.x10.mx/psp/docs/en/). The framework is implemented based on [this tutorial](https://www.youtube.com/watch?v=dZ_X0r-49cw) on how to develop a simple ECS framework for [Love2D](https://love2d.org/).

## Usage

Simple clone this repository and start hacking away. The entities/components/systems included in the example library are just that, examples, so feel free to remove them once you're comfortable with creating your own. 

Creating a component:

````lua
local example_component = ECS.Component.new("example_component")
````

Creating a system that requires x components:
````lua
local example_system = ECS.System.new("example_system", { "example_component" })
````

Creating an entity:
````lua
local example_entity = ECS.Entity.new()
ECS.World.add(example_entity)
-- or create and add automatically to the world
local example_entity = ECS.World:create() 
````

Adding component to an entity:
````lua
example_entity.add(example_component)
````

## Contributions

The code can always improve so feel free to contribute.

## License

MIT




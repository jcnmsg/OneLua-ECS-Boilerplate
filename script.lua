-- Initialize
screen.bilinear(0)
os.cpu(333)
previous_frame_time, current_frame_time = 0, 0

-- Import ECS framework and small example library  
ECS = dofile("./ecs/index.lua")
Library = dofile("./lib/index.lua")

-- Register a new "Renderer" system
local renderer_system = Library.Systems.Renderer()
ECS.World:register(renderer_system)

-- Create three new entities with "Rectangle" and "Body" components
Library.Entities.Rectangle(30, 30, 50, 100, color.new(66,0,0))
Library.Entities.Rectangle(90, 90, 50, 30, color.new(0,66,0))
Library.Entities.Rectangle(260, 90, 50, 30, color.new(0,0,66))

while 1 do 
    current_frame_time = os.clock()
    local dt = current_frame_time - previous_frame_time
    previous_frame_time = os.clock()

    -- Update world
    ECS.World:update(dt)

    -- Draw world
    ECS.World:draw()

    -- Flip and wait blank start
    screen.flip();
end
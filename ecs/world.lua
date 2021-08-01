local Entity = dofile('ecs/entity.lua')

local World = {
    entities = {},
    systems = {}
}

-- Registers system to the world
function World:register(system)
    table.insert(self.systems, system)
end

-- Unregister a system from the world by its reference
function World:unregister(system)
    table.remove(self.systems, system)
end

-- Unregisters system from the world by its id
function World:unregister_by_id(id)
    for i, system in ipairs(self.systems) do
        if (system.__id == id) then
            table.remove(self.systems, i)
            return system;
        end
    end
end

-- Create entity in the world
function World:create()
    local entity = Entity:new()
    table.insert(self.entities, entity)
    return entity
end

-- Add entity to the world
function World:add(entity)
    table.insert(self.entities, entity)
end

-- Remove entity from the world by its reference
function World:remove(entity)
    table.remove(self.entities, entity)
    return entity
end

-- World update
function World:update(dt)
    for i = #self.entities, 1, -1 do 
        local entity = self.entities[i]

        if entity.remove then
            for i, system in ipairs(self.systems) do
                if system:match(entity) then
                    system:destroy(entity)
                end
            end
            
            table.remove(self.entities, i)
        else
            for i, system in ipairs(self.systems) do
                if system:match(entity) then
                    if entity.loaded == false then
                        system:load(entity)
                    end

                    system:update(dt, entity)
                end
            end

            entity.loaded = true
        end
    end
end

-- World draw
function World:draw()
    for i = 1, #self.entities do
        local entity = self.entities[i]
        for i, system in ipairs(self.systems) do
            if system:match(entity) then
                system:draw(entity)
            end
        end
    end
end

return World
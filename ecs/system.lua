return {
    new = function(id, requires)
        assert(id)
        assert(type(requires) == 'table')
        
        local system = {
            __id = id,
            requires = requires
        }

        function system:match(entity)
            local match = true
            
            for i = 1, #self.requires do
                if entity:get(self.requires[i]) == nil then
                    match = false
                end
            end

            return match
        end

        function system:load(entity) end
        function system:update(dt, entity) end
        function system:draw(entity) end
        function system:destroy(entity) end

        return system;
    end
}
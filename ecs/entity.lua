return {
    new = function() 
        local entity = {
            components = {},
            tags = {},
            remove = false,
            loaded = false
        }

        function entity:add(component)
            assert(component.__id)
            self.components[component.__id] = component
            return component
        end

        function entity:chain_add(component)
            assert(component.__id)
            self.components[component.__id] = component
            return self
        end

        function entity:get(id)
            return self.components[id]
        end

        function entity:destroy()
            self.remove = true;
        end
        
        return entity
    end
}
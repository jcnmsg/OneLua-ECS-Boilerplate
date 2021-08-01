return function (x, y, w, h, c) 
    return ECS.World:create()
            :chain_add(Library.Components.Body(x, y, w, h))
            :chain_add(Library.Components.Fill(c))
end
return function()
    local renderer = ECS.System.new("renderer", {"body", "fill"})
    
    function renderer:draw(entity)
        local body = entity:get("body")
        local fill = entity:get("fill")
        draw.fillrect(body.x, body.y, body.width, body.height, fill.color)
    end
    
    return renderer
end
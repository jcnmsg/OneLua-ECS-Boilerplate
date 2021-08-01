return function(x, y, width, height)
    local body = ECS.Component.new("body")
    body.x = x
    body.y = y
    body.width = width
    body.height = height

    return body
end
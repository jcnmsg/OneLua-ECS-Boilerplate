return function(color)
    local fill = ECS.Component.new("fill")
    fill.color = color;
    return fill
end
local model = game:GetObjects("rbxassetid://105124723879310")[1]
if model then
    model.Parent = workspace

    if model:IsA("Model") then
        local cf = CFrame.new(265.5, 0, -27.77) * CFrame.Angles(0, math.rad(180), 0)
        model:PivotTo(cf)
    else
        model.CFrame = CFrame.new(265.5, 0, -54) * CFrame.Angles(0, math.rad(180), 0)
    end
end
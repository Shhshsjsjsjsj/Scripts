local Tool = game:GetObjects("rbxassetid://75023659702098")[1]
Tool.TextureId = "rbxassetid://15686227905"
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:FindFirstChild("Humanoid")

Tool.Parent = Player.Backpack
Tool.RequiresHandle = true

local Animation = Instance.new("Animation")
Animation.AnimationId = "rbxassetid://10479585177"

local AnimationTrack
local Sound = Tool.Giggle.Root.Laugh

Sound.Looped = true

Tool.Equipped:Connect(function()
    if Humanoid then
        AnimationTrack = Humanoid:LoadAnimation(Animation)
        AnimationTrack.Looped = true
        AnimationTrack:Play()
    end
    Sound:Play()
end)

Tool.Unequipped:Connect(function()
    if AnimationTrack then
        AnimationTrack:Stop()
        AnimationTrack = nil
    end
    Sound:Stop()
end)
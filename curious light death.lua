-- MischeviousLight.lua
-- [Comet Development] By Chrono
-- This file is part of the Hotel ++ Project.
-- + Cred to Dripo for that stupid sound path for the original guiding lighht music 😄

_G.DO_RED_GUY = true -- enabled for debugging purposes only.

local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")

local Camera = workspace.CurrentCamera
local DeathName = "DeathBackgroundBlue"

local RedPrimary = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(179, 148, 110)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(179, 148, 110))
})

local Player = Players.LocalPlayer
local PlayerGui = Player.PlayerGui
local MainUI = PlayerGui.MainUI
local Death = MainUI.Death
local HelpfulDialogue = Death.HelpfulDialogue
local MainGame = MainUI.Initiator.Main_Game
local Health = MainGame.Health
local Music = Health.Music

local function getGitSoundId(GithubSoundPath: string, AssetName: string): Sound
    local Url = GithubSoundPath

    if not isfile(AssetName..".mp3") then 
        writefile(AssetName..".mp3", game:HttpGet(Url)) 
    end

    local Sound = Instance.new("Sound")
    Sound.SoundId = getcustomasset(AssetName..".mp3", true)
    return Sound 
end

Camera.ChildAdded:Connect(
    function(Child): ()
        if Child.Name ~= DeathName then
            return
        end

        if not _G.DO_RED_GUY then
            return
        end

        for _, Asset in Music:GetChildren() do
            if Asset:IsA("Sound") then
                Asset:Destroy() -- lazy 
            end
        end

        local Lights = Child.Lights
        local Fog = Child.FogAndSmaller
        local Water = Child.Water

        for _, Light in Lights:GetDescendants() do
            if Light:IsA("SpotLight") then
                Light.Color = Color3.fromRGB(179, 148, 110)
            end

            if Light:IsA("ParticleEmitter") then
                Light.Color = RedPrimary
            end
        end

        for _, FogL in Fog:GetChildren() do
            FogL.Color = RedPrimary
        end

        for _, WaterL in Water:GetChildren() do
            WaterL.Color = RedPrimary
        end

        local BigLight = Lights.BigLight
        local Attachment = BigLight.Attachment
        local Moon = Attachment.Moon
        Moon.Texture = "rbxassetid://84862764929185"
        HelpfulDialogue.TextColor3 = Color3.fromRGB(179, 148, 110)

        local CustomMusic = getGitSoundId("https://raw.githubusercontent.com/ChronoAcceleration/Hotel-Plus-Plus/refs/heads/main/Assets/MischeviousLight.mp3", "MischeviousLight")
        CustomMusic.Parent = SoundService
        CustomMusic.Looped = true
        CustomMusic:Play()
    end
)
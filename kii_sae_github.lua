-- ======================================================
-- KII SAE INTRO LOADER • EPIC MOBILE EDITION
-- The uploaded KiiSae Hub Intro source runs first.
-- ======================================================
local KII_SAE_INTRO_SOURCE = [=[
-- ======================================================
-- KII SAE HUB • IMPACT INTRO
-- KII SAE enters from the RIGHT and HUB from the LEFT.
-- ======================================================
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer

local LOGO_ASSET = "rbxassetid://80227588329123"

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local GuiParent = (gethui and gethui()) or PlayerGui

local oldIntro = GuiParent:FindFirstChild("KiiSaeHubIntro")
if oldIntro then pcall(function() oldIntro:Destroy() end) end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KiiSaeHubIntro"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 100000
ScreenGui.Parent = GuiParent

local Blur = Instance.new("BlurEffect")
Blur.Name = "KiiSaeHubIntroBlur"
Blur.Size = 0
Blur.Parent = Lighting

local Background = Instance.new("Frame")
Background.Size = UDim2.fromScale(1,1)
Background.BackgroundColor3 = Color3.fromRGB(2,4,8)
Background.BorderSizePixel = 0
Background.Parent = ScreenGui

local bgGradient = Instance.new("UIGradient")
bgGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(2,4,8)),
    ColorSequenceKeypoint.new(0.45, Color3.fromRGB(8,12,20)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255,255,255)),
    ColorSequenceKeypoint.new(0.55, Color3.fromRGB(8,12,20)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(2,4,8))
})
bgGradient.Offset = Vector2.new(1.25,0)
bgGradient.Parent = Background

local glow = Instance.new("Frame")
glow.AnchorPoint = Vector2.new(0.5,0.5)
glow.Position = UDim2.fromScale(0.5,0.5)
glow.Size = UDim2.fromScale(0.8,0.5)
glow.BackgroundColor3 = Color3.fromRGB(255,45,60)
glow.BackgroundTransparency = 0.96
glow.BorderSizePixel = 0
glow.Parent = Background

local titleGroup = Instance.new("Frame")
titleGroup.AnchorPoint = Vector2.new(0.5,0.5)
titleGroup.Position = UDim2.fromScale(0.5,0.47)
titleGroup.Size = UDim2.fromScale(0.82,0.20)
titleGroup.BackgroundTransparency = 1
titleGroup.Parent = ScreenGui

local kiisae = Instance.new("TextLabel")
kiisae.BackgroundTransparency = 1
kiisae.AnchorPoint = Vector2.new(1,0.5)
kiisae.Position = UDim2.new(0.5,-6,0.5,0)
kiisae.Size = UDim2.new(0.46,0,1,0)
kiisae.Text = "KII SAE"
kiisae.Font = Enum.Font.Gotham
kiisae.TextSize = 56
kiisae.TextColor3 = Color3.fromRGB(255,255,255)
kiisae.TextXAlignment = Enum.TextXAlignment.Right
kiisae.Parent = titleGroup

local hub = Instance.new("TextLabel")
hub.BackgroundTransparency = 1
hub.AnchorPoint = Vector2.new(0,0.5)
hub.Position = UDim2.new(0.5,6,0.5,0)
hub.Size = UDim2.new(0.46,0,1,0)
hub.Text = "HUB"
hub.Font = Enum.Font.Gotham
hub.TextSize = 56
hub.TextColor3 = Color3.fromRGB(255,55,70)
hub.TextXAlignment = Enum.TextXAlignment.Left
hub.Parent = titleGroup

local vGrad = Instance.new("UIGradient")
vGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255,55,70)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255,255,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255,55,70))
})
vGrad.Parent = kiisae

local hGrad = vGrad:Clone()
hGrad.Parent = hub

local impact = Instance.new("Frame")
impact.AnchorPoint = Vector2.new(0.5,0.5)
impact.Position = UDim2.fromScale(0.5,0.47)
impact.Size = UDim2.fromOffset(4,52)
impact.BackgroundColor3 = Color3.fromRGB(8,8,10)
impact.BackgroundTransparency = 1
impact.Rotation = -8
impact.ZIndex = 10
impact.Parent = ScreenGui

local logo = Instance.new("ImageLabel")
logo.AnchorPoint = Vector2.new(0.5,0.5)
logo.Position = UDim2.fromScale(0.5,0.28)
logo.Size = UDim2.fromOffset(70,70)
logo.BackgroundTransparency = 1
logo.Image = LOGO_ASSET
logo.ImageTransparency = 1
logo.ScaleType = Enum.ScaleType.Fit
logo.Parent = ScreenGui

local logoShine = Instance.new("Frame")
logoShine.AnchorPoint = Vector2.new(0.5,0.5)
logoShine.Position = UDim2.fromScale(1.3,0.5)
logoShine.Size = UDim2.new(0.22,0,1.35,0)
logoShine.BackgroundColor3 = Color3.fromRGB(255,255,255)
logoShine.BackgroundTransparency = 0.65
logoShine.BorderSizePixel = 0
logoShine.Rotation = 12
logoShine.Parent = logo

local logoShineGrad = Instance.new("UIGradient")
logoShineGrad.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0,1),
    NumberSequenceKeypoint.new(0.45,1),
    NumberSequenceKeypoint.new(0.5,0.05),
    NumberSequenceKeypoint.new(0.55,1),
    NumberSequenceKeypoint.new(1,1)
})
logoShineGrad.Parent = logoShine

logo.ClipsDescendants = true

local status = Instance.new("TextLabel")
status.AnchorPoint = Vector2.new(0.5,0)
status.Position = UDim2.fromScale(0.5,0.62)
status.Size = UDim2.new(0.8,0,0,20)
status.BackgroundTransparency = 1
status.Text = "INITIALIZING KII SAE HUB"
status.Font = Enum.Font.Gotham
status.TextSize = 11
status.TextColor3 = Color3.fromRGB(145,150,160)
status.TextTransparency = 1
status.Parent = ScreenGui

local function tw(obj, time, style, dir, props)
    local t = TweenService:Create(obj, TweenInfo.new(time, style or Enum.EasingStyle.Quart, dir or Enum.EasingDirection.Out), props)
    t:Play()
    return t
end

task.spawn(function()
    while ScreenGui.Parent and Background.Parent do
        bgGradient.Offset = Vector2.new(1.25,0)
        local t = tw(bgGradient, 2.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, {Offset=Vector2.new(-1.25,0)})
        t.Completed:Wait()
        task.wait(0.12)
    end
end)

task.spawn(function()
    while ScreenGui.Parent and logo.Parent do
        logoShine.Position = UDim2.fromScale(1.3,0.5)
        local t = tw(logoShine, 1.15, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, {Position=UDim2.fromScale(-0.3,0.5)})
        t.Completed:Wait()
        task.wait(0.35)
    end
end)

local function fadeText(label, transparency, time)
    tw(label, time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, {TextTransparency=transparency})
end

-- KII SAE starts outside on the right. HUB starts outside on the left.
kiisae.Position = UDim2.new(1.18,0,0.5,0)
hub.Position = UDim2.new(-0.18,0,0.5,0)
kiisae.TextTransparency = 0
hub.TextTransparency = 0

tw(Blur, 0.80, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, {Size=16})
fadeText(status,0,0.55)

-- The two words collide, compress slightly, then rebound like two objects meeting.
tw(kiisae, 1.20, Enum.EasingStyle.Back, Enum.EasingDirection.Out, {Position=UDim2.new(0.5,12,0.5,0)})
tw(hub, 1.20, Enum.EasingStyle.Back, Enum.EasingDirection.Out, {Position=UDim2.new(0.5,-12,0.5,0)})
task.wait(1.05)

-- Impact crack: X and H briefly darken at the exact meeting point.
tw(impact,0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,{BackgroundTransparency=0.05, Size=UDim2.fromOffset(9,66)})
tw(kiisae,0.14,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,{Position=UDim2.new(0.5,-2,0.5,0)})
tw(hub,0.14,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,{Position=UDim2.new(0.5,2,0.5,0)})
task.wait(0.14)

-- Rebound: they separate a little, then settle together again.
tw(impact,0.28,Enum.EasingStyle.Quad,Enum.EasingDirection.In,{BackgroundTransparency=1, Size=UDim2.fromOffset(2,48)})
tw(kiisae,0.48,Enum.EasingStyle.Back,Enum.EasingDirection.Out,{Position=UDim2.new(0.5,-6,0.5,0)})
tw(hub,0.48,Enum.EasingStyle.Back,Enum.EasingDirection.Out,{Position=UDim2.new(0.5,6,0.5,0)})
status.Text = "KII SAE HUB • READY"
task.wait(0.65)

-- Logo arrives after the title has fully settled.
tw(logo,0.55,Enum.EasingStyle.Back,Enum.EasingDirection.Out,{ImageTransparency=0, Position=UDim2.fromScale(0.5,0.28)})
task.wait(0.65)

-- Cinematic handoff: title pulls backward while the main UI is revealed.
tw(Blur,0.55,Enum.EasingStyle.Quart,Enum.EasingDirection.Out,{Size=22})
tw(titleGroup,0.65,Enum.EasingStyle.Quart,Enum.EasingDirection.In,{Position=UDim2.fromScale(0.5,0.40), Size=UDim2.fromScale(1.02,0.25)})
tw(logo,0.55,Enum.EasingStyle.Quart,Enum.EasingDirection.In,{ImageTransparency=1, Position=UDim2.fromScale(0.5,0.20)})
tw(status,0.40,Enum.EasingStyle.Quart,Enum.EasingDirection.In,{TextTransparency=1})
task.wait(0.65)

tw(Blur,0.65,Enum.EasingStyle.Quart,Enum.EasingDirection.In,{Size=0})
tw(Background,0.65,Enum.EasingStyle.Quart,Enum.EasingDirection.In,{BackgroundTransparency=1})
task.wait(0.70)

pcall(function() Blur:Destroy() end)
ScreenGui:Destroy()
]=]

--[[
    KII SAE SCRIPT HUB
    Built from Steal_An_Egg_All_Scripts.txt

    Features:
    - Small mobile-friendly GUI
    - Scripts tab with all named entries from the source file
    - Config tab
    - GUI size controls
    - Color/theme controls
    - Touch + mouse dragging
    - Open / close / minimize animations
    - Individual execute buttons
]]

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")

local KiiSaeSoundFolder = Instance.new("Folder")
KiiSaeSoundFolder.Name = "KiiSaeSounds"
KiiSaeSoundFolder.Parent = SoundService

-- One sound only: every click/option change produces exactly one immediate sound.
local KiiSaeClickSound = Instance.new("Sound")
KiiSaeClickSound.Name = "KiiSaeClick"
KiiSaeClickSound.SoundId = "rbxassetid://6026984224"
KiiSaeClickSound.Volume = 0.30
KiiSaeClickSound.Parent = KiiSaeSoundFolder

local function KiiSaePlayClick(speed, volume)
    pcall(function()
        KiiSaeClickSound:Stop()
        KiiSaeClickSound.TimePosition = 0
        KiiSaeClickSound.PlaybackSpeed = speed or 1
        KiiSaeClickSound.Volume = volume or 0.30
        KiiSaeClickSound:Play()
    end)
end

local function KiiSaePlayExecute()
    KiiSaePlayClick(1.18, 0.34)
end

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local old = PlayerGui:FindFirstChild("KiiSae")
if old then
    old:Destroy()
end

local Scripts = {}

local Themes = {
    {Name = "KiiSae Red", Main = Color3.fromRGB(8, 16, 30), Panel = Color3.fromRGB(13, 27, 46), Accent = Color3.fromRGB(255, 72, 72), ButtonDark = Color3.fromRGB(95, 8, 18)},
    {Name = "KiiSae Purple", Main = Color3.fromRGB(18, 17, 25), Panel = Color3.fromRGB(27, 24, 36), Accent = Color3.fromRGB(160, 100, 255), ButtonDark = Color3.fromRGB(72, 35, 120)},
    {Name = "KiiSae Blue", Main = Color3.fromRGB(15, 19, 26), Panel = Color3.fromRGB(23, 29, 40), Accent = Color3.fromRGB(75, 145, 255), ButtonDark = Color3.fromRGB(18, 55, 105)},
    {Name = "KiiSae Gold", Main = Color3.fromRGB(22, 20, 16), Panel = Color3.fromRGB(31, 28, 21), Accent = Color3.fromRGB(255, 190, 65), ButtonDark = Color3.fromRGB(105, 72, 12)},
    {Name = "KiiSae Green", Main = Color3.fromRGB(15, 22, 19), Panel = Color3.fromRGB(22, 32, 27), Accent = Color3.fromRGB(75, 220, 135), ButtonDark = Color3.fromRGB(18, 92, 55)},
}

local KII_SAE_LOGO_ASSET = "rbxassetid://80227588329123"

local ThemeIndex = 1
local SizeIndex = 2
local Sizes = {
    UDim2.fromOffset(320, 250),
    UDim2.fromOffset(360, 285),
    UDim2.fromOffset(410, 325),
}

local function tween(obj, info, props)
    local t = TweenService:Create(obj, info, props)
    t:Play()
    return t
end

local function addAnimatedButtonBorder(button, accent)
    local border = Instance.new("UIStroke")
    border.Name = "KiiSaeButtonBorder"
    border.Thickness = 1.25
    border.Color = accent
    border.Transparency = 0.10
    border.Parent = button

    local gradient = Instance.new("UIGradient")
    gradient.Name = "KiiSaeButtonBorderGradient"
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0.00, accent),
        ColorSequenceKeypoint.new(0.40, accent),
        ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255,255,255)),
        ColorSequenceKeypoint.new(0.60, accent),
        ColorSequenceKeypoint.new(1.00, accent)
    })
    gradient.Offset = Vector2.new(1.15,0)
    gradient.Parent = border

    task.spawn(function()
        while button.Parent and border.Parent do
            gradient.Offset = Vector2.new(1.15,0)
            local t = tween(gradient,TweenInfo.new(1.55,Enum.EasingStyle.Linear),{Offset=Vector2.new(-1.15,0)})
            t.Completed:Wait()
            task.wait(0.08)
        end
    end)

    return border
end

local gui = Instance.new("ScreenGui")
gui.Name = "KiiSae"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 9999
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = PlayerGui

local scale = Instance.new("UIScale")
scale.Scale = 0.88
scale.Parent = gui

local shadow = Instance.new("Frame")
shadow.Name = "Shadow"
shadow.AnchorPoint = Vector2.new(0.5, 0.5)
shadow.Position = UDim2.fromScale(0.5, 0.52)
shadow.Size = Sizes[SizeIndex]
shadow.BackgroundColor3 = Color3.new(0,0,0)
shadow.BackgroundTransparency = 0.45
shadow.BorderSizePixel = 0
shadow.Parent = gui

local shadowCorner = Instance.new("UICorner")
shadowCorner.CornerRadius = UDim.new(0, 16)
shadowCorner.Parent = shadow

local main = Instance.new("Frame")
main.Name = "Main"
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Position = UDim2.fromScale(0.5, 0.48)
main.Size = Sizes[SizeIndex]
main.BackgroundColor3 = Color3.fromRGB(8, 16, 30)
main.BorderSizePixel = 0
main.ClipsDescendants = true
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 16)
mainCorner.Parent = main

local mainBgSweep = Instance.new("UIGradient")
mainBgSweep.Name = "KiiSaeBackgroundSweep"
mainBgSweep.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(8,16,30)),
    ColorSequenceKeypoint.new(0.40, Color3.fromRGB(8,16,30)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255,255,255)),
    ColorSequenceKeypoint.new(0.60, Color3.fromRGB(8,16,30)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(8,16,30))
})
mainBgSweep.Offset = Vector2.new(1.25,0)
mainBgSweep.Parent = main

task.spawn(function()
    while gui.Parent and main.Parent do
        mainBgSweep.Offset = Vector2.new(1.25,0)
        local t = tween(mainBgSweep,TweenInfo.new(3.0,Enum.EasingStyle.Linear),{Offset=Vector2.new(-1.25,0)})
        t.Completed:Wait()
        task.wait(0.12)
    end
end)

local stroke = Instance.new("UIStroke")
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(0,0,0)
stroke.Transparency = 0.05
stroke.Parent = main

local top = Instance.new("Frame")
top.Name = "TopBar"
top.Size = UDim2.new(1, 0, 0, 55)
top.BackgroundTransparency = 1
top.Parent = main

local title = Instance.new("TextLabel")
title.BackgroundTransparency = 1
title.Position = UDim2.fromOffset(74, 3)
title.Size = UDim2.new(1, -170, 0, 28)
title.Font = Enum.Font.Gotham
title.Text = "KII SAE"
title.TextSize = 22
title.TextXAlignment = Enum.TextXAlignment.Center
title.TextColor3 = Color3.new(1,1,1)
title.Parent = top

local titleGradient = Instance.new("UIGradient")
titleGradient.Rotation = 0
titleGradient.Offset = Vector2.new(1.2, 0)
titleGradient.Parent = title

local KiiSaeRed = Color3.fromRGB(255, 72, 72)
local KiiSaeWhite = Color3.fromRGB(255, 255, 255)

-- KII SAE: seamless red -> white -> red -> white.
-- Both ends are red so the loop can restart without a visible red snap.
titleGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, KiiSaeRed),
    ColorSequenceKeypoint.new(0.18, KiiSaeRed),
    ColorSequenceKeypoint.new(0.34, KiiSaeWhite),
    ColorSequenceKeypoint.new(0.50, KiiSaeRed),
    ColorSequenceKeypoint.new(0.66, KiiSaeRed),
    ColorSequenceKeypoint.new(0.82, KiiSaeWhite),
    ColorSequenceKeypoint.new(1.00, KiiSaeRed)
})

task.spawn(function()
    while gui.Parent and title.Parent do
        titleGradient.Offset = Vector2.new(1.2, 0)
        local t = tween(titleGradient, TweenInfo.new(1.15, Enum.EasingStyle.Linear), {
            Offset = Vector2.new(-1.2, 0)
        })
        t.Completed:Wait()
        -- Endpoints are both red, so the restart is visually continuous.
    end
end)

local subtitle = Instance.new("TextLabel")
subtitle.BackgroundTransparency = 1
subtitle.Position = UDim2.new(0, 58, 0, 29)
subtitle.Size = UDim2.new(1, -116, 0, 16)
subtitle.Font = Enum.Font.Gotham
subtitle.Text = "SCRIPT HUB"
subtitle.TextSize = 10
subtitle.TextXAlignment = Enum.TextXAlignment.Center
subtitle.TextColor3 = Color3.fromRGB(145,145,155)
subtitle.Parent = top

local function topButton(text, x)
    local b = Instance.new("TextButton")
    b.Size = UDim2.fromOffset(30, 28)
    b.Position = UDim2.new(1, x, 0, 8)
    b.AnchorPoint = Vector2.new(1, 0)
    b.BackgroundColor3 = Color3.fromRGB(13, 27, 46)
    b.BorderSizePixel = 0
    b.Text = text
    b.Font = Enum.Font.Gotham
    b.TextSize = 14
    b.TextColor3 = Color3.new(1,1,1)
    b.AutoButtonColor = false
    b.Parent = top
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = b
    addAnimatedButtonBorder(b, Themes[ThemeIndex].Accent)
    return b
end

local minimize = topButton("—", -88)
local close = topButton("×", -50)

local topLogo = Instance.new("ImageLabel")
topLogo.Name = "KiiSaeTopLogo"
topLogo.AnchorPoint = Vector2.new(1,0)
topLogo.Position = UDim2.new(1,-8,0,6)
topLogo.Size = UDim2.fromOffset(38,38)
topLogo.BackgroundTransparency = 1
topLogo.Image = KII_SAE_LOGO_ASSET
topLogo.ScaleType = Enum.ScaleType.Fit
topLogo.ClipsDescendants = true
topLogo.ZIndex = 8
topLogo.Parent = top

local topLogoShine = Instance.new("Frame")
topLogoShine.Name = "WhiteShine"
topLogoShine.AnchorPoint = Vector2.new(0.5,0.5)
topLogoShine.Position = UDim2.fromScale(1.3,0.5)
topLogoShine.Size = UDim2.new(0.24,0,1.45,0)
topLogoShine.BackgroundColor3 = Color3.fromRGB(255,255,255)
topLogoShine.BackgroundTransparency = 0.68
topLogoShine.BorderSizePixel = 0
topLogoShine.Rotation = 12
topLogoShine.ZIndex = 9
topLogoShine.Parent = topLogo

local topLogoShineGradient = Instance.new("UIGradient")
topLogoShineGradient.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0,1),
    NumberSequenceKeypoint.new(0.44,1),
    NumberSequenceKeypoint.new(0.50,0.05),
    NumberSequenceKeypoint.new(0.56,1),
    NumberSequenceKeypoint.new(1,1)
})
topLogoShineGradient.Parent = topLogoShine

task.spawn(function()
    while gui.Parent and topLogo.Parent do
        topLogoShine.Position = UDim2.fromScale(1.3,0.5)
        local t = tween(topLogoShine,TweenInfo.new(1.25,Enum.EasingStyle.Linear),{Position=UDim2.fromScale(-0.3,0.5)})
        t.Completed:Wait()
        task.wait(0.25)
    end
end)

-- Dedicated drag line OUTSIDE the main GUI, slightly below it.
-- It follows the whole window and remains available while the GUI is open.
local dragHandle = Instance.new("TextButton")
dragHandle.Name = "KiiSaeDragHandle"
dragHandle.AnchorPoint = Vector2.new(0.5, 0.5)
dragHandle.Size = UDim2.fromOffset(110, 16)
dragHandle.BackgroundColor3 = Color3.fromRGB(235, 235, 240)
dragHandle.BackgroundTransparency = 1
dragHandle.BorderSizePixel = 0
dragHandle.Text = ""
dragHandle.AutoButtonColor = false
dragHandle.ZIndex = 60
dragHandle.Visible = false
dragHandle.Parent = gui

local dragVisual = Instance.new("Frame")
dragVisual.Name = "Line"
dragVisual.AnchorPoint = Vector2.new(0.5, 0.5)
dragVisual.Position = UDim2.fromScale(0.5, 0.5)
dragVisual.Size = UDim2.fromOffset(76, 3)
dragVisual.BackgroundColor3 = Themes[ThemeIndex].Accent
dragVisual.BackgroundTransparency = 0.10
dragVisual.BorderSizePixel = 0
dragVisual.ZIndex = 61
dragVisual.Parent = dragHandle
local dragVisualCorner = Instance.new("UICorner")
dragVisualCorner.CornerRadius = UDim.new(1, 0)
dragVisualCorner.Parent = dragVisual

local dragCorner = Instance.new("UICorner")
dragCorner.CornerRadius = UDim.new(1, 0)
dragCorner.Parent = dragHandle

-- Bottom-right resize handle. It stays OUTSIDE the GUI and follows it exactly.
local resizeHandle = Instance.new("TextButton")
resizeHandle.Name = "KiiSaeResizeH

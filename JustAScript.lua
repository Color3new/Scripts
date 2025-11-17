local players = game:GetService("Players")
local player = players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")
getgenv().SignalDelay = 0
local cache = {}
local hi = false
local hi1 = false
local Id,productInfo

_G.TP7 = false
_G.HideAll = false
_G.SignalTrue7 = false

local mouse = player:GetMouse()
mouse.Button1Down:Connect(function()
if not _G.TP7 then return end
if not player then return end
if not player.Character then return end
if not mouse.Target then return end
player.Character:PivotTo(CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0)))
end)

local HidePlayers = {}

spawn(function()
while task.wait(0.1) do
for _, v in pairs(game.Players:GetPlayers()) do
if v ~= player and v.Character then
if _G.HideAll then
if not HidePlayers[v] then
HidePlayers[v] = v.Character.Parent
end
v.Character.Parent = nil
else
if HidePlayers[v] and v.Character.Parent == nil then
v.Character.Parent = HidePlayers[v]
end
end
end
end
end
end)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local Window = Library:NewWindow("Just A Script v1.3")

local Section = Window:NewSection("Полезные скрипты")

Section:CreateButton("Инф елд", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

Section:CreateButton("Декс", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
end)

Section:CreateButton("Виверн", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ckw69/Wyborn/main/wyborn",true))()
end)

Section:CreateButton("Ремот спай", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
end)

Section:CreateButton("Ремоут браузер", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Games1799/Scripts/refs/heads/main/RemoteBrowser"))()
end)

Section:CreateButton("Dev Products Purchaser", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ckw69/Wyborn/refs/heads/main/Dev%20Product%20Purchase"))()
end)

Section:CreateButton("Адонис байпас", function()
for i, v in pairs(game:GetDescendants()) do
if v.Name == "__FUNCTION" then
loadstring(game:HttpGet('https://raw.githubusercontent.com/Pixeluted/adoniscries/main/Source.lua'))()
hi = true
break
end
end

if not hi then
StarterGui:SetCore("SendNotification", {
Title = "Не найдено",
Text = "Адонис не найден",
Duration = 5,
})
end
end)

local Section = Window:NewSection("Перемещение")

Section:CreateToggle("Телепорт мышкой", function(state)
if state then
_G.TP7 = true
else
_G.TP7 = false
end
end)

Section:CreateButton("Скопировать координаты", function()
local pos
local char = player.Character
local hum = char and player.Character:FindFirstChild("HumanoidRootPart")
if hum then
pos = hum.position
local copy  = string.format("%f, %f, %f", pos.X, pos.Y, pos.Z)
setclipboard(tostring(copy))
else
local camera = workspace.Camera
if not camera then return end
pos = camera.Focus.Position
local copy  = string.format("%f, %f, %f", pos.X, pos.Y - 1.5, pos.Z)
setclipboard(tostring(copy))
end
end)

Section:CreateButton("Скопировать Teleport", function()
local pos
local char = player.Character
local hum = char and player.Character:FindFirstChild("HumanoidRootPart")
if char and hum then
pos = hum.position
local copy = string.format("game.Players.LocalPlayer.Character:PivotTo(CFrame.new(Vector3.new(%f, %f, %f)))", pos.X, pos.Y, pos.Z)
      setclipboard(tostring(copy))
else
local camera = workspace.Camera
if not camera then return end
pos = camera.Focus.Position
local copy = string.format("game.Players.LocalPlayer.Character:PivotTo(CFrame.new(Vector3.new(%f, %f, %f)))", pos.X, pos.Y - 1.5, pos.Z)
setclipboard(tostring(copy))
end
end)

Section:CreateButton("Скопировать TweenService", function()
local pos
local char = player.Character
local hum = char and player.Character:FindFirstChild("HumanoidRootPart")
if char and hum then
pos = hum.position
local copy = string.format([[local tweenInfo = TweenInfo.new(2)
local goal = {CFrame = CFrame.new(%f, %f, %f)}
local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, tweenInfo, goal)
tween:Play()]], pos.X, pos.Y, pos.Z)
setclipboard(tostring(copy))
else
local camera = workspace.Camera
if not camera then return end
pos = camera.Focus.Position
local copy = string.format([[local tweenInfo = TweenInfo.new(2)
local goal = {CFrame = CFrame.new(%f, %f, %f)}
local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, tweenInfo, goal)
tween:Play()]], pos.X, pos.Y - 1.5, pos.Z)
setclipboard(tostring(copy))
end
end)

local Section = Window:NewSection("Инструменты")

Section:CreateToggle("Скрыть игроков", function(state)
if state then
_G.HideAll = true
else
_G.HideAll = false
end
end)

Section:CreateButton("FireProximityPrompt", function()
for _, v in ipairs(workspace:GetDescendants()) do
if v:IsA("ProximityPrompt") then
fireproximityprompt(v)
end
end
end)

Section:CreateButton("HoldDuration 0", function()
for _, v in next, workspace:GetDescendants() do
if v:IsA("ProximityPrompt") then
v.HoldDuration = 0
end
end
end)

Section:CreateButton("FireAllClickDetectors", function()
for _, v in ipairs(workspace:GetDescendants()) do
if v:IsA("ClickDetector") then
fireclickdetector(v)
end
end
end)

Section:CreateButton("FireAllTouchinterest", function()
local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
if not hum then return end
if hum then
for _, obj in ipairs(workspace:GetDescendants()) do
if obj:IsA("TouchTransmitter") then
local part = obj.Parent
if part then
firetouchinterest(part, hum, 1)
task.wait()
firetouchinterest(part, hum, 0)
part.CFrame = hum.CFrame
end
end
end
end
end)

local Section = Window:NewSection("Изменения в игроке") 

local speed1 = 16

Section:CreateTextbox("Значение скорости", function(txt)
    speed1 = tonumber(txt)
end)

Section:CreateToggle("Скорость игрока", function(state)
    if state then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed1
    else
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)

Section:CreateButton("Флай", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end) 

local Section = Window:NewSection("Есп") Section:
local colors = {
    ["Белый"] = Color3.new(1, 1, 1),
    ["Чёрный"] = Color3.new(0, 0, 0),
    ["Красный"] = Color3.new(1, 0, 0),
    ["Зелёный"] = Color3.new(0, 1, 0),
    ["Синий"] = Color3.new(0, 0, 1),
    ["Жёлтый"] = Color3.new(1, 1, 0),
    ["Голубой"] = Color3.new(0, 1, 1),
    ["Пурпурный"] = Color3.new(1, 0, 1)
}

local selectedColor = Color3.new(1, 1, 1)
Section:CreateDropdown("Выбрать цвет еспа", {"Белый", "Чёрный", "Красный", "Зелёный", "Синий", "Жёлтый", "Голубой", "Пурпурный"}, 1, function(text)
    selectedColor = colors[text]
end)

Section:CreateToggle("Есп", function(state)
    if state then
getgenv().enabled = true
getgenv().filluseteamcolor = false
getgenv().outlineuseteamcolor = false
getgenv().fillcolor = selectedColor
getgenv().outlinecolor = selectedColor
getgenv().filltrans = 0
getgenv().outlinetrans = 0
 
local holder = game.CoreGui:FindFirstChild("ESPHolder") or Instance.new("Folder")
if enabled == false then
    holder:Destroy()
end

if holder.Name == "Folder" then
    holder.Name = "ESPHolder"
    holder.Parent = game.CoreGui
end

if uselocalplayer == false and holder:FindFirstChild(game.Players.LocalPlayer.Name) then
    holder:FindFirstChild(game.Players.LocalPlayer.Name):Destroy()
end

if getgenv().enabled == true then 
    getgenv().enabled = false
    getgenv().enabled = true
end
while getgenv().enabled do
    task.wait()
    for _,v in pairs(game.Players:GetChildren()) do
        local chr = v.Character
        if chr ~= nil then
        local esp = holder:FindFirstChild(v.Name) or Instance.new("Highlight")
        esp.Name = v.Name
        if uselocalplayer == false and esp.Name == game.Players.LocalPlayer.Name then
            else
        esp.Parent = holder
        if filluseteamcolor then
            esp.FillColor = v.TeamColor.Color
        else
            esp.FillColor = fillcolor 
        end
        if outlineuseteamcolor then
            esp.OutlineColor = v.TeamColor.Color
        else
            esp.OutlineColor = outlinecolor    
        end
        esp.FillTransparency = filltrans
        esp.OutlineTransparency = outlinetrans
        esp.Adornee = chr
        esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        end
        end
    end
end
else
getgenv().enabled = false
getgenv().filluseteamcolor = false
getgenv().outlineuseteamcolor = false
getgenv().fillcolor = selectedColor
getgenv().outlinecolor = selectedColor
getgenv().filltrans = 0
getgenv().outlinetrans = 0
 
local holder = game.CoreGui:FindFirstChild("ESPHolder") or Instance.new("Folder")
if enabled == false then
    holder:Destroy()
end

if holder.Name == "Folder" then
    holder.Name = "ESPHolder"
    holder.Parent = game.CoreGui
end

if uselocalplayer == false and holder:FindFirstChild(game.Players.LocalPlayer.Name) then
    holder:FindFirstChild(game.Players.LocalPlayer.Name):Destroy()
end

if getgenv().enabled == true then 
    getgenv().enabled = false
    getgenv().enabled = true
end
while getgenv().enabled do
    task.wait()
    for _,v in pairs(game.Players:GetChildren()) do
        local chr = v.Character
        if chr ~= nil then
        local esp = holder:FindFirstChild(v.Name) or Instance.new("Highlight")
        esp.Name = v.Name
        if uselocalplayer == false and esp.Name == game.Players.LocalPlayer.Name then
            else
        esp.Parent = holder
        if filluseteamcolor then
            esp.FillColor = v.TeamColor.Color
        else
            esp.FillColor = fillcolor 
        end
        if outlineuseteamcolor then
            esp.OutlineColor = v.TeamColor.Color
        else
            esp.OutlineColor = outlinecolor    
        end
        esp.FillTransparency = filltrans
        esp.OutlineTransparency = outlinetrans
        esp.Adornee = chr
        esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        end
        end
    end
end
end 
end)

for i, v in pairs(game:GetDescendants()) do
if v.Name == "__FUNCTION" then
StarterGui:SetCore("SendNotification", {
Title = "Найден адонис!",
Text = "Проверьте !Buyitem и !Buyasset",
Button1 = "Ок",
Duration = 5,
})
hi1 = true
break
end
end

if not _G.Prompt_ICON1 then
_G.Prompt_ICON1 = true

while task.wait(1) do  
    local purchasePrompt = CoreGui:FindFirstChild("PurchasePromptApp")  
    if purchasePrompt then  
        local price, image, priceText, imageSrc  

        local productPurchase = purchasePrompt:FindFirstChild("ProductPurchaseContainer")  
        if productPurchase and productPurchase.Animator:FindFirstChild("ProductPurchaseModal") then  
            local alert = productPurchase.Animator.ProductPurchaseModal:FindFirstChild("AlertContents")  
            if alert then  
                price = alert.Footer.Buttons["1"].ButtonContent.ButtonMiddleContent.Text  
                image = alert.MiddleContent.Content.ItemIcon  
                priceText = price.Text  
                imageSrc = image.Image  
            end  
        end  

        if not priceText then  
            local robuxUpsell = purchasePrompt:FindFirstChild("RobuxUpsellContainer")  
            if robuxUpsell and robuxUpsell:FindFirstChild("Prompt") then  
                local children = robuxUpsell.Prompt.Children:GetChildren()  
                if children[8] and children[8]:FindFirstChild("1") then  
                    local upsell = children[8]["1"].RobuxUpsellModal.AlertContents.MiddleContent.Content.ProductDetails
            price = upsell.ItemDetailsFrame.ItemDetails.ItemCost  
                    image = upsell.ItemIcon  
                    priceText = price.Text  
                    imageSrc = image.Image  
                end  
            end  
        end  

        if priceText and imageSrc then  
            StarterGui:SetCore("SendNotification", {  
                Title = "Появилось окно покупки!",  
                Text = "Стоимость — "..priceText,  
                Icon = imageSrc,  
                Duration = 5,  
            })  

            repeat task.wait(1)  
            until not (price and price.Parent and image and image.Parent)  
        end  
    end  
end
end

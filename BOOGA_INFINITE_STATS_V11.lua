local A_1 = "inf stats galaxy V5"
local A_2 = "All"
local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
Event:FireServer(A_1, A_2)

local Settings = {
    Slot = "Slot1"; -- The Slot That Will Get The Stat Boost
    NamekSlot = "Slot2"; -- The Namek Slot
    Lag = 0; -- 0 - 0.2,if script doesnt work then try with VPN
    AutoStats = false;
    StatToUp = "Phys-Damage"; -- Will invest on this stat if autostats is true,Phys-Damage,Ki-Damage,Phys-Resist,Ki-Resist,Health-Max,Ki-Max,Speed
    ProMode = false; -- The script will be much faster,disable if doesn't work with you
    ExtraTime = 0; -- 1-2 if your pc is bad
}
local Mode = "Mode" -- Don't touch this
local Stop = false -- Don't touch this
local Tries = 0 -- Don't touch this
local Tries2 = 0 -- Don't touch this
local Timee = .7 -- Don't touch this
settings().Network.IncomingReplicationLag = Settings.Lag
local VU=game:GetService("VirtualUser")
game.Players.LocalPlayer.Idled:Connect(function()
    VU:CaptureController()
    VU:ClickButton2(Vector2.new())
end)
game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
	if child.Name == "ErrorPrompt" and child:FindFirstChild("MessageArea") and child.MessageArea:FindFirstChild("ErrorFrame") then
        for i =1,30 do
            task.wait(.1)
            game.Players.LocalPlayer:Kick("Rejoin")
        end
    end
end)
local b = false
local Created = true
task.wait(3 + Settings.ExtraTime)
if game.PlaceId == 552500546 then
    task.wait(1.5)
    repeat task.wait(1)
    pcall(function()
        game.Players.LocalPlayer.Backpack.Scripter.RemoteEvent:FireServer(game:GetService("Players").LocalPlayer.PlayerGui.Setup.Frame.Side.Race,"up")
    end)
    task.wait(.5)
    if game:GetService("Players").LocalPlayer.PlayerGui.Setup.Frame.Side.Race.Set.Texter.Text == "Namekian" then break end
    until game:GetService("Players").LocalPlayer.PlayerGui.Setup.Frame.Side.Race.Set.Texter.Text == "Namekian"
    game:GetService("Players").LocalPlayer.Backpack.Scripter.RemoteEvent:FireServer("woah")
end
if tonumber(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Stats.LVL.Val.Text) < 80 then
    Level = tonumber(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Stats.LVL.Val.Text)
end
function Talk(NPC,What1,What2,What3,What4,s)
    if Stop == true and s == false then return end
    repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("Backpack") and game.Players.LocalPlayer.Backpack:FindFirstChild("ServerTraits")
    pcall(function()
        game.Players.LocalPlayer.Backpack.ServerTraits.ChatStart:FireServer(workspace.FriendlyNPCs[NPC])
        task.wait(Timee)
        game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({What1})
        if What2 then
            task.wait(Timee)
            game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({What2})
            if What3 then
                task.wait(Timee)
                game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({What3})
                if What4 then
                    task.wait(Timee)
                    game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({What4})
                end
            end
        end
    end)
end
if Settings.ProMode == true then
    Talk("Character Slot Changer","Yes","k",Settings.NamekSlot,"k")
end
if Settings.ProMode == false then
    task.wait(.6)
    Talk("Character Slot Changer","Yes","k",Settings.NamekSlot,"k")
    task.wait(5)
else
    task.wait(3.6)
    if not workspace.Live:FindFirstChild(game.Players.LocalPlayer.Name) then
        task.wait(2.3)
        Talk("Character Slot Changer","Yes","k",Settings.NamekSlot,"k")
    end
end
pcall(function()
    if tonumber(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Stats.LVL.Val.Text) < 80 then
        Level = tonumber(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Stats.LVL.Val.Text)
    end
end)
if tonumber(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Stats.LVL.Val.Text) < 50 then
    if Stop == true then return end
    Talk("Bulma","k","k","Yes","k")
    task.wait(Timee)
    Talk("Spaceship","k","k","No")
    task.wait(Timee)
    Talk("Trunks [Future]","k","k","Yes","k")
    task.wait(Timee)
    Talk("TimeMachine","k","k","No")
    task.wait(Timee)
    workspace.FriendlyNPCs["Quest Giver"]:Destroy()
    workspace.FriendlyNPCs["Quest Giver"]:Destroy()
    Talk("Quest Giver","k","k","Yes","k")
    task.wait(Timee)
    Talk("NamekianShip","k","k","No","k")
    task.wait(Timee)
    Talk("Elder Kai","k","Yes","k","k")
    task.wait(1.2)
    Talk("Character Slot Changer","Yes","k",Settings.Slot,"k")
    task.wait(5)
    Talk("Character Slot Changer","Yes","k",Settings.NamekSlot,"k")
    task.wait(5)
    game.Players.LocalPlayer.Backpack.ServerTraits.ChatStart:FireServer(workspace.FriendlyNPCs.Korin.Chat.Chat)
    task.wait(Timee)
    game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({"k"})
    task.wait(Timee)
    game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({"DRINK"})
    task.wait(3)
end
if Settings.ProMode == true then
    Timee = .560
end
task.spawn(function()
    while true do
        task.wait(.1)
        if Mode ~= "Reset" then
            if Level >= 50 and game.Players.LocalPlayer.Character.Race.Value == "Namekian" then
                if not workspace.FriendlyNPCs:FindFirstChild("KAMI") then
                    Mode = "Reset"
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(.1)
        if Mode == "Reset" then 
            Stop = true 
            task.wait(3)
            Talk("Character Slot Changer","Yes","k",Settings.NamekSlot,true)
            task.wait(6)
            if game.Players.LocalPlayer.Character.Race.Value ~= "Namekian" then
                repeat
                    Talk("Character Slot Changer","Yes","k",Settings.NamekSlot,true)
                    task.wait(6)
                    Tries2 = Tries2 + 1
                    if Tries2 >= 3 then
                        game.Players.LocalPlayer:Kick("Rejoin,script saved your account from being reseted") break
                    end
                until game.Players.LocalPlayer.Character.Race.Value ~= "Namekian"
            end
            game.Players.LocalPlayer.Backpack.ServerTraits.ChatStart:FireServer(workspace.FriendlyNPCs["Start New Game [Redo Character]"])
            task.wait(.6)
            game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({"Yes"})
            task.wait(.6)
            game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({"k"})
            task.wait(.6)
            game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({"Yes"})
        end
    end
end)
task.spawn(function()
    while true do
        if Tries >= 6 and Stop == false then
            game.Players.LocalPlayer.Character:BreakJoints()
            task.wait(7.5)
        end
        if Tries >= 15 then
            game.Players.LocalPlayer:Kick("Rejoin")
        end
        pcall(function()
            game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Stats.Visible = true
            if not workspace.FriendlyNPCs:FindFirstChild("KAMI") then
                Stop = true
                task.wait(3)
                Talk("Character Slot Changer","Yes","k",Settings.NamekSlot,true)
                task.wait(6)
                if game.Players.LocalPlayer.Character.Race.Value ~= "Namekian" then
                    repeat
                        Talk("Character Slot Changer","Yes","k",Settings.NamekSlot,true)
                        task.wait(6)
                        Tries2 = Tries2 + 1
                        if Tries2 >= 3 then
                            game.Players.LocalPlayer:Kick("Rejoin,script saved your account from being reseted") break
                        end
                    until game.Players.LocalPlayer.Character.Race.Value ~= "Namekian"
                end
                game.Players.LocalPlayer.Backpack.ServerTraits.ChatStart:FireServer(workspace.FriendlyNPCs["Start New Game [Redo Character]"])
                task.wait(.5)
                game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({"Yes"})
                task.wait(.5)
                game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({"k"})
                task.wait(.5)
                game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({"Yes"})
            end
            if Stop == true then repeat task.wait() until Stop == false end
            if tonumber(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Stats.LVL.Val.Text) < 80 then
                Level = tonumber(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Stats.LVL.Val.Text)
            end
            Talk("Character Slot Changer","Yes","k",Settings.Slot)
            task.wait(.4)
            pcall(function()
                game.Players.LocalPlayer.Backpack.ServerTraits.ChatStart:FireServer(workspace.FriendlyNPCs.KAMI.Chat)
            end)
            task.spawn(function()
                for i = 1,300 do
                    task.wait()
                    pcall(function()
                        if tonumber(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Stats.LVL.Val.Text) >= 50 and tonumber(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Stats.LVL.Val.Text) < 80 and game.Players.LocalPlayer.PlayerGui.HUD.Bottom.ChatGui.TextLabel.Text == "Mr Popo is a nice guy" then
                            Mode = "Reset"
                            for i = 1,3 do
                                task.wait(.5)
                                Mode = "Reset"
                            end
                        end
                        if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Booster") and tonumber(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Stats.LVL.Val.Text) >= 50 and tonumber(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Stats.LVL.Val.Text) < 80 and b == false and (game.Players.LocalPlayer.PlayerGui.HUD.Bottom.ChatGui.TextLabel.Text == "Alright let's do it" or game.Players.LocalPlayer.PlayerGui.HUD.Bottom.ChatGui.TextLabel.Text == "Loading!") then
                            b = true
                            Tries = Tries + 1
                        else
                            if b == true and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Booster") then
                                Tries = 0
                            end
                        end
                    end)
                end
                b = false
            end)
            task.wait(5)
            task.delay(4.2,function()
                if game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() >= 450 and Lag >= 0.2 then
                    settings().Network.IncomingReplicationLag = 0.1
                end
            end)
            pcall(function()
                game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Stats.Visible = true
            end)
            if Stop == true then repeat task.wait() until Stop == false end
            task.spawn(function()
                if Settings.AutoStats == true then
                    for i = 1,100 do
                        task.wait()
                        game:GetService("Players").LocalPlayer.Backpack.ServerTraits.AttemptUpgrade:FireServer(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Stats[Settings.StatToUp])
                    end
                end
            end)
            Talk("Character Slot Changer","Yes","k",Settings.NamekSlot)
            task.wait(5)
        end)
    end
end)
pcall(function()
    loadstring(game:HttpGet("https://pastebin.com/raw/QD7QmrB7"))()
end)
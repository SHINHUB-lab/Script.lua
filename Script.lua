-- ts file was generated at discord.gg/coolhub

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local _call8  = Color3.fromRGB(255, 105, 180)
local _call10 = Color3.fromRGB(138, 43, 226)
local _call14 = Color3.fromRGB(255, 255, 255)

-- TIMER SETTINGS
local DURATION = 3600 -- 1 HOUR
local timeLeft = DURATION
local active = false
local expired = false
local timerConn

-- GUI
local _call16 = Instance.new("ScreenGui")
_call16.Name = "FlashTeleportGUI"
_call16.ResetOnSpawn = false
_call16.Parent = game:GetService("CoreGui")

local _call19 = Instance.new("Frame")
_call19.Size = UDim2.new(0, 200, 0, 110)
_call19.Position = UDim2.new(0.5, -100, 0.5, -55)
_call19.BackgroundColor3 = Color3.fromRGB(45, 0, 80)
_call19.BorderSizePixel = 0
_call19.Active = true
_call19.Draggable = true
_call19.Parent = _call16

local _call25 = Instance.new("UICorner", _call19)
_call25.CornerRadius = UDim.new(0, 12)

local _call29 = Instance.new("UIGradient", _call19)
_call29.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, _call8),
	ColorSequenceKeypoint.new(1, _call10),
})
_call29.Rotation = 45

local _call37 = Instance.new("TextLabel")
_call37.Size = UDim2.new(1, -20, 0, 24)
_call37.Position = UDim2.new(0, 10, 0, 6)
_call37.BackgroundTransparency = 1
_call37.Text = "Shin Hub (paid flash tp)"
_call37.Font = Enum.Font.GothamBold
_call37.TextSize = 16
_call37.TextColor3 = _call14
_call37.TextXAlignment = Enum.TextXAlignment.Center
_call37.Parent = _call19

local _call47 = Instance.new("TextLabel")
_call47.Size = UDim2.new(1, -20, 0, 16)
_call47.Position = UDim2.new(0, 10, 0, 30)
_call47.BackgroundTransparency = 1
_call47.Text = "flash step tool Required"
_call47.Font = Enum.Font.Gotham
_call47.TextSize = 11
_call47.TextTransparency = 0.2
_call47.TextColor3 = _call14
_call47.TextXAlignment = Enum.TextXAlignment.Center
_call47.Parent = _call19

local _call57 = Instance.new("TextButton")
_call57.Size = UDim2.new(0.8, 0, 0, 36)
_call57.Position = UDim2.new(0.1, 0, 0, 62)
_call57.BackgroundColor3 = _call8
_call57.BorderSizePixel = 0
_call57.Font = Enum.Font.GothamBold
_call57.TextSize = 15
_call57.TextColor3 = _call14
_call57.Text = "ACTIVATE"
_call57.AutoButtonColor = false
_call57.Parent = _call19

local _call65 = Instance.new("UICorner", _call57)
_call65.CornerRadius = UDim.new(0, 8)

-- FORMAT TIME
local function format(sec)
	local m = math.floor(sec / 60)
	local s = sec % 60
	return string.format("%02d:%02d", m, s)
end

-- START TIMER
local function startTimer()
	timerConn = RunService.Heartbeat:Connect(function(dt)
		if not active then return end

		timeLeft -= dt
		if timeLeft <= 0 then
			timeLeft = 0
			active = false
			expired = true

			if timerConn then
				timerConn:Disconnect()
			end

			-- DESTROY GUI
			pcall(function()
				_call16:Destroy()
			end)

			-- KICK PLAYER
			task.wait(0.2)
			LocalPlayer:Kick("1hr free script is expired")
		else
			_call57.Text = "ACTIVE (" .. format(math.floor(timeLeft)) .. ")"
		end
	end)
end

-- HOVER EFFECTS
_call57.MouseEnter:Connect(function()
	if not active and not expired then
		_call57.BackgroundColor3 = _call10
	end
end)

_call57.MouseLeave:Connect(function()
	if not active and not expired then
		_call57.BackgroundColor3 = _call8
	end
end)

-- CLICK
_call57.MouseButton1Click:Connect(function()
	if active or expired then return end

	active = true
	_call57.BackgroundColor3 = _call10
	startTimer()
end)

print("Shin Hub loaded | 1hr FREE timer enabled")

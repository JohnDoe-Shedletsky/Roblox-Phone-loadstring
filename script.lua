--========================================================
-- 📱 SIMPLE SMARTPHONE - ONE FILE LOCAL SCRIPT
-- Place in StarterPlayer > StarterPlayerScripts
--========================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

------------------------------------------------------------
-- SETTINGS
------------------------------------------------------------

local PHONE_KEY = Enum.KeyCode.P
local phoneOpen = false
local darkMode = true
local currentApp = "Home"

------------------------------------------------------------
-- COLORS
------------------------------------------------------------

local function colors()
	if darkMode then
		return {
			Background = Color3.fromRGB(12, 14, 20),
			Panel = Color3.fromRGB(24, 27, 36),
			Panel2 = Color3.fromRGB(32, 35, 46),
			Text = Color3.fromRGB(245, 245, 250),
			SubText = Color3.fromRGB(160, 165, 180),
			Accent = Color3.fromRGB(75, 110, 255),
			Danger = Color3.fromRGB(235, 70, 80),
		}
	else
		return {
			Background = Color3.fromRGB(235, 237, 242),
			Panel = Color3.fromRGB(250, 250, 252),
			Panel2 = Color3.fromRGB(225, 228, 235),
			Text = Color3.fromRGB(25, 27, 32),
			SubText = Color3.fromRGB(100, 105, 115),
			Accent = Color3.fromRGB(65, 95, 230),
			Danger = Color3.fromRGB(220, 50, 60),
		}
	end
end

local C = colors()

------------------------------------------------------------
-- GUI
------------------------------------------------------------

local gui = Instance.new("ScreenGui")
gui.Name = "Phone"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = playerGui

------------------------------------------------------------
-- PHONE BODY
------------------------------------------------------------

local phone = Instance.new("Frame")
phone.Name = "Phone"
phone.Size = UDim2.fromOffset(390, 720)
phone.Position = UDim2.new(0.5, -195, 1, 30)
phone.BackgroundColor3 = C.Background
phone.BorderSizePixel = 0
phone.Visible = true
phone.Parent = gui

local phoneCorner = Instance.new("UICorner")
phoneCorner.CornerRadius = UDim.new(0, 42)
phoneCorner.Parent = phone

local phoneStroke = Instance.new("UIStroke")
phoneStroke.Color = Color3.fromRGB(65, 68, 80)
phoneStroke.Thickness = 2
phoneStroke.Parent = phone

------------------------------------------------------------
-- NOTCH
------------------------------------------------------------

local notch = Instance.new("Frame")
notch.Size = UDim2.fromOffset(125, 28)
notch.Position = UDim2.new(0.5, -62, 0, 10)
notch.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
notch.BorderSizePixel = 0
notch.ZIndex = 10
notch.Parent = phone

Instance.new("UICorner", notch).CornerRadius = UDim.new(0, 15)

local cameraDot = Instance.new("Frame")
cameraDot.Size = UDim2.fromOffset(7, 7)
cameraDot.Position = UDim2.new(1, -20, 0.5, -3)
cameraDot.BackgroundColor3 = Color3.fromRGB(35, 40, 50)
cameraDot.BorderSizePixel = 0
cameraDot.Parent = notch

Instance.new("UICorner", cameraDot).CornerRadius = UDim.new(1, 0)

------------------------------------------------------------
-- STATUS BAR
------------------------------------------------------------

local timeLabel = Instance.new("TextLabel")
timeLabel.Size = UDim2.fromOffset(70, 25)
timeLabel.Position = UDim2.fromOffset(20, 13)
timeLabel.BackgroundTransparency = 1
timeLabel.TextColor3 = C.Text
timeLabel.Font = Enum.Font.GothamBold
timeLabel.TextSize = 14
timeLabel.TextXAlignment = Enum.TextXAlignment.Left
timeLabel.ZIndex = 5
timeLabel.Parent = phone

local battery = Instance.new("TextLabel")
battery.Size = UDim2.fromOffset(80, 25)
battery.Position = UDim2.new(1, -95, 0, 13)
battery.BackgroundTransparency = 1
battery.Text = "100% 🔋"
battery.TextColor3 = C.Text
battery.Font = Enum.Font.GothamBold
battery.TextSize = 13
battery.TextXAlignment = Enum.TextXAlignment.Right
battery.ZIndex = 5
battery.Parent = phone

------------------------------------------------------------
-- CONTENT
------------------------------------------------------------

local content = Instance.new("Frame")
content.Name = "Content"
content.Size = UDim2.new(1, -20, 1, -85)
content.Position = UDim2.fromOffset(10, 55)
content.BackgroundTransparency = 1
content.Parent = phone

------------------------------------------------------------
-- HOME SCREEN
------------------------------------------------------------

local home = Instance.new("Frame")
home.Name = "Home"
home.Size = UDim2.fromScale(1, 1)
home.BackgroundTransparency = 1
home.Parent = content

------------------------------------------------------------
-- HOME TITLE
------------------------------------------------------------

local welcome = Instance.new("TextLabel")
welcome.Size = UDim2.new(1, -20, 0, 55)
welcome.Position = UDim2.fromOffset(10, 20)
welcome.BackgroundTransparency = 1
welcome.Text = "Hello, " .. player.DisplayName
welcome.TextColor3 = C.Text
welcome.Font = Enum.Font.GothamBold
welcome.TextSize = 25
welcome.TextXAlignment = Enum.TextXAlignment.Left
welcome.Parent = home

------------------------------------------------------------
-- APP FRAME
------------------------------------------------------------

local appFrame = Instance.new("Frame")
appFrame.Name = "App"
appFrame.Size = UDim2.fromScale(1, 1)
appFrame.BackgroundColor3 = C.Background
appFrame.Visible = false
appFrame.Parent = content

------------------------------------------------------------
-- APP TITLE
------------------------------------------------------------

local appTitle = Instance.new("TextLabel")
appTitle.Size = UDim2.new(1, -70, 0, 50)
appTitle.Position = UDim2.fromOffset(60, 5)
appTitle.BackgroundTransparency = 1
appTitle.Text = "App"
appTitle.TextColor3 = C.Text
appTitle.Font = Enum.Font.GothamBold
appTitle.TextSize = 23
appTitle.TextXAlignment = Enum.TextXAlignment.Left
appTitle.Parent = appFrame

------------------------------------------------------------
-- BACK BUTTON
------------------------------------------------------------

local backButton = Instance.new("TextButton")
backButton.Size = UDim2.fromOffset(45, 45)
backButton.Position = UDim2.fromOffset(5, 5)
backButton.BackgroundColor3 = C.Panel2
backButton.Text = "‹"
backButton.TextColor3 = C.Text
backButton.Font = Enum.Font.GothamBold
backButton.TextSize = 32
backButton.Parent = appFrame

Instance.new("UICorner", backButton).CornerRadius = UDim.new(0, 13)

------------------------------------------------------------
-- HOME INDICATOR
------------------------------------------------------------

local homeIndicator = Instance.new("Frame")
homeIndicator.Size = UDim2.fromOffset(120, 5)
homeIndicator.Position = UDim2.new(0.5, -60, 1, -18)
homeIndicator.BackgroundColor3 = C.Text
homeIndicator.BackgroundTransparency = 0.35
homeIndicator.BorderSizePixel = 0
homeIndicator.Parent = phone

Instance.new("UICorner", homeIndicator).CornerRadius = UDim.new(1, 0)

------------------------------------------------------------
-- FUNCTION: CLEAR APP
------------------------------------------------------------

local function clearApp()

	for _, child in ipairs(appFrame:GetChildren()) do

		if child ~= appTitle and child ~= backButton then
			child:Destroy()
		end

	end

end

------------------------------------------------------------
-- APP OPEN
------------------------------------------------------------

local function openApp(name)

	currentApp = name

	home.Visible = false
	appFrame.Visible = true

	appTitle.Text = name

	clearApp()

end

------------------------------------------------------------
-- BUTTON CREATOR
------------------------------------------------------------

local function makeButton(parent, text, position, size)

	local button = Instance.new("TextButton")

	button.Size = size or UDim2.fromOffset(105, 100)
	button.Position = position
	button.BackgroundColor3 = C.Panel
	button.BorderSizePixel = 0
	button.Text = text
	button.TextColor3 = C.Text
	button.Font = Enum.Font.GothamMedium
	button.TextSize = 14
	button.AutoButtonColor = false
	button.Parent = parent

	Instance.new("UICorner", button).CornerRadius = UDim.new(0, 18)

	button.MouseEnter:Connect(function()

		TweenService:Create(
			button,
			TweenInfo.new(0.15),
			{
				BackgroundColor3 = C.Panel2
			}
		):Play()

	end)

	button.MouseLeave:Connect(function()

		TweenService:Create(
			button,
			TweenInfo.new(0.15),
			{
				BackgroundColor3 = C.Panel
			}
		):Play()

	end)

	return button

end

------------------------------------------------------------
-- APP ICONS
------------------------------------------------------------

local messages = makeButton(
	home,
	"💬\nMessages",
	UDim2.fromOffset(15, 100)
)

local contacts = makeButton(
	home,
	"👤\nContacts",
	UDim2.fromOffset(140, 100)
)

local phoneApp = makeButton(
	home,
	"📞\nPhone",
	UDim2.fromOffset(265, 100)
)

local camera = makeButton(
	home,
	"📷\nCamera",
	UDim2.fromOffset(15, 215)
)

local photos = makeButton(
	home,
	"🖼️\nPhotos",
	UDim2.fromOffset(140, 215)
)

local music = makeButton(
	home,
	"🎵\nMusic",
	UDim2.fromOffset(265, 215)
)

local settings = makeButton(
	home,
	"⚙️\nSettings",
	UDim2.fromOffset(15, 330)
)

local browser = makeButton(
	home,
	"🌐\nBrowser",
	UDim2.fromOffset(140, 330)
)

local calculator = makeButton(
	home,
	"🧮\nCalculator",
	UDim2.fromOffset(265, 330)
)

------------------------------------------------------------
-- MESSAGES APP
------------------------------------------------------------

messages.MouseButton1Click:Connect(function()

	openApp("Messages")

	local info = Instance.new("TextLabel")
	info.Size = UDim2.new(1, -30, 0, 60)
	info.Position = UDim2.fromOffset(15, 70)
	info.BackgroundTransparency = 1
	info.Text = "Messages"
	info.TextColor3 = C.Text
	info.Font = Enum.Font.GothamBold
	info.TextSize = 20
	info.Parent = appFrame

	local box = Instance.new("TextBox")
	box.Size = UDim2.new(1, -30, 0, 50)
	box.Position = UDim2.fromOffset(15, 145)
	box.BackgroundColor3 = C.Panel
	box.TextColor3 = C.Text
	box.PlaceholderColor3 = C.SubText
	box.PlaceholderText = "Write a message..."
	box.Text = ""
	box.Font = Enum.Font.Gotham
	box.TextSize = 15
	box.ClearTextOnFocus = false
	box.Parent = appFrame

	Instance.new("UICorner", box).CornerRadius = UDim.new(0, 13)

	local send = makeButton(
		appFrame,
		"Send",
		UDim2.fromOffset(15, 210),
		UDim2.fromOffset(100, 45)
	)

	local result = Instance.new("TextLabel")
	result.Size = UDim2.new(1, -30, 0, 100)
	result.Position = UDim2.fromOffset(15, 275)
	result.BackgroundColor3 = C.Panel
	result.Text = "No messages yet."
	result.TextColor3 = C.SubText
	result.TextWrapped = true
	result.Font = Enum.Font.Gotham
	result.TextSize = 15
	result.Parent = appFrame

	Instance.new("UICorner", result).CornerRadius = UDim.new(0, 13)

	send.MouseButton1Click:Connect(function()

		if box.Text ~= "" then

			result.Text =
				player.DisplayName ..
				": " ..
				box.Text

			box.Text = ""

		end

	end)

end)

------------------------------------------------------------
-- CONTACTS
------------------------------------------------------------

contacts.MouseButton1Click:Connect(function()

	openApp("Contacts")

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -30, 0, 50)
	label.Position = UDim2.fromOffset(15, 75)
	label.BackgroundTransparency = 1
	label.Text = "Contacts"
	label.TextColor3 = C.Text
	label.Font = Enum.Font.GothamBold
	label.TextSize = 20
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = appFrame

	local contact = makeButton(
		appFrame,
		"👤  " .. player.DisplayName,
		UDim2.fromOffset(15, 140),
		UDim2.new(1, -30, 0, 60)
	)

	contact.MouseButton1Click:Connect(function()

		appTitle.Text = "Contact"

	end)

end)

------------------------------------------------------------
-- PHONE APP
------------------------------------------------------------

phoneApp.MouseButton1Click:Connect(function()

	openApp("Phone")

	local numberDisplay = Instance.new("TextLabel")
	numberDisplay.Size = UDim2.new(1, -30, 0, 60)
	numberDisplay.Position = UDim2.fromOffset(15, 70)
	numberDisplay.BackgroundTransparency = 1
	numberDisplay.Text = ""
	numberDisplay.TextColor3 = C.Text
	numberDisplay.Font = Enum.Font.GothamBold
	numberDisplay.TextSize = 25
	numberDisplay.Parent = appFrame

	local digits = {
		"1","2","3",
		"4","5","6",
		"7","8","9",
		"*","0","#"
	}

	for i, digit in ipairs(digits) do

		local column = (i - 1) % 3
		local row = math.floor((i - 1) / 3)

		local b = makeButton(
			appFrame,
			digit,
			UDim2.fromOffset(
				35 + column * 105,
				145 + row * 65
			),
			UDim2.fromOffset(85, 50)
		)

		b.MouseButton1Click:Connect(function()

			numberDisplay.Text =
				numberDisplay.Text .. digit

		end)

	end

	local call = makeButton(
		appFrame,
		"📞 Call",
		UDim2.fromOffset(140, 350),
		UDim2.fromOffset(100, 50)
	)

	call.MouseButton1Click:Connect(function()

		numberDisplay.Text = "Calling..."

		task.delay(2, function()

			numberDisplay.Text = "No answer."

		end)

	end)

end)

------------------------------------------------------------
-- CAMERA
------------------------------------------------------------

camera.MouseButton1Click:Connect(function()

	openApp("Camera")

	local cameraText = Instance.new("TextLabel")
	cameraText.Size = UDim2.new(1, -30, 0, 100)
	cameraText.Position = UDim2.fromOffset(15, 100)
	cameraText.BackgroundColor3 = Color3.fromRGB(5, 5, 7)
	cameraText.Text = "📷\n\nCamera"
	cameraText.TextColor3 = Color3.new(1,1,1)
	cameraText.Font = Enum.Font.GothamBold
	cameraText.TextSize = 20
	cameraText.Parent = appFrame

	Instance.new("UICorner", cameraText).CornerRadius = UDim.new(0, 20)

	local capture = makeButton(
		appFrame,
		"● Take Photo",
		UDim2.fromOffset(120, 230),
		UDim2.fromOffset(150, 55)
	)

	capture.MouseButton1Click:Connect(function()

		cameraText.Text = "📸\n\nPhoto captured!"

		task.delay(2, function()

			cameraText.Text = "📷\n\nCamera"

		end)

	end)

end)

------------------------------------------------------------
-- PHOTOS
------------------------------------------------------------

photos.MouseButton1Click:Connect(function()

	openApp("Photos")

	local photo = Instance.new("TextLabel")
	photo.Size = UDim2.new(1, -30, 0, 220)
	photo.Position = UDim2.fromOffset(15, 85)
	photo.BackgroundColor3 = C.Panel
	photo.Text = "🖼️\n\nYour photos will appear here."
	photo.TextColor3 = C.SubText
	photo.Font = Enum.Font.Gotham
	photo.TextSize = 16
	photo.Parent = appFrame

	Instance.new("UICorner", photo).CornerRadius = UDim.new(0, 20)

end)

------------------------------------------------------------
-- MUSIC
------------------------------------------------------------

music.MouseButton1Click:Connect(function()

	openApp("Music")

	local song = Instance.new("TextLabel")
	song.Size = UDim2.new(1, -30, 0, 100)
	song.Position = UDim2.fromOffset(15, 85)
	song.BackgroundColor3 = C.Panel
	song.Text = "🎵\n\nNo song selected"
	song.TextColor3 = C.Text
	song.Font = Enum.Font.GothamBold
	song.TextSize = 18
	song.Parent = appFrame

	Instance.new("UICorner", song).CornerRadius = UDim.new(0, 18)

	local play = makeButton(
		appFrame,
		"▶ Play",
		UDim2.fromOffset(70, 215),
		UDim2.fromOffset(100, 50)
	)

	local stop = makeButton(
		appFrame,
		"■ Stop",
		UDim2.fromOffset(190, 215),
		UDim2.fromOffset(100, 50)
	)

	local sound = Instance.new("Sound")
	sound.Name = "PhoneMusic"
	sound.SoundId = ""
	sound.Volume = 0.5
	sound.Parent = gui

	play.MouseButton1Click:Connect(function()

		if sound.SoundId ~= "" then
			sound:Play()
			song.Text = "🎵\n\nPlaying..."
		else
			song.Text = "🎵\n\nNo music ID configured."
		end

	end)

	stop.MouseButton1Click:Connect(function()

		sound:Stop()
		song.Text = "🎵\n\nStopped."

	end)

end)

------------------------------------------------------------
-- SETTINGS
------------------------------------------------------------

settings.MouseButton1Click:Connect(function()

	openApp("Settings")

	local dark = makeButton(
		appFrame,
		"🌙 Dark Mode",
		UDim2.fromOffset(15, 85),
		UDim2.new(1, -30, 0, 60)
	)

	dark.MouseButton1Click:Connect(function()

		darkMode = not darkMode
		C = colors()

		phone.BackgroundColor3 = C.Background
		appFrame.BackgroundColor3 = C.Background

		say()

	end)

	local info = Instance.new("TextLabel")
	info.Size = UDim2.new(1, -30, 0, 100)
	info.Position = UDim2.fromOffset(15, 165)
	info.BackgroundColor3 = C.Panel
	info.Text =
		"Phone Settings\n\nVersion 1.0\nClient Device"
	info.TextColor3 = C.Text
	info.Font = Enum.Font.Gotham
	info.TextSize = 15
	info.Parent = appFrame

	Instance.new("UICorner", info).CornerRadius = UDim.new(0, 15)

end)

------------------------------------------------------------
-- BROWSER
------------------------------------------------------------

browser.MouseButton1Click:Connect(function()

	openApp("Browser")

	local search = Instance.new("TextBox")
	search.Size = UDim2.new(1, -30, 0, 50)
	search.Position = UDim2.fromOffset(15, 80)
	search.BackgroundColor3 = C.Panel
	search.TextColor3 = C.Text
	search.PlaceholderColor3 = C.SubText
	search.PlaceholderText = "Search..."
	search.Text = ""
	search.Font = Enum.Font.Gotham
	search.TextSize = 15
	search.Parent = appFrame

	Instance.new("UICorner", search).CornerRadius = UDim.new(0, 13)

	local result = Instance.new("TextLabel")
	result.Size = UDim2.new(1, -30, 0, 160)
	result.Position = UDim2.fromOffset(15, 150)
	result.BackgroundColor3 = C.Panel
	result.Text =
		"🌐 Browser\n\nThis is an in-game browser interface."
	result.TextColor3 = C.Text
	result.TextWrapped = true
	result.Font = Enum.Font.Gotham
	result.TextSize = 15
	result.Parent = appFrame

	Instance.new("UICorner", result).CornerRadius = UDim.new(0, 15)

end)

------------------------------------------------------------
-- CALCULATOR
------------------------------------------------------------

calculator.MouseButton1Click:Connect(function()

	openApp("Calculator")

	local display = Instance.new("TextLabel")
	display.Size = UDim2.new(1, -30, 0, 60)
	display.Position = UDim2.fromOffset(15, 70)
	display.BackgroundColor3 = C.Panel
	display.Text = "0"
	display.TextColor3 = C.Text
	display.Font = Enum.Font.GothamBold
	display.TextSize = 25
	display.TextXAlignment = Enum.TextXAlignment.Right
	display.Parent = appFrame

	Instance.new("UICorner", display).CornerRadius = UDim.new(0, 13)

	local expression = ""

	local buttons = {
		"7","8","9","/",
		"4","5","6","*",
		"1","2","3","-",
		"0",".","=","+"
	}

	for i, value in ipairs(buttons) do

		local column = (i - 1) % 4
		local row = math.floor((i - 1) / 4)

		local b = makeButton(
			appFrame,
			value,
			UDim2.fromOffset(
				15 + column * 90,
				145 + row * 60
			),
			UDim2.fromOffset(75, 48)
		)

		b.MouseButton1Click:Connect(function()

			if value == "=" then

				local success, result = pcall(function()
					return loadstring("return " .. expression)()
				end)

				if success then
					display.Text = tostring(result)
					expression = tostring(result)
				else
					display.Text = "Error"
					expression = ""
				end

			else

				expression = expression .. value
				display.Text = expression

			end

		end)

	end

end)

------------------------------------------------------------
-- BACK BUTTON
------------------------------------------------------------

backButton.MouseButton1Click:Connect(function()

	appFrame.Visible = false
	home.Visible = true
	currentApp = "Home"

end)

------------------------------------------------------------
-- PHONE OPEN/CLOSE
------------------------------------------------------------

local function openPhone()

	phoneOpen = true

	phone.Visible = true

	TweenService:Create(
		phone,
		TweenInfo.new(
			0.45,
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out
		),
		{
			Position = UDim2.new(0.5, -195, 0.5, -360)
		}
	):Play()

end

local function closePhone()

	phoneOpen = false

	TweenService:Create(
		phone,
		TweenInfo.new(
			0.35,
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.In
		),
		{
			Position = UDim2.new(0.5, -195, 1, 30)
		}
	):Play()

end

------------------------------------------------------------
-- P KEY
------------------------------------------------------------

UserInputService.InputBegan:Connect(function(inputObject, processed)

	if processed then
		return
	end

	if inputObject.KeyCode == PHONE_KEY then

		if phoneOpen then
			closePhone()
		else
			openPhone()
		end

	end

end)

------------------------------------------------------------
-- HOME INDICATOR CLICK
------------------------------------------------------------

homeIndicator.InputBegan:Connect(function(inputObject)

	if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then

		appFrame.Visible = false
		home.Visible = true
		currentApp = "Home"

	end

end)

------------------------------------------------------------
-- CLOCK
------------------------------------------------------------

RunService.RenderStepped:Connect(function()

	local now = os.date("*t")

	timeLabel.Text =
		string.format("%02d:%02d", now.hour, now.min)

end)

------------------------------------------------------------
-- START
------------------------------------------------------------

phone.Position = UDim2.new(0.5, -195, 1, 30)

print("📱 Phone LocalScript loaded successfully!")
print("Press P to open/close the phone.")

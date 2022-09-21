--> Core
local InputService = game:GetService("UserInputService")
local SimpleMouse = {}


--> Stack
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local mouse = player:GetMouse()


--> Methods
function SimpleMouse:SetBehavior(mode: Enum.MouseBehavior)
	InputService.MouseBehavior = mode
end

function SimpleMouse:SetEnabled(mode: boolean)
	InputService.MouseEnabled = mode
end

function SimpleMouse:SetIconVisible(mode: boolean)
	InputService.MouseIconEnabled = mode
end

function SimpleMouse:SetIconId(id: string)
	mouse.Icon = id
end

function SimpleMouse:ToScreen(): Vector2
	return InputService:GetMouseLocation()
end

function SimpleMouse:ToWorld(raycastParams: RaycastParams)
	--> Result Types
	:	{
		Origin: Vector3,
		Position: Vector3,
		Direction: Vector3,
		Distance: number,
		Instance: Instance,
	}
	
	--> Execution
	local mouse2DPos = InputService:GetMouseLocation()
	local unitRay = workspace.CurrentCamera:ViewportPointToRay( mouse2DPos.X, mouse2DPos.Y, 1)
	local origin = CFrame.lookAt(unitRay.Origin, unitRay.Origin + unitRay.Direction) * CFrame.new(0,0,-1)
	local rayResult = workspace:Raycast(origin.Position, unitRay.Direction * 500, raycastParams)
	
	if rayResult then
		return {
			Origin = unitRay.Origin,
			Position = rayResult.Position,
			Direction = unitRay.Direction,
			Distance = (unitRay.Origin - rayResult.Position).Magnitude,
			Instance = rayResult.Instance,
		}
	else
		local resultPosition = unitRay.Origin + unitRay.Direction * 500
		return {
			Origin = unitRay.Origin,
			Position = resultPosition,
			Direction = unitRay.Direction,
			Distance = (unitRay.Origin - resultPosition),
			Instance = nil,
		}
	end
end


--> Events
SimpleMouse.OnButton1Up = mouse.Button1Up
SimpleMouse.OnButton1Down = mouse.Button1Down
SimpleMouse.OnButton2Up = mouse.Button2Up
SimpleMouse.OnButton2Down = mouse.Button2Down

SimpleMouse.OnRollUp = mouse.WheelForward
SimpleMouse.OnRollDown = mouse.WheelBackward

SimpleMouse.OnIdle = mouse.Idle
SimpleMouse.OnMove = mouse.Move

--> Result
return SimpleMouse

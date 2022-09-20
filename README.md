# SimpleMouse
A Roblox Mouse Module to facilite your script.

This Module joins UserInputService, PlayerMouse(), Camera, Raycast functions to simplify your script and overcome some disadvantages

> *Status: Developing ⚠️*

## Methods

> #### **SimpleMouse:ToScreen()**
+ *Returns the mouse position in screen as Vector2*
+ *Example:*
```lua
local position = SimpleMouse:ToScreen()
print("position = (X: "..position.X..", Y: "..position.Y.."))
```
<br>

> #### **SimpleMouse:ToWorld(raycastParam)**
+ *Return the mouse position and with others informations, but with advantage of use RaycastParams that is not possible using normal mouse.*
+ *Example:*
```lua
local rayParams = RaycastParams.new()
local worldResult = SimpleMouse:ToWorld(rayParams)

if worldResult.Instance ~= nil then
  print("finded "..worldResult.Instance.Name)
end
print("the mouse target is "..worldResult.Position)
```
<br>


> #### **SimpleMouse:SetIcon(id)**
+ *Change the mouse icon.*
<br>

> #### **SimpleMouse:SetBehavior(mouseBehaviorEnum)**
+ *Change the mode of mouse(locked, centerlocked, default)*
<br>

> #### **SimpleMouse:SetIconVisible(bool)**
+ *Change visibility of mouse icon.*
<br>

> #### **SimpleMouse:SetEnabled(bool)**
+ *Disable and enable mouse.*

## Events
> #### **SimpleMouse.OnButton1Up** <sup>and (.OnButton2Up)</sup>
+ *Fired when mouse button 1<sup> or 2</sup> ups.*

> #### **SimpleMouse.OnButton1Down** <sup>and (.OnButton2Down)</sup>
+ *Fired when mouse button 1<sup> or 2</sup> downs.*

> #### **SimpleMouse.OnRollUp**
+ *Fired when mouse roll ups.*

> #### **SimpleMouse.OnRollDown**
+ *Fired when mouse roll downs.*

> #### **SimpleMouse.OnIdle**
+ *Fired when mouse is idle.*

> #### **SimpleMouse.OnMove**
+ *Fired when mouse is moving.**

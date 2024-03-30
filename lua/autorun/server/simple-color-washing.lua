local GetColor, SetColor, RemoveAllDecals, GetRenderFX
do
	local _obj_0 = FindMetaTable("Entity")
	GetColor, SetColor, RemoveAllDecals, GetRenderFX = _obj_0.GetColor, _obj_0.SetColor, _obj_0.RemoveAllDecals, _obj_0.GetRenderFX
end
local rgba = {
	"r",
	"g",
	"b",
	"a"
}
if file.Exists("ulib/shared/hook.lua", "LUA") then
	include("ulib/shared/hook.lua")
end
return hook.Add("OnEntityWaterLevelChanged", "Simple Color Washing", function(entity, _, waterLevel)
	if waterLevel > 1 then
		RemoveAllDecals(entity)
	end
	if GetRenderFX(entity) ~= 0 then
		return
	end
	local color = GetColor(entity)
	for index = 1, 4 do
		if color[rgba[index]] < 250 then
			color[rgba[index]] = color[rgba[index]] + 25
		else
			color[rgba[index]] = 255
		end
	end
	SetColor(entity, color)
	return
end, PRE_HOOK or HOOK_MONITOR_HIGH)

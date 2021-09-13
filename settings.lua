local mods_settings = {}
for name in pairs(mods) do
	local file_path = "__" .. name .. "__/switchable_mod"
	local is_ok = pcall(require, file_path)
	if is_ok then
		local mod_data = require(file_path)
		local setting_name = "mod_" .. name
		table.insert(mods_settings, {
			type = "bool-setting",
			name = setting_name,
			order = setting_name,
			setting_type = "runtime-global",
			default_value = mod_data.default_value or true,
			localised_name = {'', "[color=orange]", "Mod", {"colon"}, "[/color] ", {"mod-name." .. name}},
		})
	end
end
if #mods_settings > 0 then
	data:extend(mods_settings)
end

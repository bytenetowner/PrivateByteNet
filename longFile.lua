-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-03-18 15:51:20
-- Luau version 6, Types version 3
-- Time taken: 0.216188 seconds

local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local UserInputService_upvr = game:GetService("UserInputService")
local Players_upvr = game:GetService("Players")
local UiUtils_upvr = require(ReplicatedStorage_upvr.modules.helpers.UiUtils)
local characters_upvr = require(ReplicatedStorage_upvr.modules.characters)
local vide_upvr = require(ReplicatedStorage_upvr.modules.shared.vide)
local create_upvr = vide_upvr.create
local tbl_14_upvr = {
	BACKGROUND = "rbxassetid://104640531265193";
	SHOP_ROOT = "rbxassetid://120716964054345";
	TV = "rbxassetid://80179389412948";
	PROFILE = "rbxassetid://112430990043182";
	PROFILE_IMAGE = "rbxassetid://8908988224";
	TOPBAR = "rbxassetid://121158941126934";
	SIDEBAR = "rbxassetid://95250679760082";
	SIDE_BUTTON = "rbxassetid://104351423047707";
	BACK = "rbxassetid://104351423047707";
	SKILLFRAME = "rbxassetid://112661409968665";
	TIX = "rbxassetid://1075605738";
	OUTLINE = characters_upvr.rarity.lv1;
	ICON_HOLDER = "rbxassetid://113724603236989";
	RARE = "rbxassetid://102632770691954";
	WARNING = "rbxassetid://80792970540813";
	PRODUCT = "rbxassetid://72710515242185";
}
local tbl_12_upvr = {
	E = "L1";
	R = "R1";
	Q = 'Y';
	M1 = "R2";
	T = 'X';
}
local tbl_69_upvr = {
	[characters_upvr.passives.none] = "None";
	[characters_upvr.passives.metalguts] = "Metal Guts";
	[characters_upvr.passives.invincible] = "Invincible";
	[characters_upvr.passives.supporter] = "Supporter";
	[characters_upvr.passives.ignoreslip] = "Ignore Slip";
}
local tbl_34_upvr = {
	slot1 = UDim2.fromScale(0.369, 0.168);
	slot2 = UDim2.fromScale(0.629, 0.168);
	slot3 = UDim2.fromScale(0.82, 0.357);
	slot4 = UDim2.fromScale(0.82, 0.609);
	slot5 = UDim2.fromScale(0.629, 0.798);
	slot6 = UDim2.fromScale(0.369, 0.798);
	slot7 = UDim2.fromScale(0.182, 0.609);
	slot8 = UDim2.fromScale(0.182, 0.357);
}
local function moving_upvr(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 82, Named "moving"
	--[[ Upvalues[1]:
		[1]: vide_upvr (readonly)
	]]
	local var12_upvw = arg5
	if not var12_upvw then
		var12_upvw = Vector2.new(0, 0)
	end
	return vide_upvr.action(function(arg1_2) -- Line 85
		--[[ Upvalues[7]:
			[1]: vide_upvr (copied, readonly)
			[2]: arg6 (readonly)
			[3]: arg4 (readonly)
			[4]: var12_upvw (read and write)
			[5]: arg2 (readonly)
			[6]: arg1 (readonly)
			[7]: arg3 (readonly)
		]]
		vide_upvr.effect(function() -- Line 86
			--[[ Upvalues[7]:
				[1]: arg6 (copied, readonly)
				[2]: arg4 (copied, readonly)
				[3]: arg1_2 (readonly)
				[4]: var12_upvw (copied, read and write)
				[5]: arg2 (copied, readonly)
				[6]: arg1 (copied, readonly)
				[7]: arg3 (copied, readonly)
			]]
			if arg6() then
				if arg4 then
					arg1_2.Position = UDim2.new(0.5 + var12_upvw.X, arg2() * arg1, 0.5 + var12_upvw.Y, arg3() * arg1)
					return
				end
				arg1_2.Position = UDim2.new(var12_upvw.X, arg2() * arg1, var12_upvw.Y, arg3() * arg1)
			end
		end)
	end)
end
local function characterNdiscription_upvr(arg1, arg2, arg3) -- Line 99, Named "characterNdiscription"
	--[[ Upvalues[2]:
		[1]: create_upvr (readonly)
		[2]: moving_upvr (readonly)
	]]
	return create_upvr("Frame")({
		Size = UDim2.fromScale(1.015, 1.015);
		AnchorPoint = Vector2.new(0.5, 0.5);
		BackgroundTransparency = 1;
		
		moving_upvr(0.025, arg1, arg2, true, nil, arg3)
	})
end
local function _(arg1, arg2, arg3) -- Line 109, Named "line"
	--[[ Upvalues[1]:
		[1]: create_upvr (readonly)
	]]
	local module_6 = {
		BackgroundColor3 = Color3.new(0, 0, 0);
		BorderColor3 = Color3.new(0, 0, 0);
		BorderSizePixel = 0;
	}
	module_6.Position = arg1
	module_6.Size = arg2
	module_6.Rotation = arg3
	module_6.ZIndex = 2
	return create_upvr("Frame")(module_6)
end
local function sideBarButton_upvr(arg1, arg2) -- Line 121, Named "sideBarButton"
	--[[ Upvalues[3]:
		[1]: create_upvr (readonly)
		[2]: tbl_14_upvr (readonly)
		[3]: UiUtils_upvr (readonly)
	]]
	local module_7 = {
		Size = UDim2.fromScale(1, 0.15);
		BackgroundTransparency = 1;
		AnchorPoint = Vector2.new(0.5, 0.5);
	}
	local tbl_56 = {
		Image = tbl_14_upvr.SIDE_BUTTON;
		BackgroundTransparency = 1;
		AnchorPoint = Vector2.new(0.5, 0.5);
		Position = UDim2.fromScale(0.5, 0.5);
		Size = UDim2.fromScale(1, 1.284);
	}
	local tbl_39 = {
		AnchorPoint = Vector2.new(0.5, 0.5);
		BackgroundTransparency = 1;
		Position = UDim2.fromScale(0.5, 0.5);
		Size = UDim2.fromScale(0.65, 0.65);
	}
	tbl_39.Text = arg1
	tbl_39.TextScaled = true
	tbl_39.TextColor3 = Color3.fromRGB(255, 231, 171)
	tbl_39.FontFace = Font.new("rbxasset://fonts/families/Oswald.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	tbl_56[1] = UiUtils_upvr.button(function() -- Line 135
		--[[ Upvalues[2]:
			[1]: arg2 (readonly)
			[2]: arg1 (readonly)
		]]
		arg2(arg1)
	end)
	tbl_56[2] = create_upvr("TextLabel")(tbl_39)
	module_7[1] = create_upvr("ImageButton")(tbl_56)
	return create_upvr("Frame")(module_7)
end
local module = {
	vide = vide_upvr;
}
local charmStore_upvr = require(ReplicatedStorage_upvr.modules.charms.charmStore)
local LocalPlayer_upvr = Players_upvr.LocalPlayer
local helper_upvr = require(ReplicatedStorage_upvr.modules.helper)
local vide-charm_upvr = require(ReplicatedStorage_upvr.modules.shared["vide-charm"])
local ownerState_upvr = require(ReplicatedStorage_upvr.modules.charms.ownerState)
local matchBase_upvr = require(ReplicatedStorage_upvr.modules.charms.matchBase)
local ViewportSize_upvr = workspace.CurrentCamera.ViewportSize
local sound_upvr = require(ReplicatedStorage_upvr.modules.helpers.sound)
local SoundService_upvr = game:GetService("SoundService")
local TweenService_upvr = game:GetService("TweenService")
local TouchEnabled_upvr = UserInputService_upvr.TouchEnabled
local GamepadEnabled_upvr = UserInputService_upvr.GamepadEnabled
local animation_upvr = require(ReplicatedStorage_upvr.modules.helpers.animation)
local MarketplaceService_upvr = game:GetService("MarketplaceService")
function module.story(arg1, arg2, arg3) -- Line 161
	--[[ Upvalues[27]:
		[1]: charmStore_upvr (readonly)
		[2]: vide_upvr (readonly)
		[3]: LocalPlayer_upvr (readonly)
		[4]: helper_upvr (readonly)
		[5]: Players_upvr (readonly)
		[6]: vide-charm_upvr (readonly)
		[7]: ownerState_upvr (readonly)
		[8]: matchBase_upvr (readonly)
		[9]: characters_upvr (readonly)
		[10]: tbl_69_upvr (readonly)
		[11]: UserInputService_upvr (readonly)
		[12]: ViewportSize_upvr (readonly)
		[13]: sound_upvr (readonly)
		[14]: ReplicatedStorage_upvr (readonly)
		[15]: SoundService_upvr (readonly)
		[16]: create_upvr (readonly)
		[17]: TweenService_upvr (readonly)
		[18]: tbl_14_upvr (readonly)
		[19]: TouchEnabled_upvr (readonly)
		[20]: GamepadEnabled_upvr (readonly)
		[21]: tbl_12_upvr (readonly)
		[22]: tbl_34_upvr (readonly)
		[23]: UiUtils_upvr (readonly)
		[24]: animation_upvr (readonly)
		[25]: MarketplaceService_upvr (readonly)
		[26]: sideBarButton_upvr (readonly)
		[27]: characterNdiscription_upvr (readonly)
	]]
	if not arg3 then
	end
	local var37_upvw = {
		Buy = function() -- Line 163, Named "Buy"
		end;
		Equip = function() -- Line 164, Named "Equip"
		end;
		Skin = function() -- Line 165, Named "Skin"
		end;
	}
	local states = charmStore_upvr.states
	local any_source_result1_upvr_12 = vide_upvr.source("SURVIVORS")
	local any_source_result1_upvr_19 = vide_upvr.source(false)
	vide_upvr.effect(function() -- Line 173
		--[[ Upvalues[2]:
			[1]: any_source_result1_upvr_19 (readonly)
			[2]: arg2 (readonly)
		]]
		local var42
		if arg2() ~= "shop" then
			var42 = false
		else
			var42 = true
		end
		any_source_result1_upvr_19(var42)
	end)
	local any_source_result1_upvr_2 = vide_upvr.source({})
	local any_source_result1_upvr = vide_upvr.source({})
	local any_source_result1_upvr_5 = vide_upvr.source()
	local any_source_result1_upvr_4 = vide_upvr.source()
	local any_source_result1_upvr_16 = vide_upvr.source({})
	local any_source_result1_upvr_3 = vide_upvr.source({})
	local any_source_result1_upvr_17 = vide_upvr.source(Players_upvr:GetPlayers())
	local any_source_result1_upvr_13 = vide_upvr.source({})
	local any_source_result1_upvr_18 = vide_upvr.source(false)
	local any_source_result1_upvr_11 = vide_upvr.source(false)
	local any_source_result1_upvr_8 = vide_upvr.source("")
	local any_source_result1_upvr_10 = vide_upvr.source(false)
	local any_source_result1_upvr_15 = vide_upvr.source(false)
	local any_source_result1_upvr_14 = vide_upvr.source(false)
	local any_source_result1_upvr_7 = vide_upvr.source(0)
	local any_source_result1_upvr_6 = vide_upvr.source(0)
	local any_useAtom_result1_upvr_9 = vide-charm_upvr.useAtom(matchBase_upvr.matchstarted)
	local any_useAtom_result1_upvr_10 = vide-charm_upvr.useAtom(states.currencies.tix)
	local any_useAtom_result1_upvr_11 = vide-charm_upvr.useAtom(states.survivorUsed)
	local any_useAtom_result1_upvr_3 = vide-charm_upvr.useAtom(states.killerUsed)
	local any_useAtom_result1_upvr = vide-charm_upvr.useAtom(states.emotes_inventory)
	local any_useAtom_result1_upvr_4 = vide-charm_upvr.useAtom(states.emotes)
	vide_upvr.effect(function() -- Line 214
		--[[ Upvalues[2]:
			[1]: any_source_result1_upvr_13 (readonly)
			[2]: any_useAtom_result1_upvr_4 (readonly)
		]]
		any_source_result1_upvr_13(any_useAtom_result1_upvr_4())
	end)
	vide_upvr.cleanup(Players_upvr.PlayerAdded:Connect(function() -- Line 217
		--[[ Upvalues[2]:
			[1]: any_source_result1_upvr_17 (readonly)
			[2]: Players_upvr (copied, readonly)
		]]
		any_source_result1_upvr_17(Players_upvr:GetPlayers())
	end))
	vide_upvr.cleanup(Players_upvr.PlayerRemoving:Connect(function() -- Line 221
		--[[ Upvalues[2]:
			[1]: any_source_result1_upvr_17 (readonly)
			[2]: Players_upvr (copied, readonly)
		]]
		any_source_result1_upvr_17(Players_upvr:GetPlayers())
	end))
	local any_useAtom_result1_upvr_12 = vide-charm_upvr.useAtom(states.survivorlevels)
	local any_useAtom_result1_upvr_5 = vide-charm_upvr.useAtom(states.survivors)
	local any_useAtom_result1_upvr_2 = vide-charm_upvr.useAtom(states.survivorskins)
	local any_useAtom_result1_upvr_8 = vide-charm_upvr.useAtom(states.killerlevels)
	local any_useAtom_result1_upvr_7 = vide-charm_upvr.useAtom(states.killers)
	local any_useAtom_result1_upvr_13 = vide-charm_upvr.useAtom(states.killerskins)
	vide_upvr.effect(function() -- Line 225
		--[[ Upvalues[16]:
			[1]: any_source_result1_upvr_12 (readonly)
			[2]: any_source_result1_upvr_2 (readonly)
			[3]: helper_upvr (copied, readonly)
			[4]: any_source_result1_upvr_18 (readonly)
			[5]: any_source_result1_upvr_11 (readonly)
			[6]: any_source_result1_upvr_8 (readonly)
			[7]: characters_upvr (copied, readonly)
			[8]: any_source_result1_upvr_3 (readonly)
			[9]: any_useAtom_result1_upvr_12 (readonly)
			[10]: any_useAtom_result1_upvr_5 (readonly)
			[11]: any_useAtom_result1_upvr_2 (readonly)
			[12]: charmStore_upvr (copied, readonly)
			[13]: any_source_result1_upvr_16 (readonly)
			[14]: any_useAtom_result1_upvr_8 (readonly)
			[15]: any_useAtom_result1_upvr_7 (readonly)
			[16]: any_useAtom_result1_upvr_13 (readonly)
		]]
		if any_source_result1_upvr_12() == "EMOTES" then
			any_source_result1_upvr_2(helper_upvr._emotes)
		else
			any_source_result1_upvr_18(false)
			any_source_result1_upvr_11(false)
			any_source_result1_upvr_8("")
			if any_source_result1_upvr_12() == "ROBUX" then
				any_source_result1_upvr_2(helper_upvr._product.product)
				return
			end
			if any_source_result1_upvr_12() == "SURVIVORS" then
				any_source_result1_upvr_2(characters_upvr.survivors)
				any_source_result1_upvr_3(any_useAtom_result1_upvr_12())
				local tbl_17 = {}
				for _, v_3 in any_useAtom_result1_upvr_5() do
					local var87 = any_useAtom_result1_upvr_2()[v_3]
					if not var87 then
						var87 = charmStore_upvr
						var87 = var87.tem
						var87 = var87.skin_tem
					end
					tbl_17[v_3] = var87
				end
				any_source_result1_upvr_16(tbl_17)
				return
			end
			if any_source_result1_upvr_12() == "KILLERS" then
				any_source_result1_upvr_2(characters_upvr.killers)
				any_source_result1_upvr_3(any_useAtom_result1_upvr_8())
				local tbl_7 = {}
				for _, v_4 in any_useAtom_result1_upvr_7() do
					var87 = any_useAtom_result1_upvr_13()[v_4]
					local var92 = var87
					if not var92 then
						var92 = charmStore_upvr
						var92 = var92.tem
						var92 = var92.skin_tem
					end
					tbl_7[v_4] = var92
				end
				any_source_result1_upvr_16(tbl_7)
			end
		end
	end)
	vide_upvr.effect(function() -- Line 265
		--[[ Upvalues[5]:
			[1]: any_source_result1_upvr_5 (readonly)
			[2]: any_source_result1_upvr_2 (readonly)
			[3]: characters_upvr (copied, readonly)
			[4]: tbl_69_upvr (copied, readonly)
			[5]: any_source_result1_upvr (readonly)
		]]
		local any_source_result1_upvr_5_result1 = any_source_result1_upvr_5()
		local any_source_result1_upvr_2_result1_2 = any_source_result1_upvr_2()
		if any_source_result1_upvr_5_result1 ~= nil and any_source_result1_upvr_2_result1_2 ~= nil then
			local var123 = any_source_result1_upvr_2_result1_2[any_source_result1_upvr_5_result1]
			if var123 then
				local var124
				if var124 then
					var124 = var123.passive
					if not var124 then
						var124 = {}
						var124[1] = characters_upvr.passives.none
					end
					local var125 = ""
					if typeof(var124) == "table" then
						for _, v in var124 do
							local var127
							local function INLINED_2() -- Internal function, doesn't exist in bytecode
								var127 = `{var125}, `
								return var127
							end
							if 1 >= #var124 or var125 == "" or not INLINED_2() then
								var127 = ""
							end
							var125 = `{var127}{tbl_69_upvr[v]}`
						end
					else
						var125 = tbl_69_upvr[var124]
					end
					for i_2, v_2 in var123.skills do
						({})[i_2] = v_2
						local var128
					end
					local tbl_25 = {
						layerorder = 0;
						name = "STATS";
					}
					local tbl_8 = {
						text = `Health : {var123["health&maxhealth"] or 100}\nSprint Speed : {var123.sprintspeed or "Normal"}\nStamina : {var123.stamina or 100}\nPassives : {var125}\n{var123.stats or ""}`;
					}
					tbl_25.discription = tbl_8
					var128.main = tbl_25
					tbl_8 = var128
					local var131 = tbl_8
					if not var131 then
						var131 = {}
					end
					any_source_result1_upvr(var131)
				end
			end
		end
	end)
	if not UserInputService_upvr.TouchEnabled then
		vide_upvr.cleanup(UserInputService_upvr.InputChanged:Connect(function(arg1_3) -- Line 305
			--[[ Upvalues[4]:
				[1]: UserInputService_upvr (copied, readonly)
				[2]: any_source_result1_upvr_7 (readonly)
				[3]: ViewportSize_upvr (copied, readonly)
				[4]: any_source_result1_upvr_6 (readonly)
			]]
			if arg1_3.UserInputType == Enum.UserInputType.MouseMovement then
				local any_GetMouseLocation_result1 = UserInputService_upvr:GetMouseLocation()
				any_source_result1_upvr_7(any_GetMouseLocation_result1.X - ViewportSize_upvr.X / 2)
				any_source_result1_upvr_6(any_GetMouseLocation_result1.Y - ViewportSize_upvr.Y / 2)
			end
		end))
	end
	local function _() -- Line 314, Named "exitshopping"
		--[[ Upvalues[4]:
			[1]: any_source_result1_upvr_5 (readonly)
			[2]: any_source_result1_upvr_4 (readonly)
			[3]: any_source_result1_upvr_15 (readonly)
			[4]: any_source_result1_upvr (readonly)
		]]
		any_source_result1_upvr_5(nil)
		any_source_result1_upvr_4(nil)
		any_source_result1_upvr_15(false)
		any_source_result1_upvr({})
	end
	local function _() -- Line 321, Named "exitSkin"
		--[[ Upvalues[4]:
			[1]: any_source_result1_upvr_12 (readonly)
			[2]: any_source_result1_upvr_2 (readonly)
			[3]: characters_upvr (copied, readonly)
			[4]: any_source_result1_upvr_10 (readonly)
		]]
		if any_source_result1_upvr_12() == "SURVIVORS" then
			any_source_result1_upvr_2(characters_upvr.survivors)
		elseif any_source_result1_upvr_12() == "KILLERS" then
			any_source_result1_upvr_2(characters_upvr.killers)
		end
		any_source_result1_upvr_10(false)
	end
	local function _() -- Line 330, Named "isKiller"
		--[[ Upvalues[1]:
			[1]: any_source_result1_upvr_12 (readonly)
		]]
		local var134
		if any_source_result1_upvr_12() ~= "KILLERS" then
			var134 = false
		else
			var134 = true
		end
		return var134
	end
	local any_music_play_result1_upvr_2 = sound_upvr.music_play(ReplicatedStorage_upvr.resources.sounds.lobbytheme, SoundService_upvr)
	local any_music_play_result1_upvr = sound_upvr.music_play(ReplicatedStorage_upvr.resources.sounds.shop1_song, SoundService_upvr)
	any_music_play_result1_upvr:Pause()
	local any_useAtom_result1_upvr_6 = vide-charm_upvr.useAtom(ownerState_upvr.loaded)
	vide_upvr.effect(function() -- Line 345
		--[[ Upvalues[3]:
			[1]: any_useAtom_result1_upvr_9 (readonly)
			[2]: any_useAtom_result1_upvr_6 (readonly)
			[3]: any_music_play_result1_upvr_2 (readonly)
		]]
		if any_useAtom_result1_upvr_9() or not any_useAtom_result1_upvr_6() then
			any_music_play_result1_upvr_2:Stop()
		else
			any_music_play_result1_upvr_2:Play()
		end
	end)
	vide_upvr.effect(function() -- Line 349
		--[[ Upvalues[2]:
			[1]: any_source_result1_upvr_16 (readonly)
			[2]: charmStore_upvr (copied, readonly)
		]]
		if not any_source_result1_upvr_16().bacon then
			local clone_3 = table.clone(any_source_result1_upvr_16())
			clone_3.bacon = charmStore_upvr.tem.skin_tem
			any_source_result1_upvr_16(clone_3)
		end
		if not any_source_result1_upvr_16().coolkid then
			local clone = table.clone(any_source_result1_upvr_16())
			clone.coolkid = charmStore_upvr.tem.skin_tem
			any_source_result1_upvr_16(clone)
		end
	end)
	local module_3 = {
		Size = UDim2.fromScale(1, 1);
		BackgroundTransparency = 1;
		AnchorPoint = Vector2.new(0.5, 0.5);
		Position = UDim2.fromScale(0.5, 0.5);
		Visible = false;
	}
	local tbl_16 = {
		Size = UDim2.fromScale(1, 1);
		Position = UDim2.fromScale(0, 0);
		BackgroundColor3 = Color3.new(0, 0, 0);
		ZIndex = 5;
	}
	local tbl_19 = {}
	local tbl_63 = {NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.1, 0), NumberSequenceKeypoint.new(0.9, 0), NumberSequenceKeypoint.new(1, 1)}
	tbl_19.Transparency = NumberSequence.new(tbl_63)
	tbl_16[1] = create_upvr("UIGradient")(tbl_19)
	tbl_16[2] = vide_upvr.action(function(arg1_9) -- Line 712
		--[[ Upvalues[9]:
			[1]: any_source_result1_upvr_19 (readonly)
			[2]: vide_upvr (copied, readonly)
			[3]: sound_upvr (copied, readonly)
			[4]: ReplicatedStorage_upvr (copied, readonly)
			[5]: SoundService_upvr (copied, readonly)
			[6]: TweenService_upvr (copied, readonly)
			[7]: any_source_result1_upvr_5 (readonly)
			[8]: any_source_result1_upvr_10 (readonly)
			[9]: any_source_result1_upvr_12 (readonly)
		]]
		local var40_result1_upvw = any_source_result1_upvr_19()
		vide_upvr.effect(function() -- Line 714
			--[[ Upvalues[7]:
				[1]: any_source_result1_upvr_19 (copied, readonly)
				[2]: var40_result1_upvw (read and write)
				[3]: sound_upvr (copied, readonly)
				[4]: ReplicatedStorage_upvr (copied, readonly)
				[5]: SoundService_upvr (copied, readonly)
				[6]: arg1_9 (readonly)
				[7]: TweenService_upvr (copied, readonly)
			]]
			if any_source_result1_upvr_19() ~= var40_result1_upvw then
				var40_result1_upvw = any_source_result1_upvr_19()
				sound_upvr.play(ReplicatedStorage_upvr.resources.sounds.transition, SoundService_upvr)
				if any_source_result1_upvr_19() then
					arg1_9.Position = UDim2.fromScale(-1.5, 0)
					TweenService_upvr:Create(arg1_9, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
						Position = UDim2.fromScale(1.5, 0);
					}):Play()
					return
				end
				arg1_9.Position = UDim2.fromScale(-2.5, 0)
				TweenService_upvr:Create(arg1_9, TweenInfo.new(0.45, Enum.EasingStyle.Linear), {
					Position = UDim2.fromScale(0.5, 0);
					Size = UDim2.fromScale(2, 1);
				}):Play()
			end
		end)
		local var39_result1_upvw = any_source_result1_upvr_12()
		local any_source_result1_upvr_5_result1_upvw = any_source_result1_upvr_5()
		local any_source_result1_upvr_10_result1_upvw = any_source_result1_upvr_10()
		vide_upvr.effect(function() -- Line 739
			--[[ Upvalues[11]:
				[1]: any_source_result1_upvr_12 (copied, readonly)
				[2]: var39_result1_upvw (read and write)
				[3]: any_source_result1_upvr_5 (copied, readonly)
				[4]: any_source_result1_upvr_5_result1_upvw (read and write)
				[5]: any_source_result1_upvr_10 (copied, readonly)
				[6]: any_source_result1_upvr_10_result1_upvw (read and write)
				[7]: sound_upvr (copied, readonly)
				[8]: ReplicatedStorage_upvr (copied, readonly)
				[9]: SoundService_upvr (copied, readonly)
				[10]: arg1_9 (readonly)
				[11]: TweenService_upvr (copied, readonly)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [5] 5. Error Block 2 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [5] 5. Error Block 2 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [15] 13. Error Block 7 start (CF ANALYSIS FAILED)
			any_source_result1_upvr_5_result1_upvw = any_source_result1_upvr_5()
			any_source_result1_upvr_10_result1_upvw = any_source_result1_upvr_10()
			var39_result1_upvw = any_source_result1_upvr_12()
			sound_upvr.play(ReplicatedStorage_upvr.resources.sounds.transition, SoundService_upvr)
			arg1_9.Position = UDim2.fromScale(-1.5, 0)
			TweenService_upvr:Create(arg1_9, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
				Position = UDim2.fromScale(1.5, 0);
			}):Play()
			-- KONSTANTERROR: [15] 13. Error Block 7 end (CF ANALYSIS FAILED)
		end)
	end)
	local tbl_11 = {
		Size = UDim2.fromScale(1.2, 1.2);
		AnchorPoint = Vector2.new(0.5, 0.5);
	}
	tbl_63 = nil
	local var195_upvw = tbl_63
	if not var195_upvw then
		var195_upvw = Vector2.new(0, 0)
	end
	local var197_upvr = true
	local var198_upvr = 0.01
	tbl_11[1] = vide_upvr.action(function(arg1_10) -- Line 85
		--[[ Upvalues[7]:
			[1]: vide_upvr (copied, readonly)
			[2]: any_source_result1_upvr_19 (readonly)
			[3]: var197_upvr (readonly)
			[4]: var195_upvw (read and write)
			[5]: any_source_result1_upvr_7 (readonly)
			[6]: var198_upvr (readonly)
			[7]: any_source_result1_upvr_6 (readonly)
		]]
		vide_upvr.effect(function() -- Line 86
			--[[ Upvalues[7]:
				[1]: any_source_result1_upvr_19 (copied, readonly)
				[2]: var197_upvr (copied, readonly)
				[3]: arg1_10 (readonly)
				[4]: var195_upvw (copied, read and write)
				[5]: any_source_result1_upvr_7 (copied, readonly)
				[6]: var198_upvr (copied, readonly)
				[7]: any_source_result1_upvr_6 (copied, readonly)
			]]
			if any_source_result1_upvr_19() then
				if var197_upvr then
					arg1_10.Position = UDim2.new(0.5 + var195_upvw.X, any_source_result1_upvr_7() * var198_upvr, 0.5 + var195_upvw.Y, any_source_result1_upvr_6() * var198_upvr)
					return
				end
				arg1_10.Position = UDim2.new(var195_upvw.X, any_source_result1_upvr_7() * var198_upvr, var195_upvw.Y, any_source_result1_upvr_6() * var198_upvr)
			end
		end)
	end)
	tbl_11.ZIndex = -1
	tbl_11.BackgroundTransparency = 1
	tbl_11.Image = tbl_14_upvr.BACKGROUND
	tbl_11.ScaleType = Enum.ScaleType.Crop
	tbl_11[2] = create_upvr("UIGradient")({
		Rotation = 90;
		Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(95, 95, 95)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(108, 108, 108))});
	})
	tbl_11[3] = vide_upvr.action(function(arg1_11) -- Line 778
		--[[ Upvalues[3]:
			[1]: vide_upvr (copied, readonly)
			[2]: any_source_result1_upvr_19 (readonly)
			[3]: TweenService_upvr (copied, readonly)
		]]
		vide_upvr.effect(function() -- Line 779
			--[[ Upvalues[3]:
				[1]: any_source_result1_upvr_19 (copied, readonly)
				[2]: TweenService_upvr (copied, readonly)
				[3]: arg1_11 (readonly)
			]]
			if any_source_result1_upvr_19() then
				TweenService_upvr:Create(arg1_11, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
					Size = UDim2.fromScale(1.1, 1.1);
				}):Play()
			else
				TweenService_upvr:Create(arg1_11, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
					Size = UDim2.fromScale(1.3, 1.3);
				}):Play()
			end
		end)
	end)
	local tbl_65 = {
		Size = UDim2.fromScale(1, 1);
		BackgroundTransparency = 1;
		AnchorPoint = Vector2.new(0.5, 0.5);
	}
	local vector2_upvw_2 = Vector2.new(0.16, 0)
	if not vector2_upvw_2 then
		vector2_upvw_2 = Vector2.new(0, 0)
	end
	local var209_upvr = true
	local var210_upvr = 0.025
	local tbl_35 = {
		Size = UDim2.fromScale(0.846, 0.668);
	}
	local vector2_upvw_6 = Vector2.new(0.077, 0.184)
	if not vector2_upvw_6 then
		vector2_upvw_6 = Vector2.new(0, 0)
	end
	local var221_upvr = false
	local var222_upvr = 0.01
	tbl_35[1] = vide_upvr.action(function(arg1_14) -- Line 85
		--[[ Upvalues[7]:
			[1]: vide_upvr (copied, readonly)
			[2]: any_source_result1_upvr_19 (readonly)
			[3]: var221_upvr (readonly)
			[4]: vector2_upvw_6 (read and write)
			[5]: any_source_result1_upvr_7 (readonly)
			[6]: var222_upvr (readonly)
			[7]: any_source_result1_upvr_6 (readonly)
		]]
		vide_upvr.effect(function() -- Line 86
			--[[ Upvalues[7]:
				[1]: any_source_result1_upvr_19 (copied, readonly)
				[2]: var221_upvr (copied, readonly)
				[3]: arg1_14 (readonly)
				[4]: vector2_upvw_6 (copied, read and write)
				[5]: any_source_result1_upvr_7 (copied, readonly)
				[6]: var222_upvr (copied, readonly)
				[7]: any_source_result1_upvr_6 (copied, readonly)
			]]
			if any_source_result1_upvr_19() then
				if var221_upvr then
					arg1_14.Position = UDim2.new(0.5 + vector2_upvw_6.X, any_source_result1_upvr_7() * var222_upvr, 0.5 + vector2_upvw_6.Y, any_source_result1_upvr_6() * var222_upvr)
					return
				end
				arg1_14.Position = UDim2.new(vector2_upvw_6.X, any_source_result1_upvr_7() * var222_upvr, vector2_upvw_6.Y, any_source_result1_upvr_6() * var222_upvr)
			end
		end)
	end)
	tbl_35.BackgroundTransparency = 1
	local tbl_62 = {
		AnchorPoint = Vector2.new(0.5, 0);
		Size = UDim2.fromScale(0.209, 0.746);
		Position = UDim2.fromScale(0.746, 0.166);
		BackgroundColor3 = Color3.fromRGB(0, 0, 0);
		BackgroundTransparency = 0;
		
		create_upvr("UIStroke")({
			Thickness = 1;
			Transparency = 0.8;
			Color = Color3.fromRGB(148, 148, 148);
		})
	}
	local function Visible() -- Line 1010
		--[[ Upvalues[1]:
			[1]: any_source_result1_upvr_18 (readonly)
		]]
		return any_source_result1_upvr_18()
	end
	tbl_62.Visible = Visible
	local tbl_58 = {
		AnchorPoint = Vector2.new(0.5, 0.5);
		Size = UDim2.fromScale(0.5, 0.5);
		Position = UDim2.fromScale(0.5, 0.841);
		BackgroundTransparency = 1;
	}
	local function ImageColor3() -- Line 1105
		--[[ Upvalues[2]:
			[1]: any_source_result1_upvr_8 (readonly)
			[2]: any_useAtom_result1_upvr (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [9] 9. Error Block 8 start (CF ANALYSIS FAILED)
		local Color3_fromRGB_result1_2 = Color3.fromRGB(255, 194, 120)
		if not Color3_fromRGB_result1_2 then
			-- KONSTANTERROR: [16] 15. Error Block 6 start (CF ANALYSIS FAILED)
			Color3_fromRGB_result1_2 = Color3.fromRGB(153, 255, 160)
			-- KONSTANTERROR: [16] 15. Error Block 6 end (CF ANALYSIS FAILED)
		end
		do
			return Color3_fromRGB_result1_2
		end
		-- KONSTANTERROR: [9] 9. Error Block 8 end (CF ANALYSIS FAILED)
	end
	tbl_58.ImageColor3 = ImageColor3
	tbl_58.Image = "rbxassetid://104351423047707"
	tbl_58.ScaleType = Enum.ScaleType.Fit
	local tbl_71 = {
		Size = UDim2.fromScale(0.65, 0.231);
		Position = UDim2.fromScale(0.5, 0.5);
		AnchorPoint = Vector2.new(0.5, 0.5);
		BackgroundTransparency = 1;
		FontFace = Font.new("rbxasset://fonts/families/Oswald.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
	}
	local function Text() -- Line 1135
		--[[ Upvalues[2]:
			[1]: any_source_result1_upvr_8 (readonly)
			[2]: any_useAtom_result1_upvr (readonly)
		]]
		if table.find(any_useAtom_result1_upvr(), any_source_result1_upvr_8()) then
			return "EQUIP"
		end
		return "BUY"
	end
	tbl_71.Text = Text
	tbl_71.TextColor3 = Color3.fromRGB(255, 231, 171)
	tbl_71.TextScaled = true
	tbl_71.TextStrokeTransparency = 1
	tbl_58[1] = UiUtils_upvr.button(function() -- Line 1112
		--[[ Upvalues[4]:
			[1]: any_source_result1_upvr_8 (readonly)
			[2]: any_useAtom_result1_upvr (readonly)
			[3]: any_source_result1_upvr_11 (readonly)
			[4]: var37_upvw (read and write)
		]]
		if table.find(any_useAtom_result1_upvr(), any_source_result1_upvr_8()) then
			any_source_result1_upvr_11(not any_source_result1_upvr_11())
		else
			var37_upvw.EmoteChange(any_source_result1_upvr_8())
		end
	end)
	tbl_58[2] = create_upvr("UIAspectRatioConstraint")({})
	tbl_58[3] = create_upvr("TextLabel")(tbl_71)
	local tbl_43 = {
		Size = UDim2.fromScale(0.765, 0.083);
		Position = UDim2.fromScale(0.517, 0.497);
		AnchorPoint = Vector2.new(0.5, 1);
		BackgroundTransparency = 1;
		FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	}
	local function Text() -- Line 1164
		--[[ Upvalues[2]:
			[1]: helper_upvr (copied, readonly)
			[2]: any_source_result1_upvr_8 (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		local var273 = helper_upvr._emotes[any_source_result1_upvr_8()]
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [7] 7. Error Block 6 start (CF ANALYSIS FAILED)
		local discription_3 = var273.discription
		if not discription_3 then
			-- KONSTANTERROR: [10] 9. Error Block 3 start (CF ANALYSIS FAILED)
			discription_3 = ""
			-- KONSTANTERROR: [10] 9. Error Block 3 end (CF ANALYSIS FAILED)
		end
		do
			return discription_3
		end
		-- KONSTANTERROR: [7] 7. Error Block 6 end (CF ANALYSIS FAILED)
	end
	tbl_43.Text = Text
	tbl_43.TextColor3 = Color3.fromRGB(255, 255, 255)
	tbl_43.TextScaled = true
	tbl_43.TextStrokeTransparency = 0
	tbl_43.TextYAlignment = Enum.TextYAlignment.Top
	local tbl_68 = {
		Size = UDim2.fromScale(0.807, 0.044);
		Position = UDim2.fromScale(0.538, 0.367);
		AnchorPoint = Vector2.new(0.5, 1);
		BackgroundTransparency = 1;
		FontFace = Font.new("rbxasset://fonts/families/AccanthisADFStd.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	}
	local function Text() -- Line 1186
		--[[ Upvalues[2]:
			[1]: helper_upvr (copied, readonly)
			[2]: any_source_result1_upvr_8 (readonly)
		]]
		local var276 = helper_upvr._emotes[any_source_result1_upvr_8()]
		local var277
		local function INLINED_6() -- Internal function, doesn't exist in bytecode
			var277 = var276.price
			return var277
		end
		if not var276 or not INLINED_6() then
			var277 = ""
		end
		return `{var277}t`
	end
	tbl_68.Text = Text
	tbl_68.TextColor3 = Color3.fromRGB(255, 211, 134)
	tbl_68.TextScaled = true
	tbl_68.TextStrokeTransparency = 0
	tbl_68.TextXAlignment = Enum.TextXAlignment.Right
	local tbl_26 = {
		Size = UDim2.fromScale(0.807, 0.06);
		Position = UDim2.fromScale(0.538, 0.33);
		AnchorPoint = Vector2.new(0.5, 1);
		BackgroundTransparency = 1;
		FontFace = Font.new("rbxasset://fonts/families/AccanthisADFStd.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	}
	local function Text() -- Line 1225
		--[[ Upvalues[2]:
			[1]: helper_upvr (copied, readonly)
			[2]: any_source_result1_upvr_8 (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		local var279 = helper_upvr._emotes[any_source_result1_upvr_8()]
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [7] 7. Error Block 6 start (CF ANALYSIS FAILED)
		local name = var279.name
		if not name then
			-- KONSTANTERROR: [10] 9. Error Block 3 start (CF ANALYSIS FAILED)
			name = ""
			-- KONSTANTERROR: [10] 9. Error Block 3 end (CF ANALYSIS FAILED)
		end
		do
			return name
		end
		-- KONSTANTERROR: [7] 7. Error Block 6 end (CF ANALYSIS FAILED)
	end
	tbl_26.Text = Text
	tbl_26.TextColor3 = Color3.fromRGB(255, 255, 255)
	tbl_26.TextScaled = true
	tbl_26.TextStrokeTransparency = 0.5
	tbl_26.TextXAlignment = Enum.TextXAlignment.Right
	tbl_62[2] = vide_upvr.action(function(arg1_18) -- Line 1014
		--[[ Upvalues[3]:
			[1]: vide_upvr (copied, readonly)
			[2]: any_source_result1_upvr_18 (readonly)
			[3]: TweenService_upvr (copied, readonly)
		]]
		vide_upvr.effect(function() -- Line 1016
			--[[ Upvalues[3]:
				[1]: any_source_result1_upvr_18 (copied, readonly)
				[2]: TweenService_upvr (copied, readonly)
				[3]: arg1_18 (readonly)
			]]
			local tbl_28 = {}
			local var253
			local function INLINED_5() -- Internal function, doesn't exist in bytecode
				var253 = UDim2.fromScale(0.746, 0.166)
				return var253
			end
			if not any_source_result1_upvr_18() or not INLINED_5() then
				var253 = UDim2.fromScale(0.5, 0.166)
			end
			tbl_28.Position = var253
			TweenService_upvr:Create(arg1_18, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), tbl_28):Play()
		end)
	end)
	tbl_62[3] = create_upvr("Frame")({
		AnchorPoint = Vector2.new(0.5, 0);
		Size = UDim2.fromScale(0.905, 0.341);
		Position = UDim2.fromScale(0.5, 0.028);
		BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		BackgroundTransparency = 0.95;
		
		create_upvr("UIStroke")({
			Thickness = 1;
			Transparency = 0.8;
			Color = Color3.fromRGB(148, 148, 148);
		}), create_upvr("ViewportFrame")({
			Size = UDim2.fromScale(1, 1);
			Position = UDim2.fromScale(0, 0);
			AnchorPoint = Vector2.new(0, 0);
			BackgroundTransparency = 1;
			
			create_upvr("UIGradient")({
				Rotation = 90;
				Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1)});
			}), vide_upvr.action(function(arg1_19) -- Line 1055
				--[[ Upvalues[6]:
					[1]: ReplicatedStorage_upvr (copied, readonly)
					[2]: TweenService_upvr (copied, readonly)
					[3]: vide_upvr (copied, readonly)
					[4]: animation_upvr (copied, readonly)
					[5]: any_source_result1_upvr_8 (readonly)
					[6]: helper_upvr (copied, readonly)
				]]
				local WorldModel_2 = Instance.new("WorldModel")
				WorldModel_2.Parent = arg1_19
				ReplicatedStorage_upvr.resources.preview_floor:Clone().Parent = arg1_19
				local clone_upvr = ReplicatedStorage_upvr.resources.preview_rig:Clone()
				clone_upvr.Parent = WorldModel_2
				clone_upvr:PivotTo(CFrame.new(0, 0.5, -5) * CFrame.Angles(0, (-math.pi), 0))
				TweenService_upvr:Create(clone_upvr.PrimaryPart, TweenInfo.new(8, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true), {
					CFrame = clone_upvr.PrimaryPart.CFrame * CFrame.Angles(0, math.pi, 0);
				}):Play()
				vide_upvr.effect(function() -- Line 1070
					--[[ Upvalues[4]:
						[1]: animation_upvr (copied, readonly)
						[2]: clone_upvr (readonly)
						[3]: any_source_result1_upvr_8 (copied, readonly)
						[4]: helper_upvr (copied, readonly)
					]]
					animation_upvr:stopAllAnimation(clone_upvr)
					local var264 = helper_upvr._emotes[any_source_result1_upvr_8()]
					if var264 then
						local any_loadAnimation_result1 = animation_upvr:loadAnimation(clone_upvr, var264.animation)
						any_loadAnimation_result1.Looped = true
						any_loadAnimation_result1:Play(0)
					end
				end)
			end)
		})
	})
	tbl_62[4] = create_upvr("Frame")({
		AnchorPoint = Vector2.new(0.5, 0);
		Size = UDim2.fromScale(0.905, 0.557);
		Position = UDim2.fromScale(0.5, 0.406);
		BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		BackgroundTransparency = 0.99;
		
		create_upvr("UIStroke")({
			Thickness = 1;
			Transparency = 0.9;
			Color = Color3.fromRGB(148, 148, 148);
		})
	})
	tbl_62[5] = create_upvr("ImageButton")(tbl_58)
	tbl_62[6] = create_upvr("TextLabel")(tbl_43)
	tbl_62[7] = create_upvr("TextLabel")(tbl_68)
	tbl_62[8] = create_upvr("TextLabel")(tbl_26)
	local tbl_21 = {
		AnchorPoint = Vector2.new(0.5, 0.5);
		Size = UDim2.fromScale(0.192, 0.746);
		Position = UDim2.fromScale(0.782, 0.557);
		BackgroundColor3 = Color3.fromRGB(150, 150, 150);
		BackgroundTransparency = 0.5;
		vide_upvr.action(function(arg1_20) -- Line 1243
			--[[ Upvalues[3]:
				[1]: vide_upvr (copied, readonly)
				[2]: any_source_result1_upvr_12 (readonly)
				[3]: TweenService_upvr (copied, readonly)
			]]
			vide_upvr.effect(function() -- Line 1245
				--[[ Upvalues[3]:
					[1]: any_source_result1_upvr_12 (copied, readonly)
					[2]: TweenService_upvr (copied, readonly)
					[3]: arg1_20 (readonly)
				]]
				-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
				local var284
				if any_source_result1_upvr_12() ~= "ROBUX" then
					var284 = false
				else
					var284 = true
				end
				local tbl_47 = {}
				if not var284 or not UDim2.fromScale(0.192, 0.746) then
				end
				tbl_47.Size = UDim2.fromScale(0.17, 0.6)
				if not var284 or not UDim2.fromScale(0.782, 0.557) then
				end
				tbl_47.Position = UDim2.fromScale(0.5, 0.3)
				TweenService_upvr:Create(arg1_20, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), tbl_47):Play()
			end)
		end)
	}
	local function Visible() -- Line 1259
		--[[ Upvalues[1]:
			[1]: any_source_result1_upvr_12 (readonly)
		]]
		local var286
		if any_source_result1_upvr_12() ~= "ROBUX" then
			var286 = false
		else
			var286 = true
		end
		return var286
	end
	tbl_21.Visible = Visible
	local tbl_60 = {
		Size = UDim2.fromScale(1, 1);
		BackgroundTransparency = 1;
		ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255);
		CanvasSize = UDim2.new(1, 0, 2, 0);
		ScrollBarThickness = 3;
		AutomaticCanvasSize = Enum.AutomaticSize.XY;
		ScrollingDirection = Enum.ScrollingDirection.Y;
		BottomImage = "";
		TopImage = "";
	}
	local any_source_result1_upvr_9 = vide_upvr.source(LocalPlayer_upvr)
	tbl_60[1] = create_upvr("UIListLayout")({
		HorizontalAlignment = Enum.HorizontalAlignment.Center;
	})
	tbl_60[2] = vide_upvr.action(function(arg1_21) -- Line 1324
		--[[ Upvalues[1]:
			[1]: vide_upvr (copied, readonly)
		]]
		local class_UIListLayout_upvr_2 = arg1_21:FindFirstChildOfClass("UIListLayout")
		arg1_21.CanvasSize = UDim2.new(0, 0, 0, class_UIListLayout_upvr_2.AbsoluteContentSize.Y)
		vide_upvr.cleanup(class_UIListLayout_upvr_2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() -- Line 1331
			--[[ Upvalues[2]:
				[1]: class_UIListLayout_upvr_2 (readonly)
				[2]: arg1_21 (readonly)
			]]
			arg1_21.CanvasSize = UDim2.new(0, 0, 0, class_UIListLayout_upvr_2.AbsoluteContentSize.Y)
		end))
	end)
	tbl_60[3] = vide_upvr.indexes(any_source_result1_upvr_17, function(arg1_22, arg2_4) -- Line 1339
		--[[ Upvalues[7]:
			[1]: create_upvr (copied, readonly)
			[2]: vide_upvr (copied, readonly)
			[3]: TweenService_upvr (copied, readonly)
			[4]: any_source_result1_upvr_9 (readonly)
			[5]: UiUtils_upvr (copied, readonly)
			[6]: var37_upvw (read and write)
			[7]: Players_upvr (copied, readonly)
		]]
		return create_upvr("Frame")({
			Size = UDim2.fromScale(1, 0.11);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 0;
			
			vide_upvr.action(function(arg1_23) -- Line 1345
				--[[ Upvalues[4]:
					[1]: vide_upvr (copied, readonly)
					[2]: TweenService_upvr (copied, readonly)
					[3]: any_source_result1_upvr_9 (copied, readonly)
					[4]: arg1_22 (readonly)
				]]
				vide_upvr.effect(function() -- Line 1346
					--[[ Upvalues[4]:
						[1]: TweenService_upvr (copied, readonly)
						[2]: arg1_23 (readonly)
						[3]: any_source_result1_upvr_9 (copied, readonly)
						[4]: arg1_22 (copied, readonly)
					]]
					local tbl_29 = {}
					local var305
					local function INLINED_7() -- Internal function, doesn't exist in bytecode
						var305 = Color3.fromRGB(0, 255, 0)
						return var305
					end
					if any_source_result1_upvr_9() ~= arg1_22() or not INLINED_7() then
						var305 = Color3.fromRGB(255, 255, 255)
					end
					tbl_29.BackgroundColor3 = var305
					TweenService_upvr:Create(arg1_23, TweenInfo.new(0.5), tbl_29):Play()
				end)
			end), create_upvr("UIGradient")({
				Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.712), NumberSequenceKeypoint.new(0.47, 1), NumberSequenceKeypoint.new(1, 1)});
			}), create_upvr("TextButton")({
				Text = "";
				Size = UDim2.fromScale(1, 1);
				BackgroundTransparency = 1;
				
				UiUtils_upvr.button(function() -- Line 1367
					--[[ Upvalues[3]:
						[1]: any_source_result1_upvr_9 (copied, readonly)
						[2]: arg1_22 (readonly)
						[3]: var37_upvw (copied, read and write)
					]]
					any_source_result1_upvr_9(arg1_22())
					var37_upvw.Gifting(any_source_result1_upvr_9())
				end)
			}), create_upvr("TextLabel")({
				Size = UDim2.fromScale(0.659, 0.503);
				Position = UDim2.fromScale(0.319, 0.241);
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundTransparency = 1;
				FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Text = `{arg1_22().Name}`;
				TextColor3 = Color3.fromRGB(255, 255, 255);
				TextScaled = true;
				TextStrokeTransparency = 1;
				TextXAlignment = Enum.TextXAlignment.Left;
				TextYAlignment = Enum.TextYAlignment.Center;
				
				create_upvr("UIStroke")({
					Thickness = 2;
					Transparency = 0.5;
					Color = Color3.fromRGB(0, 0, 0);
				})
			}), create_upvr("TextLabel")({
				Size = UDim2.fromScale(0.659, 0.382);
				Position = UDim2.fromScale(0.319, 0.698);
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundTransparency = 1;
				FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Text = `(@{arg1_22().DisplayName})`;
				TextColor3 = Color3.fromRGB(255, 255, 255);
				TextScaled = true;
				TextStrokeTransparency = 0.5;
				TextXAlignment = Enum.TextXAlignment.Left;
				TextYAlignment = Enum.TextYAlignment.Center;
				
				create_upvr("UIStroke")({
					Thickness = 2;
					Transparency = 0.5;
					Color = Color3.fromRGB(0, 0, 0);
				})
			}), create_upvr("ImageLabel")({
				Size = UDim2.fromScale(0.206, 1);
				Position = UDim2.fromScale(0, 0.5);
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundTransparency = 1;
				Image = "";
				ScaleType = Enum.ScaleType.Crop;
				
				vide_upvr.action(function(arg1_24) -- Line 1433
					--[[ Upvalues[2]:
						[1]: Players_upvr (copied, readonly)
						[2]: arg1_22 (readonly)
					]]
					task.spawn(function() -- Line 1435
						--[[ Upvalues[3]:
							[1]: Players_upvr (copied, readonly)
							[2]: arg1_22 (copied, readonly)
							[3]: arg1_24 (readonly)
						]]
						local any_GetUserThumbnailAsync_result1, any_GetUserThumbnailAsync_result2 = Players_upvr:GetUserThumbnailAsync(arg1_22().UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
						local var319
						local function INLINED_8() -- Internal function, doesn't exist in bytecode
							var319 = any_GetUserThumbnailAsync_result1
							return var319
						end
						if not any_GetUserThumbnailAsync_result2 or not INLINED_8() then
							var319 = ""
						end
						arg1_24.Image = var319
					end)
				end), create_upvr("UIGradient")({
					Rotation = 90;
					Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.6, 0), NumberSequenceKeypoint.new(1, 1)});
				})
			})
		})
	end)
	tbl_21[2] = create_upvr("UIGradient")({
		Rotation = 90;
		Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.633), NumberSequenceKeypoint.new(1, 1)});
	})
	tbl_21[3] = create_upvr("UIStroke")({
		Thickness = 2;
		Transparency = 0.8;
		
		create_upvr("UIGradient")({
			Rotation = 90;
			Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1)});
		})
	})
	tbl_21[4] = create_upvr("TextLabel")({
		Size = UDim2.fromScale(0.857, 0.083);
		Position = UDim2.fromScale(0.068, -0.1);
		AnchorPoint = Vector2.new(0, 0);
		BackgroundTransparency = 1;
		FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		Text = "PLAYERS YOU WANT TO GIFT";
		TextColor3 = Color3.fromRGB(255, 255, 255);
		TextScaled = true;
		TextStrokeTransparency = 1;
		
		create_upvr("UIStroke")({
			Thickness = 1;
			Transparency = 0;
			Color = Color3.fromRGB(0, 0, 0);
		})
	})
	tbl_21[5] = create_upvr("ScrollingFrame")(tbl_60)
	local tbl_3 = {
		BackgroundTransparency = 1;
		ScrollingDirection = Enum.ScrollingDirection.Y;
		ScrollBarThickness = 0;
		AutomaticCanvasSize = Enum.AutomaticSize.XY;
		create_upvr("UIPadding")({
			PaddingTop = UDim.new(0.085, 0);
		}), create_upvr("UIGridLayout")({
			CellPadding = UDim2.fromScale(0, 0.1);
			CellSize = UDim2.fromScale(0.2, 0.4);
			SortOrder = function() -- Line 1470, Named "SortOrder"
				--[[ Upvalues[1]:
					[1]: any_source_result1_upvr_12 (readonly)
				]]
				local var325
				local function INLINED_9() -- Internal function, doesn't exist in bytecode
					var325 = Enum.SortOrder.LayoutOrder
					return var325
				end
				if any_source_result1_upvr_12() ~= "ROBUX" or not INLINED_9() then
					var325 = Enum.SortOrder.Name
				end
				return var325
			end;
			HorizontalAlignment = Enum.HorizontalAlignment.Center;
			VerticalAlignment = Enum.VerticalAlignment.Top;
		}), vide_upvr.action(function(arg1_25) -- Line 1477
			--[[ Upvalues[4]:
				[1]: vide_upvr (copied, readonly)
				[2]: any_source_result1_upvr_12 (readonly)
				[3]: any_source_result1_upvr_18 (readonly)
				[4]: TweenService_upvr (copied, readonly)
			]]
			vide_upvr.effect(function() -- Line 1479
				--[[ Upvalues[4]:
					[1]: any_source_result1_upvr_12 (copied, readonly)
					[2]: any_source_result1_upvr_18 (copied, readonly)
					[3]: arg1_25 (readonly)
					[4]: TweenService_upvr (copied, readonly)
				]]
				-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [5] 5. Error Block 2 start (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [5] 5. Error Block 2 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [10] 9. Error Block 3 start (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [10] 9. Error Block 3 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [12] 11. Error Block 4 start (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [12] 11. Error Block 4 end (CF ANALYSIS FAILED)
			end)
			local class_UIGridLayout_upvr = arg1_25:FindFirstChildOfClass("UIGridLayout")
			arg1_25.CanvasSize = UDim2.new(0, 0, 0, class_UIGridLayout_upvr.AbsoluteContentSize.Y)
			local class_UIPadding_upvr = arg1_25:FindFirstChildOfClass("UIPadding")
			vide_upvr.cleanup(class_UIGridLayout_upvr:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() -- Line 1497
				--[[ Upvalues[3]:
					[1]: class_UIGridLayout_upvr (readonly)
					[2]: class_UIPadding_upvr (readonly)
					[3]: arg1_25 (readonly)
				]]
				local var331 = 0
				if class_UIPadding_upvr then
					var331 = (class_UIPadding_upvr.PaddingTop.Scale * arg1_25.AbsoluteSize.Y + class_UIPadding_upvr.PaddingTop.Offset) + (class_UIPadding_upvr.PaddingBottom.Scale * arg1_25.AbsoluteSize.Y + class_UIPadding_upvr.PaddingBottom.Offset)
				end
				arg1_25.CanvasSize = UDim2.new(0, 0, 0, class_UIGridLayout_upvr.AbsoluteContentSize.Y + var331 * 2)
			end))
		end)
	}
	local any_GetRankInGroupAsync_result1_upvr = LocalPlayer_upvr:GetRankInGroupAsync(helper_upvr.GROUP_ID)
	tbl_3[4] = create_upvr("UIGradient")({
		Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1)});
	})
	tbl_3[5] = vide_upvr.indexes(any_source_result1_upvr_2, function(arg1_26, arg2_5) -- Line 1526
		--[[ Upvalues[27]:
			[1]: any_source_result1_upvr_12 (readonly)
			[2]: create_upvr (copied, readonly)
			[3]: UiUtils_upvr (copied, readonly)
			[4]: MarketplaceService_upvr (copied, readonly)
			[5]: LocalPlayer_upvr (copied, readonly)
			[6]: vide_upvr (copied, readonly)
			[7]: tbl_14_upvr (copied, readonly)
			[8]: helper_upvr (copied, readonly)
			[9]: any_source_result1_upvr_18 (readonly)
			[10]: any_source_result1_upvr_8 (readonly)
			[11]: ReplicatedStorage_upvr (copied, readonly)
			[12]: animation_upvr (copied, readonly)
			[13]: any_useAtom_result1_upvr (readonly)
			[14]: any_GetRankInGroupAsync_result1_upvr (readonly)
			[15]: any_source_result1_upvr_16 (readonly)
			[16]: any_source_result1_upvr_5 (readonly)
			[17]: any_source_result1_upvr_2 (readonly)
			[18]: any_source_result1_upvr_10 (readonly)
			[19]: any_source_result1_upvr_7 (readonly)
			[20]: any_source_result1_upvr_6 (readonly)
			[21]: any_source_result1_upvr_19 (readonly)
			[22]: var37_upvw (read and write)
			[23]: any_source_result1_upvr_4 (readonly)
			[24]: any_source_result1_upvr_15 (readonly)
			[25]: characters_upvr (copied, readonly)
			[26]: any_useAtom_result1_upvr_11 (readonly)
			[27]: any_useAtom_result1_upvr_3 (readonly)
		]]
		if any_source_result1_upvr_12() == "ROBUX" then
			local module_4 = {
				Size = UDim2.fromScale(0.2, 0.35);
				Position = UDim2.fromScale(0.5, 0.5);
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundTransparency = 0;
				BackgroundColor3 = Color3.fromRGB(0, 0, 0);
			}
			module_4.LayoutOrder = arg2_5
			module_4.Visible = true
			module_4[1] = create_upvr("UIAspectRatioConstraint")({
				AspectRatio = 0.75;
			})
			module_4[2] = create_upvr("TextButton")({
				Size = UDim2.fromScale(1, 1);
				Position = UDim2.fromScale(0.5, 0.5);
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundTransparency = 1;
				
				UiUtils_upvr.button(function() -- Line 1550
					--[[ Upvalues[3]:
						[1]: MarketplaceService_upvr (copied, readonly)
						[2]: LocalPlayer_upvr (copied, readonly)
						[3]: arg1_26 (readonly)
					]]
					MarketplaceService_upvr:PromptProductPurchase(LocalPlayer_upvr, arg1_26().productid)
				end), create_upvr("ImageLabel")({
					Size = UDim2.fromScale(0.88, 0.948);
					Position = UDim2.fromScale(0.5, 0.5);
					AnchorPoint = Vector2.new(0.5, 0.5);
					BackgroundTransparency = 1;
					Image = "";
					ScaleType = Enum.ScaleType.Crop;
					
					create_upvr("UIStroke")({
						Thickness = 2;
						Transparency = 0.81;
						Color = Color3.fromRGB(255, 255, 255);
					}), vide_upvr.action(function(arg1_27) -- Line 1570
						--[[ Upvalues[3]:
							[1]: MarketplaceService_upvr (copied, readonly)
							[2]: arg1_26 (readonly)
							[3]: tbl_14_upvr (copied, readonly)
						]]
						task.spawn(function() -- Line 1571
							--[[ Upvalues[4]:
								[1]: MarketplaceService_upvr (copied, readonly)
								[2]: arg1_26 (copied, readonly)
								[3]: arg1_27 (readonly)
								[4]: tbl_14_upvr (copied, readonly)
							]]
							local pcall_result1_2, pcall_result2_2 = pcall(function() -- Line 1573
								--[[ Upvalues[2]:
									[1]: MarketplaceService_upvr (copied, readonly)
									[2]: arg1_26 (copied, readonly)
								]]
								return MarketplaceService_upvr:GetProductInfo(arg1_26().productid, Enum.InfoType.Product)
							end)
							if pcall_result1_2 then
								if pcall_result2_2 then
									local formatted_3 = `rbxassetid://{pcall_result2_2.DisplayIcon}`
									if not formatted_3 then
										formatted_3 = tbl_14_upvr
										formatted_3 = formatted_3.PRODUCT
									end
									arg1_27.Image = formatted_3
								end
							end
						end)
					end)
				}), create_upvr("TextLabel")({
					Size = UDim2.fromScale(1.148, 0.115);
					Position = UDim2.fromScale(0.489, 0.068);
					AnchorPoint = Vector2.new(0.5, 1);
					BackgroundTransparency = 1;
					FontFace = Font.new("rbxasset://fonts/families/AccanthisADFStd.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
					Text = "";
					TextColor3 = Color3.fromRGB(255, 255, 255);
					TextScaled = true;
					TextStrokeTransparency = 0;
					TextXAlignment = Enum.TextXAlignment.Center;
					TextYAlignment = Enum.TextYAlignment.Center;
					
					vide_upvr.action(function(arg1_28) -- Line 1604
						--[[ Upvalues[3]:
							[1]: MarketplaceService_upvr (copied, readonly)
							[2]: arg1_26 (readonly)
							[3]: helper_upvr (copied, readonly)
						]]
						task.spawn(function() -- Line 1605
							--[[ Upvalues[4]:
								[1]: MarketplaceService_upvr (copied, readonly)
								[2]: arg1_26 (copied, readonly)
								[3]: arg1_28 (readonly)
								[4]: helper_upvr (copied, readonly)
							]]
							local pcall_result1_3, pcall_result2_3 = pcall(function() -- Line 1607
								--[[ Upvalues[2]:
									[1]: MarketplaceService_upvr (copied, readonly)
									[2]: arg1_26 (copied, readonly)
								]]
								return MarketplaceService_upvr:GetProductInfo(arg1_26().productid, Enum.InfoType.Product)
							end)
							if pcall_result1_3 then
								if pcall_result2_3 then
									local DisplayName = pcall_result2_3.DisplayName
									if arg1_26() == helper_upvr._product.enums.tix then
										DisplayName = " Tix"
									else
										DisplayName = ""
									end
									arg1_28.Text = `{DisplayName or ""}{DisplayName}`
								end
							end
						end)
					end)
				}), create_upvr("TextLabel")({
					Size = UDim2.fromScale(1.148, 0.15);
					Position = UDim2.fromScale(0.489, 1.043);
					AnchorPoint = Vector2.new(0.5, 1);
					BackgroundTransparency = 1;
					FontFace = Font.new("rbxasset://fonts/families/AccanthisADFStd.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
					Text = "";
					TextColor3 = Color3.fromRGB(255, 255, 255);
					TextScaled = true;
					TextStrokeTransparency = 0;
					TextXAlignment = Enum.TextXAlignment.Center;
					TextYAlignment = Enum.TextYAlignment.Center;
					
					vide_upvr.action(function(arg1_29) -- Line 1638
						--[[ Upvalues[2]:
							[1]: MarketplaceService_upvr (copied, readonly)
							[2]: arg1_26 (readonly)
						]]
						task.spawn(function() -- Line 1639
							--[[ Upvalues[3]:
								[1]: MarketplaceService_upvr (copied, readonly)
								[2]: arg1_26 (copied, readonly)
								[3]: arg1_29 (readonly)
							]]
							local pcall_result1, pcall_result2 = pcall(function() -- Line 1641
								--[[ Upvalues[2]:
									[1]: MarketplaceService_upvr (copied, readonly)
									[2]: arg1_26 (copied, readonly)
								]]
								return MarketplaceService_upvr:GetProductInfo(arg1_26().productid, Enum.InfoType.Product)
							end)
							if pcall_result1 then
								if pcall_result2 then
									arg1_29.Text = `{pcall_result2.PriceInRobux or ""} Robux`
								end
							end
						end)
					end)
				})
			})
			return create_upvr("Frame")(module_4)
		end
		if any_source_result1_upvr_12() == "EMOTES" then
			local module_2 = {
				Size = UDim2.fromScale(0.2, 0.35);
				Position = UDim2.fromScale(0.5, 0.5);
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundTransparency = 0;
				BackgroundColor3 = Color3.fromRGB(0, 0, 0);
				Visible = true;
			}
			local tbl_50 = {
				Size = UDim2.fromScale(1, 1);
				AnchorPoint = Vector2.new(0.5, 0.5);
				Position = UDim2.fromScale(0.5, 0.5);
				BackgroundTransparency = 1;
			}
			local tbl_20 = {
				Size = UDim2.fromScale(0.875, 0.095);
				Position = UDim2.fromScale(0.497, 0.814);
				AnchorPoint = Vector2.new(0.5, 1);
				BackgroundTransparency = 1;
				FontFace = Font.new("rbxasset://fonts/families/AccanthisADFStd.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
			}
			local function Text() -- Line 1879
				--[[ Upvalues[3]:
					[1]: any_useAtom_result1_upvr (copied, readonly)
					[2]: arg2_5 (readonly)
					[3]: arg1_26 (readonly)
				]]
				if table.find(any_useAtom_result1_upvr(), arg2_5) then
					return "Already have"
				end
				return `{arg1_26().price} Tix`
			end
			tbl_20.Text = Text
			tbl_20.TextColor3 = Color3.fromRGB(255, 230, 129)
			tbl_20.TextScaled = true
			tbl_20.TextStrokeTransparency = 0
			tbl_20.TextXAlignment = Enum.TextXAlignment.Right
			tbl_20.TextYAlignment = Enum.TextYAlignment.Center
			tbl_50[1] = UiUtils_upvr.button(function() -- Line 1804
				--[[ Upvalues[3]:
					[1]: any_source_result1_upvr_18 (copied, readonly)
					[2]: any_source_result1_upvr_8 (copied, readonly)
					[3]: arg2_5 (readonly)
				]]
				any_source_result1_upvr_18(true)
				any_source_result1_upvr_8(arg2_5)
			end)
			tbl_50[2] = create_upvr("ViewportFrame")({
				Size = UDim2.fromScale(0.88, 0.948);
				Position = UDim2.fromScale(0.5, 0.5);
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundTransparency = 0;
				BackgroundColor3 = Color3.fromRGB(0, 0, 0);
				
				create_upvr("UIGradient")({
					Rotation = 90;
					Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1)});
				}), vide_upvr.action(function(arg1_30) -- Line 1826
					--[[ Upvalues[3]:
						[1]: ReplicatedStorage_upvr (copied, readonly)
						[2]: animation_upvr (copied, readonly)
						[3]: arg1_26 (readonly)
					]]
					local WorldModel = Instance.new("WorldModel")
					WorldModel.Parent = arg1_30
					ReplicatedStorage_upvr.resources.preview_floor:Clone().Parent = arg1_30
					local clone_5_upvr = ReplicatedStorage_upvr.resources.preview_rig:Clone()
					clone_5_upvr.Parent = WorldModel
					clone_5_upvr:PivotTo(CFrame.new(0, 0.5, -5) * CFrame.Angles(0, (-math.pi), 0))
					task.delay(0.1, function() -- Line 1838
						--[[ Upvalues[3]:
							[1]: animation_upvr (copied, readonly)
							[2]: clone_5_upvr (readonly)
							[3]: arg1_26 (copied, readonly)
						]]
						local any_loadAnimation_result1_3 = animation_upvr:loadAnimation(clone_5_upvr, arg1_26().animation)
						any_loadAnimation_result1_3.Looped = true
						any_loadAnimation_result1_3:Play(0)
						any_loadAnimation_result1_3:AdjustSpeed(0.2)
					end)
				end)
			})
			tbl_50[3] = create_upvr("TextLabel")({
				Size = UDim2.fromScale(0.875, 0.15);
				Position = UDim2.fromScale(0.497, 0.972);
				AnchorPoint = Vector2.new(0.5, 1);
				BackgroundTransparency = 1;
				FontFace = Font.new("rbxasset://fonts/families/AccanthisADFStd.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Text = arg1_26().name;
				TextColor3 = Color3.fromRGB(255, 255, 255);
				TextScaled = true;
				TextStrokeTransparency = 0;
				TextXAlignment = Enum.TextXAlignment.Right;
				TextYAlignment = Enum.TextYAlignment.Center;
			})
			tbl_50[4] = create_upvr("TextLabel")(tbl_20)
			module_2[1] = create_upvr("UIStroke")({
				Thickness = 1;
				Transparency = 0.8;
				Color = Color3.fromRGB(148, 148, 148);
			})
			module_2[2] = create_upvr("UIAspectRatioConstraint")({
				AspectRatio = 0.75;
			})
			module_2[3] = create_upvr("TextButton")(tbl_50)
			return create_upvr("Frame")(module_2)
		end
		local price_upvr = arg1_26().price
		if arg1_26().earlyaccess and any_GetRankInGroupAsync_result1_upvr < 252 then return end
		if not price_upvr then
			if any_source_result1_upvr_16()[any_source_result1_upvr_5()] and table.find(any_source_result1_upvr_16()[any_source_result1_upvr_5()].skins, arg2_5) then
			else
				return
			end
		end
		local module_5 = {
			Size = UDim2.fromScale(0.2, 0.35);
			Position = UDim2.fromScale(0.5, 0.5);
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundTransparency = 1;
		}
		local function Visible() -- Line 1914
			--[[ Upvalues[3]:
				[1]: any_source_result1_upvr_2 (copied, readonly)
				[2]: any_source_result1_upvr_5 (copied, readonly)
				[3]: any_source_result1_upvr_10 (copied, readonly)
			]]
			if any_source_result1_upvr_2()[any_source_result1_upvr_5()] then
				if not any_source_result1_upvr_10() then
					return false
				end
			end
			return true
		end
		module_5.Visible = Visible
		module_5.Name = arg1_26().name
		local tbl_10 = {
			Size = UDim2.fromScale(1, 1);
		}
		local var380_upvw
		if not var380_upvw then
			var380_upvw = Vector2.new(0, 0)
		end
		local var382_upvr = true
		local var383_upvr = -0.005
		tbl_10[1] = vide_upvr.action(function(arg1_31) -- Line 85
			--[[ Upvalues[7]:
				[1]: vide_upvr (copied, readonly)
				[2]: any_source_result1_upvr_19 (readonly)
				[3]: var382_upvr (readonly)
				[4]: var380_upvw (read and write)
				[5]: any_source_result1_upvr_7 (readonly)
				[6]: var383_upvr (readonly)
				[7]: any_source_result1_upvr_6 (readonly)
			]]
			vide_upvr.effect(function() -- Line 86
				--[[ Upvalues[7]:
					[1]: any_source_result1_upvr_19 (copied, readonly)
					[2]: var382_upvr (copied, readonly)
					[3]: arg1_31 (readonly)
					[4]: var380_upvw (copied, read and write)
					[5]: any_source_result1_upvr_7 (copied, readonly)
					[6]: var383_upvr (copied, readonly)
					[7]: any_source_result1_upvr_6 (copied, readonly)
				]]
				if any_source_result1_upvr_19() then
					if var382_upvr then
						arg1_31.Position = UDim2.new(0.5 + var380_upvw.X, any_source_result1_upvr_7() * var383_upvr, 0.5 + var380_upvw.Y, any_source_result1_upvr_6() * var383_upvr)
						return
					end
					arg1_31.Position = UDim2.new(var380_upvw.X, any_source_result1_upvr_7() * var383_upvr, var380_upvw.Y, any_source_result1_upvr_6() * var383_upvr)
				end
			end)
		end)
		tbl_10.AnchorPoint = Vector2.new(0.5, 0.5)
		tbl_10.BackgroundTransparency = 1
		local function var385() -- Line 1931
			--[[ Upvalues[10]:
				[1]: any_source_result1_upvr_10 (copied, readonly)
				[2]: any_source_result1_upvr_5 (copied, readonly)
				[3]: arg2_5 (readonly)
				[4]: any_source_result1_upvr_16 (copied, readonly)
				[5]: var37_upvw (copied, read and write)
				[6]: any_source_result1_upvr_12 (copied, readonly)
				[7]: any_source_result1_upvr_4 (copied, readonly)
				[8]: any_source_result1_upvr_15 (copied, readonly)
				[9]: any_source_result1_upvr_2 (copied, readonly)
				[10]: characters_upvr (copied, readonly)
			]]
			if not any_source_result1_upvr_10() then
				any_source_result1_upvr_5(arg2_5)
			else
				local var386
				local function INLINED_10() -- Internal function, doesn't exist in bytecode
					var386 = any_source_result1_upvr_5()
					return table.find(any_source_result1_upvr_16()[var386].skins, arg2_5)
				end
				if any_source_result1_upvr_16()[any_source_result1_upvr_5()] and INLINED_10() or any_source_result1_upvr_16()[any_source_result1_upvr_5()].skin == arg2_5 then
					if any_source_result1_upvr_12() ~= "KILLERS" then
						var386 = false
					else
						var386 = true
					end
					var37_upvw.Skin(any_source_result1_upvr_5(), arg2_5, var386)
				else
					any_source_result1_upvr_4(arg2_5)
					any_source_result1_upvr_15(true)
				end
				if any_source_result1_upvr_12() == "SURVIVORS" then
					any_source_result1_upvr_2(characters_upvr.survivors)
				elseif any_source_result1_upvr_12() == "KILLERS" then
					any_source_result1_upvr_2(characters_upvr.killers)
				end
				any_source_result1_upvr_10(false)
			end
		end
		var385 = create_upvr("ImageLabel")
		local tbl_6 = {
			Size = UDim2.fromScale(0.88, 0.948);
			Position = UDim2.fromScale(0.5, 0.5);
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundTransparency = 1;
		}
		local function Image() -- Line 1952
			--[[ Upvalues[6]:
				[1]: any_source_result1_upvr_10 (copied, readonly)
				[2]: any_source_result1_upvr_16 (copied, readonly)
				[3]: arg2_5 (readonly)
				[4]: characters_upvr (copied, readonly)
				[5]: any_source_result1_upvr_12 (copied, readonly)
				[6]: arg1_26 (readonly)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			local var392
			local var393
			if not var393 then
				var393 = any_source_result1_upvr_16()
				if var393 then
					var393 = any_source_result1_upvr_16()[arg2_5]
					local var394
					if var393 then
						var393 = any_source_result1_upvr_16()[arg2_5]
						var393 = var393.skin
						if any_source_result1_upvr_12() ~= "KILLERS" then
							var394 = false
						else
							var394 = true
						end
						if var394 then
						else
						end
						local var395 = characters_upvr.skins.survivors[arg2_5]
						if var395 then
						end
						if var393 ~= "none" then
							var392 = var395[var393]
						end
					end
				end
			end
			local function INLINED_12() -- Internal function, doesn't exist in bytecode
				var393 = var392.charactericon
				return var393
			end
			if not var392 or not INLINED_12() then
				var393 = arg1_26()
				var393 = var393.charactericon
			end
			return var393
		end
		tbl_6.Image = Image
		local function ImageColor3() -- Line 1968
			--[[ Upvalues[6]:
				[1]: any_source_result1_upvr_10 (copied, readonly)
				[2]: any_useAtom_result1_upvr_11 (copied, readonly)
				[3]: arg2_5 (readonly)
				[4]: any_useAtom_result1_upvr_3 (copied, readonly)
				[5]: any_source_result1_upvr_16 (copied, readonly)
				[6]: any_source_result1_upvr_5 (copied, readonly)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 29 start (CF ANALYSIS FAILED)
			local var398
			if not var398 then
				var398 = true
				if any_useAtom_result1_upvr_11() ~= arg2_5 then
					var398 = true
					if any_useAtom_result1_upvr_3() ~= arg2_5 then
						var398 = not any_source_result1_upvr_16()[arg2_5]
					end
				end
				-- KONSTANTWARNING: GOTO [39] #36
			end
			-- KONSTANTERROR: [0] 1. Error Block 29 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [23] 22. Error Block 30 start (CF ANALYSIS FAILED)
			if not table.find(any_source_result1_upvr_16()[any_source_result1_upvr_5()].skins, arg2_5) then
			else
			end
			local var399
			if any_source_result1_upvr_16()[any_source_result1_upvr_5()] and (any_source_result1_upvr_16()[any_source_result1_upvr_5()].skin == arg2_5 or any_source_result1_upvr_16()[any_source_result1_upvr_5()].skin == nil and arg2_5 == "none") then
				var399 = true
			end
			if var399 then
				return Color3.new(0.4, 0.4, 0.4)
			end
			do
				return Color3.new(1, 1, 1)
			end
			-- KONSTANTERROR: [23] 22. Error Block 30 end (CF ANALYSIS FAILED)
		end
		tbl_6.ImageColor3 = ImageColor3
		tbl_6.ScaleType = Enum.ScaleType.Crop
		tbl_6[1] = create_upvr("UICorner")({})
		var385 = var385(tbl_6)
		tbl_6 = create_upvr("ImageLabel")
		local tbl_2 = {
			Size = UDim2.fromScale(1.673, 1.326);
			Position = UDim2.fromScale(0.511, 0.456);
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundTransparency = 1;
		}
		local function Image() -- Line 1999
			--[[ Upvalues[8]:
				[1]: any_source_result1_upvr_10 (copied, readonly)
				[2]: any_source_result1_upvr_16 (copied, readonly)
				[3]: arg2_5 (readonly)
				[4]: characters_upvr (copied, readonly)
				[5]: any_source_result1_upvr_12 (copied, readonly)
				[6]: price_upvr (readonly)
				[7]: arg1_26 (readonly)
				[8]: tbl_14_upvr (copied, readonly)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			local var401
			local var402
			if not var402 then
				var402 = any_source_result1_upvr_16()
				if var402 then
					var402 = any_source_result1_upvr_16()[arg2_5]
					local var403
					if var402 then
						var402 = any_source_result1_upvr_16()[arg2_5]
						var402 = var402.skin
						if any_source_result1_upvr_12() ~= "KILLERS" then
							var403 = false
						else
							var403 = true
						end
						if var403 then
						else
						end
						local var404 = characters_upvr.skins.survivors[arg2_5]
						if var404 then
						end
						if var402 ~= "none" then
							var401 = var404[var402]
						end
					end
				end
			end
			local function INLINED_13() -- Internal function, doesn't exist in bytecode
				var402 = var402.event
				var402 = var402.rarity
				var402 = characters_upvr
				return var402
			end
			local function INLINED_14() -- Internal function, doesn't exist in bytecode
				var402 = var401.rarity
				return var402
			end
			if var401 and not var401.price or price_upvr or not INLINED_13() or not var401 or not INLINED_14() then
				var402 = arg1_26()
				var402 = var402.rarity
				if not var402 then
					var402 = tbl_14_upvr
					var402 = var402.OUTLINE
				end
			end
			return var402
		end
		tbl_2.Image = Image
		tbl_2.ScaleType = Enum.ScaleType.Fit
		tbl_2[1] = create_upvr("UICorner")({})
		tbl_6 = tbl_6(tbl_2)
		local tbl_15 = {
			Size = UDim2.new(0.851, 0, 0.055, 10);
		}
		local vector2_upvw_8 = Vector2.new(0.455, 0.845)
		if not vector2_upvw_8 then
			vector2_upvw_8 = Vector2.new(0, 0)
		end
		local var408_upvr = false
		local var409_upvr = 0.0025
		tbl_15[1] = vide_upvr.action(function(arg1_32) -- Line 85
			--[[ Upvalues[7]:
				[1]: vide_upvr (copied, readonly)
				[2]: any_source_result1_upvr_19 (readonly)
				[3]: var408_upvr (readonly)
				[4]: vector2_upvw_8 (read and write)
				[5]: any_source_result1_upvr_7 (readonly)
				[6]: var409_upvr (readonly)
				[7]: any_source_result1_upvr_6 (readonly)
			]]
			vide_upvr.effect(function() -- Line 86
				--[[ Upvalues[7]:
					[1]: any_source_result1_upvr_19 (copied, readonly)
					[2]: var408_upvr (copied, readonly)
					[3]: arg1_32 (readonly)
					[4]: vector2_upvw_8 (copied, read and write)
					[5]: any_source_result1_upvr_7 (copied, readonly)
					[6]: var409_upvr (copied, readonly)
					[7]: any_source_result1_upvr_6 (copied, readonly)
				]]
				if any_source_result1_upvr_19() then
					if var408_upvr then
						arg1_32.Position = UDim2.new(0.5 + vector2_upvw_8.X, any_source_result1_upvr_7() * var409_upvr, 0.5 + vector2_upvw_8.Y, any_source_result1_upvr_6() * var409_upvr)
						return
					end
					arg1_32.Position = UDim2.new(vector2_upvw_8.X, any_source_result1_upvr_7() * var409_upvr, vector2_upvw_8.Y, any_source_result1_upvr_6() * var409_upvr)
				end
			end)
		end)
		tbl_15.AnchorPoint = Vector2.new(0.5, 1)
		tbl_15.BackgroundTransparency = 1
		tbl_15.FontFace = Font.new("rbxasset://fonts/families/AccanthisADFStd.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
		local function Text() -- Line 2038, Named "Visible"
			--[[ Upvalues[4]:
				[1]: any_source_result1_upvr_10 (copied, readonly)
				[2]: any_source_result1_upvr_16 (copied, readonly)
				[3]: arg2_5 (readonly)
				[4]: any_source_result1_upvr_5 (copied, readonly)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			local var411
			if not var411 then
				var411 = any_source_result1_upvr_16()[arg2_5]
				return not var411
			end
			if not table.find(any_source_result1_upvr_16()[any_source_result1_upvr_5()].skins, arg2_5) then
				var411 = true
			else
				var411 = false
			end
			var411 = any_source_result1_upvr_16()[any_source_result1_upvr_5()]
			var411 = var411.skins
			if var411 == "none" then
			end
			return false
		end
		tbl_15.Visible = Text
		function Text() -- Line 2051
			--[[ Upvalues[2]:
				[1]: price_upvr (readonly)
				[2]: arg1_26 (readonly)
			]]
			local var412
			if not price_upvr then
				var412 = "Event | Milestone"
			else
				var412 = arg1_26()
				var412 = var412.price
			end
			return `T. {var412}`
		end
		tbl_15.Text = Text
		Text = Color3.fromRGB(255, 231, 171)
		tbl_15.TextColor3 = Text
		Text = true
		tbl_15.TextScaled = Text
		Text = 14
		tbl_15.TextSize = Text
		Text = 0
		tbl_15.TextStrokeTransparency = Text
		Text = Enum.TextXAlignment.Right
		tbl_15.TextXAlignment = Text
		local tbl_52 = {
			Size = UDim2.new(0.851, 0, 0.107, 10);
		}
		local vector2_upvw_4 = Vector2.new(0.475, 0.972)
		if not vector2_upvw_4 then
			vector2_upvw_4 = Vector2.new(0, 0)
		end
		local var416_upvr = false
		local var417_upvr = 0.0025
		Text = vide_upvr.action(function(arg1_33) -- Line 85
			--[[ Upvalues[7]:
				[1]: vide_upvr (copied, readonly)
				[2]: any_source_result1_upvr_19 (readonly)
				[3]: var416_upvr (readonly)
				[4]: vector2_upvw_4 (read and write)
				[5]: any_source_result1_upvr_7 (readonly)
				[6]: var417_upvr (readonly)
				[7]: any_source_result1_upvr_6 (readonly)
			]]
			vide_upvr.effect(function() -- Line 86
				--[[ Upvalues[7]:
					[1]: any_source_result1_upvr_19 (copied, readonly)
					[2]: var416_upvr (copied, readonly)
					[3]: arg1_33 (readonly)
					[4]: vector2_upvw_4 (copied, read and write)
					[5]: any_source_result1_upvr_7 (copied, readonly)
					[6]: var417_upvr (copied, readonly)
					[7]: any_source_result1_upvr_6 (copied, readonly)
				]]
				if any_source_result1_upvr_19() then
					if var416_upvr then
						arg1_33.Position = UDim2.new(0.5 + vector2_upvw_4.X, any_source_result1_upvr_7() * var417_upvr, 0.5 + vector2_upvw_4.Y, any_source_result1_upvr_6() * var417_upvr)
						return
					end
					arg1_33.Position = UDim2.new(vector2_upvw_4.X, any_source_result1_upvr_7() * var417_upvr, vector2_upvw_4.Y, any_source_result1_upvr_6() * var417_upvr)
				end
			end)
		end)
		tbl_52[1] = Text
		tbl_52.AnchorPoint = Vector2.new(0.5, 1)
		tbl_52.BackgroundTransparency = 1
		tbl_52.FontFace = Font.new("rbxasset://fonts/families/AccanthisADFStd.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
		local function Text() -- Line 2074
			--[[ Upvalues[7]:
				[1]: any_source_result1_upvr_10 (copied, readonly)
				[2]: any_source_result1_upvr_16 (copied, readonly)
				[3]: arg2_5 (readonly)
				[4]: characters_upvr (copied, readonly)
				[5]: any_source_result1_upvr_12 (copied, readonly)
				[6]: any_source_result1_upvr_2 (copied, readonly)
				[7]: arg1_26 (readonly)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			local var419
			local var420
			if not any_source_result1_upvr_10() then
				if any_source_result1_upvr_16() then
					local var421
					if any_source_result1_upvr_16()[arg2_5] then
						local skin_3 = any_source_result1_upvr_16()[arg2_5].skin
						if any_source_result1_upvr_12() ~= "KILLERS" then
							var421 = false
						else
							var421 = true
						end
						if var421 then
							var420 = "killers"
						else
							var420 = "survivors"
						end
						local var423 = characters_upvr.skins[var420][arg2_5]
						if var423 then
						end
						if skin_3 ~= "none" then
							var419 = var423[skin_3]
						end
					end
				end
			end
			local function INLINED_16() -- Internal function, doesn't exist in bytecode
				if not any_source_result1_upvr_2()[arg2_5] or not INLINED_15() then
					var420 = "N/A"
				end
				local function INLINED_15() -- Internal function, doesn't exist in bytecode
					var420 = var420.name
					var420 = any_source_result1_upvr_2()[arg2_5]
					return var420
				end
				return `{var419.name} | {var420}`
			end
			if not var419 or not INLINED_16() then
			end
			return arg1_26().name
		end
		tbl_52.Text = Text
		Text = Color3.fromRGB(255, 204, 0)
		tbl_52.TextColor3 = Text
		Text = true
		tbl_52.TextScaled = Text
		Text = 14
		tbl_52.TextSize = Text
		Text = 0
		tbl_52.TextStrokeTransparency = Text
		Text = Enum.TextXAlignment.Right
		tbl_52.TextXAlignment = Text
		Text = "ImageLabel"
		Text = {}
		local var424 = Text
		var424.Size = UDim2.fromScale(0.22, 0.22)
		var424.Position = UDim2.fromScale(0.901, -0.035)
		var424.AnchorPoint = Vector2.new(0.5, 0.5)
		var424.BackgroundTransparency = 1
		local function Visible() -- Line 2120
			--[[ Upvalues[1]:
				[1]: any_source_result1_upvr_10 (copied, readonly)
			]]
			return not any_source_result1_upvr_10()
		end
		var424.Visible = Visible
		var424.Image = arg1_26().class
		var424.ScaleType = Enum.ScaleType.Fit
		Text = create_upvr("UICorner")({})
		var424[1] = Text
		var424[2] = create_upvr("UIGradient")({
			Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(118, 118, 118))});
			Rotation = 90;
		})
		var424 = create_upvr
		Text = "TextLabel"
		var424 = var424(Text)
		Text = {}
		local var427 = Text
		var427.Size = UDim2.fromScale(1.171, 0.22)
		local vector2_upvw_7 = Vector2.new(-0.087, 0.388)
		if not vector2_upvw_7 then
			vector2_upvw_7 = Vector2.new(0, 0)
		end
		local var430_upvr = false
		local var431_upvr = 0.0025
		var427[1] = vide_upvr.action(function(arg1_34) -- Line 85
			--[[ Upvalues[7]:
				[1]: vide_upvr (copied, readonly)
				[2]: any_source_result1_upvr_19 (readonly)
				[3]: var430_upvr (readonly)
				[4]: vector2_upvw_7 (read and write)
				[5]: any_source_result1_upvr_7 (readonly)
				[6]: var431_upvr (readonly)
				[7]: any_source_result1_upvr_6 (readonly)
			]]
			vide_upvr.effect(function() -- Line 86
				--[[ Upvalues[7]:
					[1]: any_source_result1_upvr_19 (copied, readonly)
					[2]: var430_upvr (copied, readonly)
					[3]: arg1_34 (readonly)
					[4]: vector2_upvw_7 (copied, read and write)
					[5]: any_source_result1_upvr_7 (copied, readonly)
					[6]: var431_upvr (copied, readonly)
					[7]: any_source_result1_upvr_6 (copied, readonly)
				]]
				if any_source_result1_upvr_19() then
					if var430_upvr then
						arg1_34.Position = UDim2.new(0.5 + vector2_upvw_7.X, any_source_result1_upvr_7() * var431_upvr, 0.5 + vector2_upvw_7.Y, any_source_result1_upvr_6() * var431_upvr)
						return
					end
					arg1_34.Position = UDim2.new(vector2_upvw_7.X, any_source_result1_upvr_7() * var431_upvr, vector2_upvw_7.Y, any_source_result1_upvr_6() * var431_upvr)
				end
			end)
		end)
		var427.BackgroundTransparency = 1
		local function Visible() -- Line 2166
			--[[ Upvalues[5]:
				[1]: any_useAtom_result1_upvr_11 (copied, readonly)
				[2]: arg2_5 (readonly)
				[3]: any_useAtom_result1_upvr_3 (copied, readonly)
				[4]: any_source_result1_upvr_16 (copied, readonly)
				[5]: any_source_result1_upvr_5 (copied, readonly)
			]]
			if any_useAtom_result1_upvr_11() ~= arg2_5 then
				if any_useAtom_result1_upvr_3() ~= arg2_5 then
				else
				end
			end
			local var433
			if any_source_result1_upvr_16()[any_source_result1_upvr_5()] and (any_source_result1_upvr_16()[any_source_result1_upvr_5()].skin == arg2_5 or any_source_result1_upvr_16()[any_source_result1_upvr_5()].skin == nil and arg2_5 == "none") then
				var433 = true
			end
			return var433
		end
		var427.Visible = Visible
		var427.FontFace = Font.new("rbxasset://fonts/families/Guru.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
		var427.Text = "EQUIPPED"
		var427.TextColor3 = Color3.fromRGB(255, 204, 133)
		var427.TextScaled = true
		var427.TextSize = 14
		local tbl_24 = {
			Rotation = 90;
			Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(0.478, Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(0.493, Color3.fromRGB(61, 61, 61)), ColorSequenceKeypoint.new(1, Color3.fromRGB(42, 42, 24))});
		}
		tbl_24 = create_upvr("UIStroke")
		tbl_24 = tbl_24({
			Thickness = 2.7;
		})
		var427[2] = create_upvr("UIGradient")(tbl_24)
		var427[3] = tbl_24
		var424 = var424(var427)
		tbl_10[2] = UiUtils_upvr.button(var385)
		tbl_10[3] = var385
		tbl_10[4] = tbl_6
		tbl_10[5] = create_upvr("TextLabel")(tbl_15)
		tbl_10[6] = create_upvr("TextLabel")(tbl_52)
		tbl_10[7] = create_upvr(Text)(var424)
		tbl_10[8] = var424
		module_5[1] = create_upvr("UIAspectRatioConstraint")({
			AspectRatio = 0.75;
		})
		module_5[2] = create_upvr("TextButton")(tbl_10)
		return create_upvr("Frame")(module_5)
	end)
	local tbl_46 = {
		Size = UDim2.fromScale(1, 1);
		BackgroundTransparency = 1;
	}
	local function Visible() -- Line 2213
		--[[ Upvalues[1]:
			[1]: any_source_result1_upvr_10 (readonly)
		]]
		return not any_source_result1_upvr_10()
	end
	tbl_46.Visible = Visible
	local tbl_59 = {
		Size = UDim2.fromScale(1.118, 0.153);
		AnchorPoint = Vector2.new(0.5, 0.5);
	}
	local vector2_upvw_3 = Vector2.new(0.373, -0.067)
	if not vector2_upvw_3 then
		vector2_upvw_3 = Vector2.new(0, 0)
	end
	local var446_upvr = false
	local var447_upvr = -0.005
	tbl_59[1] = vide_upvr.action(function(arg1_35) -- Line 85
		--[[ Upvalues[7]:
			[1]: vide_upvr (copied, readonly)
			[2]: any_source_result1_upvr_19 (readonly)
			[3]: var446_upvr (readonly)
			[4]: vector2_upvw_3 (read and write)
			[5]: any_source_result1_upvr_7 (readonly)
			[6]: var447_upvr (readonly)
			[7]: any_source_result1_upvr_6 (readonly)
		]]
		vide_upvr.effect(function() -- Line 86
			--[[ Upvalues[7]:
				[1]: any_source_result1_upvr_19 (copied, readonly)
				[2]: var446_upvr (copied, readonly)
				[3]: arg1_35 (readonly)
				[4]: vector2_upvw_3 (copied, read and write)
				[5]: any_source_result1_upvr_7 (copied, readonly)
				[6]: var447_upvr (copied, readonly)
				[7]: any_source_result1_upvr_6 (copied, readonly)
			]]
			if any_source_result1_upvr_19() then
				if var446_upvr then
					arg1_35.Position = UDim2.new(0.5 + vector2_upvw_3.X, any_source_result1_upvr_7() * var447_upvr, 0.5 + vector2_upvw_3.Y, any_source_result1_upvr_6() * var447_upvr)
					return
				end
				arg1_35.Position = UDim2.new(vector2_upvw_3.X, any_source_result1_upvr_7() * var447_upvr, vector2_upvw_3.Y, any_source_result1_upvr_6() * var447_upvr)
			end
		end)
	end)
	tbl_59.BackgroundTransparency = 1
	tbl_59.ScaleType = Enum.ScaleType.Fit
	tbl_59.Image = tbl_14_upvr.TOPBAR
	tbl_59[2] = create_upvr("UIGradient")({
		Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 40)), ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))});
	})
	local tbl_4 = {
		AnchorPoint = Vector2.new(0.5, 0.5);
		BackgroundTransparency = 1;
	}
	local vector2_upvw = Vector2.new(0.025, -0.068)
	if not vector2_upvw then
		vector2_upvw = Vector2.new(0, 0)
	end
	local var457_upvr = false
	local var458_upvr = -0.005
	tbl_4[1] = vide_upvr.action(function(arg1_36) -- Line 85
		--[[ Upvalues[7]:
			[1]: vide_upvr (copied, readonly)
			[2]: any_source_result1_upvr_19 (readonly)
			[3]: var457_upvr (readonly)
			[4]: vector2_upvw (read and write)
			[5]: any_source_result1_upvr_7 (readonly)
			[6]: var458_upvr (readonly)
			[7]: any_source_result1_upvr_6 (readonly)
		]]
		vide_upvr.effect(function() -- Line 86
			--[[ Upvalues[7]:
				[1]: any_source_result1_upvr_19 (copied, readonly)
				[2]: var457_upvr (copied, readonly)
				[3]: arg1_36 (readonly)
				[4]: vector2_upvw (copied, read and write)
				[5]: any_source_result1_upvr_7 (copied, readonly)
				[6]: var458_upvr (copied, readonly)
				[7]: any_source_result1_upvr_6 (copied, readonly)
			]]
			if any_source_result1_upvr_19() then
				if var457_upvr then
					arg1_36.Position = UDim2.new(0.5 + vector2_upvw.X, any_source_result1_upvr_7() * var458_upvr, 0.5 + vector2_upvw.Y, any_source_result1_upvr_6() * var458_upvr)
					return
				end
				arg1_36.Position = UDim2.new(vector2_upvw.X, any_source_result1_upvr_7() * var458_upvr, vector2_upvw.Y, any_source_result1_upvr_6() * var458_upvr)
			end
		end)
	end)
	tbl_4.Size = UDim2.fromScale(0.131, 0.074)
	tbl_4.FontFace = Font.new("rbxasset://fonts/families/Oswald.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	local function Text() -- Line 2340
		--[[ Upvalues[1]:
			[1]: any_source_result1_upvr_12 (readonly)
		]]
		return "| "..any_source_result1_upvr_12()
	end
	tbl_4.Text = Text
	tbl_4.TextColor3 = Color3.new(0, 0, 0)
	tbl_4.TextScaled = true
	tbl_4.TextSize = 14
	tbl_4.TextTransparency = 0.78
	tbl_4.TextWrapped = true
	tbl_4.TextXAlignment = Enum.TextXAlignment.Left
	local tbl_41 = {
		AnchorPoint = Vector2.new(0.5, 0.5);
		BackgroundTransparency = 1;
		Position = UDim2.fromScale(0.48, 0.48);
		Size = UDim2.fromScale(1, 1);
		FontFace = Font.new("rbxasset://fonts/families/Oswald.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	}
	local function Text() -- Line 2363
		--[[ Upvalues[1]:
			[1]: any_source_result1_upvr_12 (readonly)
		]]
		return "| "..any_source_result1_upvr_12()
	end
	tbl_41.Text = Text
	tbl_41.TextColor3 = Color3.fromRGB(255, 231, 171)
	tbl_41.TextScaled = true
	tbl_41.TextSize = 14
	tbl_41.TextWrapped = true
	tbl_41.TextXAlignment = Enum.TextXAlignment.Left
	tbl_4[2] = create_upvr("TextLabel")(tbl_41)
	local tbl_54 = {
		Position = UDim2.fromScale(-0.203, 0.948);
		Size = UDim2.fromScale(0.189, 0.041);
		BackgroundTransparency = 1;
	}
	local tbl_48 = {
		Size = UDim2.fromScale(0.153, 0.734);
		Position = UDim2.fromScale(0.494, 0.009);
		BackgroundTransparency = 1;
		FontFace = Font.new("rbxassetid://12187366846", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	}
	local function Text() -- Line 2400
		--[[ Upvalues[1]:
			[1]: any_useAtom_result1_upvr_10 (readonly)
		]]
		return `{any_useAtom_result1_upvr_10()}$`
	end
	tbl_48.Text = Text
	tbl_48.TextScaled = true
	tbl_48.TextSize = 14
	tbl_48.TextTransparency = 0.65
	tbl_48.TextColor3 = Color3.new(1, 1, 1)
	tbl_48.TextXAlignment = Enum.TextXAlignment.Left
	tbl_54[1] = create_upvr("ImageLabel")({
		Size = UDim2.fromScale(0.75, 0.75);
		AnchorPoint = Vector2.new(0.5, 0.5);
		Position = UDim2.fromScale(0.429, 0.387);
		BackgroundTransparency = 1;
		Image = tbl_14_upvr.TIX;
		ScaleType = Enum.ScaleType.Fit;
	})
	tbl_54[2] = create_upvr("TextLabel")(tbl_48)
	tbl_46[1] = create_upvr("ImageLabel")({
		Size = UDim2.fromScale(0.123, 0.263);
		Position = UDim2.fromScale(-0.163, 0.084);
		BackgroundTransparency = 0;
		BackgroundColor3 = Color3.fromRGB(20, 16, 9);
		ScaleType = Enum.ScaleType.Fit;
		Image = tbl_14_upvr.PROFILE_IMAGE;
		
		create_upvr("UICorner")({})
	})
	tbl_46[2] = create_upvr("ImageLabel")({
		Size = UDim2.fromScale(0.335, 0.578);
		Position = UDim2.fromScale(-0.05, 0.221);
		AnchorPoint = Vector2.new(0.5, 0.5);
		BackgroundTransparency = 1;
		ScaleType = Enum.ScaleType.Fit;
		Image = tbl_14_upvr.PROFILE;
		ImageColor3 = Color3.fromRGB(255, 255, 255);
	})
	tbl_46[3] = create_upvr("ImageLabel")({
		Size = UDim2.fromScale(0.153, 0.643);
		Position = UDim2.fromScale(-0.109, 0.738);
		AnchorPoint = Vector2.new(0.5, 0.5);
		BackgroundTransparency = 1;
		ScaleType = Enum.ScaleType.Crop;
		Image = tbl_14_upvr.SIDEBAR;
		ImageColor3 = Color3.fromRGB(231, 226, 217);
		
		create_upvr("ScrollingFrame")({
			Size = UDim2.fromScale(0.821, 0.743);
			Position = UDim2.fromScale(0.094, 0.136);
			BackgroundTransparency = 1;
			CanvasSize = UDim2.new(1, 0, 0, 30);
			ScrollingDirection = Enum.ScrollingDirection.Y;
			ScrollBarThickness = 0;
			AutomaticCanvasSize = Enum.AutomaticSize.XY;
			
			sideBarButton_upvr("SURVIVORS", any_source_result1_upvr_12), sideBarButton_upvr("KILLERS", any_source_result1_upvr_12), sideBarButton_upvr("EMOTES", any_source_result1_upvr_12), sideBarButton_upvr("ROBUX", any_source_result1_upvr_12), create_upvr("UIListLayout")({
				Padding = UDim.new(0, 5);
				SortOrder = Enum.SortOrder.LayoutOrder;
				HorizontalAlignment = Enum.HorizontalAlignment.Center;
			})
		})
	})
	tbl_46[4] = create_upvr("ImageLabel")(tbl_59)
	tbl_46[5] = create_upvr("ImageButton")({
		Size = UDim2.fromScale(0.1, 0.09);
		Position = UDim2.fromScale(-0.102, -0.067);
		AnchorPoint = Vector2.new(0.5, 0.5);
		BackgroundTransparency = 1;
		Image = tbl_14_upvr.BACK;
		ScaleType = Enum.ScaleType.Fit;
		
		UiUtils_upvr.button(function() -- Line 2304
			--[[ Upvalues[1]:
				[1]: any_source_result1_upvr_19 (readonly)
			]]
			any_source_result1_upvr_19(false)
		end), create_upvr("TextLabel")({
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundTransparency = 1;
			Position = UDim2.fromScale(0.5, 0.5);
			Size = UDim2.fromScale(0.65, 0.65);
			Text = "BACK";
			TextScaled = true;
			TextColor3 = Color3.fromRGB(255, 231, 171);
			FontFace = Font.new("rbxasset://fonts/families/Oswald.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		})
	})
	tbl_46[6] = create_upvr("TextLabel")(tbl_4)
	tbl_46[7] = create_upvr("Frame")(tbl_54)
	local tbl_53 = {
		Size = UDim2.fromScale(1, 1);
		BackgroundTransparency = 1;
	}
	local function Visible() -- Line 2416
		--[[ Upvalues[1]:
			[1]: any_source_result1_upvr_10 (readonly)
		]]
		return any_source_result1_upvr_10()
	end
	tbl_53.Visible = Visible
	local tbl_36 = {
		AnchorPoint = Vector2.new(0.5, 0.5);
		BackgroundTransparency = 1;
	}
	local vector2_upvw_9 = Vector2.new(0.775, -0.068)
	if not vector2_upvw_9 then
		vector2_upvw_9 = Vector2.new(0, 0)
	end
	local var471_upvr = false
	local var472_upvr = -0.005
	tbl_36[1] = vide_upvr.action(function(arg1_37) -- Line 85
		--[[ Upvalues[7]:
			[1]: vide_upvr (copied, readonly)
			[2]: any_source_result1_upvr_19 (readonly)
			[3]: var471_upvr (readonly)
			[4]: vector2_upvw_9 (read and write)
			[5]: any_source_result1_upvr_7 (readonly)
			[6]: var472_upvr (readonly)
			[7]: any_source_result1_upvr_6 (readonly)
		]]
		vide_upvr.effect(function() -- Line 86
			--[[ Upvalues[7]:
				[1]: any_source_result1_upvr_19 (copied, readonly)
				[2]: var471_upvr (copied, readonly)
				[3]: arg1_37 (readonly)
				[4]: vector2_upvw_9 (copied, read and write)
				[5]: any_source_result1_upvr_7 (copied, readonly)
				[6]: var472_upvr (copied, readonly)
				[7]: any_source_result1_upvr_6 (copied, readonly)
			]]
			if any_source_result1_upvr_19() then
				if var471_upvr then
					arg1_37.Position = UDim2.new(0.5 + vector2_upvw_9.X, any_source_result1_upvr_7() * var472_upvr, 0.5 + vector2_upvw_9.Y, any_source_result1_upvr_6() * var472_upvr)
					return
				end
				arg1_37.Position = UDim2.new(vector2_upvw_9.X, any_source_result1_upvr_7() * var472_upvr, vector2_upvw_9.Y, any_source_result1_upvr_6() * var472_upvr)
			end
		end)
	end)
	tbl_36.Size = UDim2.fromScale(0.131, 0.074)
	tbl_36.FontFace = Font.new("rbxasset://fonts/families/Oswald.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	local function Text() -- Line 2465
		--[[ Upvalues[1]:
			[1]: any_source_result1_upvr_2 (readonly)
		]]
		if not any_source_result1_upvr_2().none then
			return "Not Found"
		end
		return any_source_result1_upvr_2().none.name
	end
	tbl_36.Text = Text
	tbl_36.TextColor3 = Color3.new(0, 0, 0)
	tbl_36.TextScaled = true
	tbl_36.TextSize = 14
	tbl_36.TextTransparency = 0.78
	tbl_36.TextWrapped = true
	tbl_36.TextXAlignment = Enum.TextXAlignment.Left
	local tbl_51 = {
		AnchorPoint = Vector2.new(0.5, 0.5);
		BackgroundTransparency = 1;
		Position = UDim2.fromScale(0.48, 0.48);
		Size = UDim2.fromScale(1, 1);
		FontFace = Font.new("rbxasset://fonts/families/Oswald.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	}
	local function Text() -- Line 2491
		--[[ Upvalues[1]:
			[1]: any_source_result1_upvr_2 (readonly)
		]]
		if not any_source_result1_upvr_2().none then
			return "Not Found"
		end
		return any_source_result1_upvr_2().none.name
	end
	tbl_51.Text = Text
	tbl_51.TextColor3 = Color3.fromRGB(255, 231, 171)
	tbl_51.TextScaled = true
	tbl_51.TextSize = 14
	tbl_51.TextWrapped = true
	tbl_51.TextXAlignment = Enum.TextXAlignment.Left
	tbl_36[2] = create_upvr("TextLabel")(tbl_51)
	local tbl_27 = {
		Position = UDim2.fromScale(0.403, -0.08);
		Size = UDim2.fromScale(0.289, 0.041);
		BackgroundTransparency = 1;
	}
	local tbl_30 = {
		Size = UDim2.fromScale(0.153, 0.734);
		Position = UDim2.fromScale(0.494, 0.009);
		BackgroundTransparency = 1;
		FontFace = Font.new("rbxassetid://12187366846", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	}
	local function Text() -- Line 2531
		--[[ Upvalues[1]:
			[1]: any_useAtom_result1_upvr_10 (readonly)
		]]
		return `{any_useAtom_result1_upvr_10()}$`
	end
	tbl_30.Text = Text
	tbl_30.TextScaled = true
	tbl_30.TextSize = 14
	tbl_30.TextTransparency = 0.65
	tbl_30.TextColor3 = Color3.new(1, 1, 1)
	tbl_30.TextXAlignment = Enum.TextXAlignment.Left
	tbl_27[1] = create_upvr("ImageLabel")({
		Size = UDim2.fromScale(0.75, 0.75);
		AnchorPoint = Vector2.new(0.5, 0.5);
		Position = UDim2.fromScale(0.429, 0.387);
		BackgroundTransparency = 1;
		Image = tbl_14_upvr.TIX;
		ScaleType = Enum.ScaleType.Fit;
	})
	tbl_27[2] = create_upvr("TextLabel")(tbl_30)
	tbl_53[1] = create_upvr("ImageButton")({
		Size = UDim2.fromScale(0.1, 0.09);
		Position = UDim2.fromScale(0.6502, -0.067);
		AnchorPoint = Vector2.new(0.5, 0.5);
		BackgroundTransparency = 1;
		Image = tbl_14_upvr.BACK;
		ScaleType = Enum.ScaleType.Fit;
		
		UiUtils_upvr.button(function() -- Line 2429
			--[[ Upvalues[4]:
				[1]: any_source_result1_upvr_12 (readonly)
				[2]: any_source_result1_upvr_2 (readonly)
				[3]: characters_upvr (copied, readonly)
				[4]: any_source_result1_upvr_10 (readonly)
			]]
			if any_source_result1_upvr_12() == "SURVIVORS" then
				any_source_result1_upvr_2(characters_upvr.survivors)
			elseif any_source_result1_upvr_12() == "KILLERS" then
				any_source_result1_upvr_2(characters_upvr.killers)
			end
			any_source_result1_upvr_10(false)
		end), create_upvr("TextLabel")({
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundTransparency = 1;
			Position = UDim2.fromScale(0.5, 0.5);
			Size = UDim2.fromScale(0.65, 0.65);
			Text = "BACK";
			TextScaled = true;
			TextColor3 = Color3.fromRGB(255, 231, 171);
			FontFace = Font.new("rbxasset://fonts/families/Oswald.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		})
	})
	tbl_53[2] = create_upvr("TextLabel")(tbl_36)
	tbl_53[3] = create_upvr("Frame")(tbl_27)
	tbl_35[2] = create_upvr("Frame")({
		Size = UDim2.fromScale(0, 0);
		Position = UDim2.fromScale(0.5, 0.5);
		AnchorPoint = Vector2.new(0.5, 0.5);
		BackgroundTransparency = 1;
		ZIndex = 5;
		
		create_upvr("UIAspectRatioConstraint")({}), vide_upvr.action(function(arg1_15) -- Line 854
			--[[ Upvalues[3]:
				[1]: vide_upvr (copied, readonly)
				[2]: any_source_result1_upvr_11 (readonly)
				[3]: TweenService_upvr (copied, readonly)
			]]
			vide_upvr.effect(function() -- Line 856
				--[[ Upvalues[3]:
					[1]: any_source_result1_upvr_11 (copied, readonly)
					[2]: arg1_15 (readonly)
					[3]: TweenService_upvr (copied, readonly)
				]]
				if any_source_result1_upvr_11() then
					arg1_15.Visible = true
					TweenService_upvr:Create(arg1_15, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
						Size = UDim2.fromScale(0.8, 0.8);
					}):Play()
				else
					arg1_15.Visible = false
					TweenService_upvr:Create(arg1_15, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
						Size = UDim2.fromScale(0, 0);
					}):Play()
				end
			end)
		end), vide_upvr.indexes(any_source_result1_upvr_13, function(arg1_16, arg2_3) -- Line 877
			--[[ Upvalues[10]:
				[1]: tbl_34_upvr (copied, readonly)
				[2]: create_upvr (copied, readonly)
				[3]: UiUtils_upvr (copied, readonly)
				[4]: any_source_result1_upvr_8 (readonly)
				[5]: var37_upvw (read and write)
				[6]: any_source_result1_upvr_11 (readonly)
				[7]: vide_upvr (copied, readonly)
				[8]: ReplicatedStorage_upvr (copied, readonly)
				[9]: animation_upvr (copied, readonly)
				[10]: helper_upvr (copied, readonly)
			]]
			if not tbl_34_upvr[arg2_3] then return end
			local module_8 = {
				Size = UDim2.fromScale(0.175, 0.175);
				Position = tbl_34_upvr[arg2_3];
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundTransparency = 1;
			}
			local tbl_13 = {
				AnchorPoint = Vector2.new(0.5, 0.5);
				Position = UDim2.fromScale(0.5, 0.5);
				BackgroundTransparency = 1;
				Size = UDim2.fromScale(1, 1);
				Text = "";
			}
			local tbl_64 = {
				AnchorPoint = Vector2.new(0.5, 0);
				Size = UDim2.fromScale(1.227, 0.178);
				Position = UDim2.fromScale(0.5, 0.853);
				TextScaled = true;
				TextColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1;
			}
			local function Text() -- Line 968
				--[[ Upvalues[2]:
					[1]: arg1_16 (readonly)
					[2]: helper_upvr (copied, readonly)
				]]
				local arg1_16_result1 = arg1_16()
				local var245 = helper_upvr._emotes[arg1_16_result1]
				local var246
				if arg1_16_result1 == "none" then
					var246 = "None"
					return var246
				end
				local function INLINED_4() -- Internal function, doesn't exist in bytecode
					var246 = var245.name
					return var246
				end
				if not var245 or not INLINED_4() then
					var246 = ""
				end
				return var246
			end
			tbl_64.Text = Text
			tbl_64.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			tbl_64[1] = create_upvr("UIStroke")({})
			tbl_13[1] = UiUtils_upvr.button(function() -- Line 893
				--[[ Upvalues[4]:
					[1]: any_source_result1_upvr_8 (copied, readonly)
					[2]: var37_upvw (copied, read and write)
					[3]: arg2_3 (readonly)
					[4]: any_source_result1_upvr_11 (copied, readonly)
				]]
				var37_upvw.EmoteChange(any_source_result1_upvr_8(), arg2_3)
				any_source_result1_upvr_11(false)
			end)
			tbl_13[2] = create_upvr("ViewportFrame")({
				Size = UDim2.fromScale(1, 1);
				BackgroundTransparency = 1;
				
				vide_upvr.action(function(arg1_17) -- Line 912
					--[[ Upvalues[5]:
						[1]: ReplicatedStorage_upvr (copied, readonly)
						[2]: vide_upvr (copied, readonly)
						[3]: animation_upvr (copied, readonly)
						[4]: helper_upvr (copied, readonly)
						[5]: arg1_16 (readonly)
					]]
					local WorldModel_3 = Instance.new("WorldModel")
					WorldModel_3.Parent = arg1_17
					local clone_4_upvr = ReplicatedStorage_upvr.resources.preview_rig:Clone()
					clone_4_upvr.Parent = WorldModel_3
					vide_upvr.effect(function() -- Line 925
						--[[ Upvalues[4]:
							[1]: animation_upvr (copied, readonly)
							[2]: clone_4_upvr (readonly)
							[3]: helper_upvr (copied, readonly)
							[4]: arg1_16 (copied, readonly)
						]]
						animation_upvr:stopAllAnimation(clone_4_upvr)
						local var238_upvr = helper_upvr._emotes[arg1_16()]
						if var238_upvr then
							task.delay(0.1, function() -- Line 931
								--[[ Upvalues[3]:
									[1]: animation_upvr (copied, readonly)
									[2]: clone_4_upvr (copied, readonly)
									[3]: var238_upvr (readonly)
								]]
								local any_loadAnimation_result1_2 = animation_upvr:loadAnimation(clone_4_upvr, var238_upvr.animation)
								any_loadAnimation_result1_2.Looped = true
								any_loadAnimation_result1_2:Play(0)
							end)
						end
					end)
				end)
			})
			tbl_13[3] = create_upvr("ImageLabel")({
				Size = UDim2.fromScale(1, 1);
				BackgroundTransparency = 1;
				Image = "rbxassetid://5538771868";
				ImageColor3 = Color3.fromRGB(255, 255, 255);
				ImageTransparency = 0.8;
			})
			tbl_13[4] = create_upvr("ImageLabel")({
				Size = UDim2.fromScale(1, 0.264);
				Position = UDim2.fromScale(0, 0.816);
				BackgroundTransparency = 1;
				Image = "rbxassetid://5538771868";
				ImageColor3 = Color3.fromRGB(0, 0, 0);
				ImageTransparency = 0.8;
			})
			tbl_13[5] = create_upvr("TextLabel")(tbl_64)
			module_8[1] = create_upvr("TextButton")(tbl_13)
			return create_upvr("Frame")(module_8)
		end), create_upvr("ImageLabel")({
			Size = UDim2.fromScale(1, 1);
			BackgroundTransparency = 1;
			Image = "rbxassetid://71548208571275";
			ImageColor3 = Color3.fromRGB(99, 99, 99);
			ImageTransparency = 0.51;
			ScaleType = Enum.ScaleType.Fit;
			ZIndex = 0;
		})
	})
	tbl_35[3] = create_upvr("Frame")(tbl_62)
	tbl_35[4] = create_upvr("Frame")(tbl_21)
	tbl_35[5] = create_upvr("ScrollingFrame")(tbl_3)
	tbl_35[6] = create_upvr("Frame")(tbl_46)
	tbl_35[7] = create_upvr("Frame")(tbl_53)
	tbl_65[1] = vide_upvr.action(function(arg1_12) -- Line 85
		--[[ Upvalues[7]:
			[1]: vide_upvr (copied, readonly)
			[2]: any_source_result1_upvr_19 (readonly)
			[3]: var209_upvr (readonly)
			[4]: vector2_upvw_2 (read and write)
			[5]: any_source_result1_upvr_7 (readonly)
			[6]: var210_upvr (readonly)
			[7]: any_source_result1_upvr_6 (readonly)
		]]
		vide_upvr.effect(function() -- Line 86
			--[[ Upvalues[7]:
				[1]: any_source_result1_upvr_19 (copied, readonly)
				[2]: var209_upvr (copied, readonly)
				[3]: arg1_12 (readonly)
				[4]: vector2_upvw_2 (copied, read and write)
				[5]: any_source_result1_upvr_7 (copied, readonly)
				[6]: var210_upvr (copied, readonly)
				[7]: any_source_result1_upvr_6 (copied, readonly)
			]]
			if any_source_result1_upvr_19() then
				if var209_upvr then
					arg1_12.Position = UDim2.new(0.5 + vector2_upvw_2.X, any_source_result1_upvr_7() * var210_upvr, 0.5 + vector2_upvw_2.Y, any_source_result1_upvr_6() * var210_upvr)
					return
				end
				arg1_12.Position = UDim2.new(vector2_upvw_2.X, any_source_result1_upvr_7() * var210_upvr, vector2_upvw_2.Y, any_source_result1_upvr_6() * var210_upvr)
			end
		end)
	end)
	tbl_65[2] = vide_upvr.action(function(arg1_13) -- Line 804
		--[[ Upvalues[3]:
			[1]: vide_upvr (copied, readonly)
			[2]: any_source_result1_upvr_19 (readonly)
			[3]: TweenService_upvr (copied, readonly)
		]]
		vide_upvr.effect(function() -- Line 805
			--[[ Upvalues[3]:
				[1]: any_source_result1_upvr_19 (copied, readonly)
				[2]: arg1_13 (readonly)
				[3]: TweenService_upvr (copied, readonly)
			]]
			if any_source_result1_upvr_19() then
				arg1_13.Position = UDim2.fromScale(1.5, 0.5)
				TweenService_upvr:Create(arg1_13, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
					Position = UDim2.fromScale(0.65, 0.5);
				}):Play()
			else
				TweenService_upvr:Create(arg1_13, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
					Position = UDim2.fromScale(1, 0.5);
				}):Play()
			end
		end)
	end)
	tbl_65[3] = create_upvr("UIAspectRatioConstraint")({
		AspectRatio = 1.645;
	})
	tbl_65[4] = create_upvr("ImageLabel")({
		Image = tbl_14_upvr.SHOP_ROOT;
		ImageColor3 = Color3.fromRGB(150, 150, 150);
		Size = UDim2.fromScale(1.3, 1.32);
		Position = UDim2.fromScale(-0.148, -0.302);
		BackgroundTransparency = 1;
		ScaleType = Enum.ScaleType.Fit;
	})
	tbl_65[5] = create_upvr("Frame")(tbl_35)
	local tbl_67 = {
		Size = UDim2.fromScale(1, 1);
		Position = UDim2.fromScale(0.5, 0.5);
		AnchorPoint = Vector2.new(0.5, 0.5);
		BackgroundTransparency = 1;
	}
	local function Visible() -- Line 2552
		--[[ Upvalues[3]:
			[1]: any_source_result1_upvr_2 (readonly)
			[2]: any_source_result1_upvr_5 (readonly)
			[3]: any_source_result1_upvr_10 (readonly)
		]]
		if any_source_result1_upvr_2()[any_source_result1_upvr_5()] then
			return not any_source_result1_upvr_10()
		end
		return false
	end
	tbl_67.Visible = Visible
	local tbl_49 = {
		Size = UDim2.fromScale(0.623, 0.783);
		Position = UDim2.fromScale(0, 0.5);
		AnchorPoint = Vector2.new(0, 0.5);
		BackgroundTransparency = 1;
		ScaleType = Enum.ScaleType.Crop;
		
		create_upvr("UIGradient")({
			Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.2, 0), NumberSequenceKeypoint.new(0.8, 0), NumberSequenceKeypoint.new(1, 1)});
			Rotation = 90;
		})
	}
	local function Image() -- Line 2600
		--[[ Upvalues[7]:
			[1]: any_source_result1_upvr_2 (readonly)
			[2]: any_source_result1_upvr_5 (readonly)
			[3]: any_source_result1_upvr_12 (readonly)
			[4]: characters_upvr (copied, readonly)
			[5]: any_source_result1_upvr_16 (readonly)
			[6]: any_source_result1_upvr_15 (readonly)
			[7]: any_source_result1_upvr_4 (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var486
		if not var486 then
			var486 = ""
			return var486
		end
		if any_source_result1_upvr_12() == "SURVIVORS" then
			var486 = characters_upvr
			var486 = var486.skins
			var486 = var486.survivors
		else
			var486 = characters_upvr
			var486 = var486.skins
			var486 = var486.killers
		end
		local var487
		local function INLINED_17() -- Internal function, doesn't exist in bytecode
			var487 = any_source_result1_upvr_15()
			return var487
		end
		if var487 or INLINED_17() then
			local function INLINED_18() -- Internal function, doesn't exist in bytecode
				var487 = any_source_result1_upvr_4()
				return var487
			end
			if not any_source_result1_upvr_15() or not INLINED_18() then
				var487 = any_source_result1_upvr_16()[any_source_result1_upvr_5()]
				var487 = var487.skin
				local var488 = var487
			end
			if var488 and var486[any_source_result1_upvr_5()] and var486[any_source_result1_upvr_5()][var488] then
				return var486[any_source_result1_upvr_5()][var488].charactericon
			end
		end
		var488 = any_source_result1_upvr_2()[any_source_result1_upvr_5()]
		var488 = var488.charactericon
		return var488
	end
	tbl_49.Image = Image
	tbl_49.ZIndex = 0
	local tbl_45 = {
		Size = UDim2.fromScale(0.355, 0.701);
		Position = UDim2.fromScale(0.8, 0.375);
		BackgroundTransparency = 1;
		BackgroundColor3 = Color3.fromRGB(0, 0, 0);
		AnchorPoint = Vector2.new(0.5, 0.5);
		ScrollBarThickness = 0;
	}
	local tbl_70 = {
		Size = UDim2.fromScale(1, 0);
		BackgroundTransparency = 1;
		BackgroundColor3 = Color3.fromRGB(0, 0, 0);
		AnchorPoint = Vector2.new(0.5, 0.5);
		AutomaticSize = Enum.AutomaticSize.Y;
		LayoutOrder = 0;
	}
	local tbl_44 = {
		BackgroundTransparency = 1;
		Size = UDim2.fromScale(1, 0.232);
		LayoutOrder = 0;
		TextXAlignment = Enum.TextXAlignment.Center;
		TextYAlignment = Enum.TextYAlignment.Center;
	}
	local function Text() -- Line 2670
		--[[ Upvalues[7]:
			[1]: any_source_result1_upvr_2 (readonly)
			[2]: any_source_result1_upvr_5 (readonly)
			[3]: any_source_result1_upvr_12 (readonly)
			[4]: characters_upvr (copied, readonly)
			[5]: any_source_result1_upvr_15 (readonly)
			[6]: any_source_result1_upvr_4 (readonly)
			[7]: any_source_result1_upvr_16 (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 26 start (CF ANALYSIS FAILED)
		local var501
		if not var501 then
			var501 = ""
			return var501
		end
		if any_source_result1_upvr_12() == "SURVIVORS" then
			var501 = characters_upvr
			var501 = var501.skins
			var501 = var501.survivors
		else
			var501 = characters_upvr
			var501 = var501.skins
			var501 = var501.killers
		end
		if any_source_result1_upvr_15() and any_source_result1_upvr_4() then
			local var502 = var501[any_source_result1_upvr_5()][any_source_result1_upvr_4()]
			if var502 then
				do
					return `{var502.name} | {any_source_result1_upvr_2()[any_source_result1_upvr_5()].name}`
				end
				-- KONSTANTWARNING: GOTO [87] #75
			end
		elseif any_source_result1_upvr_16()[any_source_result1_upvr_5()] then
			local skin_2 = any_source_result1_upvr_16()[any_source_result1_upvr_5()].skin
			if skin_2 ~= "none" then
				local var504 = var501[any_source_result1_upvr_5()][skin_2]
				if var504 then
					return `{var504.name} | {any_source_result1_upvr_2()[any_source_result1_upvr_5()].name}`
				end
			end
		end
		-- KONSTANTERROR: [0] 1. Error Block 26 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [87] 75. Error Block 16 start (CF ANALYSIS FAILED)
		do
			return any_source_result1_upvr_2()[any_source_result1_upvr_5()].name
		end
		-- KONSTANTERROR: [87] 75. Error Block 16 end (CF ANALYSIS FAILED)
	end
	tbl_44.Text = Text
	tbl_44.TextScaled = true
	tbl_44.TextColor3 = Color3.fromRGB(255, 231, 171)
	tbl_44.FontFace = Font.new("rbxasset://fonts/families/Balthazar.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	local tbl_55 = {
		BackgroundTransparency = 1;
		Size = UDim2.fromScale(1, 0.302);
		LayoutOrder = 3;
	}
	local function Text() -- Line 2735
		--[[ Upvalues[2]:
			[1]: any_source_result1_upvr_2 (readonly)
			[2]: any_source_result1_upvr_5 (readonly)
		]]
		if not any_source_result1_upvr_2()[any_source_result1_upvr_5()] then
			return ""
		end
		return tostring(any_source_result1_upvr_2()[any_source_result1_upvr_5()].discription)
	end
	tbl_55.Text = Text
	tbl_55.TextScaled = true
	tbl_55.RichText = true
	tbl_55.TextColor3 = Color3.fromRGB(255, 255, 255)
	tbl_55.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	local tbl_33 = {
		Size = UDim2.fromScale(1, 0);
		BackgroundTransparency = 1;
		BackgroundColor3 = Color3.fromRGB(0, 0, 0);
		AnchorPoint = Vector2.new(0.5, 0.5);
		AutomaticSize = Enum.AutomaticSize.Y;
		LayoutOrder = 2;
	}
	local tbl_23 = {
		BackgroundTransparency = 1;
		AutomaticSize = Enum.AutomaticSize.Y;
		Size = UDim2.fromScale(0.321, 0.05);
	}
	local function Visible() -- Line 2771
		--[[ Upvalues[2]:
			[1]: any_source_result1_upvr_16 (readonly)
			[2]: any_source_result1_upvr_5 (readonly)
		]]
		local var510
		if any_source_result1_upvr_16()[any_source_result1_upvr_5()] == nil then
			var510 = false
		else
			var510 = true
		end
		return var510
	end
	tbl_23.Visible = Visible
	tbl_23[1] = create_upvr("UITextSizeConstraint")({
		MaxTextSize = 25;
	})
	local function Text() -- Line 2779
		--[[ Upvalues[2]:
			[1]: any_source_result1_upvr_3 (readonly)
			[2]: any_source_result1_upvr_5 (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		local var512 = any_source_result1_upvr_3()[any_source_result1_upvr_5()]
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [6] 7. Error Block 9 start (CF ANALYSIS FAILED)
		local var513 = var512
		if var513 then
			var513 = var512.exp
		end
		local formatted_2 = `Lv. {var512.level} ({var513}/{var512.max_exp})`
		if not formatted_2 then
			-- KONSTANTERROR: [20] 17. Error Block 5 start (CF ANALYSIS FAILED)
			formatted_2 = "N/A"
			-- KONSTANTERROR: [20] 17. Error Block 5 end (CF ANALYSIS FAILED)
		end
		do
			return formatted_2
		end
		-- KONSTANTERROR: [6] 7. Error Block 9 end (CF ANALYSIS FAILED)
	end
	tbl_23.Text = Text
	tbl_23.TextScaled = true
	tbl_23.TextColor3 = Color3.fromRGB(255, 255, 255)
	tbl_23.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	local tbl_42 = {
		BackgroundColor3 = Color3.fromRGB(106, 106, 106);
		Size = UDim2.fromScale(0.255, 0.05);
	}
	local function Visible() -- Line 2792
		--[[ Upvalues[2]:
			[1]: any_source_result1_upvr_16 (readonly)
			[2]: any_source_result1_upvr_5 (readonly)
		]]
		local var516
		if any_source_result1_upvr_16()[any_source_result1_upvr_5()] == nil then
			var516 = false
		else
			var516 = true
		end
		return var516
	end
	tbl_42.Visible = Visible
	tbl_42[1] = create_upvr("Frame")({
		Size = UDim2.fromScale(1, 1);
		
		vide_upvr.action(function(arg1_39) -- Line 2799
			--[[ Upvalues[4]:
				[1]: vide_upvr (copied, readonly)
				[2]: any_source_result1_upvr_3 (readonly)
				[3]: any_source_result1_upvr_5 (readonly)
				[4]: TweenService_upvr (copied, readonly)
			]]
			vide_upvr.effect(function() -- Line 2800
				--[[ Upvalues[4]:
					[1]: any_source_result1_upvr_3 (copied, readonly)
					[2]: any_source_result1_upvr_5 (copied, readonly)
					[3]: TweenService_upvr (copied, readonly)
					[4]: arg1_39 (readonly)
				]]
				local var520 = any_source_result1_upvr_3()[any_source_result1_upvr_5()]
				local tbl_61 = {}
				local var522
				local function INLINED_19() -- Internal function, doesn't exist in bytecode
					var522 = var520.exp / var520.max_exp
					return var522
				end
				if not var520 or not INLINED_19() then
					var522 = 1
				end
				tbl_61.Size = UDim2.fromScale(var522, 1)
				TweenService_upvr:Create(arg1_39, TweenInfo.new(0.5, Enum.EasingStyle.Linear), tbl_61):Play()
			end)
		end)
	})
	tbl_33[1] = create_upvr("UIListLayout")({
		HorizontalAlignment = Enum.HorizontalAlignment.Center;
		Padding = UDim.new(0, 0);
	})
	tbl_33[2] = create_upvr("TextLabel")(tbl_23)
	tbl_33[3] = create_upvr("Frame")(tbl_42)
	tbl_70[1] = create_upvr("UIListLayout")({
		VerticalAlignment = Enum.VerticalAlignment.Top;
		HorizontalAlignment = Enum.HorizontalAlignment.Center;
		Padding = UDim.new(0, 0);
	})
	tbl_70[2] = create_upvr("TextLabel")(tbl_44)
	tbl_70[3] = create_upvr("ImageLabel")({
		Size = UDim2.fromScale(0.25, 0.25);
		LayoutOrder = 1;
		Image = function() -- Line 2714, Named "Image"
			--[[ Upvalues[2]:
				[1]: any_source_result1_upvr_2 (readonly)
				[2]: any_source_result1_upvr_5 (readonly)
			]]
			if not any_source_result1_upvr_2()[any_source_result1_upvr_5()] then
				return ""
			end
			return any_source_result1_upvr_2()[any_source_result1_upvr_5()].class
		end;
		ScaleType = Enum.ScaleType.Stretch;
		BackgroundTransparency = 1;
		
		create_upvr("UIAspectRatioConstraint")({})
	})
	tbl_70[4] = create_upvr("TextLabel")(tbl_55)
	tbl_70[5] = create_upvr("Frame")(tbl_33)
	tbl_45[1] = create_upvr("UIListLayout")({
		HorizontalAlignment = Enum.HorizontalAlignment.Center;
		VerticalAlignment = Enum.VerticalAlignment.Bottom;
		Padding = UDim.new(0, 10);
	})
	tbl_45[2] = vide_upvr.action(function(arg1_38) -- Line 2635
		--[[ Upvalues[1]:
			[1]: vide_upvr (copied, readonly)
		]]
		local class_UIListLayout_upvr_3 = arg1_38:FindFirstChildOfClass("UIListLayout")
		if class_UIListLayout_upvr_3 then
			vide_upvr.cleanup(class_UIListLayout_upvr_3:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() -- Line 2640
				--[[ Upvalues[2]:
					[1]: arg1_38 (readonly)
					[2]: class_UIListLayout_upvr_3 (readonly)
				]]
				arg1_38.CanvasSize = UDim2.new(0, 0, 0, class_UIListLayout_upvr_3.AbsoluteContentSize.Y)
			end))
		end
	end)
	tbl_45[3] = create_upvr("Frame")(tbl_70)
	tbl_45[4] = vide_upvr.indexes(any_source_result1_upvr, function(arg1_40, arg2_6) -- Line 2814
		--[[ Upvalues[8]:
			[1]: create_upvr (copied, readonly)
			[2]: tbl_14_upvr (copied, readonly)
			[3]: TouchEnabled_upvr (copied, readonly)
			[4]: GamepadEnabled_upvr (copied, readonly)
			[5]: tbl_12_upvr (copied, readonly)
			[6]: vide_upvr (copied, readonly)
			[7]: any_source_result1_upvr_14 (readonly)
			[8]: TweenService_upvr (copied, readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		local discription_2 = arg1_40().discription
		local var525
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [5] 5. Error Block 32 start (CF ANALYSIS FAILED)
		if discription_2 == "" then
			-- KONSTANTERROR: [7] 6. Error Block 3 start (CF ANALYSIS FAILED)
			do
				return
			end
			-- KONSTANTERROR: [7] 6. Error Block 3 end (CF ANALYSIS FAILED)
		end
		local skillicon = arg1_40().skillicon
		local _ = {
			Size = UDim2.fromScale(1, 0);
			BackgroundTransparency = 1;
			BackgroundColor3 = Color3.fromRGB(0, 0, 0);
			AnchorPoint = Vector2.new(0.5, 0.5);
			Position = UDim2.fromScale(0.5, 0.5);
			AutomaticSize = Enum.AutomaticSize.Y;
			LayoutOrder = arg1_40().layerorder or 1;
		}
		local _ = {
			HorizontalAlignment = Enum.HorizontalAlignment.Center;
			Padding = UDim.new(0, 10);
		}
		local tbl_66 = {}
		var525 = 0
		tbl_66.Size = UDim2.fromScale(0.9, var525)
		tbl_66.BackgroundTransparency = 1
		tbl_66.AutomaticSize = Enum.AutomaticSize.Y
		tbl_66.LayoutOrder = 3
		local _ = {
			FillDirection = Enum.FillDirection.Horizontal;
			HorizontalFlex = Enum.UIFlexAlignment.Fill;
			HorizontalAlignment = Enum.HorizontalAlignment.Left;
			Padding = UDim.new(0, 20);
		}
		local tbl_38 = {}
		var525 = UDim2.fromOffset(150, 150)
		tbl_38.Size = var525
		var525 = UDim2.fromScale(0.5, 0.5)
		tbl_38.Position = var525
		var525 = tbl_14_upvr
		var525 = var525.SKILLFRAME
		tbl_38.Image = var525
		var525 = Color3.fromRGB(127, 127, 127)
		tbl_38.ImageColor3 = var525
		var525 = Enum.ScaleType.Stretch
		tbl_38.ScaleType = var525
		var525 = 1
		tbl_38.BackgroundTransparency = var525
		if skillicon then
			var525 = true
		else
			var525 = false
		end
		tbl_38.Visible = var525
		var525 = "ImageLabel"
		var525 = {}
		var525.Size = UDim2.fromScale(1, 1)
		var525.Image = skillicon or ""
		var525.ImageColor3 = Color3.fromRGB(255, 255, 255)
		var525.ScaleType = Enum.ScaleType.Stretch
		var525.BackgroundTransparency = 1
		tbl_38[1] = create_upvr("UIAspectRatioConstraint")({})
		tbl_38[2] = create_upvr(var525)(var525)
		local tbl_31 = {}
		var525 = "UITextSizeConstraint"
		var525 = {}
		var525.MaxTextSize = 30
		tbl_31[1] = create_upvr(var525)(var525)
		tbl_31.Size = UDim2.fromScale(1, 0)
		tbl_31.RichText = true
		tbl_31.TextScaled = true
		tbl_31.AutomaticSize = Enum.AutomaticSize.Y
		tbl_31.TextColor3 = Color3.fromRGB(255, 255, 255)
		tbl_31.TextXAlignment = Enum.TextXAlignment.Left
		tbl_31.BackgroundTransparency = 1
		if discription_2.text then
			-- KONSTANTWARNING: GOTO [269] #193
		end
		-- KONSTANTERROR: [5] 5. Error Block 32 end (CF ANALYSIS FAILED)
	end)
	local tbl_37 = {
		Size = UDim2.fromScale(0.383, 0.16);
		Position = UDim2.fromScale(0.799, 0.812);
		BackgroundTransparency = 1;
		BackgroundColor3 = Color3.fromRGB(0, 0, 0);
		AnchorPoint = Vector2.new(0.5, 0.5);
		LayoutOrder = -1;
	}
	local tbl_9 = {
		Size = UDim2.fromScale(0.298, 0.533);
		AnchorPoint = Vector2.new(0.5, 0.5);
		BackgroundTransparency = 1;
		Image = tbl_14_upvr.BACK;
		LayoutOrder = 1;
		ImageColor3 = Color3.fromRGB(78, 146, 255);
		create_upvr("UIAspectRatioConstraint")({
			AspectRatio = 2.16;
		})
	}
	local function Visible() -- Line 3121
		--[[ Upvalues[5]:
			[1]: any_source_result1_upvr_12 (readonly)
			[2]: characters_upvr (copied, readonly)
			[3]: any_source_result1_upvr_5 (readonly)
			[4]: any_source_result1_upvr_15 (readonly)
			[5]: any_source_result1_upvr_16 (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var550
		if any_source_result1_upvr_12() == "SURVIVORS" then
			var550 = characters_upvr
			var550 = var550.skins
			var550 = var550.survivors
		else
			var550 = characters_upvr
			var550 = var550.skins
			var550 = var550.killers
		end
		var550 = var550[any_source_result1_upvr_5()]
		if var550 then
			if not any_source_result1_upvr_15() then
				if any_source_result1_upvr_16()[any_source_result1_upvr_5()] == nil then
				else
				end
			end
		end
		return true
	end
	tbl_9.Visible = Visible
	tbl_9[2] = UiUtils_upvr.button(function() -- Line 3135
		--[[ Upvalues[6]:
			[1]: any_source_result1_upvr_14 (readonly)
			[2]: any_source_result1_upvr_12 (readonly)
			[3]: characters_upvr (copied, readonly)
			[4]: any_source_result1_upvr_5 (readonly)
			[5]: any_source_result1_upvr_2 (readonly)
			[6]: any_source_result1_upvr_10 (readonly)
		]]
		any_source_result1_upvr_14(false)
		local var552
		if any_source_result1_upvr_12() == "SURVIVORS" then
			var552 = characters_upvr.skins.survivors
		else
			var552 = characters_upvr.skins.killers
		end
		local clone_2 = table.clone(var552[any_source_result1_upvr_5()])
		if clone_2 then
			clone_2.none = any_source_result1_upvr_2()[any_source_result1_upvr_5()]
			any_source_result1_upvr_2(clone_2)
			any_source_result1_upvr_10(true)
		end
	end)
	tbl_9[3] = create_upvr("TextLabel")({
		AnchorPoint = Vector2.new(0.5, 0.5);
		BackgroundTransparency = 1;
		Position = UDim2.fromScale(0.5, 0.5);
		Size = UDim2.fromScale(0.6, 0.6);
		Text = "SKIN";
		TextScaled = true;
		TextColor3 = Color3.fromRGB(255, 231, 171);
		FontFace = Font.new("rbxasset://fonts/families/Oswald.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	})
	tbl_37[1] = create_upvr("UIListLayout")({
		FillDirection = Enum.FillDirection.Horizontal;
		VerticalAlignment = Enum.VerticalAlignment.Center;
		HorizontalAlignment = Enum.HorizontalAlignment.Center;
		Padding = UDim.new(0, 10);
	})
	tbl_37[2] = create_upvr("ImageButton")({
		Size = UDim2.fromScale(0.298, 0.533);
		AnchorPoint = Vector2.new(0.5, 0.5);
		BackgroundTransparency = 1;
		Image = tbl_14_upvr.BACK;
		LayoutOrder = 0;
		ImageColor3 = function() -- Line 3050, Named "ImageColor3"
			--[[ Upvalues[4]:
				[1]: any_source_result1_upvr_15 (readonly)
				[2]: any_source_result1_upvr_4 (readonly)
				[3]: any_source_result1_upvr_16 (readonly)
				[4]: any_source_result1_upvr_5 (readonly)
			]]
			local var539
			if var539 then
				var539 = any_source_result1_upvr_4()
				if var539 then
					return Color3.fromRGB(0, 255, 0)
				end
			end
			local function INLINED_21() -- Internal function, doesn't exist in bytecode
				var539 = Color3.fromRGB(255, 162, 0)
				return var539
			end
			if not any_source_result1_upvr_16()[any_source_result1_upvr_5()] or not INLINED_21() then
				var539 = Color3.fromRGB(0, 255, 0)
			end
			return var539
		end;
		
		create_upvr("UIAspectRatioConstraint")({
			AspectRatio = 2.16;
		}), UiUtils_upvr.button(function() -- Line 3060
			--[[ Upvalues[7]:
				[1]: any_source_result1_upvr_15 (readonly)
				[2]: any_source_result1_upvr_4 (readonly)
				[3]: var37_upvw (read and write)
				[4]: any_source_result1_upvr_5 (readonly)
				[5]: any_source_result1_upvr_12 (readonly)
				[6]: any_source_result1_upvr (readonly)
				[7]: any_source_result1_upvr_16 (readonly)
			]]
			local var543
			if any_source_result1_upvr_15() then
				local var544
				if any_source_result1_upvr_4() then
					var543 = any_source_result1_upvr_5()
					if any_source_result1_upvr_12() ~= "KILLERS" then
						var544 = false
					else
						var544 = true
					end
					var37_upvw.Skin(var543, any_source_result1_upvr_4(), var544)
					var543 = nil
					any_source_result1_upvr_5(var543)
					var543 = nil
					any_source_result1_upvr_4(var543)
					var543 = false
					any_source_result1_upvr_15(var543)
					var543 = {}
					any_source_result1_upvr(var543)
					return
				end
			end
			var543 = any_source_result1_upvr_5()
			if any_source_result1_upvr_16()[var543] then
				if any_source_result1_upvr_12() ~= "KILLERS" then
					var543 = false
				else
					var543 = true
				end
				var37_upvw.Equip(any_source_result1_upvr_5(), var543)
			else
				if any_source_result1_upvr_12() ~= "KILLERS" then
					var543 = false
				else
					var543 = true
				end
				var37_upvw.Buy(any_source_result1_upvr_5(), var543)
			end
		end), create_upvr("TextLabel")({
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundTransparency = 1;
			Position = UDim2.fromScale(0.5, 0.5);
			Size = UDim2.fromScale(0.6, 0.6);
			Text = function() -- Line 3082, Named "Text"
				--[[ Upvalues[6]:
					[1]: any_source_result1_upvr_15 (readonly)
					[2]: any_source_result1_upvr_4 (readonly)
					[3]: any_source_result1_upvr_16 (readonly)
					[4]: any_source_result1_upvr_5 (readonly)
					[5]: any_useAtom_result1_upvr_11 (readonly)
					[6]: any_useAtom_result1_upvr_3 (readonly)
				]]
				if any_source_result1_upvr_15() then
					if any_source_result1_upvr_4() then
						return "Buy"
					end
				end
				if any_source_result1_upvr_16()[any_source_result1_upvr_5()] then
					if any_source_result1_upvr_5() == any_useAtom_result1_upvr_11() or any_source_result1_upvr_5() == any_useAtom_result1_upvr_3() then
						return "Equipped"
					end
					return "Equip"
				end
				return "Buy"
			end;
			TextScaled = true;
			TextColor3 = Color3.fromRGB(255, 231, 171);
			FontFace = Font.new("rbxasset://fonts/families/Oswald.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		})
	})
	tbl_37[3] = create_upvr("ImageButton")(tbl_9)
	tbl_37[4] = create_upvr("ImageButton")({
		Size = UDim2.fromScale(0.298, 0.533);
		AnchorPoint = Vector2.new(0.5, 0.5);
		BackgroundTransparency = 1;
		Image = tbl_14_upvr.BACK;
		LayoutOrder = 2;
		ImageColor3 = Color3.fromRGB(255, 0, 0);
		
		create_upvr("UIAspectRatioConstraint")({
			AspectRatio = 2.16;
		}), UiUtils_upvr.button(function() -- Line 3186
			--[[ Upvalues[5]:
				[1]: any_source_result1_upvr_14 (readonly)
				[2]: any_source_result1_upvr_5 (readonly)
				[3]: any_source_result1_upvr_4 (readonly)
				[4]: any_source_result1_upvr_15 (readonly)
				[5]: any_source_result1_upvr (readonly)
			]]
			any_source_result1_upvr_14(false)
			any_source_result1_upvr_5(nil)
			any_source_result1_upvr_4(nil)
			any_source_result1_upvr_15(false)
			any_source_result1_upvr({})
		end), create_upvr("TextLabel")({
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundTransparency = 1;
			Position = UDim2.fromScale(0.5, 0.5);
			Size = UDim2.fromScale(0.6, 0.6);
			Text = "BACK";
			TextScaled = true;
			TextColor3 = Color3.fromRGB(255, 231, 171);
			FontFace = Font.new("rbxasset://fonts/families/Oswald.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		})
	})
	local tbl_18 = {
		Size = UDim2.fromScale(1.2, 1.2);
		AnchorPoint = Vector2.new(0.5, 0.5);
	}
	local var560_upvw
	if not var560_upvw then
		var560_upvw = Vector2.new(0, 0)
	end
	local var562_upvr = true
	local var563_upvr = 0.01
	tbl_18[1] = vide_upvr.action(function(arg1_41) -- Line 85
		--[[ Upvalues[7]:
			[1]: vide_upvr (copied, readonly)
			[2]: any_source_result1_upvr_19 (readonly)
			[3]: var562_upvr (readonly)
			[4]: var560_upvw (read and write)
			[5]: any_source_result1_upvr_7 (readonly)
			[6]: var563_upvr (readonly)
			[7]: any_source_result1_upvr_6 (readonly)
		]]
		vide_upvr.effect(function() -- Line 86
			--[[ Upvalues[7]:
				[1]: any_source_result1_upvr_19 (copied, readonly)
				[2]: var562_upvr (copied, readonly)
				[3]: arg1_41 (readonly)
				[4]: var560_upvw (copied, read and write)
				[5]: any_source_result1_upvr_7 (copied, readonly)
				[6]: var563_upvr (copied, readonly)
				[7]: any_source_result1_upvr_6 (copied, readonly)
			]]
			if any_source_result1_upvr_19() then
				if var562_upvr then
					arg1_41.Position = UDim2.new(0.5 + var560_upvw.X, any_source_result1_upvr_7() * var563_upvr, 0.5 + var560_upvw.Y, any_source_result1_upvr_6() * var563_upvr)
					return
				end
				arg1_41.Position = UDim2.new(var560_upvw.X, any_source_result1_upvr_7() * var563_upvr, var560_upvw.Y, any_source_result1_upvr_6() * var563_upvr)
			end
		end)
	end)
	tbl_18.BackgroundTransparency = 1
	tbl_18.Image = tbl_14_upvr.WARNING
	tbl_18.ImageTransparency = 0.5
	function tbl_18.Visible() -- Line 3268
		--[[ Upvalues[2]:
			[1]: any_source_result1_upvr_16 (readonly)
			[2]: any_source_result1_upvr_5 (readonly)
		]]
		if any_source_result1_upvr_16()[any_source_result1_upvr_5()] then
			return false
		end
		return true
	end
	local tbl_32 = {
		BackgroundTransparency = 1;
	}
	local vector2_upvw_5 = Vector2.new(0.159, 0.446)
	if not vector2_upvw_5 then
		vector2_upvw_5 = Vector2.new(0, 0)
	end
	local var569_upvr = false
	local var570_upvr = 0.02
	tbl_32[1] = vide_upvr.action(function(arg1_42) -- Line 85
		--[[ Upvalues[7]:
			[1]: vide_upvr (copied, readonly)
			[2]: any_source_result1_upvr_19 (readonly)
			[3]: var569_upvr (readonly)
			[4]: vector2_upvw_5 (read and write)
			[5]: any_source_result1_upvr_7 (readonly)
			[6]: var570_upvr (readonly)
			[7]: any_source_result1_upvr_6 (readonly)
		]]
		vide_upvr.effect(function() -- Line 86
			--[[ Upvalues[7]:
				[1]: any_source_result1_upvr_19 (copied, readonly)
				[2]: var569_upvr (copied, readonly)
				[3]: arg1_42 (readonly)
				[4]: vector2_upvw_5 (copied, read and write)
				[5]: any_source_result1_upvr_7 (copied, readonly)
				[6]: var570_upvr (copied, readonly)
				[7]: any_source_result1_upvr_6 (copied, readonly)
			]]
			if any_source_result1_upvr_19() then
				if var569_upvr then
					arg1_42.Position = UDim2.new(0.5 + vector2_upvw_5.X, any_source_result1_upvr_7() * var570_upvr, 0.5 + vector2_upvw_5.Y, any_source_result1_upvr_6() * var570_upvr)
					return
				end
				arg1_42.Position = UDim2.new(vector2_upvw_5.X, any_source_result1_upvr_7() * var570_upvr, vector2_upvw_5.Y, any_source_result1_upvr_6() * var570_upvr)
			end
		end)
	end)
	tbl_32.Size = UDim2.fromScale(0.681, 0.164)
	tbl_32.Text = "*You dont have this character*"
	tbl_32.TextScaled = true
	tbl_32.TextColor3 = Color3.fromRGB(255, 225, 156)
	tbl_32.TextTransparency = 0.81
	tbl_32.FontFace = Font.new("rbxasset://fonts/families/RobotoCondensed.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	tbl_18[2] = create_upvr("UIGradient")({
		Color = ColorSequence.new(Color3.fromRGB(255, 175, 143), Color3.new(0, 0, 0));
	})
	tbl_18[3] = create_upvr("TextLabel")(tbl_32)
	tbl_67[1] = create_upvr("Frame")({
		Size = UDim2.fromScale(2, 2);
		BackgroundColor3 = Color3.fromRGB(0, 0, 0);
		ZIndex = -1;
	})
	tbl_67[2] = create_upvr("Frame")({
		Size = UDim2.fromScale(0.716, 1.2);
		Position = UDim2.fromScale(0.717, 0.5);
		AnchorPoint = Vector2.new(0.5, 0.5);
		BackgroundColor3 = Color3.new(0, 0, 0);
		BorderColor3 = Color3.new(0, 0, 0);
		BorderSizePixel = 0;
		ZIndex = 1;
		create_upvr("UIGradient")({
			Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.299, 0), NumberSequenceKeypoint.new(1, 0)});
		})
	})
	tbl_67[3] = create_upvr("ImageLabel")(tbl_49)
	tbl_67[4] = create_upvr("ScrollingFrame")(tbl_45)
	tbl_67[5] = create_upvr("Frame")(tbl_37)
	tbl_67[6] = create_upvr("ImageLabel")(tbl_18)
	module_3[1] = create_upvr("Frame")({
		Size = UDim2.fromScale(1, 1);
		BackgroundTransparency = 0.5;
		BackgroundColor3 = Color3.fromRGB(0, 0, 0);
		AnchorPoint = Vector2.new(0.5, 0.5);
		Position = UDim2.fromScale(0.5, 0.5);
		Visible = any_source_result1_upvr_14;
		ZIndex = 5;
		
		create_upvr("Frame")({
			Size = UDim2.fromScale(0.591, 0.793);
			BackgroundTransparency = 1;
			BackgroundColor3 = Color3.fromRGB(0, 0, 0);
			AnchorPoint = Vector2.new(0.5, 0.5);
			Position = UDim2.fromScale(0.5, 0.604);
			
			vide_upvr.action(function(arg1_4) -- Line 386
				--[[ Upvalues[6]:
					[1]: vide_upvr (copied, readonly)
					[2]: any_source_result1_upvr_14 (readonly)
					[3]: sound_upvr (copied, readonly)
					[4]: ReplicatedStorage_upvr (copied, readonly)
					[5]: SoundService_upvr (copied, readonly)
					[6]: TweenService_upvr (copied, readonly)
				]]
				vide_upvr.effect(function() -- Line 387
					--[[ Upvalues[6]:
						[1]: any_source_result1_upvr_14 (copied, readonly)
						[2]: sound_upvr (copied, readonly)
						[3]: ReplicatedStorage_upvr (copied, readonly)
						[4]: SoundService_upvr (copied, readonly)
						[5]: arg1_4 (readonly)
						[6]: TweenService_upvr (copied, readonly)
					]]
					if any_source_result1_upvr_14() then
						sound_upvr.play(ReplicatedStorage_upvr.resources.sounds["Paper SFX"], SoundService_upvr)
						arg1_4.Position = UDim2.fromScale(0.5, -1)
						TweenService_upvr:Create(arg1_4, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
							Position = UDim2.fromScale(0.5, 0.604);
						}):Play()
					end
				end)
			end), create_upvr("ScrollingFrame")({
				Size = UDim2.fromScale(1, 0.915);
				BackgroundTransparency = 1;
				AnchorPoint = Vector2.new(0, 0.5);
				Position = UDim2.fromScale(0, 0.5);
				ScrollBarThickness = 0;
				
				create_upvr("UIListLayout")({
					HorizontalAlignment = Enum.HorizontalAlignment.Center;
					Padding = UDim.new(0, 10);
				}), create_upvr("UIPadding")({
					PaddingLeft = UDim.new(0.025, 0);
				}), vide_upvr.action(function(arg1_5) -- Line 413
					--[[ Upvalues[1]:
						[1]: vide_upvr (copied, readonly)
					]]
					local class_UIListLayout_upvr = arg1_5:FindFirstChildOfClass("UIListLayout")
					if class_UIListLayout_upvr then
						vide_upvr.cleanup(class_UIListLayout_upvr:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() -- Line 417
							--[[ Upvalues[2]:
								[1]: arg1_5 (readonly)
								[2]: class_UIListLayout_upvr (readonly)
							]]
							arg1_5.CanvasSize = UDim2.new(0, 0, 0, class_UIListLayout_upvr.AbsoluteContentSize.Y)
						end))
					end
				end), vide_upvr.indexes(any_source_result1_upvr, function(arg1_6, arg2_2) -- Line 423
					--[[ Upvalues[8]:
						[1]: create_upvr (copied, readonly)
						[2]: tbl_14_upvr (copied, readonly)
						[3]: TouchEnabled_upvr (copied, readonly)
						[4]: GamepadEnabled_upvr (copied, readonly)
						[5]: tbl_12_upvr (copied, readonly)
						[6]: vide_upvr (copied, readonly)
						[7]: any_source_result1_upvr_14 (readonly)
						[8]: TweenService_upvr (copied, readonly)
					]]
					-- KONSTANTERROR: [0] 1. Error Block 32 start (CF ANALYSIS FAILED)
					local discription = arg1_6().discription
					local var156
					if not discription or discription == "" then return end
					local text_upvr = discription.text
					local skillicon_2 = arg1_6().skillicon
					local _ = {
						Size = UDim2.fromScale(1, 0);
						BackgroundTransparency = 1;
						BackgroundColor3 = Color3.fromRGB(0, 0, 0);
						AnchorPoint = Vector2.new(0.5, 0.5);
						Position = UDim2.fromScale(0.5, 0.5);
						AutomaticSize = Enum.AutomaticSize.Y;
						LayoutOrder = arg1_6().layerorder or 1;
					}
					local _ = {
						HorizontalAlignment = Enum.HorizontalAlignment.Center;
						Padding = UDim.new(0, 10);
					}
					local tbl = {}
					var156 = 0
					tbl.Size = UDim2.fromScale(0.9, var156)
					tbl.BackgroundTransparency = 1
					tbl.AutomaticSize = Enum.AutomaticSize.Y
					tbl.LayoutOrder = 3
					local tbl_22 = {}
					var156 = UDim2.fromOffset(150, 150)
					tbl_22.Size = var156
					var156 = UDim2.fromScale(0.5, 0.5)
					tbl_22.Position = var156
					var156 = tbl_14_upvr
					var156 = var156.SKILLFRAME
					tbl_22.Image = var156
					var156 = Color3.fromRGB(127, 127, 127)
					tbl_22.ImageColor3 = var156
					var156 = Enum.ScaleType.Stretch
					tbl_22.ScaleType = var156
					var156 = 1
					tbl_22.BackgroundTransparency = var156
					if skillicon_2 then
						var156 = true
					else
						var156 = false
					end
					tbl_22.Visible = var156
					var156 = "ImageLabel"
					var156 = {}
					var156.Size = UDim2.fromScale(1, 1)
					var156.Image = skillicon_2 or ""
					var156.ImageColor3 = Color3.fromRGB(255, 255, 255)
					var156.ScaleType = Enum.ScaleType.Stretch
					var156.BackgroundTransparency = 1
					tbl_22[1] = create_upvr("UIAspectRatioConstraint")({})
					tbl_22[2] = create_upvr(var156)(var156)
					local tbl_5 = {}
					var156 = "UITextSizeConstraint"
					var156 = {}
					var156.MaxTextSize = 30
					tbl_5[1] = create_upvr(var156)(var156)
					tbl_5.Size = UDim2.fromScale(1, 0)
					tbl_5.RichText = true
					tbl_5.TextScaled = true
					tbl_5.AutomaticSize = Enum.AutomaticSize.Y
					tbl_5.TextColor3 = Color3.fromRGB(255, 255, 255)
					tbl_5.TextXAlignment = Enum.TextXAlignment.Left
					tbl_5.BackgroundTransparency = 1
					if text_upvr then
						-- KONSTANTWARNING: GOTO [269] #193
					end
					-- KONSTANTERROR: [0] 1. Error Block 32 end (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [268] 192. Error Block 35 start (CF ANALYSIS FAILED)
					tbl_5.Visible = false
					local keybindname_upvr = arg1_6().keybindname
					local function Text() -- Line 514
						--[[ Upvalues[5]:
							[1]: text_upvr (readonly)
							[2]: TouchEnabled_upvr (copied, readonly)
							[3]: keybindname_upvr (readonly)
							[4]: GamepadEnabled_upvr (copied, readonly)
							[5]: tbl_12_upvr (copied, readonly)
						]]
						-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
						local var166
						-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
						-- KONSTANTERROR: [2] 3. Error Block 22 start (CF ANALYSIS FAILED)
						local var167
						if TouchEnabled_upvr or not keybindname_upvr then
							var166 = ""
						else
							local function INLINED_3() -- Internal function, doesn't exist in bytecode
								var167 = tbl_12_upvr[keybindname_upvr]
								return var167
							end
							if not GamepadEnabled_upvr or not INLINED_3() then
								var167 = keybindname_upvr
							end
							var166 = `Ability : {var167}\n`
						end
						local formatted = `{var166}{text_upvr}`
						if not formatted then
							-- KONSTANTERROR: [27] 26. Error Block 13 start (CF ANALYSIS FAILED)
							formatted = ""
							-- KONSTANTERROR: [27] 26. Error Block 13 end (CF ANALYSIS FAILED)
						end
						do
							return formatted
						end
						-- KONSTANTERROR: [2] 3. Error Block 22 end (CF ANALYSIS FAILED)
					end
					tbl_5.Text = Text
					tbl_5.FontFace = Font.new("rbxasset://fonts/families/TitilliumWeb.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
					var156 = "UIStroke"
					var156 = {}
					var156 = vide_upvr
					var156 = var156.action
					var156 = var156(function(arg1_7) -- Line 527
						--[[ Upvalues[3]:
							[1]: vide_upvr (copied, readonly)
							[2]: any_source_result1_upvr_14 (copied, readonly)
							[3]: TweenService_upvr (copied, readonly)
						]]
						vide_upvr.effect(function() -- Line 529
							--[[ Upvalues[3]:
								[1]: any_source_result1_upvr_14 (copied, readonly)
								[2]: arg1_7 (readonly)
								[3]: TweenService_upvr (copied, readonly)
							]]
							if any_source_result1_upvr_14() then
								arg1_7.MaxVisibleGraphemes = 0
								TweenService_upvr:Create(arg1_7, TweenInfo.new(math.random(5, 8), Enum.EasingStyle.Quint), {
									MaxVisibleGraphemes = #arg1_7.Text + 10;
								}):Play()
							end
						end)
					end)
					tbl_5[2] = create_upvr(var156)(var156)
					tbl_5[3] = var156
					tbl[1] = create_upvr("UIListLayout")({
						FillDirection = Enum.FillDirection.Horizontal;
						HorizontalFlex = Enum.UIFlexAlignment.Fill;
						HorizontalAlignment = Enum.HorizontalAlignment.Left;
						Padding = UDim.new(0, 20);
					})
					tbl[2] = create_upvr("ImageLabel")(tbl_22)
					tbl[3] = create_upvr("TextLabel")(tbl_5)
					local tbl_40 = {}
					var156 = 0
					tbl_40.Size = UDim2.fromScale(0.95, var156)
					tbl_40.RichText = true
					tbl_40.TextSize = 23
					tbl_40.AutomaticSize = Enum.AutomaticSize.Y
					var156 = 255
					tbl_40.TextColor3 = Color3.fromRGB(255, var156, 255)
					tbl_40.TextXAlignment = Enum.TextXAlignment.Left
					tbl_40.TextTransparency = 0.65
					tbl_40.LayoutOrder = 2
					tbl_40.BackgroundTransparency = 1
					if discription.smalldiscription then
						-- KONSTANTWARNING: GOTO [356] #256
					end
					-- KONSTANTERROR: [268] 192. Error Block 35 end (CF ANALYSIS FAILED)
				end)
			})
		})
	})
	module_3[2] = create_upvr("ImageLabel")({
		Size = UDim2.fromScale(1.2, 1.2);
		AnchorPoint = Vector2.new(0.5, 0.5);
		Position = UDim2.fromScale(0.5, 0.5);
		Image = tbl_14_upvr.TV;
		ImageColor3 = Color3.new(0, 0, 0);
		ImageTransparency = 0.93;
		ScaleType = Enum.ScaleType.Crop;
		ZIndex = 10;
		BackgroundTransparency = 1;
	})
	module_3[3] = vide_upvr.action(function(arg1_8) -- Line 650
		--[[ Upvalues[9]:
			[1]: vide_upvr (copied, readonly)
			[2]: any_source_result1_upvr_12 (readonly)
			[3]: any_source_result1_upvr_5 (readonly)
			[4]: any_source_result1_upvr_10 (readonly)
			[5]: TweenService_upvr (copied, readonly)
			[6]: any_source_result1_upvr_19 (readonly)
			[7]: any_useAtom_result1_upvr_9 (readonly)
			[8]: any_music_play_result1_upvr (readonly)
			[9]: any_music_play_result1_upvr_2 (readonly)
		]]
		vide_upvr.effect(function() -- Line 651
			--[[ Upvalues[5]:
				[1]: any_source_result1_upvr_12 (copied, readonly)
				[2]: any_source_result1_upvr_5 (copied, readonly)
				[3]: any_source_result1_upvr_10 (copied, readonly)
				[4]: TweenService_upvr (copied, readonly)
				[5]: arg1_8 (readonly)
			]]
			any_source_result1_upvr_12()
			any_source_result1_upvr_5()
			any_source_result1_upvr_10()
			TweenService_upvr:Create(arg1_8, TweenInfo.new(0.085, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), {
				Size = UDim2.fromScale(1.1, 1.1);
			}):Play()
		end)
		vide_upvr.effect(function() -- Line 662
			--[[ Upvalues[6]:
				[1]: any_source_result1_upvr_19 (copied, readonly)
				[2]: any_useAtom_result1_upvr_9 (copied, readonly)
				[3]: any_music_play_result1_upvr (copied, readonly)
				[4]: any_music_play_result1_upvr_2 (copied, readonly)
				[5]: TweenService_upvr (copied, readonly)
				[6]: arg1_8 (readonly)
			]]
			if any_source_result1_upvr_19() then
				if not any_useAtom_result1_upvr_9() then
					any_music_play_result1_upvr:Resume()
				end
				if any_music_play_result1_upvr_2 then
					TweenService_upvr:Create(any_music_play_result1_upvr_2, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
						PlaybackSpeed = 0;
					}):Play()
				end
				arg1_8.Visible = true
			else
				any_music_play_result1_upvr:Pause()
				if any_music_play_result1_upvr_2 then
					TweenService_upvr:Create(any_music_play_result1_upvr_2, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
						PlaybackSpeed = 1;
					}):Play()
				end
				task.delay(0.3, function() -- Line 689
					--[[ Upvalues[1]:
						[1]: arg1_8 (copied, readonly)
					]]
					arg1_8.Visible = false
				end)
			end
		end)
	end)
	module_3[4] = create_upvr("Frame")(tbl_16)
	module_3[5] = create_upvr("ImageLabel")(tbl_11)
	module_3[6] = create_upvr("Frame")(tbl_65)
	module_3[7] = create_upvr("Frame")(tbl_67)
	module_3[8] = characterNdiscription_upvr(any_source_result1_upvr_7, any_source_result1_upvr_6, any_source_result1_upvr_19)
	return create_upvr("Frame")(module_3)
end
return module

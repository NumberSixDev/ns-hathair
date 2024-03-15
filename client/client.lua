local previousHair = nil
local QBCore = exports['qb-core']:GetCoreObject()

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Wait(5)
	end
end

function Anim()
    loadAnimDict("clothingshirt")
    TaskPlayAnim(PlayerPedId(), "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
end

RegisterCommand("hathair", function()
    local ped = PlayerPedId()

    if previousHair == nil then
        previousHair = GetPedDrawableVariation(ped, 2)
        QBCore.Functions.Progressbar("removehair", "Removing Hair... ", 2000, false, false, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
            Anim()
        }, {}, {}, {}, function()
            QBCore.Functions.Notify("Your hair has been removed.", "success", 5000)
            SetPedComponentVariation(ped, 2, 0, 0, 0)
        end)
    else
        QBCore.Functions.Progressbar("restorehair", "Restoring Hair... ", 2000, false, false, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
            Anim()
        }, {}, {}, {}, function()
            SetPedComponentVariation(ped, 2, previousHair, 0, 0)
            QBCore.Functions.Notify("Your previous hair has been restored.", "success", 5000)
            previousHair = nil
        end)
    end
end, false)

local PlayerData = {}  -- BU SCRIPT LEVIS DEVELOPMENTS TARAFINDAN YAPILMIŞTIR. ! Onur#8448

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job

	Citizen.Wait(5000)
end)

local clientcooldown = false
local clientcooldown2 = false
local clientcooldown3 = false
local icecek = false
local icki = false
local yemek = false

Citizen.CreateThread(function()
    while true do
        local sleep = 750

        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        for k,v in pairs(LVS.IcecekReyon) do
            local distance = GetDistanceBetweenCoords(playercoords, v.x,v.y,v.z, true)
    
            if distance < 1 then
                sleep = 7
                DrawText3D(v.x,v.y,v.z, '~g~E~s~ - Reyonu Soy')
                if IsControlJustReleased(0, 38) then
                    if not clientcooldown then
                        IcecekVer()
                    else
                        ESX.ShowNotification('Bu Reyon Zaten Soyulmuş.')
                    end
                end
            end
        end

        for k,v in pairs(LVS.IckiReyon) do
            local distance2 = GetDistanceBetweenCoords(playercoords, v.x,v.y,v.z, true)

            if distance2 < 1 then
                sleep = 7
                DrawText3D(v.x,v.y,v.z, '~g~E~s~ - Reyonu Soy')
                if IsControlJustReleased(0, 38) then
                    if not clientcooldown2 then
                        IckiVer()
                    else
                        ESX.ShowNotification('Bu Reyon Zaten Soyulmuş.')
                    end
                end
            end
        end
    
        for k,v in pairs(LVS.YiyecekReyon) do
            local distance3 = GetDistanceBetweenCoords(playercoords, v.x,v.y,v.z, true)

            if distance3 < 1 then
                sleep = 7
                DrawText3D(v.x,v.y,v.z, '~g~E~s~ - Reyonu Soy')
                if IsControlJustReleased(0, 38) then
                    if not clientcooldown3 then
                        YemekVer()
                    else
                        ESX.ShowNotification('Bu Reyon Zaten Soyulmuş.')
                    end
                end 
            end
        end

        Citizen.Wait(sleep)
    end
end)

function IcecekVer()
    if not icecek then
        icecek = true
        exports['mythic_progbar']:Progress({
            name = "icecekler",
            duration = 6000,
            label = 'İçecek Reyonu Soyuluyor [DEL]',
            useWhileDead = false,
            canCancel = true,
             controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = "amb@prop_human_bum_bin@idle_a",
                anim = "idle_a",
                flags = 49,
            },
        }, function(cancelled)
            if not cancelled then
                TriggerServerEvent('lvs_reyon:icecekver')
                icecek = false
                ESX.ShowNotification('İçecek Reyonu Soydun!')
                clientcooldown = true
                Citizen.Wait(LVS.CoolDown)
                clientcooldown = false
            end
        end)
    end
end

function IckiVer()
    if not icki then
        icki = true
        exports['mythic_progbar']:Progress({
            name = "ickiler",
            duration = 6000,
            label = 'İçki Dolabı Soyuluyor [DEL]',
            useWhileDead = false,
            canCancel = true,
             controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = "amb@prop_human_bum_bin@idle_a",
                anim = "idle_a",
                flags = 49,
            },
        }, function(cancelled)
            if not cancelled then
                TriggerServerEvent('lvs_reyon:ickiver')
                icki = false
                ESX.ShowNotification('İçki Dolabını Soydun!')
                clientcooldown2 = true
                Citizen.Wait(LVS.CoolDown)
                clientcooldown2 = false
            end
        end)
    end
end

function YemekVer()
    if not yemek then
        yemek = true
        exports['mythic_progbar']:Progress({
            name = "yemek",
            duration = 6000,
            label = 'Yiyecek Dolabı Soyuluyor [DEL]',
            useWhileDead = false,
            canCancel = true,
             controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = "amb@prop_human_bum_bin@idle_a",
                anim = "idle_a",
                flags = 49,
            },
        }, function(cancelled)
            if not cancelled then
                TriggerServerEvent('lvs_reyon:yemekver')
                yemek = false
                ESX.ShowNotification('Yiyecek Dolabını Soydun!')
                clientcooldown3 = true
                Citizen.Wait(LVS.CoolDown)
                clientcooldown3 = false
            end
        end)
    end
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

-- BU SCRİPT LEVİS DEVELOPMENTS TARAFINDAN YAPILMIŞTIR 
-- TEKNİK DESTEK İÇİN : https://discord.gg/7dDuKTu7NG , ! Onur#8448
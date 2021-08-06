ESX = nil 
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('lvs_reyon:gereklipolis', function(source, cb)
	local xPlayers = ESX.GetPlayers()

	copConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' or  xPlayer.job.name == 'sheriff' then
			copConnected = copConnected + 1
		end
	end

	cb(copConnected)
end)

RegisterServerEvent('lvs_reyon:icecekver')
AddEventHandler('lvs_reyon:icecekver', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getQuantity('water', 4) then
        xPlayer.addInventoryItem('water', 2)
        xPlayer.addInventoryItem('icetea', 1)
        xPlayer.addInventoryItem('redbul', 1)
    else
        TriggerClientEvent('esx:showNotification', src, 'Üzerinde bunu taşıyacak yer yok!')
    end
end)      

RegisterServerEvent('lvs_reyon:ickiver')
AddEventHandler('lvs_reyon:ickiver', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getQuantity('sarap', 4) then
        xPlayer.addInventoryItem('sarap', 2)
        xPlayer.addInventoryItem('vodka', 1)
        xPlayer.addInventoryItem('whisky', 1)
    else
        TriggerClientEvent('esx:showNotification', src, 'Üzerinde bunu taşıyacak yer yok!')
    end
end) 

RegisterServerEvent('lvs_reyon:yemekver')
AddEventHandler('lvs_reyon:yemekver', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getQuantity('bread', 4) then
        xPlayer.addInventoryItem('hotdog', 2)
        xPlayer.addInventoryItem('tost', 1)
        xPlayer.addInventoryItem('hamburger', 1)
    else
        TriggerClientEvent('esx:showNotification', src, 'Üzerinde bunu taşıyacak yer yok!')
    end
end)

-- BU SCRİPT LEVİS DEVELOPMENTS TARAFINDAN YAPILMIŞTIR 
-- TEKNİK DESTEK İÇİN : https://discord.gg/7dDuKTu7NG , ! Onur#8448
ESX = nil

local fly = false

RegisterCommand("fly", function(source, args, rawcommand)
    fly = not fly
    if fly then
        ESX.ShowNotification("Fly activé")
        ESX.ShowNotification("Appuyez sur Espace pour monter, CTRL pour descendre, A pour tourner à gauche, D pour tourner à droite")
        Citizen.Wait(30000)
        ESX.ShowNotification("Il reste 30 secondes de fly")
        Citizen.Wait(10000)
        ESX.ShowNotification("Il reste 10 secondes de fly")
        Citizen.Wait(5000)
        ESX.ShowNotification("Il reste 5 secondes de fly")
        Citizen.Wait(2000)
        ESX.ShowNotification("Il reste 3 secondes de fly")
        Citizen.Wait(1000)
        ESX.ShowNotification("Il reste 2 secondes de fly")
        Citizen.Wait(1000)
        ESX.ShowNotification("Il reste 1 secondes de fly")
        Citizen.Wait(1000)
        ESX.ShowNotification("Fly désactivé")
        fly = not fly
    else
        ESX.ShowNotification("Fly désactivé")
    end
end, false)


Citizen.CreateThread(function()
    while true do
    if fly then
        SetEntityInvincible(PlayerPedId(), true)
        local ped = PlayerPedId()
        local coord = GetEntityCoords(ped)
        local phead = GetEntityHeading(ped)
        local CamRot = GetGameplayCamRot(2)
        local force = 0.1
        local Fx = -( math.sin(math.rad(CamRot.z)) * force*8 )
		local Fy = ( math.cos(math.rad(CamRot.z)) * force*8 )
        
		local Fz = force * (CamRot.x*0.2)
        if IsControlPressed(1, 51) then
        ApplyForceToEntity(ped, 1, Fx, Fy,Fz + 3, 0,0,0, true, false, true, true, true, true)
        TaskParachute(ped, true)
        end
        if IsControlPressed(1, 34) then
            SetEntityHeading(ped, phead + 2)
        end
        if IsControlPressed(1, 30) then
            SetEntityHeading(ped, phead - 2)
        end    
    end
    Citizen.Wait(1)
    end

end)

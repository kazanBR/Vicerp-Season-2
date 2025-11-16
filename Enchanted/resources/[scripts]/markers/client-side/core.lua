-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("markers")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Markers = {}
local Players = {}
local Pause = false
local Active = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- INFORMATION
-----------------------------------------------------------------------------------------------------------------------------------------
local Information = {
    Militar = {
        ["Coronel"] = 1,
        ["Tenente-Coronel"] = 2,
        ["Major"] = 3,
        ["Capitão"] = 4,
        ["1º Tenente"] = 5,
        ["2º Tenente"] = 6,
        ["Aspirante"] = 7,
        ["Subtenente"] = 8,
        ["1º Sargento"] = 9,
        ["2º Sargento"] = 10,
        ["3º Sargento"] = 11,
        ["Cabo"] = 12,
        ["Soldado"] = 13,
        ["Recruta"] = 14,
        ["Delegada"] = 15
    },
    Rota = {
        ["Coronel"] = 16,
        ["Tenente-Coronel"] = 17,
        ["Major"] = 18,
        ["Capitão"] = 19,
        ["1º Tenente"] = 20,
        ["2º Tenente"] = 21,
        ["Aspirante"] = 22,
        ["Subtenente"] = 23,
        ["1º Sargento"] = 24,
        ["2º Sargento"] = 25,
        ["3º Sargento"] = 26,
        ["Cabo"] = 27,
        ["Soldado"] = 28,
        ["Recruta"] = 29,
        ["Delegada"] = 30
    },
    Civil = {
        ["Coronel"] = 31,
        ["Tenente-Coronel"] = 32,
        ["Major"] = 33,
        ["Capitão"] = 34,
        ["1º Tenente"] = 35,
        ["2º Tenente"] = 36,
        ["Aspirante"] = 37,
        ["Subtenente"] = 38,
        ["1º Sargento"] = 39,
        ["2º Sargento"] = 40,
        ["3º Sargento"] = 41,
        ["Cabo"] = 42,
        ["Soldado"] = 43,
        ["Recruta"] = 44,
        ["Delegada"] = 45
    },
    Federal = {
        ["Coronel"] = 46,
        ["Tenente-Coronel"] = 47,
        ["Major"] = 48,
        ["Capitão"] = 49,
        ["1º Tenente"] = 50,
        ["2º Tenente"] = 51,
        ["Aspirante"] = 52,
        ["Subtenente"] = 53,
        ["1º Sargento"] = 54,
        ["2º Sargento"] = 55,
        ["3º Sargento"] = 56,
        ["Cabo"] = 57,
        ["Soldado"] = 58,
        ["Recruta"] = 59,
        ["Delegada"] = 60
    },
    PRF = {
        ["Coronel"] = 61,
        ["Tenente-Coronel"] = 62,
        ["Major"] = 63,
        ["Capitão"] = 64,
        ["1º Tenente"] = 65,
        ["2º Tenente"] = 66,
        ["Aspirante"] = 67,
        ["Subtenente"] = 68,
        ["1º Sargento"] = 69,
        ["2º Sargento"] = 70,
        ["3º Sargento"] = 71,
        ["Cabo"] = 72,
        ["Soldado"] = 73,
        ["Recruta"] = 74,
        ["Delegada"] = 75
    },
    Paramedico = {
        ["Diretor-Geral"] = 76,
        ["Diretor Clínico"] = 77,
        ["Diretor Técnico"] = 78,
        ["Chefe de Corpo Clínico"] = 79,
        ["Médico Supervisor"] = 80,
        ["Médico Cirurgião"] = 81,
        ["Médico Plantonista"] = 82,
        ["Médico Especialista"] = 83,
        ["Médico Clínico"] = 84,
        ["Residente"] = 85,
        ["Enfermeiro"] = 86,
        ["Técnico de Enfermagem"] = 87,
        ["Auxiliar de Enfermagem"] = 88,
        ["Estagiário de Medicina"] = 89,
        ["Estagiário de Enfermagem"] = 90
    },
    Corredor = {
        ["Corredor"] = 91
    },
    Traficante = {
        ["Traficante"] = 92
    },
    Boosting = {
        ["Boosting"] = 93
    }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADMARKERS
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Index,_ in pairs(Information) do
		AddStateBagChangeHandler(Index,("player:%s"):format(LocalPlayer["state"]["Source"]),function(Name,Key,Value)
			Active = Key

			if not Value then
				Active = false
				CleanMarkers()
			end
		end)
	end

	while true do
		local TimeDistance = 999
		if LocalPlayer["state"]["Active"] and Active and Information[Active] then
			if IsPauseMenuActive() then
				if not Pause then
					CleanMarkers()
					Pause = true
				end

				local Users = vSERVER.Users()
				for Index,v in pairs(Users) do
					if Information[v.Permission] and Information[v.Permission][v.Level] and ((LocalPlayer["state"]["Paramedico"] and v.Permission == "Paramedico") or (CheckPolice() and v.Permission ~= "Paramedico")) then
						if Markers[Index] then
							async(function()
								MoveBlipSmooth(Markers[Index],v.Coords)
							end)
						else
							Markers[Index] = AddBlipForCoord(v.Coords)
							SetBlipSprite(Markers[Index],v.Vehicle ~= 0 and 225 or 1)
							SetBlipDisplay(Markers[Index],4)
							SetBlipAsShortRange(Markers[Index],false)
							SetBlipColour(Markers[Index],Information[v.Permission][v.Level])
							SetBlipScale(Markers[Index],0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString("! "..v.Permission.." : "..v.Level)
							EndTextCommandSetBlipName(Markers[Index])
						end
					end
				end
			else
				if Pause then
					CleanMarkers()
					Pause = false
				end

				local Ped = PlayerPedId()
				if IsPedInAnyVehicle(Ped) then
					TimeDistance = 100

					local List = GetPlayers()
					for Index,v in pairs(Players) do
						if List[Index] then
							if not Markers[Index] and Information[v.Permission] and Information[v.Permission][v.Level] and ((LocalPlayer["state"]["Paramedico"] and v.Permission == "Paramedico") or (CheckPolice() and v.Permission ~= "Paramedico")) then
								local Source = GetPlayerFromServerId(Index)
								local Ped = GetPlayerPed(Source)

								Markers[Index] = AddBlipForEntity(Ped)
								SetBlipSprite(Markers[Index],IsPedInAnyVehicle(Ped) and 225 or 1)
								SetBlipDisplay(Markers[Index],4)
								SetBlipAsShortRange(Markers[Index],false)
								SetBlipColour(Markers[Index],Information[v.Permission][v.Level])
								SetBlipScale(Markers[Index],0.5)
								BeginTextCommandSetBlipName("STRING")
								AddTextComponentString("! "..v.Permission.." : "..v.Level)
								EndTextCommandSetBlipName(Markers[Index])
							end
						else
							if Markers[Index] then
								if DoesBlipExist(Markers[Index]) then
									RemoveBlip(Markers[Index])
								end

								Markers[Index] = nil
							end
						end
					end
				end
			end
		end

		Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETPLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------
function GetPlayers()
	local Selected = {}
	local GamePool = GetGamePool("CPed")

	for _,Entity in ipairs(GamePool) do
		if IsPedAPlayer(Entity) then
			local Index = NetworkGetPlayerIndexFromPed(Entity)
			if Index and NetworkIsPlayerConnected(Index) then
				Selected[GetPlayerServerId(Index)] = Entity
			end
		end
	end

	return Selected
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLEANMARKERS
-----------------------------------------------------------------------------------------------------------------------------------------
function CleanMarkers()
	for _,v in pairs(Markers) do
		if DoesBlipExist(v) then
			RemoveBlip(v)
		end
	end

	Markers = {}
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MOVEBLIPSMOOTH
-----------------------------------------------------------------------------------------------------------------------------------------
function MoveBlipSmooth(Blip,Coords)
	if not DoesBlipExist(Blip) then
		return false
	end

	local Timer = 0.0
	local Init = GetBlipCoords(Blip)
	local LastUpdate = GetGameTimer()

	while Timer < 1.0 do
		local CurrentTime = GetGameTimer()
		if CurrentTime - LastUpdate > 10 then
			LastUpdate = CurrentTime
			Timer = Timer + 0.01

			SetBlipCoords(Blip,Init + (Coords - Init) * Timer)
		end

		Wait(1)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MARKERS:ADD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("markers:Add")
AddEventHandler("markers:Add",function(Source,Table)
	Players[Source] = Table
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MARKERS:FULL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("markers:Full")
AddEventHandler("markers:Full",function(Table)
	Players = Table
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MARKERS:REMOVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("markers:Remove")
AddEventHandler("markers:Remove",function(Source)
	if Players[Source] then
		if Markers[Source] then
			if DoesBlipExist(Markers[Source]) then
				RemoveBlip(Markers[Source])
			end

			Markers[Source] = nil
		end

		Players[Source] = nil
	end
end)
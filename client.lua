door1 = GetHashKey("prop_strip_door_01")
door1name = "prop_strip_door_01"
door1dec = 3178925983
coords = vector3(127.9552, -1298.503, 29.41962)

Citizen.CreateThread(function()
        if Citizen.InvokeNative(0xC153C43EA202C8C1, door1dec) then -- IS_DOOR_REGISTERED_WITH_SYSTEM
            print(door1)
            print(door1name)
            print("removed")
            Citizen.InvokeNative(0x464D8E1427156FE4, door1dec) -- REMOVE_DOOR_FROM_SYSTEM
        else
            Citizen.InvokeNative(0x6F8838D03D1DC226, door1dec, door1name, coords, 0, true, 0) -- ADD_DOOR_TO_SYSTEM
            print("dooraddedtosystem")
        end

        Citizen.Wait(3000) -- 3 sec

        if Citizen.InvokeNative(0xC153C43EA202C8C1, door1dec) then -- IS_DOOR_REGISTERED_WITH_SYSTEM
            print("door is registered")
            Citizen.Wait(3000) -- 3 sec
            
            if Citizen.InvokeNative(0xDF97CDD4FC08FD34, door1dec) then --DOOR_SYSTEM_GET_IS_PHYSICS_LOADED
                print("true")
                getstate = Citizen.InvokeNative(0x160AA1B32F6139B8, door1dec) -- DOOR_SYSTEM_GET_DOOR_STATE
                getratio = Citizen.InvokeNative(0x65499865FCA6E5EC , door1dec) -- DOOR_SYSTEM_GET_OPEN_RATIO
                print(getstate)
                print(getratio)

                Citizen.InvokeNative(0x6BAB9442830C7F53, door1dec, 1, true, true) -- DOOR_SYSTEM_SET_DOOR_STATE
            else
                print("false")
            end
        else
            Citizen.InvokeNative(0x870DDFD5A4A796E4, door1dec) -- NETWORK_REQUEST_CONTROL_OF_DOOR
            Citizen.Trace('requesting network control' .. '\n')
        end
end)

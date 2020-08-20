-- RECURSO CREADO PARA EL SERVIDOR RP DESPERADOSRP.COM --
-- Implementado por Mapachito

Inventory = exports.vorp_inventory:vorp_inventoryApi()
--local data = {}
--local count = VorpInv.getItemCount(source, "bread")
----TriggerEvent("vorpCore:getItemCount",function(call)
--    --data = call
----end)

RegisterServerEvent('ranch:moonshine')
AddEventHandler("ranch:moonshine", function(name, weapon)
    local _source = tonumber(source)
    TriggerEvent('vorp:getCharacter', _source, function(user)
        local count = Inventory.getItemCount(_source, "sugar")
        local count2 = Inventory.getItemCount(_source, "water")
        local count3 = Inventory.getItemCount(_source, "soborno")
		--local count = data.checkItem(_source, "sugar")
		--local count2 = data.checkItem(_source, "water")
		if count >= 2 and count2 >= 2 and count3 then		    
            Inventory.subItem(_source,"sugar", 2) -- number of water u need
            Inventory.subItem(_source,"water", 2)
            Inventory.subItem(_source,"soborno", 1) -- number of water u need
			--data.delItem(_source,"sugar", 25)
			--data.delItem(_source,"water", 10)			
            TriggerClientEvent('shiner:moonshine', _source)
            Citizen.Wait(26000)		  
            Inventory.addItem(_source,"moonshine", 1)
            --data.addItem(_source,"moonshine", 10)
            TriggerClientEvent("vorp:NotifyLeft", source, "Alcohol destilado", 2, "success")
        else
            TriggerClientEvent("vorp:NotifyLeft", _source, 'Buen intento, casi lo consigues', 3)
        end
    end)
end)
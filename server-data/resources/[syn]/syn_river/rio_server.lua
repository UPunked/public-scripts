local VORPInv = {}

local VORPInv = exports.vorp_inventory:vorp_inventoryApi()

-- When the player drinks from the well
RegisterServerEvent('playerDrank')
AddEventHandler('playerDrank', function()
    local source = source
    local emptyBottle = "Empty_Bottle" --change to your item name
    local fullWater = "Well_Water"-- change to your item name

    -- Check if the player has an empty bottle in their inventory
    if VORPInv.getItemCount(source, emptyBottle) > 0 then
        -- Remove an empty bottle from the player's inventory
        VORPInv.subItem(source, emptyBottle, 1)

        -- Add a full water bottle to the player's inventory
        VORPInv.addItem(source, fullWater, 1)
    else
        -- If the player doesn't have an empty bottle in their inventory, send them a notification
        TriggerClientEvent('notification', source, 'You need an empty bottle to drink water!')
    end
end)



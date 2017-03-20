local downgrade = RegisterMod("Downgrade", 1)
local game = Game()

downgrade_item = Isaac.GetItemIdByName("Downgrade")

function downgrade:use_downgrade( )
	local	player = Isaac.GetPlayer( 0 )
	local	entities = Isaac.GetRoomEntities( )
	for i = 1, #entities do
		if entities[ i ]:IsActiveEnemy(false) then
      if entities[i].Type == EntityType.ENTITY_ATTACKFLY then
        entities[i]:ToNPC():Morph(EntityType.ENTITY_FLY,1,0,0)
      end
      if entities[i].Type == EntityType.ENTITY_MOTER then
        entities[i]:ToNPC():Morph(EntityType.ENTITY_ATTACKFLY,1,0,0)
      end
		end
	end
end

downgrade:AddCallback( ModCallbacks.MC_USE_ITEM, downgrade.use_downgrade, downgrade_item );

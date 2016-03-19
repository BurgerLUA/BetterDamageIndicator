util.AddNetworkString( "BDI_SendToClient" )

function BDI_ScalePlayerDamage(victim,hitgroup,dmginfo)

	local RealAttacker = dmginfo:GetAttacker()
	
	if not RealAttacker then
		RealAttacker = dmginfo:GetInflictor()
	end

	local Position = RealAttacker:GetPos() + RealAttacker:OBBCenter()
	local Damage = dmginfo:GetDamage()
	
	net.Start("BDI_SendToClient")
		net.WriteVector(Position)
		net.WriteFloat(Damage)
	net.Send(victim)
	
end

hook.Add("ScalePlayerDamage","BDI: ScalePlayerDamage",BDI_ScalePlayerDamage)
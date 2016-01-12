print("BDI Server Loaded!")

util.AddNetworkString( "BDI_SendToClient" )

function BDI_ScalePlayerDamage(victim,hitgroup,dmginfo)

	local Position = dmginfo:GetAttacker():GetShootPos() or dmginfo:GetAttacker():GetPos() + dmginfo:GetAttacker():OBBCenter()
	local Damage = dmginfo:GetDamage()
	
	net.Start("BDI_SendToClient")
		net.WriteVector(Position)
		net.WriteFloat(Damage)
	net.Send(victim)
	
end

hook.Add("ScalePlayerDamage","BDI: ScalePlayerDamage",BDI_ScalePlayerDamage)
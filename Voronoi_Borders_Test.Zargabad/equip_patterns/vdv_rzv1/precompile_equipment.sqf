if (!isServer) exitWith {};
bn_equip_vdv_rzv1_rifleman_vss = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\rifleman_vss.sqf';
bn_equip_vdv_rzv1_ace_med = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\ace_med.sqf';
bn_equip_vdv_rzv1_ak74 = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\ak74.sqf';
bn_equip_vdv_rzv1_ak74m = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\ak74m.sqf';
bn_equip_vdv_rzv1_ak74m_ammo = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\ak74m_ammo.sqf';
bn_equip_vdv_rzv1_assistant = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\assistant.sqf';
bn_equip_vdv_rzv1_gp = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\gp.sqf';
bn_equip_vdv_rzv1_leader = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\leader.sqf';
bn_equip_vdv_rzv1_medical_backpack_ace = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\medical_backpack_ace.sqf';
bn_equip_vdv_rzv1_nsv_one = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\nsv_one.sqf';
bn_equip_vdv_rzv1_nsv_three = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\nsv_three.sqf';
bn_equip_vdv_rzv1_nsv_two = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\nsv_two.sqf';
bn_equip_vdv_rzv1_officer = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\officer.sqf';
bn_equip_vdv_rzv1_pkm = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\pkm.sqf';
bn_equip_vdv_rzv1_pkm_ass = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\pkm_ass.sqf';
bn_equip_vdv_rzv1_rifleman = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\rifleman.sqf';
bn_equip_vdv_rzv1_rifleman_assistant = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\rifleman_assistant.sqf';
bn_equip_vdv_rzv1_rifleman_crew = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\rifleman_crew.sqf';
bn_equip_vdv_rzv1_rifleman_gp = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\rifleman_gp.sqf';
bn_equip_vdv_rzv1_rifleman_marksman = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\rifleman_marksman.sqf';
bn_equip_vdv_rzv1_rifleman_marksman2 = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\rifleman_marksman2.sqf';
bn_equip_vdv_rzv1_rifleman_med = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\rifleman_med.sqf';
bn_equip_vdv_rzv1_rifleman_pbs = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\rifleman_pbs.sqf';
bn_equip_vdv_rzv1_rifleman_pkm = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\rifleman_pkm.sqf';
bn_equip_vdv_rzv1_rifleman_pkm_ass = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\rifleman_pkm_ass.sqf';
bn_equip_vdv_rzv1_rifleman_rpg26 = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\rifleman_rpg26.sqf';
bn_equip_vdv_rzv1_rifleman_rpg7 = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\rifleman_rpg7.sqf';
bn_equip_vdv_rzv1_rifleman_rpg7_ass = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\rifleman_rpg7_ass.sqf';
bn_equip_vdv_rzv1_rifleman_rpk = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\rifleman_rpk.sqf';
bn_equip_vdv_rzv1_rifleman_sap = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\rifleman_sap.sqf';
bn_equip_vdv_rzv1_rpg7 = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\rpg7.sqf';
bn_equip_vdv_rzv1_rpg7_ammo = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\rpg7_ammo.sqf';
bn_equip_vdv_rzv1_rpk = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\rpk.sqf';
bn_equip_vdv_rzv1_soldier_base = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\soldier_base.sqf';
bn_equip_vdv_rzv1_spg_one = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\spg_one.sqf';
bn_equip_vdv_rzv1_spg_three = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\spg_three.sqf';
bn_equip_vdv_rzv1_spg_two = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\spg_two.sqf';
bn_equip_vdv_rzv1_squad_leader = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\squad_leader.sqf';
bn_equip_vdv_rzv1_Zrk = compile preprocessFileLineNumbers 'equip_patterns\vdv_rzv1\zrk.sqf';
//Insert the following (uncommented) lines into description.sqf:
/*class CfgFunctions
{
	class bn
	{
		class myCategory
		{
			class campaign_vdv_rzv1_preInit {
				file = 'equip_patterns\vdv_rzv1\precompile_equipment.sqf';
				preInit = 1;
			};
		};
	};
};*/
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCORD
-----------------------------------------------------------------------------------------------------------------------------------------
local Discord = {
	Connect = "https://discord.com/api/webhooks/1405964199544356975/pXfKllltahjU_l1UU6XG5DcV1Vey5FJClMMKxYim0xvbIlpkMJwR3EwIm58f8aN96FmK",
	Disconnect = "https://discord.com/api/webhooks/1405964385985499266/RQlSKIaZOXNezSK-jyDwgmCidpW6f1DDsLfCez7HxyQO8MAR_cIe6p74qdG2uaP4YfEJ",
	Airport = "https://discord.com/api/webhooks/1406186227740315749/ZyldGoYdZHeXdtXz2lv2rGwouof5MWRoq3xWK45sObyppyXys_GpzQrON-QDRTGWQHZo",
	Deaths = "https://discord.com/api/webhooks/1406186463854592071/3CmwlSUP4-SxvJy1FG_xqVnSA0FnWigUUyzgO7TWq_4E_fAAMZ39XB2G1XYx_UWypdB7",
	Gemstone = "https://discord.com/api/webhooks/1406186808127262740/hF4mne1NRxuA1woae8whhDsRIhi16PPO12yeGNd0dzfc8dW2geZai9la8-RsbIoTehk5",
	Rename = "https://discord.com/api/webhooks/1406186967447896144/pY7wONIiqmZuaIqQ0dGMXkBrvOA0lkwDs7jWxgUAoiFwnL0kpD1ydOA_pEH0zyFXMfWv",
	Roles = "https://discord.com/api/webhooks/1406186918991102012/ncPliZRoBWsunsaSMU7DyhF8clw47mmycPMUrexQ1S3LGYMPTPJg4ZqVeAxHu1gYDRuS",
	Weaponskins = "https://discord.com/api/webhooks/1406187783617253416/NWWgLQO_jWklD5ZFjvH1KTD_V-d_tEGguMp2YfJPfXHr03YTM6Z2wbcReFcB4SR41DP6",
	Marketplace = "https://discord.com/api/webhooks/1406187949908820021/hx1Xy7KsxmB08AZ4p93XqUDBl7aOJzbo6Y3tQkNo8ahrPjDEEizuU6_gp_QLmZwDOfYg",
	Shopping = "https://discord.com/api/webhooks/1406188085938622536/hnkNVrThPCMmlb_CxrPbnyOPksHfUUclUE2pI6Gtnt_nFCrF5jlQA9GV6A0OlpZHXVhd",
	Boxes = "https://discord.com/api/webhooks/1406188393402077275/LmpDwKa9DuZWdvACjY2tFpkBAPunbvp0iPeEbSETpJALjNdBGxsMnIUVQ6DJudmdQRxg",
	Battlepass = "https://discord.com/api/webhooks/1406188581491445801/dYTYiUlf9R7XUxgURAyeS-LFxpGqyKcwqhHdrsP5HQu7MjIiCndp6CvUkn2swFZnYx8r",
	Hackers = "https://discord.com/api/webhooks/1406188698026115082/uAz860hQ8kWlclBjVKrsTmuM8MpTnk6sSaBC-ol4zptRvt9GtBY8TVlZLQZbLeGqSCoL",
	Skin = "https://discord.com/api/webhooks/1406188889651155077/LvEi8KlwUsDph4hmaZ1pdoY-6PF9E-v2zBlwFP8KNYvgdJNm4Wt8gzSn_Z5VyCwJmwbL",
	ClearInv = "https://discord.com/api/webhooks/1406189006168916128/cithVUj1OfpTQg1tHhkLYdqifkfTwe_RW5nBRnroKPKINGKyQpadrQ4g5KBLTBxpfCRY",
	Dima = "https://discord.com/api/webhooks/1406189106056269884/MiQ6T8i2y9sQi_rpaxgJnrmhINE4gmiGYNjAaY-H5zBGsqi3eJsCmDbP2ePtIexv-AQT",
	God = "https://discord.com/api/webhooks/1406189356875776082/caagp9D72rhRB89r_Rk7iBcrjm8MUsoJDwOa8k4eV0K0lfmZ2aXJfn56_ZARSMp4LZDw",
	Item = "https://discord.com/api/webhooks/1406189493874196490/_8qmMkjbGSKJMrkOH3qCQoukuhoqSc4b2NpNV_-OPnl2MBw1YCA8wknBxHrERGPBSQJI",
	Delete = "https://discord.com/api/webhooks/1406189860531736697/ZrfmW4q63XkObSJ93lTdtE5Ikzo1IBILz5QfzOLrBXqzfJZNkWe3e1Da6ywteE0PNPpX",
	Kick = "https://discord.com/api/webhooks/1406189987493580860/ADWR_N9kUCfAN7Ip-SOmQVXzgkCFdaFqiw9tUqMXnyg6IefF4_T1hhEXNpcbVVKbewIU",
	Ban = "https://discord.com/api/webhooks/1406190144754815068/AXGKJq64PXtJC3jmcagmkpEIb9Ij0NQOz9LYKmdvvL9N2A5ATMlCbMdjY8yggrJh9kZr",
	Group = "https://discord.com/api/webhooks/1406190355329843220/9Y7X0VksKYbWjejY499cKZvwJoLB_qhiD8FNgySsNw0KPrjb4oj7qVbZEoZ7jeP3zzl5",
	AddCar = "https://discord.com/api/webhooks/1406190485466251365/EyJhuSZrVm2g6RMhla6t-m0Mr1KqyW-egLHo2Mcwf6W7Nd4X16LKo0__NUHQKFWC32-W",
	Print = "https://discord.com/api/webhooks/1406190878955143259/2101r9Yw6rsOCnQSoBHfmFlguJI1PFUADp1ulpow9t7RWCtteRwc2M8H5TW6GTrG_gSe",
	Permissions = "https://discord.com/api/webhooks/1406191137185726474/bHc-JV2YxYhLhq-SVHJ24EWZQtKezgw8CvMdnbIdZytjSFWwhGKiK8HXMGQeIC5kXlte",
	Sprays = "https://discord.com/api/webhooks/1406191319189028904/h1S24H0SyZPgSyoWWq_Oe1MD0-YjhYTdURnHzZV8d_Z4Ri-w07WS4OFItAOiDPbqsgxG",
	Daily = "https://discord.com/api/webhooks/1406191664573452298/yP0skeXSlyz8o5dvjvnciHmd-0vSZPOHvHQqHAcUXGKbum1ZBOAsYixqe-Ej8WWTjs64",
	Premium = "https://discord.com/api/webhooks/1406192907727409263/MFVQYNDLE5lpGAdugY7leL3S86xKv2e5r48VABV5ivaWIG2C1hChnFnVvuuCP-01ZlhK",
	Chest = "https://discord.com/api/webhooks/1406193476542005331/bcOjWRr2RKxA5mIb8CBzIPVcOLQU9DgwiBgEXGGaEr3sZXVjilYIMGyI9XJqngSEdwdd",
	Propertys = "https://discord.com/api/webhooks/1406194382159482982/RYOcVd2QivE7rASeounRoalAwJTb4w0lHlw52RrYaPh8ulFCi0pnGmi2WNy45WhOD1TY",
	Crons = "https://discord.com/api/webhooks/1406194998449279208/snccBZDrNlVEGsbS_c2BtKMr0zOtP3PesiZOaiX7SavZD-sS-lafKSy_3joQEVO2XTtM",
	Races = "https://discord.com/api/webhooks/1406195623627325541/1L6Ybp6Dj667oAcWctwd4JuABpGTpg2W8xWd_gDQgLUpUz3zopHKTIs_KtSDpdJMURH5",
	Pdm = "https://discord.com/api/webhooks/1406196417076396042/Wl2805XfMS6H1X9xfPC3qGQHh0hjnhRrLDobV36QDjdtocNIELlxV-yBXYd7lhlGgc-Z",
	Domination = "https://discord.com/api/webhooks/1406196807314309240/Nkdqm6Sahrog4TX3CnZIvoW6YHKr8CfWIbvICyqi1MX1kmurGzZESERAey18kG9bw-zU",
	Luckywheel = "https://discord.com/api/webhooks/1406197567833768006/PwhKN-Z3aH3qh71-4AAGSJCfptxrLiDOsz98xvIA_AoXuzI3hUy9qjz7lIyvNU1VSzad",
	Send = "https://discord.com/api/webhooks/1406198054888935464/a6t5EOHnEUMsdd7c-dU8uj7xDRqrJY2dI3lQcVAjywQNGSxVdT3451T93UBAk3i782SU",
	Referral = "https://discord.com/api/webhooks/1408971499439653017/nqS8kdaPLQfQBIdIWfPs2_ss3k3Aim6mujjjlHBQIt0FfAVIkmdq1mIwOgntIJYWapPe",
	Inspect = "https://discord.com/api/webhooks/1438500663255498793/7yzi4AESwnV-Zud6GMVElTXFu9o2b9PpP6VqT3BnyuXzObWasSNg9y0wRFDBixf4QWFf"
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- EMBED
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Embed",function(Hook,Message,source)
	PerformHttpRequest(Discord[Hook],function() end,"POST",json.encode({
		username = ServerName,
		avatar_url = ServerAvatar,
		embeds = {
			{
				color = 6171009,
				description = Message,
				footer = {
					icon_url = ServerAvatar,
					text = os.date("%d/%m/%Y %H:%M:%S")
				}
			}
		}
	}),{ ["Content-Type"] = "application/json" })

	if source then
		TriggerClientEvent("megazord:Screenshot",source,Discord[Hook])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONTENT
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Content",function(Hook,Message)
	PerformHttpRequest(Discord[Hook],function() end,"POST",json.encode({
		username = ServerName,
		content = Message
	}),{ ["Content-Type"] = "application/json" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Webhook",function(Hook)
	return Discord[Hook] or ""
end)
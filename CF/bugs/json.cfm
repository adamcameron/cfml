<cfsavecontent variable="variables.scString">
	{
		"username": "MinerAccount",
		"rating": "none",
		"confirmed_nmc_reward": "0.00000000",
		"send_threshold": "1.00000000",
		"nmc_send_threshold": "10.00000000",
		"confirmed_reward": "0.58411453",
		"workers": {
			"MinerAccount.sif": {
				"last_share": 1364237399,
				"score": "0",
				"hashrate": 0, 
				"shares": 0, 
				"alive": false
			},
			"MinerAccount.loki": {
				"last_share": 1317347573,
				"score": "0",
				"hashrate": 0,
				"shares": 0,
				"alive": false
			},
			"MinerAccount.odin": {
				"last_share": 1329744778,
				"score": "0",
				"hashrate": 0,
				"shares": 0,
				"alive": false
			},
			"MinerAccount.dog": {
				"last_share": 1364850934,
				"score": "29285.8037",
				"hashrate": 2040,
				"shares": 2816,
				"alive": true
			},
			"MinerAccount.Freyr": {
				"last_share": 1364440355,
				"score": "0",
				"hashrate": 0,
				"shares": 0,
				"alive": false
			}
		},
		"wallet": "REDACTED",
		"unconfirmed_nmc_reward": "0.00000000",
		"unconfirmed_reward": "0.19413921",
		"estimated_reward": "0.00218734",
		"hashrate": "3094.363"
	}
</cfsavecontent>



<cfscript>
	variables.data = deserializeJSON(variables.scString);
	variables.miner = {};
	variables.miner.confirmed_reward = data.confirmed_reward;
	variables.miner.unconfirmed_reward = data.unconfirmed_reward;
	variables.miner.total_reward = variables.miner.unconfirmed_reward + variables.miner.confirmed_reward;
	variables.miner.liveWorker = structFindValue(data.workers, true, "all");

	variables.miner.dog = data.workers[ 'MinerAccount.dog'];
	variables.miner.cat=variables.miner.dog.alive;
	variables.miner.livedog = structFindValue(variables.miner.dog, variables.miner.cat, "all");
	variables.miner.livedog2 = structFindValue(variables.miner.dog, true, "all");

writeDump(data.workers);
writeDump(variables.miner.dog);
writeOutput("variables.miner.cat: #variables.miner.cat#<br>");
writeDump(variables.miner.liveWorker);
writeDump(variables.miner.livedog);
writeDump(variables.miner.livedog2);
abort;
	
	
</cfscript>
<cfset cat=variables.miner.dog.alive >
<cfdump var="#variables.miner.dog#" metainfo="yes" label="dog">
<hr>
<cfdump var="#variables.miner.dog.alive#" label="dog.alive">
<hr>
<cfdump var="#variables.miner#" label="entire Struct">
package wowp.utils.debug {

import wowp.utils.Utils;

public class FakeBattleResult {
    public var response:Object;
    public var response2:Object;
    public var response3:Object;
    public var response4:Object;
    public var response5:Object;
    private var QUESTS:int = 20;
    private var MAX_VALUE:int = 3000000;
    
    public function FakeBattleResult() {
        response = {
            "accConsumablesIDs":
                    [],
            "actualCr": 3442,
            "actualXP": 788,
            "arenaName": "Азійський кордон: Ефект раптовості",
            "arenaType": 4,
            "autoResolve": false,
            "autoShow": true,
            "baseCr": 3442.973655746237,
            "baseFreeXP": 39,
            "baseXP": 394,
            "events":
                    [
                        {
                            "7":
                                    {
                                        "planeID": 1102,
                                        "value": 394
                                    }
                        }
                    ],
            "expensesCr": 0,
            "freeXPOtherBonus": 0,
            "freeXPPremBonus": 9,
            "gameMode": 11,
            "gameModeResults":
                    {
                        "allyPoints": 800,
                        "enemyPoints": 400,
                        "gameTime": 37,
                        "winState": 1
                    },
            "isPremiumAccount": false,
            "leaderboards":
                    {},
            "mapID": 40,
            "pieces":
                    {},
            "playerID": 2,
            "premCr": 3442.973655746237,
            "premCrCoeff": 1,
            "premXP": 394,
            "premXPCoeff": 1,
            "quests":
                    {
                        "-1566830899":
                                {
                                    "bonuses":
                                            [],
                                    "completed": false,
                                    "progress":
                                            [
                                                {
                                                    "before": 1,
                                                    "current": 2,
                                                    "display": false,
                                                    "max": 5
                                                }
                                            ],
                                    "tir":
                                            {
                                                "completed": [],
                                                "current": 1
                                            },
                                    "type": "daily"
                                },
                        "1478604309":
                                {
                                    "bonuses":
                                            [],
                                    "completed": false,
                                    "progress":
                                            [
                                                {
                                                    "before": 0,
                                                    "current": 1,
                                                    "display": false,
                                                    "max": 7
                                                }
                                            ],
                                    "tir":
                                            {
                                                "completed": [],
                                                "current": 1
                                            },
                                    "type": "daily"
                                },
                        "565666100":
                                {
                                    "bonuses":
                                            [],
                                    "completed": false,
                                    "progress":
                                            [
                                                {
                                                    "before": 0,
                                                    "current": 1,
                                                    "display": true,
                                                    "max": 2
                                                }
                                            ],
                                    "type": "sse.quest"
                                }
                    },
            "refill":
                    {
                        "credits": 0,
                        "gold": 0,
                        "tickets": 0
                    },
            "repairCr": 0,
            "result": 22,
            "servicePlanes":
                    {
                        "refill":
                                {},
                        "repair": 0
                    },
            "startTime": 1713785229,
            "teams":
                    {
                        "0":
                                {
                                    "2":
                                            {
                                                "achievements":
                                                        {},
                                                "bScore": 2200,
                                                "baseXP": 394,
                                                "bestRankPlaneID": 1102,
                                                "clan": "",
                                                "context":
                                                        {
                                                            "activities":
                                                                    {
                                                                        "component":
                                                                                {
                                                                                    "globalScore": "active",
                                                                                    "leaderboard": "active",
                                                                                    "redcomet": "war_1_gatheringstorm"
                                                                                }
                                                                    },
                                                            "arena":
                                                                    {
                                                                        "mode": "areaconquest",
                                                                        "source": "player",
                                                                        "type": "normal"
                                                                    },
                                                            "leaderboards":
                                                                    [
                                                                        "war_1_gatheringstorm"
                                                                    ],
                                                            "pieces": 0,
                                                            "player":
                                                                    {
                                                                        "accDBID": 1,
                                                                        "id": 2,
                                                                        "isNPC": "false",
                                                                        "killed": "no",
                                                                        "lastBattleTime": 10,
                                                                        "plane":
                                                                                {
                                                                                    "activeNation": "germany",
                                                                                    "crew":
                                                                                            {
                                                                                                "id": 1004
                                                                                            },
                                                                                    "global": 339446936,
                                                                                    "hasGunner": "no",
                                                                                    "id": 1102,
                                                                                    "level": 1,
                                                                                    "nation": "germany",
                                                                                    "specialization": "specialist.1",
                                                                                    "tir": "1",
                                                                                    "type": "navy"
                                                                                },
                                                                        "squad":
                                                                                {
                                                                                    "active": "no",
                                                                                    "id": 10
                                                                                },
                                                                        "stayToTheEnd": "yes",
                                                                        "teamIndex": 0,
                                                                        "testflight": "false",
                                                                        "type": "player",
                                                                        "winStreak": 4
                                                                    },
                                                            "self":
                                                                    {
                                                                        "event":
                                                                                {
                                                                                    "context": "player",
                                                                                    "name": "top.1.by.kill.plane.defender",
                                                                                    "type": "battle"
                                                                                }
                                                                    },
                                                            "team":
                                                                    {
                                                                        "result": "win"
                                                                    },
                                                            "time": 1713785327
                                                        },
                                                "databaseID": 1,
                                                "firstGID": 339446936,
                                                "id": 2,
                                                "leaderboards":
                                                        [],
                                                "mScore": 530,
                                                "name": "_dev_1",
                                                "pDamage": 65,
                                                "pKill": 1,
                                                "pieces":
                                                        {
                                                            "clientData":
                                                                    {},
                                                            "data":
                                                                    {}
                                                        },
                                                "planes":
                                                        [
                                                            {
                                                                "achievements":
                                                                        {},
                                                                "actions":
                                                                        {},
                                                                "actualXP": 788,
                                                                "atKillMaxDF": 1,
                                                                "bScore": 2200,
                                                                "baseCr": 3442.973655746237,
                                                                "baseXP": 394,
                                                                "camouflage": 1,
                                                                "camouflageCoeffs":
                                                                        {
                                                                            "decor":
                                                                                    {
                                                                                        "credits": 0,
                                                                                        "crewXP": 0,
                                                                                        "xp": 0
                                                                                    },
                                                                            "nose":
                                                                                    {
                                                                                        "credits": 0,
                                                                                        "crewXP": 0,
                                                                                        "xp": 0
                                                                                    }
                                                                        },
                                                                "consumableCoeffs":
                                                                        {},
                                                                "crewXP": 788,
                                                                "crewXPList":
                                                                        [
                                                                            [
                                                                                0,
                                                                                788
                                                                            ]
                                                                        ],
                                                                "critsInfo":
                                                                        {},
                                                                "equipmentCoeffs":
                                                                        {},
                                                                "extKillers":
                                                                        {},
                                                                "firstWinXPCoeff": 2,
                                                                "flights": 1,
                                                                "flighttime": 36,
                                                                "gExtDamage":
                                                                        {},
                                                                "gExtKills":
                                                                        {},
                                                                "globalID": 339446936,
                                                                "isElite": true,
                                                                "isElitePlane": true,
                                                                "isSpecialist": true,
                                                                "mScore": 530,
                                                                "nationID": 1,
                                                                "pDamage": 65,
                                                                "pExtDeaths":
                                                                        {},
                                                                "pExtKills":
                                                                        {
                                                                            "enemy":
                                                                                    {
                                                                                        "navy": 1
                                                                                    }
                                                                        },
                                                                "pKill": 1,
                                                                "planeID": 1102,
                                                                "planeType": "navy",
                                                                "postBattle":
                                                                        {
                                                                            "economics":
                                                                                    {
                                                                                        "PersonalScore":
                                                                                                {
                                                                                                    "EndGame":
                                                                                                            {
                                                                                                                "battle": 1000
                                                                                                            },
                                                                                                    "ObjectAssistDestroy":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "ObjectDamage":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "ObjectDestroy":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "PlaneAssistDestroy":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "PlaneDamage":
                                                                                                            {
                                                                                                                "battle": 1000
                                                                                                            },
                                                                                                    "PlaneDestroy":
                                                                                                            {
                                                                                                                "AllyPlaneDestroy":
                                                                                                                        {
                                                                                                                            "battle": 0
                                                                                                                        },
                                                                                                                "BomberPlaneDestroy":
                                                                                                                        {
                                                                                                                            "battle": 0
                                                                                                                        },
                                                                                                                "DefenderPlaneDestroy":
                                                                                                                        {
                                                                                                                            "battle": 0
                                                                                                                        },
                                                                                                                "EnemyPlaneDestroy":
                                                                                                                        {
                                                                                                                            "battle": 200
                                                                                                                        }
                                                                                                            },
                                                                                                    "SectorAttack":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "SectorCapture":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "SectorDefence":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "SectorParticipationCapture":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "pointsSum": 2200
                                                                                                },
                                                                                        "pointsSum": 2200
                                                                                    }
                                                                        },
                                                                "premPlaneLvlXPCoeff": 1,
                                                                "premXP": 394,
                                                                "quests":
                                                                        {},
                                                                "ranks":
                                                                        {
                                                                            "objectives":
                                                                                    [
                                                                                        {
                                                                                            "id": 415540407,
                                                                                            "progressMax": 6,
                                                                                            "progressRawValueRequired": 50
                                                                                        },
                                                                                        {
                                                                                            "id": 1703894135,
                                                                                            "progressMax": 6,
                                                                                            "progressRawValueRequired": 1
                                                                                        },
                                                                                        {
                                                                                            "id": -1122474517,
                                                                                            "progressMax": 6,
                                                                                            "progressRawValueRequired": 1
                                                                                        }
                                                                                    ],
                                                                            "rank": null
                                                                        },
                                                                "streaks":
                                                                        {
                                                                            "points":
                                                                                    {
                                                                                        "1000": 1,
                                                                                        "2000": 1
                                                                                    }
                                                                        },
                                                                "totalXP": 788,
                                                                "usedCamouflages":
                                                                        [
                                                                            1005288432,
                                                                            -1562236342
                                                                        ],
                                                                "usedCmbl":
                                                                        [],
                                                                "usedEqmt":
                                                                        [],
                                                                "usedWeapon":
                                                                        [],
                                                                "zoneCaptureExtended":
                                                                        {}
                                                            }
                                                        ],
                                                "rank": 1
                                            }
                                },
                        "1":
                                {
                                    "1":
                                            {
                                                "achievements":
                                                        {},
                                                "bScore": 1000,
                                                "baseXP": 198,
                                                "bestRankPlaneID": 2101,
                                                "clan": "",
                                                "context":
                                                        {
                                                            "activities":
                                                                    {
                                                                        "component":
                                                                                {
                                                                                    "globalScore": "active",
                                                                                    "leaderboard": "active",
                                                                                    "redcomet": "war_1_gatheringstorm"
                                                                                }
                                                                    },
                                                            "arena":
                                                                    {
                                                                        "mode": "areaconquest",
                                                                        "source": "bot",
                                                                        "type": "normal"
                                                                    },
                                                            "leaderboards":
                                                                    [
                                                                        "war_1_gatheringstorm"
                                                                    ],
                                                            "player":
                                                                    {
                                                                        "accDBID": 0,
                                                                        "id": 1,
                                                                        "isNPC": "false",
                                                                        "killed": "yes",
                                                                        "lastBattleTime": 0,
                                                                        "plane":
                                                                                {
                                                                                    "activeNation": "ussr",
                                                                                    "crew":
                                                                                            {
                                                                                                "id": -1
                                                                                            },
                                                                                    "global": 857013865,
                                                                                    "hasGunner": "no",
                                                                                    "id": 2101,
                                                                                    "level": 1,
                                                                                    "nation": "ussr",
                                                                                    "specialization": "stock",
                                                                                    "tir": "1",
                                                                                    "type": "navy"
                                                                                },
                                                                        "squad":
                                                                                {
                                                                                    "active": "no",
                                                                                    "id": 30
                                                                                },
                                                                        "stayToTheEnd": "yes",
                                                                        "teamIndex": 1,
                                                                        "testflight": "false",
                                                                        "type": "player",
                                                                        "winStreak": 0
                                                                    },
                                                            "team":
                                                                    {
                                                                        "result": "lose"
                                                                    }
                                                        },
                                                "deaths": 1,
                                                "firstGID": 857013865,
                                                "id": 1,
                                                "isBot": true,
                                                "leaderboards":
                                                        [],
                                                "mScore": 400,
                                                "name": "Тимур",
                                                "planes":
                                                        [
                                                            {
                                                                "achievements":
                                                                        {},
                                                                "actions":
                                                                        {},
                                                                "actualXP": 198,
                                                                "bScore": 1000,
                                                                "baseCr": 1323.592193245227,
                                                                "baseXP": 198,
                                                                "camouflage": 1,
                                                                "crewXP": 198,
                                                                "critsInfo":
                                                                        {},
                                                                "deaths": 1,
                                                                "extKillers":
                                                                        {
                                                                            "2":
                                                                                    {
                                                                                        "1102": 1
                                                                                    }
                                                                        },
                                                                "firstWinXPCoeff": 1,
                                                                "flights": 2,
                                                                "flighttime": 14,
                                                                "gExtDamage":
                                                                        {},
                                                                "gExtKills":
                                                                        {},
                                                                "globalID": 857013865,
                                                                "mScore": 400,
                                                                "nationID": 2,
                                                                "pExtDeaths":
                                                                        {
                                                                            "player": 1
                                                                        },
                                                                "pExtKills":
                                                                        {},
                                                                "planeID": 2101,
                                                                "planeType": "navy",
                                                                "postBattle":
                                                                        {
                                                                            "economics":
                                                                                    {
                                                                                        "PersonalScore":
                                                                                                {
                                                                                                    "EndGame":
                                                                                                            {
                                                                                                                "battle": 1000
                                                                                                            },
                                                                                                    "ObjectAssistDestroy":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "ObjectDamage":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "ObjectDestroy":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "PlaneAssistDestroy":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "PlaneDamage":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "PlaneDestroy":
                                                                                                            {
                                                                                                                "AllyPlaneDestroy":
                                                                                                                        {
                                                                                                                            "battle": 0
                                                                                                                        },
                                                                                                                "BomberPlaneDestroy":
                                                                                                                        {
                                                                                                                            "battle": 0
                                                                                                                        },
                                                                                                                "DefenderPlaneDestroy":
                                                                                                                        {
                                                                                                                            "battle": 0
                                                                                                                        },
                                                                                                                "EnemyPlaneDestroy":
                                                                                                                        {
                                                                                                                            "battle": 0
                                                                                                                        }
                                                                                                            },
                                                                                                    "SectorAttack":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "SectorCapture":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "SectorDefence":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "SectorParticipationCapture":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "pointsSum": 1000
                                                                                                },
                                                                                        "pointsSum": 1000
                                                                                    }
                                                                        },
                                                                "premXP": 198,
                                                                "quests":
                                                                        {},
                                                                "ranks":
                                                                        {
                                                                            "objectives":
                                                                                    [
                                                                                        {
                                                                                            "id": 415540407,
                                                                                            "progressMax": 6,
                                                                                            "progressRawValueRequired": 50
                                                                                        },
                                                                                        {
                                                                                            "id": 1703894135,
                                                                                            "progressMax": 6,
                                                                                            "progressRawValueRequired": 1
                                                                                        },
                                                                                        {
                                                                                            "id": -1122474517,
                                                                                            "progressMax": 6,
                                                                                            "progressRawValueRequired": 1
                                                                                        }
                                                                                    ],
                                                                            "rank": null
                                                                        },
                                                                "streaks":
                                                                        {
                                                                            "points":
                                                                                    {
                                                                                        "1000": 1
                                                                                    }
                                                                        },
                                                                "totalXP": 198,
                                                                "usedWeapon":
                                                                        [],
                                                                "zoneCaptureExtended":
                                                                        {}
                                                            }
                                                        ],
                                                "rank": 1
                                            }
                                }
                    },
            "totalCr": 3442,
            "totalFreeXP": 39,
            "totalXP": 788,
            "winState": 1
        };
        
        response2 = {
            "accConsumablesIDs": [],
            "actualCr": 19410,
            "actualXP": 1032,
            "arenaName": "Albion: Final Argument",
            "arenaType": 4,
            "autoResolve": false,
            "autoShow": true,
            "baseCr": 12940.9961136594,
            "baseFreeXP": 34,
            "baseXP": 688,
            "events": [],
            "expensesCr": 0,
            "freeXPOtherBonus": 0,
            "freeXPPremBonus": 17,
            "gameMode": 11,
            "gameModeResults": {
                "allyPoints": 800,
                "enemyPoints": 400,
                "gameTime": 5,
                "winState": 1
            },
            "isPremiumAccount": true,
            "leaderboards": {},
            "mapID": 91,
            "pieces": {},
            "playerID": 2,
            "premCr": 19410.9961136594,
            "premCrCoeff": 1.5,
            "premXP": 1032,
            "premXPCoeff": 1.5,
            "quests": {
                "-1678821532": {
                    "bonuses": [],
                    "completed": false,
                    "progress": [
                        {
                            "before": 2,
                            "current": 3,
                            "display": false,
                            "max": 5
                        }
                    ],
                    "tir": {
                        "completed": [],
                        "current": 2
                    },
                    "type": "daily"
                },
                "-18538665": {
                    "bonuses": [],
                    "completed": true,
                    "progress": [],
                    "type": "sse.quest.marathon"
                },
                "-258851693": {
                    "bonuses": [],
                    "completed": true,
                    "progress": [
                        {
                            "before": 0,
                            "current": 1,
                            "display": true,
                            "max": 1
                        }
                    ],
                    "type": "sse.quest.marathon"
                },
                "-455173566": {
                    "bonuses": [
                        {
                            "id": null,
                            "type": "slot",
                            "value": 1
                        },
                        {
                            "id": 12791,
                            "type": "plane",
                            "value": 1
                        },
                        {
                            "id": null,
                            "kwargs": {
                                "boardOnPlaneID": "12791",
                                "skillLevel": "100",
                                "skillPoints": "1",
                                "specializationID": "0"
                            },
                            "planeID": 12791,
                            "type": "crew",
                            "value": 1,
                            "ui": {
                                "boardOnPlaneID": "12791",
                                "skillLevel": "100",
                                "skillPoints": "1",
                                "specializationID": "0",
                                "planeID": 12791
                            }
                        },
                        {
                            "id": -1014476375,
                            "kwargs": {
                                "expiryTime": "-1.0"
                            },
                            "type": "camouflage",
                            "value": 1
                        },
                        {
                            "id": -1014476375,
                            "kwargs": {
                                "arenaType": "0"
                            },
                            "type": "camouflage",
                            "value": 1
                        },
                        {
                            "id": -41772476,
                            "kwargs": {
                                "expiryTime": "-1.0"
                            },
                            "type": "camouflage",
                            "value": 1
                        },
                        {
                            "id": -41772476,
                            "kwargs": {
                                "arenaType": "0"
                            },
                            "type": "camouflage",
                            "value": 1
                        },
                        {
                            "id": -677438532,
                            "kwargs": {
                                "expiryTime": "-1.0"
                            },
                            "type": "camouflage",
                            "value": 1
                        },
                        {
                            "id": -677438532,
                            "kwargs": {
                                "arenaType": "1"
                            },
                            "type": "camouflage",
                            "value": 1
                        },
                        {
                            "id": -677438532,
                            "kwargs": {
                                "arenaType": "2"
                            },
                            "type": "camouflage",
                            "value": 1
                        },
                        {
                            "id": -677438532,
                            "kwargs": {
                                "arenaType": "3"
                            },
                            "type": "camouflage",
                            "value": 1
                        },
                        {
                            "id": -677438532,
                            "kwargs": {
                                "arenaType": "4"
                            },
                            "type": "camouflage",
                            "value": 1
                        },
                        {
                            "id": -1362751001,
                            "kwargs": {
                                "hideMessage": "False"
                            },
                            "type": "gameeventobject",
                            "value": 1
                        }
                    ],
                    "completed": true,
                    "progress": [],
                    "type": "sse.quest.marathon"
                }
            },
            "refill": {
                "credits": 0,
                "gold": 0,
                "tickets": 0
            },
            "repairCr": 0,
            "result": 22,
            "servicePlanes": {
                "refill": {},
                "repair": 0
            },
            "startTime": 1691425733,
            "teams": {
                "0": {
                    "2": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 688,
                        "bestRankPlaneID": 1593,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {}
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "player",
                                "type": "normal"
                            },
                            "leaderboards": [],
                            "pieces": 0,
                            "player": {
                                "accDBID": 98,
                                "id": 2,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "germany",
                                    "crew": {
                                        "id": 1006
                                    },
                                    "global": -972013075,
                                    "hasGunner": "no",
                                    "id": 1593,
                                    "level": 5,
                                    "nation": "germany",
                                    "specialization": "stock",
                                    "tir": "2",
                                    "type": "fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 3
                            },
                            "self": {
                                "event": {
                                    "context": "player",
                                    "name": "top.1.by.kill.plane.defender",
                                    "type": "battle"
                                }
                            },
                            "team": {
                                "result": "win"
                            },
                            "time": 1691425789
                        },
                        "databaseID": 98,
                        "firstGID": -972013075,
                        "id": 2,
                        "leaderboards": [],
                        "mScore": 450,
                        "name": "_dev_98",
                        "pieces": {
                            "clientData": {},
                            "data": {}
                        },
                        "planes": [
                            {
                                "achievements": {
                                    "1242874774": {
                                        "bonuses": []
                                    },
                                    "2130685919": {
                                        "bonuses": []
                                    }
                                },
                                "actions": {},
                                "actualXP": 1032,
                                "bScore": 1000,
                                "baseCr": 12940.9961136594,
                                "baseXP": 688,
                                "camouflage": 1,
                                "camouflageCoeffs": {
                                    "decor": {
                                        "credits": 0,
                                        "crewXP": 0,
                                        "xp": 0
                                    },
                                    "nose": {
                                        "credits": 0,
                                        "crewXP": 0,
                                        "xp": 0
                                    }
                                },
                                "consumableCoeffs": {},
                                "crewXP": 1238,
                                "crewXPList": [
                                    [
                                        0,
                                        1238
                                    ]
                                ],
                                "critsInfo": {},
                                "equipmentCoeffs": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "flighttime": 5,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -972013075,
                                "isElite": true,
                                "isElitePlane": true,
                                "mScore": 450,
                                "nationID": 1,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 1593,
                                "planeType": "fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premPlaneLvlXPCoeff": 1,
                                "premXP": 1032,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1299816437,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        },
                                        {
                                            "id": -823071514,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 606152162,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalPremXP": 344,
                                "totalXP": 1032,
                                "usedCamouflages": [
                                    -1298007923,
                                    732473655
                                ],
                                "usedCmbl": [],
                                "usedEqmt": [],
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    }
                },
                "1": {
                    "1": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 360,
                        "bestRankPlaneID": 1505,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {}
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [],
                            "player": {
                                "accDBID": 0,
                                "id": 1,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "germany",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": 1945735461,
                                    "hasGunner": "no",
                                    "id": 1505,
                                    "level": 5,
                                    "nation": "germany",
                                    "specialization": "stock",
                                    "tir": "2",
                                    "type": "assault"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "lose"
                            }
                        },
                        "firstGID": 1945735461,
                        "id": 1,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 400,
                        "name": "Viktor",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 360,
                                "bScore": 1000,
                                "baseCr": 5882.270960754271,
                                "baseXP": 360,
                                "camouflage": 4,
                                "crewXP": 385,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": 1945735461,
                                "mScore": 400,
                                "nationID": 1,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 1505,
                                "planeType": "assault",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 360,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1056691134,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 50
                                        },
                                        {
                                            "id": 175793157,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 20
                                        },
                                        {
                                            "id": -319343865,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 360,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    }
                }
            },
            "totalCr": 19410,
            "totalFreeXP": 51,
            "totalXP": 1032,
            "winState": 1
        }
        
        response3 = {
            "accConsumablesIDs":
                    [],
            "actualCr": 23376,
            "actualXP": 1620,
            "arenaName": "Alpine Gambit: Day of Reckoning",
            "arenaType": 4,
            "autoResolve": false,
            "autoShow": true,
            "baseCr": 23376.78149125932,
            "baseFreeXP": 81,
            "baseXP": 810,
            "events":
                    [
                        {
                            "5":
                                    {
                                        "planeID": 6591,
                                        "value": 1
                                    }
                        },
                        {
                            "7":
                                    {
                                        "planeID": 6591,
                                        "value": 810
                                    }
                        }
                    ],
            "expensesCr": 0,
            "freeXPOtherBonus": 0,
            "freeXPPremBonus": 20,
            "gameMode": 11,
            "gameModeResults":
                    {
                        "allyPoints": 600,
                        "enemyPoints": 300,
                        "gameTime": 32,
                        "winState": 1
                    },
            "isPremiumAccount": false,
            "leaderboards":
                    {},
            "mapID": 29,
            "pieces":
                    {
                        "1": 1
                    },
            "playerID": 2,
            "premCr": 23376.78149125932,
            "premCrCoeff": 1,
            "premXP": 810,
            "premXPCoeff": 1,
            "quests":
                    {
                        "-1209936488":
                                {
                                    "bonuses":
                                            [],
                                    "completed": false,
                                    "progress":
                                            [
                                                {
                                                    "before": 0,
                                                    "current": 1,
                                                    "display": true,
                                                    "max": 2
                                                }
                                            ],
                                    "type": "sse.quest"
                                },
                        "-1359506284":
                                {
                                    "bonuses": [],
                                    "completed": true,
                                    "progress": [],
                                    "type": "sse.quest"
                                },
                        "-1574677591":
                                {
                                    "bonuses":
                                            [
                                                {
                                                    "id": null,
                                                    "type": "gold",
                                                    "value": 100
                                                }
                                            ],
                                    "completed": true,
                                    "progress":
                                            [
                                                {
                                                    "before": 0,
                                                    "current": 1,
                                                    "display": true,
                                                    "max": 1
                                                }
                                            ],
                                    "type": "sse.quest.personal"
                                },
                        "-1736981365":
                                {
                                    "bonuses":
                                            [],
                                    "completed": false,
                                    "progress":
                                            [
                                                {
                                                    "before": 0,
                                                    "current": 1,
                                                    "display": true,
                                                    "max": 3
                                                }
                                            ],
                                    "type": "sse.quest.personal"
                                },
                        "-399640004":
                                {
                                    "bonuses":
                                            [
                                                {
                                                    "id": 2,
                                                    "type": "currency",
                                                    "value": 1000
                                                }
                                            ],
                                    "completed": true,
                                    "progress":
                                            [
                                                {
                                                    "before": 0,
                                                    "current": 1,
                                                    "display": true,
                                                    "max": 1
                                                }
                                            ],
                                    "type": "quest.objective"
                                },
                        "-998547890":
                                {
                                    "bonuses":
                                            [],
                                    "completed": false,
                                    "progress":
                                            [
                                                {
                                                    "before": 0,
                                                    "current": 1,
                                                    "display": true,
                                                    "max": 2
                                                }
                                            ],
                                    "type": "sse.quest"
                                },
                        "257798909":
                                {
                                    "bonuses":
                                            [
                                                {
                                                    "id": 1215,
                                                    "type": "equipment",
                                                    "value": 1
                                                },
                                                {
                                                    "id": 1211,
                                                    "type": "equipment",
                                                    "value": 1
                                                },
                                                {
                                                    "id": 7,
                                                    "type": "currency",
                                                    "value": 25
                                                }
                                            ],
                                    "completed": true,
                                    "progress":
                                            [
                                                {
                                                    "before": 0,
                                                    "current": 1,
                                                    "display": true,
                                                    "max": 1
                                                }
                                            ],
                                    "type": "sse.quest"
                                },
                        "483870852":
                                {
                                    "bonuses":
                                            [],
                                    "completed": false,
                                    "progress":
                                            [
                                                {
                                                    "before": 0,
                                                    "current": 1,
                                                    "display": true,
                                                    "max": 2
                                                }
                                            ],
                                    "type": "sse.quest"
                                },
                        "588566855":
                                {
                                    "bonuses":
                                            [],
                                    "completed": false,
                                    "progress":
                                            [
                                                {
                                                    "before": 0,
                                                    "current": 1,
                                                    "display": true,
                                                    "max": 3
                                                }
                                            ],
                                    "type": "sse.quest"
                                },
                        "875469311":
                                {
                                    "bonuses":
                                            [
                                                {
                                                    "id": 1012,
                                                    "type": "warcash",
                                                    "value": 1
                                                }
                                            ],
                                    "completed": true,
                                    "progress":
                                            [
                                                {
                                                    "before": 0,
                                                    "current": 1,
                                                    "display": true,
                                                    "max": 1
                                                }
                                            ],
                                    "type": "sse.quest.personal"
                                }
                    },
            "refill":
                    {
                        "credits": 0,
                        "gold": 0,
                        "tickets": 0
                    },
            "repairCr": 0,
            "result": 22,
            "servicePlanes":
                    {
                        "refill":
                                {},
                        "repair": 0
                    },
            "startTime": 1720579978,
            "teams":
                    {
                        "0":
                                {
                                    "2":
                                            {
                                                "achievements":
                                                        {},
                                                "bScore": 2200,
                                                "baseXP": 810,
                                                "bestRankPlaneID": 6591,
                                                "clan": "",
                                                "context":
                                                        {
                                                            "activities":
                                                                    {
                                                                        "component":
                                                                                {
                                                                                    "globalScore": "active",
                                                                                    "leaderboard": "active",
                                                                                    "redcomet": "war_1_gatheringstorm"
                                                                                }
                                                                    },
                                                            "arena":
                                                                    {
                                                                        "mode": "areaconquest",
                                                                        "source": "player",
                                                                        "type": "normal"
                                                                    },
                                                            "leaderboards":
                                                                    [
                                                                        "war_1_gatheringstorm"
                                                                    ],
                                                            "pieces": 1,
                                                            "player":
                                                                    {
                                                                        "accDBID": 8,
                                                                        "id": 2,
                                                                        "isNPC": "false",
                                                                        "killed": "no",
                                                                        "lastBattleTime": 0,
                                                                        "plane":
                                                                                {
                                                                                    "activeNation": "china",
                                                                                    "crew":
                                                                                            {
                                                                                                "id": 1006
                                                                                            },
                                                                                    "global": -1022803015,
                                                                                    "hasGunner": "no",
                                                                                    "id": 6591,
                                                                                    "level": 5,
                                                                                    "nation": "china",
                                                                                    "specialization": "stock",
                                                                                    "tir": "2",
                                                                                    "type": "fighter"
                                                                                },
                                                                        "squad":
                                                                                {
                                                                                    "active": "no",
                                                                                    "id": 10
                                                                                },
                                                                        "stayToTheEnd": "yes",
                                                                        "teamIndex": 0,
                                                                        "testflight": "false",
                                                                        "type": "player",
                                                                        "winStreak": 1
                                                                    },
                                                            "self":
                                                                    {
                                                                        "event":
                                                                                {
                                                                                    "context": "player",
                                                                                    "name": "top.1.by.kill.plane.defender",
                                                                                    "type": "battle"
                                                                                }
                                                                    },
                                                            "team":
                                                                    {
                                                                        "result": "win"
                                                                    },
                                                            "time": 1720580067
                                                        },
                                                "databaseID": 8,
                                                "firstGID": -1022803015,
                                                "id": 2,
                                                "leaderboards":
                                                        [],
                                                "mScore": 530,
                                                "name": "_dev_8",
                                                "pDamage": 160,
                                                "pKill": 1,
                                                "pieces":
                                                        {
                                                            "clientData":
                                                                    {},
                                                            "data":
                                                                    {
                                                                        "956740343":
                                                                                {
                                                                                    "0":
                                                                                            {
                                                                                                "0": true,
                                                                                                "2": true
                                                                                            },
                                                                                    "1":
                                                                                            {
                                                                                                "-751782822":
                                                                                                        {
                                                                                                            "0": 1,
                                                                                                            "1": 1
                                                                                                        }
                                                                                            }
                                                                                }
                                                                    }
                                                        },
                                                "planes":
                                                        [
                                                            {
                                                                "achievements":
                                                                        {},
                                                                "actions":
                                                                        {},
                                                                "actualXP": 1620,
                                                                "atKillMaxDF": 1,
                                                                "bScore": 2200,
                                                                "baseCr": 23376.78149125932,
                                                                "baseXP": 810,
                                                                "camouflage": 1,
                                                                "camouflageCoeffs":
                                                                        {
                                                                            "decor":
                                                                                    {
                                                                                        "credits": 0,
                                                                                        "crewXP": 0,
                                                                                        "xp": 0
                                                                                    },
                                                                            "nose":
                                                                                    {
                                                                                        "credits": 0,
                                                                                        "crewXP": 0,
                                                                                        "xp": 0
                                                                                    }
                                                                        },
                                                                "consumableCoeffs":
                                                                        {},
                                                                "crewXP": 1944,
                                                                "crewXPList":
                                                                        [
                                                                            [
                                                                                0,
                                                                                1944
                                                                            ]
                                                                        ],
                                                                "critsInfo":
                                                                        {},
                                                                "equipmentCoeffs":
                                                                        {},
                                                                "extKillers":
                                                                        {},
                                                                "firstWinXPCoeff": 2,
                                                                "flights": 1,
                                                                "flighttime": 32,
                                                                "gExtDamage":
                                                                        {},
                                                                "gExtKills":
                                                                        {},
                                                                "globalID": -1022803015,
                                                                "isElite": true,
                                                                "isElitePlane": true,
                                                                "mScore": 530,
                                                                "nationID": 6,
                                                                "pDamage": 160,
                                                                "pExtDeaths":
                                                                        {},
                                                                "pExtKills":
                                                                        {
                                                                            "enemy":
                                                                                    {
                                                                                        "fighter": 1
                                                                                    }
                                                                        },
                                                                "pKill": 1,
                                                                "planeID": 6591,
                                                                "planeType": "fighter",
                                                                "postBattle":
                                                                        {
                                                                            "economics":
                                                                                    {
                                                                                        "PersonalScore":
                                                                                                {
                                                                                                    "EndGame":
                                                                                                            {
                                                                                                                "battle": 1000
                                                                                                            },
                                                                                                    "ObjectAssistDestroy":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "ObjectDamage":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "ObjectDestroy":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "PlaneAssistDestroy":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "PlaneDamage":
                                                                                                            {
                                                                                                                "battle": 1000
                                                                                                            },
                                                                                                    "PlaneDestroy":
                                                                                                            {
                                                                                                                "AllyPlaneDestroy":
                                                                                                                        {
                                                                                                                            "battle": 0
                                                                                                                        },
                                                                                                                "BomberPlaneDestroy":
                                                                                                                        {
                                                                                                                            "battle": 0
                                                                                                                        },
                                                                                                                "DefenderPlaneDestroy":
                                                                                                                        {
                                                                                                                            "battle": 0
                                                                                                                        },
                                                                                                                "EnemyPlaneDestroy":
                                                                                                                        {
                                                                                                                            "battle": 200
                                                                                                                        }
                                                                                                            },
                                                                                                    "SectorAttack":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "SectorCapture":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "SectorDefence":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "SectorParticipationCapture":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "pointsSum": 2200
                                                                                                },
                                                                                        "pointsSum": 2200
                                                                                    }
                                                                        },
                                                                "premPlaneLvlXPCoeff": 1,
                                                                "premXP": 810,
                                                                "quests":
                                                                        {
                                                                            "1694485449":
                                                                                    {
                                                                                        "bonuses":
                                                                                                [],
                                                                                        "completed": false,
                                                                                        "progress":
                                                                                                [
                                                                                                    {
                                                                                                        "before": 0,
                                                                                                        "current": 1,
                                                                                                        "display": true,
                                                                                                        "max": 126
                                                                                                    },
                                                                                                    {
                                                                                                        "before": 0,
                                                                                                        "current": 0,
                                                                                                        "display": true,
                                                                                                        "max": 30
                                                                                                    }
                                                                                                ],
                                                                                        "type": "stage"
                                                                                    }
                                                                        },
                                                                "ranks":
                                                                        {
                                                                            "objectives":
                                                                                    [
                                                                                        {
                                                                                            "id": 1299816437,
                                                                                            "progress": 0,
                                                                                            "progressMax": 6,
                                                                                            "progressRawValue": 1,
                                                                                            "progressRawValueRequired": 3
                                                                                        },
                                                                                        {
                                                                                            "id": -823071514,
                                                                                            "progressMax": 6,
                                                                                            "progressRawValueRequired": 1
                                                                                        },
                                                                                        {
                                                                                            "id": 606152162,
                                                                                            "progressMax": 6,
                                                                                            "progressRawValueRequired": 75
                                                                                        }
                                                                                    ],
                                                                            "rank": null
                                                                        },
                                                                "streaks":
                                                                        {
                                                                            "points":
                                                                                    {
                                                                                        "1000": 1,
                                                                                        "2000": 1
                                                                                    }
                                                                        },
                                                                "totalXP": 1620,
                                                                "usedCamouflages":
                                                                        [
                                                                            -1407181733,
                                                                            891899361
                                                                        ],
                                                                "usedCmbl":
                                                                        [],
                                                                "usedEqmt":
                                                                        [],
                                                                "usedWeapon":
                                                                        [],
                                                                "zoneCaptureExtended":
                                                                        {}
                                                            }
                                                        ],
                                                "rank": 1
                                            }
                                },
                        "1":
                                {
                                    "1":
                                            {
                                                "achievements":
                                                        {},
                                                "bScore": 1000,
                                                "baseXP": 408,
                                                "bestRankPlaneID": 4503,
                                                "clan": "",
                                                "context":
                                                        {
                                                            "activities":
                                                                    {
                                                                        "component":
                                                                                {
                                                                                    "globalScore": "active",
                                                                                    "leaderboard": "active",
                                                                                    "redcomet": "war_1_gatheringstorm"
                                                                                }
                                                                    },
                                                            "arena":
                                                                    {
                                                                        "mode": "areaconquest",
                                                                        "source": "bot",
                                                                        "type": "normal"
                                                                    },
                                                            "leaderboards":
                                                                    [
                                                                        "war_1_gatheringstorm"
                                                                    ],
                                                            "player":
                                                                    {
                                                                        "accDBID": 0,
                                                                        "id": 1,
                                                                        "isNPC": "false",
                                                                        "killed": "yes",
                                                                        "lastBattleTime": 0,
                                                                        "plane":
                                                                                {
                                                                                    "activeNation": "japan",
                                                                                    "crew":
                                                                                            {
                                                                                                "id": -1
                                                                                            },
                                                                                    "global": 1467539964,
                                                                                    "hasGunner": "no",
                                                                                    "id": 4503,
                                                                                    "level": 5,
                                                                                    "nation": "japan",
                                                                                    "specialization": "stock",
                                                                                    "tir": "2",
                                                                                    "type": "fighter"
                                                                                },
                                                                        "squad":
                                                                                {
                                                                                    "active": "no",
                                                                                    "id": 30
                                                                                },
                                                                        "stayToTheEnd": "yes",
                                                                        "teamIndex": 1,
                                                                        "testflight": "false",
                                                                        "type": "player",
                                                                        "winStreak": 0
                                                                    },
                                                            "team":
                                                                    {
                                                                        "result": "lose"
                                                                    }
                                                        },
                                                "deaths": 1,
                                                "firstGID": 1467539964,
                                                "id": 1,
                                                "isBot": true,
                                                "leaderboards":
                                                        [],
                                                "mScore": 400,
                                                "name": "Otsuka",
                                                "planes":
                                                        [
                                                            {
                                                                "achievements":
                                                                        {},
                                                                "actions":
                                                                        {},
                                                                "actualXP": 408,
                                                                "bScore": 1000,
                                                                "baseCr": 6666.5737555215,
                                                                "baseXP": 408,
                                                                "camouflage": 5,
                                                                "crewXP": 416,
                                                                "critsInfo":
                                                                        {},
                                                                "deaths": 1,
                                                                "extKillers":
                                                                        {
                                                                            "2":
                                                                                    {
                                                                                        "6591": 1
                                                                                    }
                                                                        },
                                                                "firstWinXPCoeff": 1,
                                                                "flights": 1,
                                                                "flighttime": 21,
                                                                "gExtDamage":
                                                                        {},
                                                                "gExtKills":
                                                                        {},
                                                                "globalID": 1467539964,
                                                                "mScore": 400,
                                                                "nationID": 4,
                                                                "pExtDeaths":
                                                                        {
                                                                            "player": 1
                                                                        },
                                                                "pExtKills":
                                                                        {},
                                                                "planeID": 4503,
                                                                "planeType": "fighter",
                                                                "postBattle":
                                                                        {
                                                                            "economics":
                                                                                    {
                                                                                        "PersonalScore":
                                                                                                {
                                                                                                    "EndGame":
                                                                                                            {
                                                                                                                "battle": 1000
                                                                                                            },
                                                                                                    "ObjectAssistDestroy":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "ObjectDamage":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "ObjectDestroy":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "PlaneAssistDestroy":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "PlaneDamage":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "PlaneDestroy":
                                                                                                            {
                                                                                                                "AllyPlaneDestroy":
                                                                                                                        {
                                                                                                                            "battle": 0
                                                                                                                        },
                                                                                                                "BomberPlaneDestroy":
                                                                                                                        {
                                                                                                                            "battle": 0
                                                                                                                        },
                                                                                                                "DefenderPlaneDestroy":
                                                                                                                        {
                                                                                                                            "battle": 0
                                                                                                                        },
                                                                                                                "EnemyPlaneDestroy":
                                                                                                                        {
                                                                                                                            "battle": 0
                                                                                                                        }
                                                                                                            },
                                                                                                    "SectorAttack":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "SectorCapture":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "SectorDefence":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "SectorParticipationCapture":
                                                                                                            {
                                                                                                                "battle": 0
                                                                                                            },
                                                                                                    "pointsSum": 1000
                                                                                                },
                                                                                        "pointsSum": 1000
                                                                                    }
                                                                        },
                                                                "premXP": 408,
                                                                "quests":
                                                                        {},
                                                                "ranks":
                                                                        {
                                                                            "objectives":
                                                                                    [
                                                                                        {
                                                                                            "id": 1299816437,
                                                                                            "progressMax": 6,
                                                                                            "progressRawValueRequired": 3
                                                                                        },
                                                                                        {
                                                                                            "id": -823071514,
                                                                                            "progressMax": 6,
                                                                                            "progressRawValueRequired": 1
                                                                                        },
                                                                                        {
                                                                                            "id": 606152162,
                                                                                            "progressMax": 6,
                                                                                            "progressRawValueRequired": 75
                                                                                        }
                                                                                    ],
                                                                            "rank": null
                                                                        },
                                                                "streaks":
                                                                        {
                                                                            "points":
                                                                                    {
                                                                                        "1000": 1
                                                                                    }
                                                                        },
                                                                "totalXP": 408,
                                                                "usedWeapon":
                                                                        [],
                                                                "zoneCaptureExtended":
                                                                        {}
                                                            }
                                                        ],
                                                "rank": 1
                                            }
                                }
                    },
            "totalCr": 23376,
            "totalFreeXP": 81,
            "totalXP": 1620,
            "winState": 1
        }
        
        response4 = {
            "accConsumablesIDs": [],
            "actualCr": 23684,
            "actualXP": 182,
            "arenaName": "Albion: Trump Card",
            "arenaType": 4,
            "autoResolve": false,
            "autoShow": true,
            "baseCr": 23684.967984135,
            "baseFreeXP": 9,
            "baseXP": 182,
            "events": [
                {
                    "5": {
                        "planeID": 1391,
                        "value": 2
                    }
                },
                {
                    "7": {
                        "planeID": 1391,
                        "value": 182
                    }
                }
            ],
            "expensesCr": 0,
            "freeXPOtherBonus": 0,
            "freeXPPremBonus": 4,
            "gameMode": 11,
            "gameModeResults": {
                "allyPoints": 0,
                "enemyPoints": 0,
                "gameTime": 64,
                "winState": 2
            },
            "isPremiumAccount": false,
            "leaderboards": {
                "war_1_gatheringstorm": 1
            },
            "mapID": 90,
            "pieces": {},
            "playerID": 24,
            "premCr": 23684.967984135,
            "premCrCoeff": 1,
            "premXP": 182,
            "premXPCoeff": 1,
            "quests": {
                "-1209936488": {
                    "bonuses": [
                        {
                            "id": 1063,
                            "type": "equipment",
                            "value": 1
                        },
                        {
                            "id": 1067,
                            "type": "equipment",
                            "value": 1
                        },
                        {
                            "id": 7,
                            "type": "currency",
                            "value": 25
                        }
                    ],
                    "completed": true,
                    "progress": [
                        {
                            "before": 0,
                            "current": 2,
                            "display": true,
                            "max": 2
                        }
                    ],
                    "type": "sse.quest"
                },
                "-1566830899": {
                    "bonuses": [],
                    "completed": false,
                    "progress": [
                        {
                            "before": 0,
                            "current": 1,
                            "display": false,
                            "max": 5
                        }
                    ],
                    "tir": {
                        "completed": [],
                        "current": 1
                    },
                    "type": "daily"
                },
                "-1829781351": {
                    "bonuses": [],
                    "completed": false,
                    "progress": [
                        {
                            "before": 0,
                            "current": 1,
                            "display": false,
                            "max": 3
                        }
                    ],
                    "tir": {
                        "completed": [],
                        "current": 1
                    },
                    "type": "daily"
                },
                "-399640004": {
                    "bonuses": [
                        {
                            "id": 2,
                            "type": "currency",
                            "value": 1000
                        }
                    ],
                    "completed": true,
                    "progress": [
                        {
                            "before": 0,
                            "current": 1,
                            "display": true,
                            "max": 1
                        }
                    ],
                    "type": "quest.objective"
                },
                "-998547890": {
                    "bonuses": [
                        {
                            "id": null,
                            "type": "slot",
                            "value": 1
                        },
                        {
                            "id": 4591,
                            "type": "plane",
                            "value": 1
                        },
                        {
                            "id": null,
                            "kwargs": {
                                "boardOnPlaneID": "4591",
                                "mainSkillID": "1",
                                "skillLevel": "100",
                                "skillPoints": "1",
                                "specializationID": "0"
                            },
                            "planeID": 4591,
                            "type": "crew",
                            "value": 1,
                            "ui": {
                                "boardOnPlaneID": "4591",
                                "mainSkillID": "1",
                                "skillLevel": "100",
                                "skillPoints": "1",
                                "specializationID": "0",
                                "planeID": 4591
                            }
                        },
                        {
                            "id": 11,
                            "type": "warcash",
                            "value": 3
                        }
                    ],
                    "completed": true,
                    "progress": [
                        {
                            "before": 0,
                            "current": 2,
                            "display": true,
                            "max": 2
                        }
                    ],
                    "type": "sse.quest"
                },
                "1386050657": {
                    "bonuses": [],
                    "completed": false,
                    "progress": [
                        {
                            "before": 0,
                            "current": 1400,
                            "display": true,
                            "max": 15000
                        }
                    ],
                    "type": "sse.quest.personal"
                },
                "257798909": {
                    "bonuses": [
                        {
                            "id": 1215,
                            "type": "equipment",
                            "value": 1
                        },
                        {
                            "id": 1211,
                            "type": "equipment",
                            "value": 1
                        },
                        {
                            "id": 7,
                            "type": "currency",
                            "value": 25
                        }
                    ],
                    "completed": true,
                    "progress": [
                        {
                            "before": 0,
                            "current": 1,
                            "display": true,
                            "max": 1
                        }
                    ],
                    "type": "sse.quest"
                },
                "875469311": {
                    "bonuses": [
                        {
                            "id": 1012,
                            "type": "warcash",
                            "value": 1
                        }
                    ],
                    "completed": true,
                    "progress": [
                        {
                            "before": 0,
                            "current": 1,
                            "display": true,
                            "max": 1
                        }
                    ],
                    "type": "sse.quest.personal"
                }
            },
            "refill": {
                "credits": 0,
                "gold": 0,
                "tickets": 0
            },
            "repairCr": 0,
            "result": 23,
            "servicePlanes": {
                "refill": {},
                "repair": 0
            },
            "startTime": 1723471790,
            "teams": {
                "0": {
                    "1": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 91,
                        "bestRankPlaneID": 4401,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 1,
                                "isNPC": "false",
                                "killed": "yes",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "japan",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -1742578075,
                                    "hasGunner": "no",
                                    "id": 4401,
                                    "level": 4,
                                    "nation": "japan",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "draw"
                            }
                        },
                        "deaths": 1,
                        "firstGID": -1742578075,
                        "id": 1,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 100,
                        "name": "Kanbara",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 91,
                                "bScore": 1000,
                                "baseCr": 5958.700235035692,
                                "baseXP": 91,
                                "camouflage": 3,
                                "crewXP": 92,
                                "critsInfo": {},
                                "deaths": 1,
                                "extKillers": {
                                    "24": {
                                        "1391": 1
                                    }
                                },
                                "firstWinXPCoeff": 1,
                                "flights": 2,
                                "flighttime": 13,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -1742578075,
                                "mScore": 100,
                                "nationID": 4,
                                "pExtDeaths": {
                                    "player": 1
                                },
                                "pExtKills": {},
                                "planeID": 4401,
                                "planeType": "fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 91,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1299816437,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        },
                                        {
                                            "id": -823071514,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 606152162,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 91,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 5
                    },
                    "10": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 91,
                        "bestRankPlaneID": 2406,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 10,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "ussr",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -1685311821,
                                    "hasGunner": "yes",
                                    "id": 2406,
                                    "level": 4,
                                    "nation": "ussr",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "bomber"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "draw"
                            }
                        },
                        "firstGID": -1685311821,
                        "id": 10,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 100,
                        "name": "Svyatoslav",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 91,
                                "bScore": 1000,
                                "baseCr": 6147.888245406432,
                                "baseXP": 91,
                                "camouflage": 4,
                                "crewXP": 92,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -1685311821,
                                "mScore": 100,
                                "nationID": 2,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 2406,
                                "planeType": "bomber",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 91,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": -1157125025,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 100
                                        },
                                        {
                                            "id": 1416227638,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 40
                                        },
                                        {
                                            "id": -1167923079,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 91,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 5
                    },
                    "11": {
                        "achievements": {},
                        "bScore": 1440,
                        "baseXP": 91,
                        "bestRankPlaneID": 1406,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 11,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "germany",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -1732387792,
                                    "hasGunner": "yes",
                                    "id": 1406,
                                    "level": 4,
                                    "nation": "germany",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "bomber"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "draw"
                            }
                        },
                        "firstGID": -1732387792,
                        "gDamage": 1485,
                        "gKill": 1,
                        "id": 11,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 100,
                        "name": "Hildebrand",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 91,
                                "attackPoints": 20,
                                "bScore": 1440,
                                "baseCr": 8081.5035070369,
                                "baseXP": 91,
                                "camouflage": 4,
                                "crewXP": 92,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gDamage": 1485,
                                "gExtDamage": {
                                    "small": 1485
                                },
                                "gExtKills": {
                                    "smallArmored": 1
                                },
                                "gKill": 1,
                                "gKillMaxDF": 1,
                                "globalID": -1732387792,
                                "mScore": 100,
                                "nationID": 1,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 1406,
                                "planeType": "bomber",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 50
                                            },
                                            "ObjectDestroy": {
                                                "battle": 390
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1440
                                        },
                                        "pointsSum": 1440
                                    }
                                },
                                "premXP": 91,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": -1157125025,
                                            "progress": 0,
                                            "progressMax": 6,
                                            "progressRawValue": 20,
                                            "progressRawValueRequired": 100
                                        },
                                        {
                                            "id": 1416227638,
                                            "progress": 0,
                                            "progressMax": 6,
                                            "progressRawValue": 5,
                                            "progressRawValueRequired": 40
                                        },
                                        {
                                            "id": -1167923079,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 91,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 2
                    },
                    "2": {
                        "achievements": {},
                        "bScore": 1135,
                        "baseXP": 91,
                        "bestRankPlaneID": 2403,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 2,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "ussr",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": 320700646,
                                    "hasGunner": "no",
                                    "id": 2403,
                                    "level": 4,
                                    "nation": "ussr",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "draw"
                            }
                        },
                        "dDamage": 46.86157608032227,
                        "firstGID": 320700646,
                        "id": 2,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 100,
                        "name": "Kazimir",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 91,
                                "bScore": 1135,
                                "baseCr": 6967.912552344998,
                                "baseXP": 91,
                                "camouflage": 2,
                                "crewXP": 92,
                                "critsInfo": {},
                                "dDamage": 46.86157608032227,
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": 320700646,
                                "mScore": 100,
                                "nationID": 2,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 2403,
                                "planeType": "fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 135
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1135
                                        },
                                        "pointsSum": 1135
                                    }
                                },
                                "premXP": 91,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1299816437,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        },
                                        {
                                            "id": -823071514,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 606152162,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 91,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 3
                    },
                    "24": {
                        "achievements": {},
                        "bScore": 3400,
                        "baseXP": 182,
                        "bestRankPlaneID": 1391,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "player",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "pieces": 0,
                            "player": {
                                "accDBID": 15,
                                "id": 24,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "germany",
                                    "crew": {
                                        "id": 1006
                                    },
                                    "global": -1197170888,
                                    "hasGunner": "no",
                                    "id": 1391,
                                    "level": 4,
                                    "nation": "germany",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "navy"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "self": {
                                "event": {
                                    "context": "player",
                                    "name": "top.1.by.kill.plane.defender",
                                    "type": "battle"
                                }
                            },
                            "team": {
                                "result": "draw"
                            },
                            "time": 1723471967
                        },
                        "databaseID": 15,
                        "firstGID": -1197170888,
                        "id": 24,
                        "leaderboards": [],
                        "mScore": 200,
                        "name": "_dev_15",
                        "pDamage": 1150,
                        "pKill": 2,
                        "pieces": {
                            "clientData": {},
                            "data": {}
                        },
                        "planes": [
                            {
                                "aDamage": 790,
                                "achievements": {},
                                "actions": {},
                                "actualXP": 182,
                                "atKillMaxDF": 2,
                                "bScore": 3400,
                                "baseCr": 23684.967984135,
                                "baseXP": 182,
                                "camouflage": 1,
                                "camouflageCoeffs": {
                                    "decor": {
                                        "credits": 0,
                                        "crewXP": 0,
                                        "xp": 0
                                    },
                                    "nose": {
                                        "credits": 0,
                                        "crewXP": 0,
                                        "xp": 0
                                    }
                                },
                                "consumableCoeffs": {},
                                "crewXP": 218,
                                "crewXPList": [
                                    [
                                        0,
                                        218
                                    ]
                                ],
                                "critsInfo": {},
                                "equipmentCoeffs": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "flighttime": 63,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -1197170888,
                                "isElite": true,
                                "isElitePlane": true,
                                "mScore": 200,
                                "nationID": 1,
                                "pDamage": 1150,
                                "pExtDeaths": {},
                                "pExtKills": {
                                    "ally": 2,
                                    "enemy": {
                                        "assault": 1,
                                        "bomber": 1
                                    }
                                },
                                "pKill": 2,
                                "planeID": 1391,
                                "planeType": "navy",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 1000
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": -1000
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 400
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 3400
                                        },
                                        "pointsSum": 3400
                                    }
                                },
                                "premPlaneLvlXPCoeff": 1,
                                "premXP": 182,
                                "quests": {
                                    "82226704": {
                                        "bonuses": [],
                                        "completed": false,
                                        "progress": [
                                            {
                                                "before": 0,
                                                "current": 400,
                                                "display": true,
                                                "max": 27000
                                            },
                                            {
                                                "before": 0,
                                                "current": 0,
                                                "display": true,
                                                "max": 25
                                            }
                                        ],
                                        "type": "stage"
                                    }
                                },
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 415540407,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 50
                                        },
                                        {
                                            "id": 1703894135,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": -1122474517,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "player": {
                                        "kills": {
                                            "2": 1
                                        }
                                    },
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 182,
                                "usedCamouflages": [
                                    1046862147,
                                    -1486059271
                                ],
                                "usedCmbl": [],
                                "usedEqmt": [],
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "3": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 91,
                        "bestRankPlaneID": 2403,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 3,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "ussr",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": 320700646,
                                    "hasGunner": "no",
                                    "id": 2403,
                                    "level": 4,
                                    "nation": "ussr",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "draw"
                            }
                        },
                        "firstGID": 320700646,
                        "id": 3,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 100,
                        "name": "Kirill",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 91,
                                "bScore": 1000,
                                "baseCr": 6337.076255777173,
                                "baseXP": 91,
                                "camouflage": 4,
                                "crewXP": 92,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": 320700646,
                                "mScore": 100,
                                "nationID": 2,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 2403,
                                "planeType": "fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 91,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1299816437,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        },
                                        {
                                            "id": -823071514,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 606152162,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 91,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 5
                    },
                    "4": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 91,
                        "bestRankPlaneID": 4402,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 4,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "japan",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -808231377,
                                    "hasGunner": "no",
                                    "id": 4402,
                                    "level": 4,
                                    "nation": "japan",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "draw"
                            }
                        },
                        "dDamage": 1.125,
                        "firstGID": -808231377,
                        "id": 4,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 100,
                        "name": "Kudo",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 91,
                                "bScore": 1000,
                                "baseCr": 5958.700235035692,
                                "baseXP": 91,
                                "camouflage": 4,
                                "crewXP": 92,
                                "critsInfo": {},
                                "dDamage": 1.125,
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -808231377,
                                "mScore": 100,
                                "nationID": 4,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 4402,
                                "planeType": "fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 91,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1299816437,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        },
                                        {
                                            "id": -823071514,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 606152162,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 91,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 5
                    },
                    "5": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 91,
                        "bestRankPlaneID": 4402,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 5,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "japan",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -808231377,
                                    "hasGunner": "no",
                                    "id": 4402,
                                    "level": 4,
                                    "nation": "japan",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "draw"
                            }
                        },
                        "dDamage": 3.37496280670166,
                        "firstGID": -808231377,
                        "id": 5,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 100,
                        "name": "Ogura",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 91,
                                "bScore": 1000,
                                "baseCr": 5958.700235035692,
                                "baseXP": 91,
                                "camouflage": 5,
                                "crewXP": 92,
                                "critsInfo": {},
                                "dDamage": 3.37496280670166,
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -808231377,
                                "mScore": 100,
                                "nationID": 4,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 4402,
                                "planeType": "fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 91,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1299816437,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        },
                                        {
                                            "id": -823071514,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 606152162,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 91,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 5
                    },
                    "6": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 91,
                        "bestRankPlaneID": 1403,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 6,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "germany",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -724529394,
                                    "hasGunner": "yes",
                                    "id": 1403,
                                    "level": 4,
                                    "nation": "germany",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "heavy.fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "draw"
                            }
                        },
                        "dDamage": 1.514543473720551,
                        "firstGID": -724529394,
                        "id": 6,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 100,
                        "name": "Heinolf",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 91,
                                "bScore": 1000,
                                "baseCr": 8513.460466683326,
                                "baseXP": 91,
                                "camouflage": 4,
                                "crewXP": 110,
                                "critsInfo": {},
                                "dDamage": 1.514543473720551,
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -724529394,
                                "mScore": 100,
                                "nationID": 1,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 1403,
                                "planeType": "heavy.fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 91,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": -159219576,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 1779447378,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        },
                                        {
                                            "id": -22301176,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 91,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 5
                    },
                    "7": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 91,
                        "bestRankPlaneID": 5402,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 7,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "gb",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -808037984,
                                    "hasGunner": "yes",
                                    "id": 5402,
                                    "level": 4,
                                    "nation": "gb",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "heavy.fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "draw"
                            }
                        },
                        "firstGID": -808037984,
                        "id": 7,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 100,
                        "name": "Freeman",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 91,
                                "bScore": 1000,
                                "baseCr": 6904.640286889395,
                                "baseXP": 91,
                                "camouflage": 4,
                                "crewXP": 92,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -808037984,
                                "mScore": 100,
                                "nationID": 5,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 5402,
                                "planeType": "heavy.fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 91,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": -159219576,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 1779447378,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        },
                                        {
                                            "id": -22301176,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 91,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 5
                    },
                    "8": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 91,
                        "bestRankPlaneID": 2405,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 8,
                                "isNPC": "false",
                                "killed": "yes",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "ussr",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": 1651605884,
                                    "hasGunner": "no",
                                    "id": 2405,
                                    "level": 4,
                                    "nation": "ussr",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "assault"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "draw"
                            }
                        },
                        "deaths": 1,
                        "firstGID": 1651605884,
                        "id": 8,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 100,
                        "name": "Arkadiy",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 91,
                                "bScore": 1000,
                                "baseCr": 6432.39235260518,
                                "baseXP": 91,
                                "camouflage": 4,
                                "crewXP": 92,
                                "critsInfo": {},
                                "deaths": 1,
                                "extKillers": {
                                    "24": {
                                        "1391": 1
                                    }
                                },
                                "firstWinXPCoeff": 1,
                                "flights": 2,
                                "flighttime": 23,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": 1651605884,
                                "mScore": 100,
                                "nationID": 2,
                                "pExtDeaths": {
                                    "player": 1
                                },
                                "pExtKills": {},
                                "planeID": 2405,
                                "planeType": "assault",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 91,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1056691134,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 50
                                        },
                                        {
                                            "id": 175793157,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 20
                                        },
                                        {
                                            "id": -319343865,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 91,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 5
                    },
                    "9": {
                        "achievements": {},
                        "bScore": 1030,
                        "baseXP": 91,
                        "bestRankPlaneID": 3404,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 9,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "usa",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -1885961099,
                                    "hasGunner": "no",
                                    "id": 3404,
                                    "level": 4,
                                    "nation": "usa",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "navy"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "draw"
                            }
                        },
                        "dDamage": 13.58440971374512,
                        "firstGID": -1885961099,
                        "id": 9,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 100,
                        "name": "Winston",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 91,
                                "bScore": 1030,
                                "baseCr": 6286.119109284414,
                                "baseXP": 91,
                                "camouflage": 4,
                                "crewXP": 92,
                                "critsInfo": {},
                                "dDamage": 13.58440971374512,
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -1885961099,
                                "mScore": 100,
                                "nationID": 3,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 3404,
                                "planeType": "navy",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 30
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1030
                                        },
                                        "pointsSum": 1030
                                    }
                                },
                                "premXP": 91,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 415540407,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 50
                                        },
                                        {
                                            "id": 1703894135,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": -1122474517,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 91,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 4
                    }
                },
                "1": {
                    "12": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 91,
                        "bestRankPlaneID": 4401,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 12,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "japan",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -1742578075,
                                    "hasGunner": "no",
                                    "id": 4401,
                                    "level": 4,
                                    "nation": "japan",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "draw"
                            }
                        },
                        "firstGID": -1742578075,
                        "id": 12,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 100,
                        "name": "Saito",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 91,
                                "bScore": 1000,
                                "baseCr": 5958.700235035692,
                                "baseXP": 91,
                                "camouflage": 3,
                                "crewXP": 92,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -1742578075,
                                "mScore": 100,
                                "nationID": 4,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 4401,
                                "planeType": "fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 91,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1299816437,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        },
                                        {
                                            "id": -823071514,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 606152162,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 91,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "13": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 91,
                        "bestRankPlaneID": 2403,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 13,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "ussr",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": 320700646,
                                    "hasGunner": "no",
                                    "id": 2403,
                                    "level": 4,
                                    "nation": "ussr",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "draw"
                            }
                        },
                        "firstGID": 320700646,
                        "id": 13,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 100,
                        "name": "Mikhail",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 91,
                                "bScore": 1000,
                                "baseCr": 6337.076255777173,
                                "baseXP": 91,
                                "camouflage": 4,
                                "crewXP": 92,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": 320700646,
                                "mScore": 100,
                                "nationID": 2,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 2403,
                                "planeType": "fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 91,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1299816437,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        },
                                        {
                                            "id": -823071514,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 606152162,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 91,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "14": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 91,
                        "bestRankPlaneID": 2403,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 14,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "ussr",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": 320700646,
                                    "hasGunner": "no",
                                    "id": 2403,
                                    "level": 4,
                                    "nation": "ussr",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "draw"
                            }
                        },
                        "firstGID": 320700646,
                        "id": 14,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 100,
                        "name": "Nikita",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 91,
                                "bScore": 1000,
                                "baseCr": 6337.076255777173,
                                "baseXP": 91,
                                "camouflage": 4,
                                "crewXP": 92,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": 320700646,
                                "mScore": 100,
                                "nationID": 2,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 2403,
                                "planeType": "fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 91,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1299816437,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        },
                                        {
                                            "id": -823071514,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 606152162,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 91,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "15": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 91,
                        "bestRankPlaneID": 4402,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 15,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "japan",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -808231377,
                                    "hasGunner": "no",
                                    "id": 4402,
                                    "level": 4,
                                    "nation": "japan",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "draw"
                            }
                        },
                        "firstGID": -808231377,
                        "id": 15,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 100,
                        "name": "Okabe",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 91,
                                "bScore": 1000,
                                "baseCr": 5958.700235035692,
                                "baseXP": 91,
                                "camouflage": 4,
                                "crewXP": 92,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -808231377,
                                "mScore": 100,
                                "nationID": 4,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 4402,
                                "planeType": "fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 91,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1299816437,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        },
                                        {
                                            "id": -823071514,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 606152162,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 91,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "16": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 91,
                        "bestRankPlaneID": 4402,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 16,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "japan",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -808231377,
                                    "hasGunner": "no",
                                    "id": 4402,
                                    "level": 4,
                                    "nation": "japan",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "draw"
                            }
                        },
                        "firstGID": -808231377,
                        "id": 16,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 100,
                        "name": "Haraguchi",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 91,
                                "bScore": 1000,
                                "baseCr": 5958.700235035692,
                                "baseXP": 91,
                                "camouflage": 4,
                                "crewXP": 92,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -808231377,
                                "mScore": 100,
                                "nationID": 4,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 4402,
                                "planeType": "fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 91,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1299816437,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        },
                                        {
                                            "id": -823071514,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 606152162,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 91,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "17": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 91,
                        "bestRankPlaneID": 1403,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 17,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "germany",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -724529394,
                                    "hasGunner": "yes",
                                    "id": 1403,
                                    "level": 4,
                                    "nation": "germany",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "heavy.fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "draw"
                            }
                        },
                        "firstGID": -724529394,
                        "id": 17,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 100,
                        "name": "Laurenz",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 91,
                                "bScore": 1000,
                                "baseCr": 8513.460466683326,
                                "baseXP": 91,
                                "camouflage": 4,
                                "crewXP": 110,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -724529394,
                                "mScore": 100,
                                "nationID": 1,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 1403,
                                "planeType": "heavy.fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 91,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": -159219576,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 1779447378,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        },
                                        {
                                            "id": -22301176,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 91,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "18": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 91,
                        "bestRankPlaneID": 5402,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 18,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "gb",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -808037984,
                                    "hasGunner": "yes",
                                    "id": 5402,
                                    "level": 4,
                                    "nation": "gb",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "heavy.fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "draw"
                            }
                        },
                        "firstGID": -808037984,
                        "id": 18,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 100,
                        "name": "Jasper",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 91,
                                "bScore": 1000,
                                "baseCr": 6904.640286889395,
                                "baseXP": 91,
                                "camouflage": 1,
                                "crewXP": 92,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -808037984,
                                "mScore": 100,
                                "nationID": 5,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 5402,
                                "planeType": "heavy.fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 91,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": -159219576,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 1779447378,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        },
                                        {
                                            "id": -22301176,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 91,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "19": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 91,
                        "bestRankPlaneID": 2405,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 19,
                                "isNPC": "false",
                                "killed": "yes",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "ussr",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": 1651605884,
                                    "hasGunner": "no",
                                    "id": 2405,
                                    "level": 4,
                                    "nation": "ussr",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "assault"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "draw"
                            }
                        },
                        "deaths": 1,
                        "firstGID": 1651605884,
                        "id": 19,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 100,
                        "name": "Maksim",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 91,
                                "bScore": 1000,
                                "baseCr": 6432.39235260518,
                                "baseXP": 91,
                                "camouflage": 4,
                                "crewXP": 92,
                                "critsInfo": {},
                                "deaths": 1,
                                "extKillers": {
                                    "24": {
                                        "1391": 1
                                    }
                                },
                                "firstWinXPCoeff": 1,
                                "flights": 2,
                                "flighttime": 42,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": 1651605884,
                                "mScore": 100,
                                "nationID": 2,
                                "pExtDeaths": {
                                    "player": 1
                                },
                                "pExtKills": {},
                                "planeID": 2405,
                                "planeType": "assault",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 91,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1056691134,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 50
                                        },
                                        {
                                            "id": 175793157,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 20
                                        },
                                        {
                                            "id": -319343865,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 91,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "20": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 91,
                        "bestRankPlaneID": 5403,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 20,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "gb",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": 2102472070,
                                    "hasGunner": "no",
                                    "id": 5403,
                                    "level": 4,
                                    "nation": "gb",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "navy"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "draw"
                            }
                        },
                        "firstGID": 2102472070,
                        "id": 20,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 100,
                        "name": "Bruce",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 91,
                                "bScore": 1000,
                                "baseCr": 5958.700235035692,
                                "baseXP": 91,
                                "camouflage": 4,
                                "crewXP": 92,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": 2102472070,
                                "mScore": 100,
                                "nationID": 5,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 5403,
                                "planeType": "navy",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 91,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 415540407,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 50
                                        },
                                        {
                                            "id": 1703894135,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": -1122474517,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 91,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "21": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 91,
                        "bestRankPlaneID": 3404,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 21,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "usa",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -1885961099,
                                    "hasGunner": "no",
                                    "id": 3404,
                                    "level": 4,
                                    "nation": "usa",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "navy"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "draw"
                            }
                        },
                        "firstGID": -1885961099,
                        "id": 21,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 100,
                        "name": "Stewart",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 91,
                                "bScore": 1000,
                                "baseCr": 6147.888245406432,
                                "baseXP": 91,
                                "camouflage": 3,
                                "crewXP": 92,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -1885961099,
                                "mScore": 100,
                                "nationID": 3,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 3404,
                                "planeType": "navy",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 91,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 415540407,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 50
                                        },
                                        {
                                            "id": 1703894135,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": -1122474517,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 91,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "22": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 91,
                        "bestRankPlaneID": 2406,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 22,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "ussr",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -1685311821,
                                    "hasGunner": "yes",
                                    "id": 2406,
                                    "level": 4,
                                    "nation": "ussr",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "bomber"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "draw"
                            }
                        },
                        "firstGID": -1685311821,
                        "id": 22,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 100,
                        "name": "Vsevolod",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 91,
                                "bScore": 1000,
                                "baseCr": 6147.888245406432,
                                "baseXP": 91,
                                "camouflage": 4,
                                "crewXP": 92,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -1685311821,
                                "mScore": 100,
                                "nationID": 2,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 2406,
                                "planeType": "bomber",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 91,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": -1157125025,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 100
                                        },
                                        {
                                            "id": 1416227638,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 40
                                        },
                                        {
                                            "id": -1167923079,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 91,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "23": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 91,
                        "bestRankPlaneID": 1406,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 23,
                                "isNPC": "false",
                                "killed": "yes",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "germany",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -1732387792,
                                    "hasGunner": "yes",
                                    "id": 1406,
                                    "level": 4,
                                    "nation": "germany",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "bomber"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "draw"
                            }
                        },
                        "deaths": 1,
                        "firstGID": -1732387792,
                        "id": 23,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 100,
                        "name": "Sven",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 91,
                                "bScore": 1000,
                                "baseCr": 6147.888245406432,
                                "baseXP": 91,
                                "camouflage": 4,
                                "crewXP": 92,
                                "critsInfo": {},
                                "deaths": 1,
                                "extKillers": {
                                    "24": {
                                        "1391": 1
                                    }
                                },
                                "firstWinXPCoeff": 1,
                                "flights": 2,
                                "flighttime": 34,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -1732387792,
                                "mScore": 100,
                                "nationID": 1,
                                "pExtDeaths": {
                                    "player": 1
                                },
                                "pExtKills": {},
                                "planeID": 1406,
                                "planeType": "bomber",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 91,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": -1157125025,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 100
                                        },
                                        {
                                            "id": 1416227638,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 40
                                        },
                                        {
                                            "id": -1167923079,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 91,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    }
                }
            },
            "totalCr": 23684,
            "totalFreeXP": 9,
            "totalXP": 182,
            "winState": 2
        }
        
        response5 = {
            "accConsumablesIDs": [],
            "actualCr": 12940,
            "actualXP": 1376,
            "arenaName": "Albion: Trump Card",
            "arenaType": 4,
            "autoResolve": false,
            "autoShow": true,
            "baseCr": 12940.9961136594,
            "baseFreeXP": 68,
            "baseXP": 688,
            "events": [
                {
                    "7": {
                        "planeID": 4591,
                        "value": 688
                    }
                }
            ],
            "expensesCr": 0,
            "freeXPOtherBonus": 0,
            "freeXPPremBonus": 17,
            "gameMode": 11,
            "gameModeResults": {
                "allyPoints": 800,
                "enemyPoints": 400,
                "gameTime": 39,
                "winState": 1
            },
            "isPremiumAccount": false,
            "leaderboards": {},
            "mapID": 90,
            "pieces": {},
            "playerID": 100,
            "premCr": 12940.9961136594,
            "premCrCoeff": 1,
            "premXP": 688,
            "premXPCoeff": 1,
            "quests": {
                "-1359506284": {
                    "bonuses": [],
                    "completed": true,
                    "progress": [],
                    "type": "sse.quest"
                },
                "-1574677591": {
                    "bonuses": [
                        {
                            "id": null,
                            "type": "gold",
                            "value": 100
                        }
                    ],
                    "completed": true,
                    "progress": [
                        {
                            "before": 0,
                            "current": 1,
                            "display": true,
                            "max": 1
                        }
                    ],
                    "type": "sse.quest.personal"
                },
                "-1736981365": {
                    "bonuses": [],
                    "completed": false,
                    "progress": [
                        {
                            "before": 0,
                            "current": 1,
                            "display": true,
                            "max": 3
                        }
                    ],
                    "type": "sse.quest.personal"
                },
                "-445574551": {
                    "bonuses": [],
                    "completed": false,
                    "progress": [
                        {
                            "before": 0,
                            "current": 1,
                            "display": false,
                            "max": 3
                        }
                    ],
                    "tir": {
                        "completed": [],
                        "current": 2
                    },
                    "type": "daily"
                },
                "-721232835": {
                    "bonuses": [],
                    "completed": false,
                    "progress": [
                        {
                            "before": 0,
                            "current": 1,
                            "display": false,
                            "max": 5
                        }
                    ],
                    "tir": {
                        "completed": [],
                        "current": 2
                    },
                    "type": "daily"
                },
                "588566855": {
                    "bonuses": [],
                    "completed": false,
                    "progress": [
                        {
                            "before": 0,
                            "current": 1,
                            "display": true,
                            "max": 3
                        }
                    ],
                    "type": "sse.quest"
                }
            },
            "refill": {
                "credits": 0,
                "gold": 0,
                "tickets": 0
            },
            "repairCr": 0,
            "result": 22,
            "servicePlanes": {
                "refill": {},
                "repair": 925
            },
            "startTime": 1723472380,
            "teams": {
                "0": {
                    "100": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 688,
                        "bestRankPlaneID": 4591,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "player",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "pieces": 0,
                            "player": {
                                "accDBID": 15,
                                "id": 100,
                                "isNPC": "false",
                                "killed": "yes",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "japan",
                                    "crew": {
                                        "id": 1007
                                    },
                                    "global": 121025802,
                                    "hasGunner": "no",
                                    "id": 4591,
                                    "level": 5,
                                    "nation": "japan",
                                    "specialization": "stock",
                                    "tir": "2",
                                    "type": "fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 1
                            },
                            "self": {
                                "event": {
                                    "context": "player",
                                    "name": "top.1.by.kill.plane.defender",
                                    "type": "battle"
                                }
                            },
                            "team": {
                                "result": "win"
                            },
                            "time": 1723472452
                        },
                        "databaseID": 15,
                        "deaths": 1,
                        "firstGID": 121025802,
                        "id": 100,
                        "leaderboards": [],
                        "mScore": 450,
                        "name": "_dev_15",
                        "pieces": {
                            "clientData": {},
                            "data": {}
                        },
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 1376,
                                "bScore": 1000,
                                "baseCr": 12940.9961136594,
                                "baseXP": 688,
                                "camouflage": 1,
                                "camouflageCoeffs": {
                                    "decor": {
                                        "credits": 0,
                                        "crewXP": 0,
                                        "xp": 0
                                    },
                                    "nose": {
                                        "credits": 0,
                                        "crewXP": 0,
                                        "xp": 0
                                    }
                                },
                                "consumableCoeffs": {},
                                "crewXP": 1651,
                                "crewXPList": [
                                    [
                                        0,
                                        1651
                                    ]
                                ],
                                "critsInfo": {},
                                "deaths": 1,
                                "equipmentCoeffs": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 2,
                                "flights": 1,
                                "flighttime": 22,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": 121025802,
                                "isElite": true,
                                "isElitePlane": true,
                                "mScore": 450,
                                "nationID": 4,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "pSuicides": 1,
                                "planeID": 4591,
                                "planeType": "fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premPlaneLvlXPCoeff": 1,
                                "premXP": 688,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1299816437,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        },
                                        {
                                            "id": -823071514,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 606152162,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 1376,
                                "usedCamouflages": [
                                    -504840880,
                                    2028072170
                                ],
                                "usedCmbl": [],
                                "usedEqmt": [],
                                "usedWeapon": [
                                    0,
                                    1
                                ],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "77": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 614,
                        "bestRankPlaneID": 4401,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 77,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "japan",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -1742578075,
                                    "hasGunner": "no",
                                    "id": 4401,
                                    "level": 4,
                                    "nation": "japan",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 1
                            },
                            "team": {
                                "result": "win"
                            }
                        },
                        "firstGID": -1742578075,
                        "id": 77,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 450,
                        "name": "Kanbara",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 614,
                                "bScore": 1000,
                                "baseCr": 7150.151445385776,
                                "baseXP": 614,
                                "camouflage": 2,
                                "crewXP": 626,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -1742578075,
                                "mScore": 450,
                                "nationID": 4,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 4401,
                                "planeType": "fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 614,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1299816437,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        },
                                        {
                                            "id": -823071514,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 606152162,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 614,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "78": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 614,
                        "bestRankPlaneID": 2403,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 78,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "ussr",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": 320700646,
                                    "hasGunner": "no",
                                    "id": 2403,
                                    "level": 4,
                                    "nation": "ussr",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 1
                            },
                            "team": {
                                "result": "win"
                            }
                        },
                        "firstGID": 320700646,
                        "id": 78,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 450,
                        "name": "Kazimir",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 614,
                                "bScore": 1000,
                                "baseCr": 7605.069180246717,
                                "baseXP": 614,
                                "camouflage": 3,
                                "crewXP": 626,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": 320700646,
                                "mScore": 450,
                                "nationID": 2,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 2403,
                                "planeType": "fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 614,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1299816437,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        },
                                        {
                                            "id": -823071514,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 606152162,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 614,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "79": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 614,
                        "bestRankPlaneID": 2403,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 79,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "ussr",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": 320700646,
                                    "hasGunner": "no",
                                    "id": 2403,
                                    "level": 4,
                                    "nation": "ussr",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 1
                            },
                            "team": {
                                "result": "win"
                            }
                        },
                        "firstGID": 320700646,
                        "id": 79,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 450,
                        "name": "Kirill",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 614,
                                "bScore": 1000,
                                "baseCr": 7605.069180246717,
                                "baseXP": 614,
                                "camouflage": 4,
                                "crewXP": 626,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": 320700646,
                                "mScore": 450,
                                "nationID": 2,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 2403,
                                "planeType": "fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 614,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1299816437,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        },
                                        {
                                            "id": -823071514,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 606152162,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 614,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "80": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 614,
                        "bestRankPlaneID": 4402,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 80,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "japan",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -808231377,
                                    "hasGunner": "no",
                                    "id": 4402,
                                    "level": 4,
                                    "nation": "japan",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 1
                            },
                            "team": {
                                "result": "win"
                            }
                        },
                        "firstGID": -808231377,
                        "id": 80,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 450,
                        "name": "Kudo",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 614,
                                "bScore": 1000,
                                "baseCr": 7150.151445385776,
                                "baseXP": 614,
                                "camouflage": 4,
                                "crewXP": 626,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -808231377,
                                "mScore": 450,
                                "nationID": 4,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 4402,
                                "planeType": "fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 614,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1299816437,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        },
                                        {
                                            "id": -823071514,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 606152162,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 614,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "81": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 614,
                        "bestRankPlaneID": 4402,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 81,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "japan",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -808231377,
                                    "hasGunner": "no",
                                    "id": 4402,
                                    "level": 4,
                                    "nation": "japan",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 1
                            },
                            "team": {
                                "result": "win"
                            }
                        },
                        "firstGID": -808231377,
                        "id": 81,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 450,
                        "name": "Ogura",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 614,
                                "bScore": 1000,
                                "baseCr": 7150.151445385776,
                                "baseXP": 614,
                                "camouflage": 4,
                                "crewXP": 626,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -808231377,
                                "mScore": 450,
                                "nationID": 4,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 4402,
                                "planeType": "fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 614,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1299816437,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        },
                                        {
                                            "id": -823071514,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 606152162,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 614,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "82": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 614,
                        "bestRankPlaneID": 1403,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 82,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "germany",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -724529394,
                                    "hasGunner": "yes",
                                    "id": 1403,
                                    "level": 4,
                                    "nation": "germany",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "heavy.fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 1
                            },
                            "team": {
                                "result": "win"
                            }
                        },
                        "firstGID": -724529394,
                        "id": 82,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 450,
                        "name": "Heinolf",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 614,
                                "bScore": 1000,
                                "baseCr": 10216.15256001999,
                                "baseXP": 614,
                                "camouflage": 3,
                                "crewXP": 748,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -724529394,
                                "mScore": 450,
                                "nationID": 1,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 1403,
                                "planeType": "heavy.fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 614,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": -159219576,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 1779447378,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        },
                                        {
                                            "id": -22301176,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 614,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "83": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 614,
                        "bestRankPlaneID": 5402,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 83,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "gb",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -808037984,
                                    "hasGunner": "yes",
                                    "id": 5402,
                                    "level": 4,
                                    "nation": "gb",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "heavy.fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 1
                            },
                            "team": {
                                "result": "win"
                            }
                        },
                        "firstGID": -808037984,
                        "id": 83,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 450,
                        "name": "Freeman",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 614,
                                "bScore": 1000,
                                "baseCr": 8285.279507610219,
                                "baseXP": 614,
                                "camouflage": 4,
                                "crewXP": 626,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -808037984,
                                "mScore": 450,
                                "nationID": 5,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 5402,
                                "planeType": "heavy.fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 614,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": -159219576,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 1779447378,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        },
                                        {
                                            "id": -22301176,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 614,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "84": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 614,
                        "bestRankPlaneID": 2405,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 84,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "ussr",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": 1651605884,
                                    "hasGunner": "no",
                                    "id": 2405,
                                    "level": 4,
                                    "nation": "ussr",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "assault"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 1
                            },
                            "team": {
                                "result": "win"
                            }
                        },
                        "firstGID": 1651605884,
                        "id": 84,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 450,
                        "name": "Arkadiy",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 614,
                                "bScore": 1000,
                                "baseCr": 7717.715476497998,
                                "baseXP": 614,
                                "camouflage": 5,
                                "crewXP": 626,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": 1651605884,
                                "mScore": 450,
                                "nationID": 2,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 2405,
                                "planeType": "assault",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 614,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1056691134,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 50
                                        },
                                        {
                                            "id": 175793157,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 20
                                        },
                                        {
                                            "id": -319343865,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 614,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "85": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 614,
                        "bestRankPlaneID": 3404,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 85,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "usa",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -1885961099,
                                    "hasGunner": "no",
                                    "id": 3404,
                                    "level": 4,
                                    "nation": "usa",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "navy"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 1
                            },
                            "team": {
                                "result": "win"
                            }
                        },
                        "firstGID": -1885961099,
                        "id": 85,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 450,
                        "name": "Winston",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 614,
                                "bScore": 1000,
                                "baseCr": 7378.332404458883,
                                "baseXP": 614,
                                "camouflage": 1,
                                "crewXP": 626,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -1885961099,
                                "mScore": 450,
                                "nationID": 3,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 3404,
                                "planeType": "navy",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 614,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 415540407,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 50
                                        },
                                        {
                                            "id": 1703894135,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": -1122474517,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 614,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "86": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 614,
                        "bestRankPlaneID": 2406,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 86,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "ussr",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -1685311821,
                                    "hasGunner": "yes",
                                    "id": 2406,
                                    "level": 4,
                                    "nation": "ussr",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "bomber"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 1
                            },
                            "team": {
                                "result": "win"
                            }
                        },
                        "firstGID": -1685311821,
                        "id": 86,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 450,
                        "name": "Svyatoslav",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 614,
                                "bScore": 1000,
                                "baseCr": 7378.332404458883,
                                "baseXP": 614,
                                "camouflage": 6,
                                "crewXP": 626,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -1685311821,
                                "mScore": 450,
                                "nationID": 2,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 2406,
                                "planeType": "bomber",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 614,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": -1157125025,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 100
                                        },
                                        {
                                            "id": 1416227638,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 40
                                        },
                                        {
                                            "id": -1167923079,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 614,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "87": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 614,
                        "bestRankPlaneID": 1406,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 87,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "germany",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -1732387792,
                                    "hasGunner": "yes",
                                    "id": 1406,
                                    "level": 4,
                                    "nation": "germany",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "bomber"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 10
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 0,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 1
                            },
                            "team": {
                                "result": "win"
                            }
                        },
                        "firstGID": -1732387792,
                        "id": 87,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 450,
                        "name": "Hildebrand",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 614,
                                "bScore": 1000,
                                "baseCr": 7378.332404458883,
                                "baseXP": 614,
                                "camouflage": 4,
                                "crewXP": 626,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -1732387792,
                                "mScore": 450,
                                "nationID": 1,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 1406,
                                "planeType": "bomber",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 614,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": -1157125025,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 100
                                        },
                                        {
                                            "id": 1416227638,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 40
                                        },
                                        {
                                            "id": -1167923079,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 614,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    }
                },
                "1": {
                    "88": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 364,
                        "bestRankPlaneID": 4401,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 88,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "japan",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -1742578075,
                                    "hasGunner": "no",
                                    "id": 4401,
                                    "level": 4,
                                    "nation": "japan",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "lose"
                            }
                        },
                        "firstGID": -1742578075,
                        "id": 88,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 400,
                        "name": "Saito",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 364,
                                "bScore": 1000,
                                "baseCr": 5958.700235035692,
                                "baseXP": 364,
                                "camouflage": 4,
                                "crewXP": 371,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -1742578075,
                                "mScore": 400,
                                "nationID": 4,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 4401,
                                "planeType": "fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 364,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1299816437,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        },
                                        {
                                            "id": -823071514,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 606152162,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 364,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "89": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 364,
                        "bestRankPlaneID": 2403,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 89,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "ussr",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": 320700646,
                                    "hasGunner": "no",
                                    "id": 2403,
                                    "level": 4,
                                    "nation": "ussr",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "lose"
                            }
                        },
                        "firstGID": 320700646,
                        "id": 89,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 400,
                        "name": "Mikhail",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 364,
                                "bScore": 1000,
                                "baseCr": 6337.076255777173,
                                "baseXP": 364,
                                "camouflage": 1,
                                "crewXP": 371,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": 320700646,
                                "mScore": 400,
                                "nationID": 2,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 2403,
                                "planeType": "fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 364,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1299816437,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        },
                                        {
                                            "id": -823071514,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 606152162,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 364,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "90": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 364,
                        "bestRankPlaneID": 2403,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 90,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "ussr",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": 320700646,
                                    "hasGunner": "no",
                                    "id": 2403,
                                    "level": 4,
                                    "nation": "ussr",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "lose"
                            }
                        },
                        "firstGID": 320700646,
                        "id": 90,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 400,
                        "name": "Nikita",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 364,
                                "bScore": 1000,
                                "baseCr": 6337.076255777173,
                                "baseXP": 364,
                                "camouflage": 6,
                                "crewXP": 371,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": 320700646,
                                "mScore": 400,
                                "nationID": 2,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 2403,
                                "planeType": "fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 364,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1299816437,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        },
                                        {
                                            "id": -823071514,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 606152162,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 364,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "91": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 364,
                        "bestRankPlaneID": 4402,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 91,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "japan",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -808231377,
                                    "hasGunner": "no",
                                    "id": 4402,
                                    "level": 4,
                                    "nation": "japan",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "lose"
                            }
                        },
                        "firstGID": -808231377,
                        "id": 91,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 400,
                        "name": "Okabe",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 364,
                                "bScore": 1000,
                                "baseCr": 5958.700235035692,
                                "baseXP": 364,
                                "camouflage": 4,
                                "crewXP": 371,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -808231377,
                                "mScore": 400,
                                "nationID": 4,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 4402,
                                "planeType": "fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 364,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1299816437,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        },
                                        {
                                            "id": -823071514,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 606152162,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 364,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "92": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 364,
                        "bestRankPlaneID": 4402,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 92,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "japan",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -808231377,
                                    "hasGunner": "no",
                                    "id": 4402,
                                    "level": 4,
                                    "nation": "japan",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "lose"
                            }
                        },
                        "firstGID": -808231377,
                        "id": 92,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 400,
                        "name": "Haraguchi",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 364,
                                "bScore": 1000,
                                "baseCr": 5958.700235035692,
                                "baseXP": 364,
                                "camouflage": 4,
                                "crewXP": 371,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -808231377,
                                "mScore": 400,
                                "nationID": 4,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 4402,
                                "planeType": "fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 364,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1299816437,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        },
                                        {
                                            "id": -823071514,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 606152162,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 364,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "93": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 364,
                        "bestRankPlaneID": 1403,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 93,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "germany",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -724529394,
                                    "hasGunner": "yes",
                                    "id": 1403,
                                    "level": 4,
                                    "nation": "germany",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "heavy.fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "lose"
                            }
                        },
                        "firstGID": -724529394,
                        "id": 93,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 400,
                        "name": "Laurenz",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 364,
                                "bScore": 1000,
                                "baseCr": 8513.460466683326,
                                "baseXP": 364,
                                "camouflage": 4,
                                "crewXP": 443,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -724529394,
                                "mScore": 400,
                                "nationID": 1,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 1403,
                                "planeType": "heavy.fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 364,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": -159219576,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 1779447378,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        },
                                        {
                                            "id": -22301176,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 364,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "94": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 364,
                        "bestRankPlaneID": 5402,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 94,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "gb",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -808037984,
                                    "hasGunner": "yes",
                                    "id": 5402,
                                    "level": 4,
                                    "nation": "gb",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "heavy.fighter"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "lose"
                            }
                        },
                        "firstGID": -808037984,
                        "id": 94,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 400,
                        "name": "Jasper",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 364,
                                "bScore": 1000,
                                "baseCr": 6904.640286889395,
                                "baseXP": 364,
                                "camouflage": 2,
                                "crewXP": 371,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -808037984,
                                "mScore": 400,
                                "nationID": 5,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 5402,
                                "planeType": "heavy.fighter",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 364,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": -159219576,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": 1779447378,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 75
                                        },
                                        {
                                            "id": -22301176,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 3
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 364,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "95": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 364,
                        "bestRankPlaneID": 2405,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 95,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "ussr",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": 1651605884,
                                    "hasGunner": "no",
                                    "id": 2405,
                                    "level": 4,
                                    "nation": "ussr",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "assault"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "lose"
                            }
                        },
                        "firstGID": 1651605884,
                        "id": 95,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 400,
                        "name": "Maksim",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 364,
                                "bScore": 1000,
                                "baseCr": 6432.39235260518,
                                "baseXP": 364,
                                "camouflage": 4,
                                "crewXP": 371,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": 1651605884,
                                "mScore": 400,
                                "nationID": 2,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 2405,
                                "planeType": "assault",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 364,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 1056691134,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 50
                                        },
                                        {
                                            "id": 175793157,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 20
                                        },
                                        {
                                            "id": -319343865,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 364,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "96": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 364,
                        "bestRankPlaneID": 5403,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 96,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "gb",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": 2102472070,
                                    "hasGunner": "no",
                                    "id": 5403,
                                    "level": 4,
                                    "nation": "gb",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "navy"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "lose"
                            }
                        },
                        "firstGID": 2102472070,
                        "id": 96,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 400,
                        "name": "Bruce",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 364,
                                "bScore": 1000,
                                "baseCr": 5958.700235035692,
                                "baseXP": 364,
                                "camouflage": 5,
                                "crewXP": 371,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": 2102472070,
                                "mScore": 400,
                                "nationID": 5,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 5403,
                                "planeType": "navy",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 364,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 415540407,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 50
                                        },
                                        {
                                            "id": 1703894135,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": -1122474517,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 364,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "97": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 364,
                        "bestRankPlaneID": 3404,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 97,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "usa",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -1885961099,
                                    "hasGunner": "no",
                                    "id": 3404,
                                    "level": 4,
                                    "nation": "usa",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "navy"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "lose"
                            }
                        },
                        "firstGID": -1885961099,
                        "id": 97,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 400,
                        "name": "Stewart",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 364,
                                "bScore": 1000,
                                "baseCr": 6147.888245406432,
                                "baseXP": 364,
                                "camouflage": 3,
                                "crewXP": 371,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -1885961099,
                                "mScore": 400,
                                "nationID": 3,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 3404,
                                "planeType": "navy",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 364,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": 415540407,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 50
                                        },
                                        {
                                            "id": 1703894135,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        },
                                        {
                                            "id": -1122474517,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 364,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "98": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 364,
                        "bestRankPlaneID": 2406,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 98,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "ussr",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -1685311821,
                                    "hasGunner": "yes",
                                    "id": 2406,
                                    "level": 4,
                                    "nation": "ussr",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "bomber"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "lose"
                            }
                        },
                        "firstGID": -1685311821,
                        "id": 98,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 400,
                        "name": "Vsevolod",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 364,
                                "bScore": 1000,
                                "baseCr": 6147.888245406432,
                                "baseXP": 364,
                                "camouflage": 3,
                                "crewXP": 371,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -1685311821,
                                "mScore": 400,
                                "nationID": 2,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 2406,
                                "planeType": "bomber",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 364,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": -1157125025,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 100
                                        },
                                        {
                                            "id": 1416227638,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 40
                                        },
                                        {
                                            "id": -1167923079,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 364,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    },
                    "99": {
                        "achievements": {},
                        "bScore": 1000,
                        "baseXP": 364,
                        "bestRankPlaneID": 1406,
                        "clan": "",
                        "context": {
                            "activities": {
                                "component": {
                                    "globalScore": "active",
                                    "leaderboard": "active",
                                    "redcomet": "war_1_gatheringstorm"
                                }
                            },
                            "arena": {
                                "mode": "areaconquest",
                                "source": "bot",
                                "type": "normal"
                            },
                            "leaderboards": [
                                "war_1_gatheringstorm"
                            ],
                            "player": {
                                "accDBID": 0,
                                "id": 99,
                                "isNPC": "false",
                                "killed": "no",
                                "lastBattleTime": 0,
                                "plane": {
                                    "activeNation": "germany",
                                    "crew": {
                                        "id": -1
                                    },
                                    "global": -1732387792,
                                    "hasGunner": "yes",
                                    "id": 1406,
                                    "level": 4,
                                    "nation": "germany",
                                    "specialization": "stock",
                                    "tir": "1",
                                    "type": "bomber"
                                },
                                "squad": {
                                    "active": "no",
                                    "id": 30
                                },
                                "stayToTheEnd": "yes",
                                "teamIndex": 1,
                                "testflight": "false",
                                "type": "player",
                                "winStreak": 0
                            },
                            "team": {
                                "result": "lose"
                            }
                        },
                        "firstGID": -1732387792,
                        "id": 99,
                        "isBot": true,
                        "leaderboards": [],
                        "mScore": 400,
                        "name": "Sven",
                        "planes": [
                            {
                                "achievements": {},
                                "actions": {},
                                "actualXP": 364,
                                "bScore": 1000,
                                "baseCr": 6147.888245406432,
                                "baseXP": 364,
                                "camouflage": 4,
                                "crewXP": 371,
                                "critsInfo": {},
                                "extKillers": {},
                                "firstWinXPCoeff": 1,
                                "flights": 1,
                                "gExtDamage": {},
                                "gExtKills": {},
                                "globalID": -1732387792,
                                "mScore": 400,
                                "nationID": 1,
                                "pExtDeaths": {},
                                "pExtKills": {},
                                "planeID": 1406,
                                "planeType": "bomber",
                                "postBattle": {
                                    "economics": {
                                        "PersonalScore": {
                                            "EndGame": {
                                                "battle": 1000
                                            },
                                            "ObjectAssistDestroy": {
                                                "battle": 0
                                            },
                                            "ObjectDamage": {
                                                "battle": 0
                                            },
                                            "ObjectDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneAssistDestroy": {
                                                "battle": 0
                                            },
                                            "PlaneDamage": {
                                                "battle": 0
                                            },
                                            "PlaneDestroy": {
                                                "AllyPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "BomberPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "DefenderPlaneDestroy": {
                                                    "battle": 0
                                                },
                                                "EnemyPlaneDestroy": {
                                                    "battle": 0
                                                }
                                            },
                                            "SectorAttack": {
                                                "battle": 0
                                            },
                                            "SectorCapture": {
                                                "battle": 0
                                            },
                                            "SectorDefence": {
                                                "battle": 0
                                            },
                                            "SectorParticipationCapture": {
                                                "battle": 0
                                            },
                                            "pointsSum": 1000
                                        },
                                        "pointsSum": 1000
                                    }
                                },
                                "premXP": 364,
                                "quests": {},
                                "ranks": {
                                    "objectives": [
                                        {
                                            "id": -1157125025,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 100
                                        },
                                        {
                                            "id": 1416227638,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 40
                                        },
                                        {
                                            "id": -1167923079,
                                            "progressMax": 6,
                                            "progressRawValueRequired": 1
                                        }
                                    ],
                                    "rank": null
                                },
                                "streaks": {
                                    "points": {
                                        "1000": 1
                                    }
                                },
                                "totalXP": 364,
                                "usedWeapon": [],
                                "zoneCaptureExtended": {}
                            }
                        ],
                        "rank": 1
                    }
                }
            },
            "totalCr": 12940,
            "totalFreeXP": 68,
            "totalXP": 1376,
            "winState": 1
        }

//        fillQuests();
    }
    
    private function fillQuests():void {
        if (!response.quests) response.quests = {};
        
        var before, current, max:int;
        for (var i:int = 0; i < QUESTS; i++) {
            max = Utils.getRandom(5, MAX_VALUE);
            current = Utils.getRandom(0, max);
            before = Utils.coinFlip() ? 0 : Utils.getRandom(0, current);
            
            response.quests["" + i] =
                    {
                        "bonuses": [],
                        "completed": false,
                        "progress": [
                            {
                                "before": before,
                                "current": current,
                                "display": true,
                                "max": max
                            }
                        ],
                        "type": "sse.quest"
                    }
        }
    }
}
}

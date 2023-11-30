package utils.wg.debug {

import wowp.utils.Utils;

public class FakeBattleResult {
    public var response:Object;
    private var QUESTS:int = 20;
    private var MAX_VALUE:int = 3000000;
    
    public function FakeBattleResult() {
        response =
                {
                    "accConsumablesIDs":[
            
                    ],
                    "actualCr":19410,
                    "actualXP":1032,
                    "arenaName":"Albion: Final Argument",
                    "arenaType":4,
                    "autoResolve":false,
                    "autoShow":true,
                    "baseCr":12940.9961136594,
                    "baseFreeXP":34,
                    "baseXP":688,
                    "events":[
            
                    ],
                    "expensesCr":0,
                    "freeXPOtherBonus":0,
                    "freeXPPremBonus":17,
                    "gameMode":11,
                    "gameModeResults":{
                        "allyPoints":800,
                        "enemyPoints":400,
                        "gameTime":5,
                        "winState":1
                    },
                    "isPremiumAccount":true,
                    "leaderboards":{
                
                    },
                    "mapID":91,
                    "pieces":{
                
                    },
                    "playerID":2,
                    "premCr":19410.9961136594,
                    "premCrCoeff":1.5,
                    "premXP":1032,
                    "premXPCoeff":1.5,
                    "quests":{
                        "-1678821532":{
                            "bonuses":[
                    
                            ],
                            "completed":false,
                            "progress":[
                                {
                                    "before":2,
                                    "current":3,
                                    "display":false,
                                    "max":5
                                }
                            ],
                            "tir":{
                                "completed":[
                        
                                ],
                                "current":2
                            },
                            "type":"daily"
                        },
                        "-18538665":{
                            "bonuses":[
                    
                            ],
                            "completed":true,
                            "progress":[
                    
                            ],
                            "type":"sse.quest.marathon"
                        },
                        "-258851693":{
                            "bonuses":[
                    
                            ],
                            "completed":true,
                            "progress":[
                                {
                                    "before":0,
                                    "current":1,
                                    "display":true,
                                    "max":1
                                }
                            ],
                            "type":"sse.quest.marathon"
                        },
                        "-455173566":{
                            "bonuses":[
                                {
                                    "id":null,
                                    "type":"slot",
                                    "value":1
                                },
                                {
                                    "id":12791,
                                    "type":"plane",
                                    "value":1
                                },
                                {
                                    "id":null,
                                    "kwargs":{
                                        "boardOnPlaneID":"12791",
                                        "skillLevel":"100",
                                        "skillPoints":"1",
                                        "specializationID":"0"
                                    },
                                    "planeID":12791,
                                    "type":"crew",
                                    "value":1,
                                    "ui":{
                                        "boardOnPlaneID":"12791",
                                        "skillLevel":"100",
                                        "skillPoints":"1",
                                        "specializationID":"0",
                                        "planeID":12791
                                    }
                                },
                                {
                                    "id":-1014476375,
                                    "kwargs":{
                                        "expiryTime":"-1.0"
                                    },
                                    "type":"camouflage",
                                    "value":1
                                },
                                {
                                    "id":-1014476375,
                                    "kwargs":{
                                        "arenaType":"0"
                                    },
                                    "type":"camouflage",
                                    "value":1
                                },
                                {
                                    "id":-41772476,
                                    "kwargs":{
                                        "expiryTime":"-1.0"
                                    },
                                    "type":"camouflage",
                                    "value":1
                                },
                                {
                                    "id":-41772476,
                                    "kwargs":{
                                        "arenaType":"0"
                                    },
                                    "type":"camouflage",
                                    "value":1
                                },
                                {
                                    "id":-677438532,
                                    "kwargs":{
                                        "expiryTime":"-1.0"
                                    },
                                    "type":"camouflage",
                                    "value":1
                                },
                                {
                                    "id":-677438532,
                                    "kwargs":{
                                        "arenaType":"1"
                                    },
                                    "type":"camouflage",
                                    "value":1
                                },
                                {
                                    "id":-677438532,
                                    "kwargs":{
                                        "arenaType":"2"
                                    },
                                    "type":"camouflage",
                                    "value":1
                                },
                                {
                                    "id":-677438532,
                                    "kwargs":{
                                        "arenaType":"3"
                                    },
                                    "type":"camouflage",
                                    "value":1
                                },
                                {
                                    "id":-677438532,
                                    "kwargs":{
                                        "arenaType":"4"
                                    },
                                    "type":"camouflage",
                                    "value":1
                                },
                                {
                                    "id":-1362751001,
                                    "kwargs":{
                                        "hideMessage":"False"
                                    },
                                    "type":"gameeventobject",
                                    "value":1
                                }
                            ],
                            "completed":true,
                            "progress":[
                    
                            ],
                            "type":"sse.quest.marathon"
                        }
                    },
                    "refill":{
                        "credits":0,
                        "gold":0,
                        "tickets":0
                    },
                    "repairCr":0,
                    "result":22,
                    "servicePlanes":{
                        "refill":{
                    
                        },
                        "repair":0
                    },
                    "startTime":1691425733,
                    "teams":{
                        "0":{
                            "2":{
                                "achievements":{
                            
                                },
                                "bScore":1000,
                                "baseXP":688,
                                "bestRankPlaneID":1593,
                                "clan":"",
                                "context":{
                                    "activities":{
                                        "component":{
                                    
                                        }
                                    },
                                    "arena":{
                                        "mode":"areaconquest",
                                        "source":"player",
                                        "type":"normal"
                                    },
                                    "leaderboards":[
                            
                                    ],
                                    "pieces":0,
                                    "player":{
                                        "accDBID":98,
                                        "id":2,
                                        "isNPC":"false",
                                        "killed":"no",
                                        "lastBattleTime":0,
                                        "plane":{
                                            "activeNation":"germany",
                                            "crew":{
                                                "id":1006
                                            },
                                            "global":-972013075,
                                            "hasGunner":"no",
                                            "id":1593,
                                            "level":5,
                                            "nation":"germany",
                                            "specialization":"stock",
                                            "tir":"2",
                                            "type":"fighter"
                                        },
                                        "squad":{
                                            "active":"no",
                                            "id":10
                                        },
                                        "teamIndex":0,
                                        "testflight":"false",
                                        "type":"player",
                                        "winStreak":3
                                    },
                                    "self":{
                                        "event":{
                                            "context":"player",
                                            "name":"top.1.by.kill.plane.defender",
                                            "type":"battle"
                                        }
                                    },
                                    "team":{
                                        "result":"win"
                                    },
                                    "time":1691425789
                                },
                                "databaseID":98,
                                "firstGID":-972013075,
                                "id":2,
                                "leaderboards":[
                        
                                ],
                                "mScore":450,
                                "name":"_dev_98",
                                "pieces":{
                                    "clientData":{
                                
                                    },
                                    "data":{
                                
                                    }
                                },
                                "planes":[
                                    {
                                        "achievements":{
                                            "1242874774":{
                                                "bonuses":[
                                        
                                                ]
                                            },
                                            "2130685919":{
                                                "bonuses":[
                                        
                                                ]
                                            }
                                        },
                                        "actions":{
                                    
                                        },
                                        "actualXP":1032,
                                        "bScore":1000,
                                        "baseCr":12940.9961136594,
                                        "baseXP":688,
                                        "camouflage":1,
                                        "camouflageCoeffs":{
                                            "decor":{
                                                "credits":0,
                                                "crewXP":0,
                                                "xp":0
                                            },
                                            "nose":{
                                                "credits":0,
                                                "crewXP":0,
                                                "xp":0
                                            }
                                        },
                                        "consumableCoeffs":{
                                    
                                        },
                                        "crewXP":1238,
                                        "crewXPList":[
                                            [
                                                0,
                                                1238
                                            ]
                                        ],
                                        "critsInfo":{
                                    
                                        },
                                        "equipmentCoeffs":{
                                    
                                        },
                                        "extKillers":{
                                    
                                        },
                                        "firstWinXPCoeff":1,
                                        "flights":1,
                                        "flighttime":5,
                                        "gExtDamage":{
                                    
                                        },
                                        "gExtKills":{
                                    
                                        },
                                        "globalID":-972013075,
                                        "isElite":true,
                                        "isElitePlane":true,
                                        "mScore":450,
                                        "nationID":1,
                                        "pExtDeaths":{
                                    
                                        },
                                        "pExtKills":{
                                    
                                        },
                                        "planeID":1593,
                                        "planeType":"fighter",
                                        "postBattle":{
                                            "economics":{
                                                "PersonalScore":{
                                                    "EndGame":{
                                                        "battle":1000
                                                    },
                                                    "ObjectAssistDestroy":{
                                                        "battle":0
                                                    },
                                                    "ObjectDamage":{
                                                        "battle":0
                                                    },
                                                    "ObjectDestroy":{
                                                        "battle":0
                                                    },
                                                    "PlaneAssistDestroy":{
                                                        "battle":0
                                                    },
                                                    "PlaneDamage":{
                                                        "battle":0
                                                    },
                                                    "PlaneDestroy":{
                                                        "AllyPlaneDestroy":{
                                                            "battle":0
                                                        },
                                                        "BomberPlaneDestroy":{
                                                            "battle":0
                                                        },
                                                        "DefenderPlaneDestroy":{
                                                            "battle":0
                                                        },
                                                        "EnemyPlaneDestroy":{
                                                            "battle":0
                                                        }
                                                    },
                                                    "SectorAttack":{
                                                        "battle":0
                                                    },
                                                    "SectorCapture":{
                                                        "battle":0
                                                    },
                                                    "SectorDefence":{
                                                        "battle":0
                                                    },
                                                    "SectorParticipationCapture":{
                                                        "battle":0
                                                    },
                                                    "pointsSum":1000
                                                },
                                                "pointsSum":1000
                                            }
                                        },
                                        "premPlaneLvlXPCoeff":1,
                                        "premXP":1032,
                                        "quests":{
                                    
                                        },
                                        "ranks":{
                                            "objectives":[
                                                {
                                                    "id":1299816437,
                                                    "progressMax":6,
                                                    "progressRawValueRequired":3
                                                },
                                                {
                                                    "id":-823071514,
                                                    "progressMax":6,
                                                    "progressRawValueRequired":1
                                                },
                                                {
                                                    "id":606152162,
                                                    "progressMax":6,
                                                    "progressRawValueRequired":75
                                                }
                                            ],
                                            "rank":null
                                        },
                                        "streaks":{
                                            "points":{
                                                "1000":1
                                            }
                                        },
                                        "totalPremXP":344,
                                        "totalXP":1032,
                                        "usedCamouflages":[
                                            -1298007923,
                                            732473655
                                        ],
                                        "usedCmbl":[
                                
                                        ],
                                        "usedEqmt":[
                                
                                        ],
                                        "usedWeapon":[
                                
                                        ],
                                        "zoneCaptureExtended":{
                                    
                                        }
                                    }
                                ],
                                "rank":1
                            }
                        },
                        "1":{
                            "1":{
                                "achievements":{
                            
                                },
                                "bScore":1000,
                                "baseXP":360,
                                "bestRankPlaneID":1505,
                                "clan":"",
                                "context":{
                                    "activities":{
                                        "component":{
                                    
                                        }
                                    },
                                    "arena":{
                                        "mode":"areaconquest",
                                        "source":"bot",
                                        "type":"normal"
                                    },
                                    "leaderboards":[
                            
                                    ],
                                    "player":{
                                        "accDBID":0,
                                        "id":1,
                                        "isNPC":"false",
                                        "killed":"no",
                                        "lastBattleTime":0,
                                        "plane":{
                                            "activeNation":"germany",
                                            "crew":{
                                                "id":-1
                                            },
                                            "global":1945735461,
                                            "hasGunner":"no",
                                            "id":1505,
                                            "level":5,
                                            "nation":"germany",
                                            "specialization":"stock",
                                            "tir":"2",
                                            "type":"assault"
                                        },
                                        "squad":{
                                            "active":"no",
                                            "id":30
                                        },
                                        "teamIndex":1,
                                        "testflight":"false",
                                        "type":"player",
                                        "winStreak":0
                                    },
                                    "team":{
                                        "result":"lose"
                                    }
                                },
                                "firstGID":1945735461,
                                "id":1,
                                "isBot":true,
                                "leaderboards":[
                        
                                ],
                                "mScore":400,
                                "name":"Viktor",
                                "planes":[
                                    {
                                        "achievements":{
                                    
                                        },
                                        "actions":{
                                    
                                        },
                                        "actualXP":360,
                                        "bScore":1000,
                                        "baseCr":5882.270960754271,
                                        "baseXP":360,
                                        "camouflage":4,
                                        "crewXP":385,
                                        "critsInfo":{
                                    
                                        },
                                        "extKillers":{
                                    
                                        },
                                        "firstWinXPCoeff":1,
                                        "flights":1,
                                        "gExtDamage":{
                                    
                                        },
                                        "gExtKills":{
                                    
                                        },
                                        "globalID":1945735461,
                                        "mScore":400,
                                        "nationID":1,
                                        "pExtDeaths":{
                                    
                                        },
                                        "pExtKills":{
                                    
                                        },
                                        "planeID":1505,
                                        "planeType":"assault",
                                        "postBattle":{
                                            "economics":{
                                                "PersonalScore":{
                                                    "EndGame":{
                                                        "battle":1000
                                                    },
                                                    "ObjectAssistDestroy":{
                                                        "battle":0
                                                    },
                                                    "ObjectDamage":{
                                                        "battle":0
                                                    },
                                                    "ObjectDestroy":{
                                                        "battle":0
                                                    },
                                                    "PlaneAssistDestroy":{
                                                        "battle":0
                                                    },
                                                    "PlaneDamage":{
                                                        "battle":0
                                                    },
                                                    "PlaneDestroy":{
                                                        "AllyPlaneDestroy":{
                                                            "battle":0
                                                        },
                                                        "BomberPlaneDestroy":{
                                                            "battle":0
                                                        },
                                                        "DefenderPlaneDestroy":{
                                                            "battle":0
                                                        },
                                                        "EnemyPlaneDestroy":{
                                                            "battle":0
                                                        }
                                                    },
                                                    "SectorAttack":{
                                                        "battle":0
                                                    },
                                                    "SectorCapture":{
                                                        "battle":0
                                                    },
                                                    "SectorDefence":{
                                                        "battle":0
                                                    },
                                                    "SectorParticipationCapture":{
                                                        "battle":0
                                                    },
                                                    "pointsSum":1000
                                                },
                                                "pointsSum":1000
                                            }
                                        },
                                        "premXP":360,
                                        "quests":{
                                    
                                        },
                                        "ranks":{
                                            "objectives":[
                                                {
                                                    "id":1056691134,
                                                    "progressMax":6,
                                                    "progressRawValueRequired":50
                                                },
                                                {
                                                    "id":175793157,
                                                    "progressMax":6,
                                                    "progressRawValueRequired":20
                                                },
                                                {
                                                    "id":-319343865,
                                                    "progressMax":6,
                                                    "progressRawValueRequired":1
                                                }
                                            ],
                                            "rank":null
                                        },
                                        "streaks":{
                                            "points":{
                                                "1000":1
                                            }
                                        },
                                        "totalXP":360,
                                        "usedWeapon":[
                                
                                        ],
                                        "zoneCaptureExtended":{
                                    
                                        }
                                    }
                                ],
                                "rank":1
                            }
                        }
                    },
                    "totalCr":19410,
                    "totalFreeXP":51,
                    "totalXP":1032,
                    "winState":1
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

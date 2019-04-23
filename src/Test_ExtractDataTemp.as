package {
import flash.display.Sprite;

public class Test_ExtractDataTemp extends Sprite {
    private var data:* = [{"reward_group_id":10,"reward_items":[{"unknown_mod_count":0,"rarity_level":0,"dictId":1138,"amount":50,"dict_id":1138}]},{"reward_group_id":11,"reward_items":[{"unknown_mod_count":0,"rarity_level":0,"dictId":1138,"amount":100,"dict_id":1138}]},{"reward_group_id":12,"reward_items":[{"unknown_mod_count":0,"rarity_level":0,"dictId":1138,"amount":150,"dict_id":1138}]},{"reward_group_id":13,"reward_items":[{"unknown_mod_count":0,"rarity_level":0,"dictId":1138,"amount":200,"dict_id":1138}]},{"reward_group_id":14,"reward_items":[{"unknown_mod_count":0,"rarity_level":0,"dictId":1138,"amount":300,"dict_id":1138}]},{"reward_group_id":15,"reward_items":[{"unknown_mod_count":0,"rarity_level":0,"dictId":1138,"amount":400,"dict_id":1138}]},{"reward_group_id":16,"reward_items":[{"unknown_mod_count":0,"rarity_level":0,"dictId":1138,"amount":550,"dict_id":1138}]},{"reward_group_id":17,"reward_items":[{"unknown_mod_count":0,"rarity_level":0,"dictId":1138,"amount":750,"dict_id":1138}]},{"reward_group_id":18,"reward_items":[{"unknown_mod_count":0,"rarity_level":0,"dictId":1138,"amount":1000,"dict_id":1138}]}];
    private var data2:* = [{"reward_group_id":0,"rewards":[],"stars":3,"rank":10,"league_end_reward_group_id":0,"equipment_level":2,"winner_team_points":[1,1,1,1,0.75,0.5,0.25,0],"looser_team_points":[0,0,0,0,0,0,0,0]},{"reward_group_id":0,"rewards":[],"stars":3,"rank":9,"league_end_reward_group_id":10,"equipment_level":2,"winner_team_points":[1,1,1,1,0.75,0.5,0.25,0],"looser_team_points":[0,0,0,0,0,0,0,0]},{"reward_group_id":0,"rewards":[],"stars":3,"rank":8,"league_end_reward_group_id":11,"equipment_level":2,"winner_team_points":[1,1,1,1,0.75,0.5,0.25,0],"looser_team_points":[0,0,-0.25,-0.25,-0.5,-0.5,-0.5,-0.5]},{"reward_group_id":0,"rewards":[],"stars":4,"rank":7,"league_end_reward_group_id":12,"equipment_level":2,"winner_team_points":[1,1,1,1,0.75,0.5,0.25,0],"looser_team_points":[0,0,-0.25,-0.25,-0.5,-0.5,-0.5,-0.5]},{"reward_group_id":0,"rewards":[],"stars":5,"rank":6,"league_end_reward_group_id":13,"equipment_level":3,"winner_team_points":[1,1,1,1,0.75,0.5,0.25,0],"looser_team_points":[0,0,-0.25,-0.25,-0.5,-0.5,-0.5,-0.5]},{"reward_group_id":0,"rewards":[],"stars":5,"rank":5,"league_end_reward_group_id":14,"equipment_level":3,"winner_team_points":[1,1,1,1,0.75,0.5,0.25,0],"looser_team_points":[0,-0.25,-0.5,-0.75,-1,-1,-1,-1]},{"reward_group_id":0,"rewards":[],"stars":7,"rank":4,"league_end_reward_group_id":15,"equipment_level":3,"winner_team_points":[1,1,1,1,0.75,0.5,0.25,0],"looser_team_points":[0,-0.25,-0.5,-0.75,-1,-1,-1,-1]},{"reward_group_id":0,"rewards":[],"stars":10,"rank":3,"league_end_reward_group_id":16,"equipment_level":4,"winner_team_points":[1,1,1,1,0.75,0.5,0.25,0],"looser_team_points":[0,-0.25,-0.5,-0.75,-1,-1,-1,-1]},{"reward_group_id":0,"rewards":[],"stars":15,"rank":2,"league_end_reward_group_id":17,"equipment_level":4,"winner_team_points":[1,1,1,1,0.75,0.5,0.25,0],"looser_team_points":[0,-0.25,-0.5,-0.75,-1,-1,-1,-1]},{"reward_group_id":0,"rewards":[],"stars":15,"rank":1,"league_end_reward_group_id":18,"equipment_level":4,"winner_team_points":[1,1,1,1,0.75,0.5,0.25,0],"looser_team_points":[0,-0.25,-0.5,-0.75,-1,-1,-1,-1]}];
    public function Test_ExtractDataTemp() {

//        trace(this.data["0"].reward_items["0"].amount);
//        trace(this.data["1"].reward_items["0"].amount);

        //this.data["3"].reward_group_id
        //this.data2["4"].league_end_reward_group_id

        var o = getReward(15);
        trace(o);
    }

    private function getReward(id:int):String {
        var o:Object;
        for each (o in data){
            if(o.reward_group_id == id){
                return o.reward_items[0].amount;
            }
        }
        return "-";
    }
}
}

/**
 * Created with IntelliJ IDEA.
 * User: SenCheR
 * Date: 04.12.13
 * Time: 23:40
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.display.Sprite;

public class Test_String extends Sprite{
	private var s3:String = "http://vast.ssp.optimatic.com/vast/getVast.aspx?id=a111&zone=__default__&content_page_url=http://anyclip-player.s3.amazonaws.com/tests/Page_SR_Player_100_fill.html";
	private var s4:String = "https://ssp.streamrail.net/ssp/vpaid/weqwe111/b222?cb=[CB]&pos...";
	private var s5:String = "https://ssp.lkqd.net/ssp/111/sid=333?cb=[CB]&pos...";
	private var s6:String = "/vpaid/sdasda/someShit";
	private var s7:String = "http://anyclip-player.s3.amazonaws.com/tests/Page_SR_Player_100_fill.html?branch=dev";

	private var adManager;
	private var matches;
	private var sid;

	public function Test_String() {
//        var s1:String = /*"1%3D2"//*/"https://goldentriumph-dev.emict.net/flash/main.swf?config=https%3A%2F%2Fgoldentriumph-dev.emict.net%2Fgame_flash.html%3Fconfig%3D1%26code%3D372189-3927%26terminal%3D1000002%26hid%3DC6DFB473311741F9B158400D951DAA4A";
//        var s2:String = "https://goldentriumph-dev.emict.net/game_flash.html?config=1&code=372189-3927&terminal=1000002&hid=C6DFB473311741F9B158400D951DAA4A";
//
//        var s11:String = s1.replace(/%3D/g,"=");
//        var s22:String = s2.replace(/%3D/g,"=");
//        trace(s11);
//        trace(s22);
//        var i = s11.lastIndexOf("=");
//        var i2 = s22.lastIndexOf("=");
//        trace(i, i2);
//        var hid:String = s11.substr(i+1);
//        var hid2:String = s22.substr(i2+1);
//        trace(hid);
//        trace(hid2);

//**********************************************************

		for(var i = 3; i<7; i++){
			extract(this["s"+i]);
		}

		matches = /\/\/([\w.-]+)/.exec(s7);
		var host:String = matches[1];

		var h = /\/\/([\w.-]+)/.exec(s7)[1];
		trace(h);
    }

	private function extract(adTagUrl:String)
	{
		if (adTagUrl.indexOf('lkqd.net') !== -1) {
			adManager = 'lkqd';

		} else if (adTagUrl.indexOf('ssp.streamrail.net') !== -1 || adTagUrl.indexOf('ssp.anyclip-media.com') !== -1) {
			adManager = 'sr';
		} else if (adTagUrl.indexOf('ssp.optimatic.com') !== -1) {
			adManager = 'optimatic';
		} else {
			adManager = 'acmanager';
		}

		matches = null;
		sid = null;
		switch (adManager) {
			case 'lkqd':
				matches = /sid=(\d+)/.exec(adTagUrl);

				if (matches && matches[1]) {
					sid = matches[1];
				}
				break;
			case 'optimatic':
				matches = /id=([\w\d]+)/.exec(adTagUrl);

				if (matches && matches[1]) {
					sid = matches[1];
				}
				break;
			default:
				matches = /vpaid\/[\w\d]+\/([\w\d]+)/.exec(adTagUrl);

				if (matches && matches[1]) {
					sid = matches[1];
				}
				break;
		}
		trace(adManager, sid);
	}
}
}

//gamePrize1 = "TEST PRIZE";
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//Imports
// \\mgt-nas02\FlashDev\Master Flash\Classes\External Libraries\GreenSock-BusinessGreen-AS2
import com.greensock.*;
import com.greensock.easing.*;
import com.greensock.plugins.*;

TweenPlugin.activate([AutoAlphaPlugin]);
//TweenPlugin.activate([BezierPlugin]);
//TweenPlugin.activate([VolumePlugin]);
//TweenMax.to(_root["racer"+i], 2.0, {_x:_root["racer"+i]._x - 50, ease:Expo.easeOut, onComplete:ObstacleFinish, onCompleteParams:[_root["racer"+i]] });
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//Configurations

var debug:Boolean = true;
var demo:Boolean = true;

var numberOfPrizes:Number = 1; // set to 1 for revealer
var isWideScreen:Boolean = false;

var winnerPrize:String = new String();
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//Instance Variables

var transition:MovieClip;
var bg:MovieClip;
var intro:MovieClip;
var outro:MovieClip;



if (isWideScreen) {
	//Opposite resolution asset management
	TweenMax.to(transitionStandard, 0, {autoAlpha:0});
	TweenMax.to(backgroundStandard, 0, {autoAlpha:0});
	TweenMax.to(outroStandard, 0, {autoAlpha:0});
	TweenMax.to(introStandard, 0, {autoAlpha:0});
	
	//Correct resolution asset assignment
	transition = transitionWide;
	bg = backgroundWide;
	outro = outroWide;
	intro = introWide;
	
}else {
	
	//Opposite resolution asset management
	TweenMax.to(transitionWide, 0, {autoAlpha:0});
	TweenMax.to(backgroundWide, 0, {autoAlpha:0});
	TweenMax.to(outroWide, 0, {autoAlpha:0});
	TweenMax.to(introWide, 0, {autoAlpha:0});
	
	//Correct resolution asset assignment
	transition = transitionStandard;
	bg = backgroundStandard;
	outro = outroStandard;
	intro = introStandard;
}
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//Load Falsh Variables
var myXML:XML = new XML();
myXML.ignoreWhite = true;
myXML.load("FlashVariables.xml");
myXML.onLoad = function(success) {
	if (success) {
		var timervars = myXML.firstChild.firstChild.childNodes;
		
		for (var i:Number = 0; i < timervars.length; i++) {
			var timervalue = timervars[i].firstChild.nodeValue;
			
			if (i == 0) {
				timer_reveal = parseInt(timervalue);
				trace("timer_reveal: " + timer_reveal);
				
			}else if (i == 1) {
				
				timer_grats = parseInt(timervalue);
				trace("timer_grats: " + timer_grats);
				
			}else if (i == 2) {
				
				timer_timeout = parseInt(timervalue);
				trace("timer_timeout: " + timer_timeout);
				
				count_timeout = timer_timeout;
			}
		}
		
		if (debug == true) {
			trace("[WARNING: DEBUG MODE]");
			Mouse.show();
			
			generatePrizes();
			//populateRemainingPrizes();
			
		}else if (demo) {
			trace("[WARNING: DEMO MODE]");
			Mouse.show();
			
			generatePrizes();
			//populateRemainingPrizes();
			
		}else {
			trace("[DISTRIBUTION SAFE]");
			Mouse.hide();
			
			//interval_validatePrizes = setInterval(validatePrizes, 100);
			
			winnerPrize = _root.gamePrize1;
		}
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//Sounds

var MusicSFX:Sound = new Sound(createEmptyMovieClip("MusicSFX", getNextHighestDepth()));
MusicSFX.attachSound("MusicSFX");

var TadaSFX:Sound = new Sound(createEmptyMovieClip("TadaSFX", getNextHighestDepth()));
TadaSFX.attachSound("TadaSFX");

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//Methods

MusicSFX.start();

TweenMax.to(transition, 2.0, {autoAlpha:0, delay:0.5, onComplete:fadeComplete});

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//Fade Complete
function fadeComplete():Void {
	startIntro();
	trace("INTRO START")
}
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//Start Intro
function startIntro():Void{
	intro.gotoAndPlay(2);
}
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//Generate Prize

function generatePrizes():Void {
	for (var i:Number = 1; i <= numberOfPrizes; i++) {
		_root["gamePrize" + i] = "Prize" + i + " - This is a test prize to test prize functionality";
		trace(_root["gamePrize" + i]);
		winnerPrize = _root["gamePrize" + i];
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//Start Game
function startGame():Void {
	intro.unloadMovie();
	trace("[GAME: START]");
	showGrats(); // LOAD GRATS
}
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//Show Grats
function showGrats():Void {
	playGratsAnimation();
	TadaSFX.start();
	outro.grats.txtBody.text = winnerPrize;
	outro.gotoAndPlay(2);
	TweenMax.to(outro, 0, {autoAlpha:100, onComplete:gratsDone});
}
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//Animate Grats
function playGratsAnimation():Void{
	trace("PLAYING PICKED-GRATS ANIMATION IN AVAILABLE");
}
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//Finish Grats
function gratsDone():Void {
	timer_grats--;//Accounts for a one second audio fade
	TweenMax.delayedCall(timer_grats, fadeAudio);
}

function fadeAudio():Void {
	//Kill all animations first!!!
	TweenMax.to(transition, 1.0, {autoAlpha:100});
	TweenMax.to(MusicSFX, 1.0,{volume:0, onComplete:endGame});
}

function clearGame():Void {
	TweenMax.to(transition, 0, {autoAlpha:100});
	TweenMax.killAll();
	MusicSFX.stop();
}

function endGame():Void {
	
	clearGame();
	
	fscommand("end");
}
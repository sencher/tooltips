import com.greensock.*;
import com.greensock.easing.*;
import com.greensock.plugins.*;

TweenPlugin.activate([AutoAlphaPlugin]);

//Config
var debug:Boolean = true;
var demo:Boolean = true;
var numberOfPrizes:Number = 1; // set to 1 for revealer
var isWideScreen:Boolean = false;

//Variables
var clickArea:MovieClip;
var transition:MovieClip;
var idleAnimation:MovieClip;
var openAnimation:MovieClip;
var winAnimation:MovieClip;
var bg:MovieClip;
var winnerPrize:String;
var clicked:Boolean = false;
var timer_reveal:int = 2;
var timer_grats:int = 2;
var timer_timeout:int = 15;

//Animation init
if (isWideScreen) {
	//Opposite resolution asset management
	transitionStandard.unloadMovie();
	idleAnimationStandard.unloadMovie();
	openAnimationStandard.unloadMovie();
	winAnimationStandart.unloadMovie();
	backgroundStandard.unloadMovie();
	
	//Correct resolution asset assignment
	transition = transitionWide;
	idleAnimation = idleAnimationWide;
	openAnimation = openAnimationWide;
	winAnimation = winAnimationWide;
	bg = backgroundWide;
	
}else {
	//Opposite resolution asset management
	transitionWide.unloadMovie();
	idleAnimationWide.unloadMovie();
	openAnimationWide.unloadMovie();
	winAnimationWide.unloadMovie();
	backgroundWide.unloadMovie();
	
	//Correct resolution asset assignment
	transition = transitionStandard;
	idleAnimation = idleAnimationStandard;
	openAnimation = openAnimationStandard;
	winAnimation = winAnimationStandart;
	bg = backgroundStandard;
}
winAnimation.stop();

//Sounds
var MusicSFX:Sound = new Sound(createEmptyMovieClip("MusicSFX", getNextHighestDepth()));
MusicSFX.attachSound("MusicSFX");

var TadaSFX:Sound = new Sound(createEmptyMovieClip("TadaSFX", getNextHighestDepth()));
TadaSFX.attachSound("TadaSFX");

//Load Falsh Variables
var myXML:XML = new XML();
myXML.ignoreWhite = true;
myXML.load("FlashVariables.xml");
myXML.onLoad = function(success) {
	log("FlashVariables.xml onLoad "+success);
	
	if (success) {
		var timervars = myXML.firstChild.firstChild.childNodes;
		
		for (var i:Number = 0; i < timervars.length; i++) {
			var timervalue = timervars[i].firstChild.nodeValue;
			
			if (i == 0) {
				timer_reveal = parseInt(timervalue);
				log("timer_reveal: " + timer_reveal);
				
			}else if (i == 1) {
				
				timer_grats = parseInt(timervalue);
				log("timer_grats: " + timer_grats);
				
			}else if (i == 2) {
				
				timer_timeout = parseInt(timervalue);
				log("timer_timeout: " + timer_timeout);
				
				count_timeout = timer_timeout;
			}
		}
	}
	
	if (debug || demo) {
		log("[WARNING: DEBUG or DEMO mode]");
		Mouse.show();
		generatePrizes();
	}else{
		log("[DISTRIBUTION SAFE]");
		Mouse.hide();
		winnerPrize = _root.gamePrize1;
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//Methods

if(!debug) MusicSFX.start();

TweenMax.to(transition, 2.0, {autoAlpha:0, delay:0.5});

function generatePrizes():Void {
	for (var i:Number = 1; i <= numberOfPrizes; i++) {
		_root["gamePrize" + i] = "Prize " + i + "$ - This is a test prize to test prize functionality";
		log(_root["gamePrize" + i]);
		winnerPrize = _root["gamePrize" + i];
	}
}

clickArea.onPress = function (){
	log("click1");
	clicked = true;
	clickArea.onPress = null;
	clickArea.enabled = false;
}

function startOpenAnimation():Void {
	idleAnimation.unloadMovie();
	log("[startOpenAnimation]");
	openAnimation.text_mc.txtBody.text = winnerPrize;
	openAnimation.gotoAndPlay(2);
}

function tadaPlay():Void{
	log("[TADA]");
	TadaSFX.start();
}

function winAnimationPlay():Void{
	log("[winAnimationPlay]");
	
	openAnimation.unloadMovie();
	winAnimation.text_mc.txtBody.text = winnerPrize;
	winAnimation.gotoAndPlay(1);
	clickArea.enabled = true;
	clickArea.onPress = function():Void{
		log("click2");
		clickArea.onPress = null;
		clickArea.enabled = false;
		TweenMax.to(winAnimation, 0, {autoAlpha:100, onComplete:animationsDone});
	}
}

function animationsDone():Void {
	log("[animationsDone]");
	timer_grats--;//Accounts for a one second audio fade
	TweenMax.delayedCall(timer_grats, fadeAudio);
}

function fadeAudio():Void {
	TweenMax.to(transition, 1.0, {autoAlpha:100});
	TweenMax.to(MusicSFX, 1.0,{volume:0, onComplete:endGame});
}

function endGame():Void {
	winAnimation.unloadMovie();
	TweenMax.to(transition, 0, {autoAlpha:100});
	TweenMax.killAll();
	MusicSFX.stop();
	fscommand("end");
}

//DEBUG
//	idleAnimation.unloadMovie();
//	log("[startOpenAnimation]");
//	openAnimation.text_mc.txtBody.text = winnerPrize;
//	openAnimation.gotoAndPlay(640);

//	idleAnimation.unloadMovie();
//	openAnimation.unloadMovie();
//	winAnimation.text_mc.txtBody.text = "dasdsdwd23e$--1!";
//	winAnimation.play();

function log(s:String):Void{
	trace(s);
	if(debug) debugText.text += s + "\n";
}

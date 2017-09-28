package air {
	import air.update.utils.FileUtils;
	
	import flash.desktop.NativeProcess;
import flash.desktop.NativeProcessStartupInfo;
import flash.display.Shape;
import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.text.TextField;

import utils.Utils;
	
	// in app.xml
	// <supportedProfiles>desktop extendedDesktop mobileDevice extendedMobileDevice</supportedProfiles>
	// build exe to NativeProcess
public class AirMain extends Sprite {
	private var tf:TextField = new TextField();
	private var button:Sprite = new Sprite();
	private var appPath:File;
	private var lastPath:File;
	private var lastPathLoading:File;
	private var browsePath:File;
	private const LAST_PATH:String = "LastPath.txt";
	private const COPIES:String = "Copies";
	
	public function AirMain() {
		appPath = new File(File.applicationDirectory.nativePath/* + "/Test"*/);
		
		tf.text = "Main";
		tf.multiline = true;
		tf.wordWrap = true;
		tf.border = true;
		addChild(tf);
		
		var box:Shape = Utils.drawBox(100,100,200,200,0,0xffff00);
		box.name = "box";
		addChild(button);
		button.addChild(box);
		
		lastPathLoading = appPath.resolvePath(LAST_PATH);
		if(lastPathLoading.exists) {
			lastPathLoading.addEventListener(Event.COMPLETE, lastPathLoaded);
			lastPathLoading.load();
		}
		
//		function loaded(event:Event = null)
//		{
//			var bytes = file.data;
//			str = bytes.readUTFBytes(bytes.length);
//			lastPath = new File(str);
//		}
		
		button.addEventListener(MouseEvent.CLICK, browseBtn_clickHandler)
//		onClick();
	}
	
	private function lastPathLoaded(event:Event = null)
	{
		var bytes = lastPathLoading.data;
		var str:String = bytes.readUTFBytes(bytes.length);
		try {
			lastPath = new File(str);
			trace("loaded " + LAST_PATH);
		}catch (e:Error){
			trace("Incorrect LastPath.txt : ", str);
		}
	}
	
	private function onClick(event:MouseEvent = null):void {
		tf.appendText("c");
		
//		if(NativeProcess.isSupported)
//		{
//			tf.appendText("+");
//			var file:File = new File(File.applicationDirectory.nativePath).resolvePath('./../AirChild/AirChild.exe');
//			trace(file.nativePath);
//
//			var nativeProcessStartupInfo:NativeProcessStartupInfo = new NativeProcessStartupInfo();
//			nativeProcessStartupInfo.executable = file;
//			var process:NativeProcess = new NativeProcess();
//
//			process.start(nativeProcessStartupInfo);
//
//		}



//		var newFolder:File = currentPath.resolvePath("Test");
//		trace(newFolder.nativePath, newFolder.url);
//		newFolder.createDirectory();
//
//		var file:File = currentPath.resolvePath("MyTextFile.txt");
//		var stream:FileStream = new FileStream();
//		stream.open(file, FileMode.WRITE);
//		stream.writeUTFBytes("This is my text file.");
//		stream.close();
//
//		var movedFile:File = newFolder.resolvePath(file.name);
//		file.copyTo(movedFile, true);
//		file.deleteFile();
		
		
		
//		var contents:Array = currentPath.getDirectoryListing();
//		for (var i:uint = 0; i < contents.length; i++)
//		{
//			if(contentstrace(contents[i].name, contents[i].size);
//		}

//			newFolder = currentPath.resolvePath("Test");
//			trace(newFolder.nativePath, newFolder.url);
//			newFolder.createDirectory();
		
//		var swfFiles:Array = getFilesInFolderRecursive(currentPath);
//		trace(swfFiles.length);
//		var file:File;
//		var movedFile:File;
//		var newPath:String;
//		for each (file in swfFiles)
//		{
//			trace(file.name, file.size);
//
//			var lastSlash:int = file.nativePath.lastIndexOf("\\") + 1;
//			newPath = file.nativePath.substring(0, lastSlash) + file.name.replace(file.type,"\\") + file.nativePath.substring(lastSlash, file.nativePath.length);
//			trace(newPath);
//			var movedFile:File = new File(newPath);
//			trace(movedFile.nativePath);
//			file.copyTo(movedFile, true);
//			//file.deleteFile();
//		}
	}
	
	protected function browseBtn_clickHandler(event:MouseEvent):void
	{
		browsePath = lastPath ? lastPath.clone() : appPath.clone();
		browsePath.addEventListener(Event.SELECT, fileSelected);
		browsePath.browseForDirectory("Select Local Folder");
	}
	
	private function fileSelected(e:Event):void {
		browsePath.removeEventListener(Event.SELECT, fileSelected);
		trace(browsePath.nativePath);
		
		var copiesFolder:File = browsePath.resolvePath(COPIES);
		if(copiesFolder.exists){
			trace("removed old copiesFolder");
			copiesFolder.deleteDirectory(true);
		}
		
		var swfFiles:Array = getFilesInFolderRecursive(browsePath);
		trace(swfFiles.length);
		var file:File;
		var movedFile:File;
		var newPath:String;
		for each (file in swfFiles)
		{
			trace(file.name, file.size);
			
			//Each swf in folder Copies and then in separate folders
			newPath = browsePath.nativePath + "\\" + COPIES + "\\" + file.name.replace(file.type,"\\") + file.name;
			
			//Each swf in folder in place
			//var lastSlash:int = file.nativePath.lastIndexOf("\\") + 1;
			//newPath = file.nativePath.substring(0, lastSlash) + file.name.replace(file.type,"\\") + file.nativePath.substring(lastSlash, file.nativePath.length);
			trace(newPath);
			var movedFile:File = new File(newPath);
			trace(movedFile.nativePath);
			file.copyTo(movedFile, true);
			//file.deleteFile();
		}
		
		var stream:FileStream = new FileStream();
		stream.open(appPath.resolvePath(LAST_PATH), FileMode.WRITE);
		stream.writeUTFBytes(browsePath.nativePath);
		stream.close();
		lastPath = browsePath.clone();
	}
	
	private function getFilesInFolderRecursive(path:File):Array {
		var searched:Array = [];
		
		var directory:Array = path.getDirectoryListing();
		
		for each (var file:File in directory)
		{
			if (file.isDirectory)
				searched = searched.concat(getFilesInFolderRecursive(file));
			else if(file.extension == "swf")
				searched.push(file);
		}
		return searched;
	}
}
}

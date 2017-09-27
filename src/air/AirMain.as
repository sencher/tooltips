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
	private var currentPath:File;
	
	public function AirMain() {
		currentPath = new File(File.applicationDirectory.nativePath + "/Test");
		
		tf.text = "Main";
		tf.multiline = true;
		tf.wordWrap = true;
		tf.border = true;
		addChild(tf);
		
		var box:Shape = Utils.drawBox(100,100,200,200,0,0xffff00);
		box.name = "box";
		addChild(button);
		button.addChild(box);
		button.addEventListener(MouseEvent.CLICK, browseBtn_clickHandler)
//		onClick();
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
		
		var swfFiles:Array = getFilesInFolderRecursive(currentPath);
		trace(swfFiles.length);
		var file:File;
		var movedFile:File;
		var newPath:String;
		for each (file in swfFiles)
		{
			trace(file.name, file.size);
			
			var lastSlash:int = file.nativePath.lastIndexOf("\\") + 1;
			newPath = file.nativePath.substring(0, lastSlash) + file.name.replace(file.type,"\\") + file.nativePath.substring(lastSlash, file.nativePath.length);
			trace(newPath);
			var movedFile:File = new File(newPath);
			trace(movedFile.nativePath);
			file.copyTo(movedFile, true);
			//file.deleteFile();
		}
	}
	
	protected function browseBtn_clickHandler(event:MouseEvent):void
	{
		var browseFile:File = currentPath;
		browseFile.addEventListener(Event.SELECT, fileSelected);
		browseFile.browseForDirectory("Select Local Folder");
		function fileSelected(e:Event):void {
			browseFile.removeEventListener(Event.SELECT, fileSelected);
			trace(browseFile.nativePath);
			var swfFiles:Array = getFilesInFolderRecursive(browseFile);
			trace(swfFiles.length);
			var file:File;
			var movedFile:File;
			var newPath:String;
			for each (file in swfFiles)
			{
				trace(file.name, file.size);
				
				var lastSlash:int = file.nativePath.lastIndexOf("\\") + 1;
				newPath = file.nativePath.substring(0, lastSlash) + file.name.replace(file.type,"\\") + file.nativePath.substring(lastSlash, file.nativePath.length);
				trace(newPath);
				var movedFile:File = new File(newPath);
				trace(movedFile.nativePath);
				file.copyTo(movedFile, true);
				//file.deleteFile();
			}
		}
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

package air {
import flash.desktop.NativeProcess;
import flash.desktop.NativeProcessStartupInfo;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.text.TextField;

import utils.Utils;

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
		button.addEventListener(MouseEvent.CLICK, onClick)
//		onClick();
	}
	
	private function onClick(event:MouseEvent = null):void {
		tf.appendText("c");
		
		//  in app.xml
		// <supportedProfiles>desktop extendedDesktop mobileDevice extendedMobileDevice</supportedProfiles>
		
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
		
		var swfFiles:Array = getFilesInFolderRecursive(currentPath);
		trace(swfFiles.length);
		for (var i:uint = 0; i < swfFiles.length; i++)
		{
			trace(swfFiles[i].name, swfFiles[i].size);
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

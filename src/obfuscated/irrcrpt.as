// string decryption function by irrfuscator. 
// Only needed if the 'encrypt strings' option was selected for obfuscation.
package obfuscated
{											
	public function irrcrpt(s:String, o:int):String
	{										
		var d:String = new String();		
											
		for (var i:int=0; i<s.length; ++i)	
		{									
			var c:int = s.charCodeAt(i);	
											
			if (c >= 48 && c <= 57)			
			{								
				c = (c - o)-48;				
				if (c < 0) c += (57-48+1);	
				c = (c % (57-48+1)) + 48;	
			}								
			else							
			if (c >= 65 && c <= 90)			
			{								
				c = (c - o)-65;				
				if (c < 0) c += (90-65+1);	
				c = (c % (90-65+1)) + 65;	
			}								
			else							
			if (c >= 97 && c <= 122)		
			{								
				c = (c - o)-97;				
				if (c < 0) c += (122-97+1);	
				c = (c % (122-97+1)) + 97;	
			}								
											
			d += String.fromCharCode(c);	
		}									
											
		return d;							
	}										
}											

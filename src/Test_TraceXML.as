package {
	import flash.display.Sprite;
	
	public class Test_TraceXML extends Sprite {
		public function Test_TraceXML() {
			var xmlData:XML = new XML(<xmlcontainer>
						<client>
							<name>Marco</name>
							<phone>123456789</phone>
						</client>
						<client>
							<name>Roberto</name>
							<phone>987654321</phone>
						</client>
					</xmlcontainer>
			);
			xmlData.appendChild(<pessoa/>);
			xmlData.appendChild(<id/>);
			xmlData.id.appendChild('idFieldText');
			xmlData.appendChild(<nome/>);
			xmlData.nome.appendChild('nameFieldText');
			xmlData.appendChild(<email/>);
			xmlData.email.appendChild('email');
			xmlData.appendChild(<contacto/>);
			xmlData.contacto.appendChild('phone');
			trace(xmlData);
		}
	}
}

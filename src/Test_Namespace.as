/*В следующем примере показано, как работать с пространствами имен, определенными в объектах XML.
Это можно сделать, выполнив следующие действия:
 1. В этом примере определены три объекта Namespace, каждый из которых имеет уникальный URI,
 определяющий пространство имен.
 2. В примере определяется переменная XML с именем myXML, которая присваивается возвращаемому значению getRSS().
 Метод getRSS() применяется для определения объекта XML, содержащего несколько пространств имен и возврата данного объекта.
 3. В примере объявляется и оценивается переменная Array путем вызова метода parseRSS(), которому передается myXML.
 В parseRSS() пространство имен XML по умолчанию определяется как rss. Переменная XMLList определяется
 в примере путем присвоения списка объектов item переменной myXML. Создается массив, который заполняется данными
 о различных узлах, входящих в myXML.item. Затем этот массив возвращается.
 4. Печать элементов массива выполняется с помощью цикла for и трех вызовов выражения trace().*/

package {
    import flash.display.Sprite;

    public class Test_Namespace extends Sprite {
        private var rss:Namespace = new Namespace("http://purl.org/rss/1.0/");
        private var rdf:Namespace = new Namespace("http://www.w3.org/1999/02/22-rdf-syntax-ns#");
        private var dc:Namespace  = new Namespace("http://purl.org/dc/elements/1.1/");

        public function Test_Namespace() {
            var myXML:XML = getRSS();
            var rssItems:Array = parseRSS(myXML);

            var len:uint = rssItems.length;
            for (var i:uint; i < len; i++) {
                trace(rssItems[i].title);
                trace(rssItems[i].creator);
                trace(rssItems[i].date);
                // Adobe Flash Developer Center
                // Adobe
                // 2005-08-08
                // Flex Developer Center
                // Adobe
                // 2005-10-16                
            }
        }

        private function parseRSS(rssXML:XML):Array {
            default xml namespace = rss;

            var items:XMLList = rssXML.item;

            var arr:Array = new Array();
            var len:uint = items.length();
            for (var i:uint; i < len; i++) {
                arr.push({title:items[i].title, creator:items[i].dc::creator, date:items[i].dc::date});
            }

            return arr;
        }

        private function getRSS():XML {
            var myXML:XML =  <rdf:RDF
            xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
            xmlns="http://purl.org/rss/1.0/"
            xmlns:dc="http://purl.org/dc/elements/1.1/"
            >
                <channel rdf:about="http://www.xml.com/cs/xml/query/q/19">
                    <title>Test RSS</title>
                    <link>http://www.adobe.com/</link>
                    <description>This is a test RSS document.</description>
                    <language>en-us</language>
                    <items>
                        <rdf:Seq>
                            <rdf:li rdf:resource="http://www.adobe.com/devnet/flash/"/>
                            <rdf:li rdf:resource="http://www.adobe.com/devnet/flex/"/>
                        </rdf:Seq>
                    </items>
                </channel>
                <item rdf:about="http://www.adobe.com/devnet/flash/">
                    <title>Adobe Flash Developer Center</title>
                    <link>http://www.adobe.com/devnet/flash/</link>
                    <description>Welcome to the Flash Developer Center</description>
                    <dc:creator>Adobe</dc:creator>
                    <dc:date>2005-08-08</dc:date>
                </item>
                <item rdf:about="http://www.adobe.com/devnet/flex/">
                    <title>Flex Developer Center</title>
                    <link>http://www.adobe.com/devnet/flex/</link>
                    <description>Welcome to the Flex Developer Center</description>
                    <dc:creator>Adobe</dc:creator>
                    <dc:date>2005-10-16</dc:date>
                </item>
            </rdf:RDF>;

            return myXML;
        }
    }
}
package
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	public class AutomaattiTeht extends MovieClip
	{
		
		public function AutomaattiTeht(stage:Stage)
		{
			var myLoader:Loader = new Loader(); 
			var url:URLRequest = new URLRequest("AutomaattiTehtava.swf");
			myLoader.load(url); 
			stage.addChild(myLoader);
			
			// Pitää estää ukkelin liikkuminen 
		}
	}
}
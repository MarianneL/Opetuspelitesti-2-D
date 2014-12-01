package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Automaatti extends MovieClip
	{		
		var bg:Background;
		var player:Player;
		
		var stageRef:Stage;
		var automaattiTeht:AutomaattiTeht;
		
		public function Automaatti()
		{
			addEventListener(MouseEvent.MOUSE_OVER, rollOver);	// Mitä tapahtuu kun hiiri on tämän kohdalla
			addEventListener(MouseEvent.MOUSE_OUT, rollOut);	// Mitä tapahtuu kun hiiri ei ole tämän kohdalla
			addEventListener(MouseEvent.CLICK, goToAutomaattiTeht);	// Mitä tapahtuu kun tätä klikataan
		}
		
		public function rollOut(e:Event = null):void
		{
			this.gotoAndStop("unhighlight");	// Menee movieclipin frameen jonka nimi on unhighlight
			
		}
		
		public function rollOver(e:Event = null):void
		{
			this.gotoAndStop("highlight");
		}
		
		public function goToAutomaattiTeht(e:Event = null):void
		{
			//automaattiTeht  = new AutomaattiTeht(stage);
			//addChild(automaattiTeht);
		}
	}
}
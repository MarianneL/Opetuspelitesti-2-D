package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Door extends MovieClip
	{		
		var bg:Background;
		var player:Player;
		
		var stageRef:Stage;
		
		public function Door(/*stageRef:Stage, X:int, Y:int*/)
		{
			//this.stageRef = stageRef;
			//this.x = X;
			//this.y = Y;
			
			addEventListener(MouseEvent.CLICK, clickMyDoor);			// Mitä tapahtuu kun hiirtä klikataan (tämän kohdalla)
			addEventListener(MouseEvent.MOUSE_OVER, rollOverMyDoor);	// Mitä tapahtuu kun hiiri on tämän kohdalla
			addEventListener(MouseEvent.MOUSE_OUT, rollOutMyDoor);		// Mitä tapahtuu kun hiiri ei ole tämän kohdalla
		}
		
		public function rollOutMyDoor(e:Event = null):void
		{
			this.gotoAndStop("unhighlight");	// Menee movieclipin frameen jonka nimi on unhighlight
			
		}
		
		public function rollOverMyDoor(e:Event = null):void
		{
			this.gotoAndStop("highlight");
		}
		
		public function clickMyDoor(e:Event = null):void
		{
			this.gotoAndStop("open");
		}
	}
}
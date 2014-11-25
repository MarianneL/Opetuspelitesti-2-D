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
		
		public function Door(stageRef:Stage, X:int, Y:int)
		{
			this.stageRef = stageRef;
			this.x = X;
			this.y = Y;
			
			addEventListener(MouseEvent.CLICK, clickMyDoor);
			addEventListener(MouseEvent.MOUSE_OVER, rollOverMyDoor);
			addEventListener(MouseEvent.MOUSE_OUT, rollOutMyDoor);
		}
		
		public function rollOutMyDoor(e:Event = null):void
		{
			this.gotoAndStop("unhighlight");
			
		}
		
		public function rollOverMyDoor(e:Event = null):void
		{
			this.gotoAndStop("highlight");
		}
		
		public function clickMyDoor(e:Event):void
		{
			this.gotoAndStop("open");
		}
	}
}
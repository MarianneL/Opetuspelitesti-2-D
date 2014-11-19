package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Door extends MovieClip
	{		
		public function Door()
		{
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
		
		public function clickMyDoor(e:Event = null):void
		{
			
		}
	}
}
package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class Background extends MovieClip
	{
		var leftPressed:Boolean = false;
		var rightPressed:Boolean = false;
		
		var xScrollSpeed:int = 10;
		
		public function Background()
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		function loop(e:Event):void
		{
			if(leftPressed)
				this.x += xScrollSpeed;
			else if(rightPressed)
				this.x -= xScrollSpeed;
		}
		
		function keyDownHandler(e:KeyboardEvent):void
		{
			if(e.keyCode == Keyboard.LEFT || e.keyCode == Keyboard.A)
			{
				leftPressed = true;
			}
			if(e.keyCode == Keyboard.RIGHT || e.keyCode == Keyboard.D)
			{
				rightPressed = true;
			}
		}
		
		function keyUpHandler(e:KeyboardEvent):void
		{
			if(e.keyCode == Keyboard.LEFT || e.keyCode == Keyboard.A)
			{
				leftPressed = false;
			}
			if(e.keyCode == Keyboard.RIGHT || e.keyCode == Keyboard.D)
			{
				rightPressed = false;
			}
		}
	}
}
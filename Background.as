package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	public class Background extends MovieClip
	{
		var leftPressed:Boolean = false;
		var rightPressed:Boolean = false;
				
		var xSpeed:int = 4; // Nopeus jolla tausta liikkuu
		var scrollX:int = 0;
		var speedConstant:int = 2;
		var friction:Number = 0.95;
		
		var player:Player = new Player();
		var playerLeftBumping = player.getLeftBumping();
		var playerRightBumping = player.getRightBumping();
		
		public function Background()
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler); // Tarkistaa painetaanko näppäintä parhaillaan
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler); // Tarkistaa että näppäin on "ylhäällä"
			
			stage.addEventListener(Event.ENTER_FRAME, loop); // Toistetaan joka fps
			// ^ Näiden kolmen functiot alempana
		}
		
		function loop(e:Event):void
		{
			if(leftPressed) // jos vasen näppäin on pohjassa...
				xSpeed -= speedConstant; //... tausta liikkuu yhteen suuntaan...
			else if(rightPressed) //... ja jos oikea näppäin on pohjassa...
				xSpeed += speedConstant; //... nin tausta liikkuu toiseen suuntan :)
			
			if(playerLeftBumping == true)
			{
				if(xSpeed < 0)
				{
					xSpeed *= -0.5;
				}
			}
			
			if(playerRightBumping == true)
			{
				if(xSpeed > 0)
				{
					xSpeed *= -0.5;
				}
			}
			
			xSpeed *= friction;
			scrollX -= xSpeed;
			this.x = scrollX;
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
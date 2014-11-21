package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	public class Background extends MovieClip
	{
		var currentLevel:int = 1;
		
		var leftPressed:Boolean = false;
		var rightPressed:Boolean = false;
				
		var xSpeed:int = 4; // Nopeus jolla tausta liikkuu
		var scrollX:int = 0;
		var scrollXPlayer:int = 0;
		var speedConstant:int = 2;
		var friction:Number = 0.95;
		var maxSpeedConstant:Number = 10;
		
		var leftBumping:Boolean = false; // Määrittelee osuuko pelaajan vasen "kylki" johonkin
		var rightBumping:Boolean = false;
		
		var player:Player = new Player(stage, 186, 420);
		var myDoor:Door = new Door(stage, 538, 374);

		
		public function Background()
		{	
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler); // Tarkistaa painetaanko näppäintä parhaillaan
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler); // Tarkistaa että näppäin on "ylhäällä"
			
			stage.addEventListener(Event.ENTER_FRAME, loop); // Toistetaan joka fps
			// ^ Näiden kolmen funktiot alempana
						
			addChild(myDoor); // Lisätään ovi omalle paikalleen
			// http://www.kirupa.com/forum/showthread.php?344758-how-do-i-access-a-function-in-the-main-class-from-another-class
			myDoor.addEventListener(MouseEvent.CLICK, nextLevel);
			
			// Kun laitoin stage.addChild, niin tää pysy koko ajan samas kohtaa...
			// GUI systeemi, ehkä?
			
			addChild(player); // Lisätään pelaaja näytölle
		}

		
		function loop(e:Event):void
		{
			if(leftPressed) // jos vasen näppäin on pohjassa...
			{
				xSpeed -= speedConstant; //... tausta liikkuu yhteen suuntaan...
				//player.x -= 10;
			}
			else if(rightPressed) //... ja jos oikea näppäin on pohjassa...
			{
				xSpeed += speedConstant; //... niin tausta liikkuu toiseen suuntan :)
				//player.x += 10;
			}
			
			if(xSpeed > maxSpeedConstant) // Liikutaan oikealle
				xSpeed = maxSpeedConstant;
			else if(xSpeed < (maxSpeedConstant * -1)) // Liikutaan vasemmalle
				xSpeed = (maxSpeedConstant * -1)
			
			xSpeed *= friction;
			scrollX -= xSpeed;
			scrollXPlayer += xSpeed;
			this.x = scrollX;
			player.x = scrollXPlayer;
			
			if(Math.abs(xSpeed) < 0.5)
				xSpeed = 0;
			
			// Tämä määrittää rajat jossa pelaaja voi liikkua (näille kannattais tehdä variaabelit)
			if(scrollXPlayer < 44)
				scrollXPlayer = 44; // vasen "seinä"
			else if (scrollXPlayer > 1291)
				scrollXPlayer = 1291; // oikea "seinä"
			// Määrittää rajat joissa tausta liikkuu
			if(scrollX > 150)
				scrollX = 150;
			else if (scrollX < -1000)
				scrollX = -1000;
			
		}
		
		function keyDownHandler(e:KeyboardEvent):void
		{
			if(e.keyCode == Keyboard.LEFT || e.keyCode == Keyboard.A)
				leftPressed = true;
			if(e.keyCode == Keyboard.RIGHT || e.keyCode == Keyboard.D)
				rightPressed = true;
		}
		
		function keyUpHandler(e:KeyboardEvent):void
		{
			if(e.keyCode == Keyboard.LEFT || e.keyCode == Keyboard.A)
				leftPressed = false;
			if(e.keyCode == Keyboard.RIGHT || e.keyCode == Keyboard.D)
				rightPressed = false;
		}
		
		public function nextLevel(e:MouseEvent)
		{
			currentLevel++;
			if(currentLevel == 2)
				gotoLevel2();
		}
		
		function gotoLevel2():void
		{
			this.gotoAndStop(2);
		}
		
	}
}
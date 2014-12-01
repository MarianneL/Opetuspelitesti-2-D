package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	public class Background extends MovieClip
	{
		var currentLevel:int = 1;
		
		var leftPressed:Boolean = false;
		var rightPressed:Boolean = false;
				
		var xSpeed:int = 10;
		var scrollX:int = 0;
		var scrollXPlayer:int = 186;
		var speedConstant:int = 20; 
		var friction:Number = 0.75;
		var maxSpeedConstant:Number = 20;
		
		var player:Player = new Player(stage, 100, 400);
		var myDoor:Door = new Door(/*stage, 1440, 258*/);	// Ovien nimet vois olla selkeemmät... eim. kaupanOvi, keittiönOvi jne
		var wasiDoor:KaupanOvi = new KaupanOvi();
		var wasiDoorOut:KaupastaPihalle = new KaupastaPihalle();
		var myTomaatti:Automaatti = new Automaatti();
		
		public function Background()
		{				
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler); // Tarkistaa painetaanko näppäintä parhaillaan
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler); // Tarkistaa että näppäintä ei parhaillaan paineta		
			stage.addEventListener(Event.ENTER_FRAME, loop); // Toistetaan joka fps

			myDoor.addEventListener(MouseEvent.CLICK, door1GoTo); 	// http://www.kirupa.com/forum/showthread.php?344758-how-do-i-access-a-function-in-the-main-class-from-another-class
			wasiDoor.addEventListener(MouseEvent.CLICK, wasiDoorGoTo);	// Kun ovea klikataan, siirrytään uuteen tasoon, jonka doorGoTo funktio määrittää
			wasiDoorOut.addEventListener(MouseEvent.CLICK, wasiDoorOutGoTo);
			// Kun laitoin stage.addChild, niin tää pysy koko ajan samas kohtaa...
			// GUI systeemi, ehkä?
			
			addChild(myDoor); // Lisätään ovi omalle paikalleen
			myDoor.x = 2913,05;
			myDoor.y = 246,1;
			addChild(player); // Lisätään pelaaja näytölle
		}

		
		function loop(e:Event):void
		{	
			if(leftPressed) // jos vasen näppäin on pohjassa...
				xSpeed -= speedConstant; //... tausta liikkuu yhteen suuntaan...
			else if(rightPressed) //... ja jos oikea näppäin on pohjassa...
				xSpeed += speedConstant; //... niin tausta liikkuu toiseen suuntan :)
			
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
			
			// Tässä määritetään "liikkumisrajat" riippuen millä framella ollaan (framen nimen mukaan)
			switch(currentFrameLabel)
			{
				case "olohuone":
				{
					// rajat joiden sisällä pelaaja pystyy liikkumaan
					if(scrollXPlayer < 200)
						scrollXPlayer = 200; // vasen "seinä"
					else if (scrollXPlayer > 2600)
						scrollXPlayer = 2600; // oikea "seinä"
					// rajat joissa tausta liikkuu
					if(scrollX > -15)
						scrollX = -15;
					else if (scrollX < -2180)
						scrollX = -2180;	
					break;
				}
				case "piha":
				{
					if(scrollXPlayer < 600)
						scrollXPlayer = 600; 
					else if (scrollXPlayer > 5000)
						scrollXPlayer = 5000; 
					if(scrollX > -250)
						scrollX = -250;
					else if (scrollX < -4500)
						scrollX = -4500;	
					break;
				}	
				case "kauppa":
				{
					if(scrollXPlayer < 30)
						scrollXPlayer = 30; 
					else if (scrollXPlayer > 315)
						scrollXPlayer = 315; 
					if(scrollX > 0 || scrollX < 0)
						scrollX = 0;
						
					break;
				}
				default:
				{
					break;
				}
			}

		}

		
		function keyDownHandler(e:KeyboardEvent):void 	// Tarkistaa painetaanko näppäintä parhaillaan
		{
			if(e.keyCode == Keyboard.LEFT || e.keyCode == Keyboard.A)
				leftPressed = true;
			if(e.keyCode == Keyboard.RIGHT || e.keyCode == Keyboard.D)
				rightPressed = true;
		}
		
		function keyUpHandler(e:KeyboardEvent):void 	// Tarkistaa että näppäintä ei parhaillaan paineta		
		{
			if(e.keyCode == Keyboard.LEFT || e.keyCode == Keyboard.A)
				leftPressed = false;
			if(e.keyCode == Keyboard.RIGHT || e.keyCode == Keyboard.D)
				rightPressed = false;
		}
		
		
		// Ovesta 1 mennään Background movieclipin kakkos framelle, eli kakkos "kenttään"
		public function door1GoTo(e:MouseEvent):void	
		{
			nextLevel(2);
		}
		public function wasiDoorGoTo(e:MouseEvent):void
		{
			nextLevel(3);
		}
		public function wasiDoorOutGoTo(e:MouseEvent):void
		{
			nextLevel(4);
		}
		
		
		// Asetetaan pelaaja ja ovet jne, sen mukaan millä framella ollaan
		public function nextLevel(currentLevel):void
		{
			switch(currentLevel)
			{
				case 2:
				{
					this.gotoAndStop("piha");
					removeChild(myDoor);
					addChild(wasiDoor);
					addChild(myTomaatti);
					this.setChildIndex(player, this.numChildren - 1); // Tällä saadaan pelaaja päällimmäiseksi, muuten se jää myDoor2 ja myTomaatti alapuolelle
					myTomaatti.x = 4715;
					myTomaatti.y = 570;
					wasiDoor.x = 5038;
					wasiDoor.y = 575,55;
					scrollXPlayer = 368;
					scrollX = 100;
					break;
				}
				case 3:
				{
					this.gotoAndStop("kauppa");
					removeChild(wasiDoor);
					addChild(wasiDoorOut);
					wasiDoorOut.x = 384;
					wasiDoorOut.y = 842;
					this.setChildIndex(player, this.numChildren - 1);
					scrollXPlayer = 200;
					scrollX = 0;
					break;
				}	
				case 4: // tullaan kaupasta pihalle
				{
					gotoAndStop("piha");
					removeChild(wasiDoorOut);
					this.setChildIndex(player, this.numChildren - 1);
					scrollXPlayer = 5000;
					scrollX = -4500;
					break;
				}
				default:
				{
					break;
				}
			}
		}	
		
	}
}
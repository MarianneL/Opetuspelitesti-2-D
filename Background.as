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
				
		var xSpeed:int = 10; //4;
		var scrollX:int = 0;
		var scrollXPlayer:int = 186;
		var speedConstant:int = 10; //5;
		var friction:Number = 0.95;
		var maxSpeedConstant:Number = 20; //10;
		
		var player:Player = new Player(stage, 186, 420);
		var myDoor:Door = new Door(/*stage, 1440, 258*/);	// Ovien nimet vois olla selkeemmät... eim. kaupanOvi, keittiönOvi jne
		var myDoor2:Door = new Door(/*stage, 2493, 294*/);
		var myTomaatti:Automaatti = new Automaatti();
		var myTomaattiTehtava:AutomaattiPeli = new AutomaattiPeli();
		
		public function Background()
		{				
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler); // Tarkistaa painetaanko näppäintä parhaillaan
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler); // Tarkistaa että näppäintä ei parhaillaan paineta		
			stage.addEventListener(Event.ENTER_FRAME, loop); // Toistetaan joka fps

			myDoor.addEventListener(MouseEvent.CLICK, door1GoTo); 	// http://www.kirupa.com/forum/showthread.php?344758-how-do-i-access-a-function-in-the-main-class-from-another-class
			myDoor2.addEventListener(MouseEvent.CLICK, door2GoTo);	// Kun ovea klikataan, siirrytään uuteen tasoon, jonka doorGoTo funktio määrittää
			// Kun laitoin stage.addChild, niin tää pysy koko ajan samas kohtaa...
			// GUI systeemi, ehkä?
			
			addChild(myDoor); // Lisätään ovi omalle paikalleen
			myDoor.x = 1440;
			myDoor.y = 258;
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
					if(scrollXPlayer < 40)
						scrollXPlayer = 40; // vasen "seinä"
					else if (scrollXPlayer > 1500)
						scrollXPlayer = 1500; // oikea "seinä"
					// rajat joissa tausta liikkuu
					if(scrollX > -15)
						scrollX = -15;
					else if (scrollX < -875)
						scrollX = -875;	
					break;
				}
				case "piha":
				{
					if(scrollXPlayer < 380)
						scrollXPlayer = 380; 
					else if (scrollXPlayer > 2800)
						scrollXPlayer = 2800; 
					if(scrollX > 0)
						scrollX = 0;
					else if (scrollX < -2200)
						scrollX = -2200;	
					break;
				}	
				case "kauppa":
				{
					if(scrollXPlayer < 30)
						scrollXPlayer = 30; 
					else if (scrollXPlayer > 315)
						scrollXPlayer = 315; 
					if(scrollX > 0)
						scrollX = 0;
					else if (scrollX < 0)
						scrollX = 0;	
					break;
				}
				default:
				{
					break;
				}
			}
			
			if(myTomaatti.clicked)
			{
				addChild(myTomaattiTehtava);

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
		public function door2GoTo(e:MouseEvent):void
		{
			nextLevel(3);
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
					addChild(myDoor2);
					addChild(myTomaatti);
					this.setChildIndex(player, this.numChildren - 1); // Tällä saadaan pelaaja päällimmäiseksi, muuten se jää myDoor2 ja myTomaatti alapuolelle
					myTomaatti.x = 2303;
					myTomaatti.y = 314;
					myDoor2.x = 2493;
					myDoor2.y = 294;
					scrollXPlayer = 368;
					scrollX = 100;
					break;
				}
				case 3:
				{
					this.gotoAndStop("kauppa");
					removeChild(myDoor2);
					this.setChildIndex(player, this.numChildren - 1);
					scrollXPlayer = 200;
					scrollX = 0;
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
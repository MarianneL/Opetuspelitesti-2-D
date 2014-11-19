package
{
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	public class Player extends MovieClip
	{
		var leftBumping:Boolean = false; // Määrittelee osuuko pelaajan vasen "kylki" johonkin
		var rightBumping:Boolean = false;
		var leftBumpPoint:Point = new Point(-35, -45);
		var rightBumpPoint:Point = new Point(35, -45)
			
		var bg:Background;
		
		// määrittää sen mikä animaatio ukkelilla pyörii
		//var animationState:String = "idle";
			
		public function Player()
		{
			/*
			// Jos oikea näppäin on pohjassa...
			if(bg.rightPressed)
			// animaatioksi vaihtuu oikealle kävelevä ukkeli
			animationState = "walkingRight";
			// Jos vasen näppäin on pohjassa...
			else if(bg.leftPressed)
			// animaatioksi vaihtuu vasemmalle kävelevä ukkeli
			animationState = "walkingLeft";
			// Jos kumpikaan näppäin ei ole pohjassa... (! = not, eli "not rightPressed")
			else if(!bg.rightPressed && !bg.leftPressed)
			//...animaationa on idle
			animationState = "idle";
			
			// currentLabel katsoo flashissä ukkelin timelinelta, missä labelissa ollaan (labelit: idle, walking.)
			// Jos label ja animaatio jonka pitäisi pyöriä ei täsmää, animaatio vaihdetaan oikeaksi
			// TAi jotain sellasta, en oikeen ymmäräny :D
			if(this.currentLabel != animationState)
			this.gotoAndStop(animationState);
			*/
		}
		
		public function getLeftBumpPoint():Point
		{
			return leftBumpPoint;
		}
		
		public function getRightBumpPoint():Point
		{
			return rightBumpPoint;
		}
		
		
	}
}
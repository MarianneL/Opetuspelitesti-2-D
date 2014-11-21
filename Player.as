package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	public class Player extends MovieClip
	{
		static var leftBumping:Boolean = false; // Määrittelee osuuko pelaajan vasen "kylki" johonkin
		static var rightBumping:Boolean = false;
		static  var leftBumpPoint:Point = new Point(-35, -45);
		static var rightBumpPoint:Point = new Point(35, -45)
			
		static var leftPressed:Boolean = false;
		static var rightPressed:Boolean = false;
		
		var bg:Background;
		
		var stageRef:Stage;
		
		// määrittää sen mikä animaatio ukkelilla pyörii
		//var animationState:String = "idle";
			
		public function Player(stageRef:Stage)
		{
			this.stageRef = stageRef;
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			/*// Jos oikea näppäin on pohjassa...
			if(rightPressed)
			// animaatioksi vaihtuu oikealle kävelevä ukkeli
			animationState = "walk";
			// Jos vasen näppäin on pohjassa...
			else if(leftPressed)
			// animaatioksi vaihtuu vasemmalle kävelevä ukkeli
			animationState = "walk";
			// Jos kumpikaan näppäin ei ole pohjassa... (! = not, eli "not rightPressed")
			else if(!rightPressed && !leftPressed)
			//...animaationa on idle
			animationState = "idle";
			
			// currentLabel katsoo flashissä ukkelin timelinelta, missä labelissa ollaan (labelit: idle, walking.)
			// Jos label ja animaatio jonka pitäisi pyöriä ei täsmää, animaatio vaihdetaan oikeaksi
			// TAi jotain sellasta, en oikeen ymmäräny :D
			if(this.currentLabel != animationState)
			this.gotoAndStop(animationState);*/
			
		}
		
		
		public function onAddedToStage(e:Event):void
		{
			x = 186;
			y = 420;
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
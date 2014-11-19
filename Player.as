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
		//var bgLeftPressed = bg.getLeftPressed();
		//var bgRightPressed = bg.getRightPressed();
			
		public function Player()
		{
			
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
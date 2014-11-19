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
			
		var background:Background = new Background();
			
		public function Player()
		{
			if(background.hitTestPoint(this.x + leftBumpPoint.x, this.y + leftBumpPoint.y, true))
			{
				leftBumping = true
			} else {
				leftBumping = false;
			}
			
			if(background.hitTestPoint(this.x + rightBumpPoint.x, this.y + rightBumpPoint.y, true))
			{
				rightBumping = true
			} else {
				rightBumping = false;
			}
		}
		
		
		public function getLeftBumping():Boolean
		{
			return this.leftBumping;
		}
		
		public function getRightBumping():Boolean
		{
			return this.rightBumping;
		}
	}
}
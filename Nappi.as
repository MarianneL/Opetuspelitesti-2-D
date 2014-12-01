package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	
	public class Nappi extends MovieClip
	{
		var stageRef:Stage;
		
		public function Nappi(stageRef:Stage, X:int, Y:int)
		{
			this.stageRef = stageRef;
			X = this.x;
			Y = this.y;
			
		}
	}
}
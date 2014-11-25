package
{

	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	public class MainMenu extends MovieClip
	{
		public var mainClass:Engine;
		
		
		public function MainMenu(passedClass:Engine)
		{
			//var PlayButton:PlayBtn = new PlayBtn();
			
			mainClass = passedClass;
			PlayBtn.addEventListener(MouseEvent.CLICK, onPlayBtnClicked);
		}
		
		public function onPlayBtnClicked(event:MouseEvent)
		{
			mainClass.PlayTheGame();
		}
	}
}
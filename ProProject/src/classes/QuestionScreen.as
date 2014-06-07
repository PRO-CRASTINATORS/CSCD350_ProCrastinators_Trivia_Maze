package  classes
{
	import org.osflash.signals.Signal;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.natejc.utils.StageRef;
	import classes.TriviaItem;
	import classes.Door;
	
	public class QuestionScreen extends MovieClip
	{
		private var mcScreen	:MovieClip;
		private var dDoor		:Door;
		private var tTriv		:TriviaItem;
		private var sAns		:String;
		
		public function QuestionScreen($door:Door = null) 
		{
			// constructor code
			this.mcScreen = new QuestionClip();
			this.dDoor = $door;
			this.tTriv = $door.getTriviaItem();
			init();
		}
		
		private function init():void
		{
			StageRef.stage.addChild(this.mcScreen);
			this.fillMC();
			
			this.mcScreen.AButton.addEventListener(MouseEvent.CLICK, this.setAnswer, false, 0, true);
			this.mcScreen.BButton.addEventListener(MouseEvent.CLICK, this.setAnswer, false, 0, true);
			
			this.mcScreen.OKButton.addEventListener(MouseEvent.CLICK, this.checkAnswer, false, 0, true);
			this.mcScreen.ExitButton.addEventListener(MouseEvent.CLICK, this.kill, false, 0, true);
		}
		public function fillMC():void
		{
			this.mcScreen.Question.text = this.tTriv.getQuestion();
			
			var temp:Array = this.tTriv.getAnswers();
			
			this.mcScreen.Aanswer.text = temp[0];
			this.mcScreen.Banswer.text = temp[1];
			
			if(this.tTriv.getType() == 2)
			{
				this.mcScreen.Canswer.text = temp[2];
				this.mcScreen.Danswer.text = temp[3];
				
				this.mcScreen.CButton.addEventListener(MouseEvent.CLICK, this.setAnswer, false, 0, true);
				this.mcScreen.DButton.addEventListener(MouseEvent.CLICK, this.setAnswer, false, 0, true);
			}
			else
			{
				this.mcScreen.removeChild(this.mcScreen.CButton);
				this.mcScreen.removeChild(this.mcScreen.DButton);
				this.mcScreen.removeChild(this.mcScreen.Canswer);
				this.mcScreen.removeChild(this.mcScreen.Danswer);
			}

	
			
		}
		public function setAnswer($me:MouseEvent = null):void
		{
			if($me.target.name == "AButton")
			{
				this.sAns = "A";
				this.mcScreen.AnswerChoice.y = this.mcScreen.AButton.y; 
			}
			if($me.target.name == "BButton")
			{
				this.sAns = "B";
				this.mcScreen.AnswerChoice.y = this.mcScreen.BButton.y;
			}
			if($me.target.name == "CButton")
			{
				this.sAns = "C";
				this.mcScreen.AnswerChoice.y = this.mcScreen.CButton.y;
			}
			if($me.target.name == "DButton")
			{
				this.sAns = "D";
				this.mcScreen.AnswerChoice.y = this.mcScreen.DButton.y;
			}
		}
		
		public function checkAnswer($me:MouseEvent = null):void
		{
			if(this.sAns == this.tTriv.getCorrectIndex())
			{
				trace("CORRECT");
				this.dDoor.setDoorLock(1);
			}
			else
			{
				trace("WRONG");
				this.dDoor.setDoorLock(2);
			}
				
			this.kill();
			
		}
		public function kill($me:MouseEvent = null):void
		{
			
			StageRef.stage.removeChild(this.mcScreen);
			
			this.mcScreen.AButton.removeEventListener(MouseEvent.CLICK, this.setAnswer, false);
			this.mcScreen.BButton.removeEventListener(MouseEvent.CLICK, this.setAnswer, false);
			
			if(this.tTriv.getType() == 2)
			{
				this.mcScreen.CButton.removeEventListener(MouseEvent.CLICK, this.setAnswer, false);
				this.mcScreen.DButton.removeEventListener(MouseEvent.CLICK, this.setAnswer, false);
			}
			
			this.mcScreen.OKButton.removeEventListener(MouseEvent.CLICK, this.checkAnswer, false);
			this.mcScreen.ExitButton.removeEventListener(MouseEvent.CLICK, this.kill, false);
		}

	}
	
}

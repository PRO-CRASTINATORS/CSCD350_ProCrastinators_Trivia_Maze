package  classes
{
	/**
	 * ...
	 * @author ...
	 */
	public class TriviaItem 
	{
		private var que				:String;
		private var ans				:Array;
		private var correctIndex	:String;
		private var type			:int;
		private var _locked 		:int = 0;
		
		public function TriviaItem(ques: String, correct: String, anOne: String, anTwo: String, anThree: String, anFour: String, type: int) 
		{
			que = ques;

			correctIndex = correct;
			
			this.type = type;

			if (type == 1) 
			{
				ans = new Array(anOne, anTwo);
			
			} 
			else if (type == 2) 
			{
				ans = new Array(anOne, anTwo, anThree, anFour);
			}
		}
		
		public function getQuestion(): String
		{
			return que;
		}
		
		public function getType(): int
		{
			return this.type;
		}

		public function getAnswers(): Array
		{
			return ans;
		}

		public function getCorrectIndex(): String 
		{
			return correctIndex;
		}
		public function setDoorLock($x:int):void
		{
			this._locked = $x;
		}
		
		public function getDoorLock():int
		{
			return this._locked;
		}
		
	}

}
package  classes
{
	import flash.display.MovieClip;
	import classes.TriviaItem;
	public class QuestionFactory extends MovieClip
	{
		private var questions:Array;
		
		public function QuestionFactory(dbh:DatabaseHandler) 
		{
			questions = dbh.getQuestions();
		}
		
		public function getTriviaItem():TriviaItem
		{
			var index:int = int(Math.floor(Math.random() * questions.length));
			
			var trivia:TriviaItem = questions[index];

			questions.splice(index, 1);
			
			return trivia;
		}
	}
}
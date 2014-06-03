package  
{
	/**
	 * ...
	 * @author ...
	 */
	public class QuestionFactory 
	{
		var questions:Array;
		public function QuestionFactory(dbh:DatabaseHandler) 
		{
			questions = dbh.getQuestions();
		}
		
		public function getTriviaItem()
		{
			var index:int = Math.random() * questions.length;
			
			var trivia:TriviaItem = questions[index];
			
			questions = questions.split(index, 1);
			
			return trivia;
		}
		
	}

}
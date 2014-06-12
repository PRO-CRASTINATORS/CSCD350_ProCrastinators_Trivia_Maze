package cs350_maze;

public class Question {
	
	private String _question;
	
	public Question(DataBaseHandler dbh)
	{
		_question = dbh.pullQuestion();
	}
	
	public String toString()
	{		
		return _question;
	}
}

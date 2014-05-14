package cs350_maze;

import java.util.ArrayList;

public class Answer {
	
	private ArrayList<String> _answers;
	
	public Answer(DataBaseHandler dbh)
	{
		_answers = new ArrayList<String>();
		
		_answers.add(dbh.pullAnswers());
	}
	
	public String toString()
	{
		int i;
		String res = "";
		
		for (i = 0; i < _answers.size(); i++)
			res += _answers.get(i) + ", ";
		
		return res;
	}
}

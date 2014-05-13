//5-13-14
//KM

public class QandA 
{
	private String que;
	private String[] ans;
	char correctIndex;
	
	public QandA(String ques, char correct, String anOne, String anTwo, String anThree, String anFour, int type)
	{
		que = ques;
		
		correctIndex = correct;
		
		if(type == 1)
		{
			ans = new String[2];
			ans[0] = anOne;
			ans[1] = anTwo;
		}
		else
		if(type == 2)
		{
			ans = new String[4];
			ans[0] = anOne;
			ans[1] = anTwo;
			ans[2] = anThree;
			ans[3] = anFour;
		}
		
	}
	
	public String getQuestion()
	{
		return que;
	}
	
	public String[] getAnswers()
	{
		return ans;
	}
	
	public char getCorrectIndex()
	{
		return correctIndex;
	}
}


public class Door
{
	QandA que;
	int locked;
	
	public Door()
	{
		que = questionFactory.getQandA();
		locked = 0;
	}
	
	public String getQuestion()
	{
		return que.getQuestion();
	}

	
	public String[] getAnswer()
	{
		return que.getAnswers();
	}
	
	public int getCorrectIndex()
	{
		return que.getCorrectIndex();
	}
	
	public int getLockStatus()
	{
		return locked;
	}
	
	public void setLock(int lok)
	{
		locked = lok;
	}
	
	
	public String useKey(int keys)
	{
		if(keys > 0)
		{
			locked = 1;
			return "Door was unlocked!";
		}
		else
			return "No keys in inventory!";
			
	}
	
	public String answerQ(int pAnswer)
	{
	
		if(pAnswer == this.getCorrectIndex())
		{	
			this.setLock(1);
			return "Correct! Door opened!";
		}
		else
		{	this.setLock(3);
			return "Incorrect! Door permalocked!";
		}
	}
}

public class Door
{
	QandA que;
	int locked;
	int[] coordinates;

	public Door(QuestionFactory fact, int row, int col)
	{
		coordinates = new int[2];
		
		que = fact.getQandA();
		locked = 0;
		coordinates[0] = row;
		coordinates[1] = col;
	
	}

	public Door(QandA question)
	{
		que = question;
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

	public char getCorrectIndex()
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
	
	public int[] getNextRoom()
	{
		return coordinates;
	}

	public String useKey(int keys)
	{
		if (keys > 0)
		{
			locked = 1;
			return "Door was unlocked!";
		}
		else
			return "No keys in inventory!";

	}

public String answerQ(char pAnswer)
{

if (pAnswer == this.getCorrectIndex())
{
this.setLock(1);
return "Correct! Door opened!";
}
else
{
this.setLock(3);
return "Incorrect! Door permalocked!";
}
}
}
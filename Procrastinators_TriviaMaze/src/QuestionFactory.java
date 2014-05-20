//5-18-14
//KM

import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;

public class QuestionFactory 
{
	 ArrayList<QandA> qList;
	
	public QandA getQandA() 
	{
		return new QandA("Would you like to go through this door?", 'A', "Yes!", "No!", "", "", 1);
		
		//int index = (int) Math.floor(Math.random()*(qList.size()));
		
		//QandA que = qList.get(index);
		// qList.remove(index);
		 
		// return que;
		
	}
	
	public void genQlist()
	{
		qList = new ArrayList<QandA>();
		String[] line;
		
		try 
		{
			
			
			Scanner in = new Scanner(new File("C:/Users/Kevin/Documents/GitHub/CSCD350_ProCrastinators_Trivia_Maze/Procrastinators_TriviaMaze/src/StarWarsTrivia.csv"));
			
			while(in.hasNextLine())
			{
				System.out.println("Yes?");
				line = in.nextLine().split(";");
				qList.add(new QandA(line[0], line[1].charAt(0), line[2], line[3], line[4], line[5], (int)(line[6].charAt(0)) - 48));
			}
			
		} 
		catch (FileNotFoundException e) 
		{
			
			e.printStackTrace();
		}
		
		System.out.println("evevwefvwe");
		
		for(int k = 0; k < qList.size(); k++)
		{
			System.out.println(k);
		}
		
		
	}
}

//5-13-14
//KM

import java.util.Scanner;

public class TestDoorAndQAndA 
{
	public static void main(String[] args)
	{
		
		Scanner keyboard = new Scanner(System.in);
		int letter = 65;
		char input;
		String[] ans;
		
		Door d = new Door();
		
		System.out.println(d.getQuestion() +"\n");
		ans = d.getAnswer();
		
		
		for(int k = 0; k < ans.length; k++)
		{
			System.out.println( (char)(letter + k) + ": " + ans[k]);
		}
		
		
		input = keyboard.nextLine().charAt(0);
		
		
		System.out.println(d.answerQ(input));
		
		
		d = new Door(new QandA("Would you like to go throough this door?", 'A', "Yes!", "No!", "I don't know...", "NEVER!!", 2));
		
		System.out.println(d.getQuestion() +"\n");
		ans = d.getAnswer();
		
		System.out.println("\n");
		
		for(int k = 0; k < ans.length; k++)
		{
			System.out.println( (char)(letter + k) + ": " + ans[k]);
		}
		
		
		input = keyboard.nextLine().charAt(0);
		
		
		System.out.println(d.answerQ(input));
		
		keyboard.close();
	}
}

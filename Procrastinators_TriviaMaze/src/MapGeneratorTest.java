import java.util.Scanner;

public class MapGeneratorTest
{
	public static void main(String[] args)
	{
		String[][] protoMap = MazeGenerator.loadMap("C:/Users/Kevin/Documents/GitHub/CSCD350_ProCrastinators_Trivia_Maze/Procrastinators_TriviaMaze/src/map1.txt");

		MazeGenerator.printArray(protoMap);
		
		Room[][]Map = MazeGenerator.convertMap(protoMap);
		System.out.println("\n");
		
		Player kevin = new Player("Kevin");
		
		kevin.setPosRow(1);
		kevin.setPosCol(1);
		
		int nesw = 0;
		String[] answers;
		Room cur;
		Door door;
		char ans;
		
		
		Scanner in = new Scanner(System.in);
		
		while(kevin.getPosRow() != 6 && kevin.getPosRow() != 6)
		{
			cur = Map[kevin.getPosRow()][kevin.getPosCol()];
			
			try
			{
				if(cur.getNorth() != null)
				{
					System.out.println("There is a northern(1) door");
				}
			}
			catch(NullPointerException e)
			{
				
			}
			

			try
			{
				if(cur.getEast() != null)
				{
					System.out.println("There is an eastern(2) door");
				}
			}
			catch(NullPointerException e)
			{
				
			}

			try
			{
				if(cur.getSouth() != null)
				{
					System.out.println("There is a southern(3) door");
				}
			}
			catch(NullPointerException e)
			{
				
			}
			

			try
			{
				if(cur.getWest() != null)
				{
					System.out.println("There is a western(4) door");
				}
			}
			catch(NullPointerException e)
			{
				
			}
			
			System.out.println("\nWhich door would you like to go through?\n");
			nesw = in.nextInt();
			
			switch(nesw)
			{
				case 1: door = cur.getNorth();
						System.out.println(door.getQuestion());
						answers = door.getAnswer();
						for(int k = 0; k < answers.length; k++)
						{
							System.out.println((char)(65+k) + ": " + answers[k]);
						}
						ans = in.next().toUpperCase().charAt(0);
						System.out.println(door.answerQ(ans ));
						if(door.getLockStatus() == 1)
						{
							kevin.goThrough(door);
						}
						
					break;
				case 2:	door = cur.getEast();
						System.out.println(door.getQuestion());
						answers = door.getAnswer();
						for(int k = 0; k < answers.length; k++)
						{
							System.out.println((char)(65+k) + ": " + answers[k]);
						}
						ans = in.next().toUpperCase().charAt(0);
								System.out.println(door.answerQ(ans));
									if(door.getLockStatus() == 1)
										{
											kevin.goThrough(door);
										}
					break;
				case 3:	door = cur.getSouth();
						System.out.println(door.getQuestion());
						answers = door.getAnswer();
						for(int k = 0; k < answers.length; k++)
						{
							System.out.println((char)(65+k) + ": " + answers[k]);
						}
						ans = in.next().toUpperCase().charAt(0);
								System.out.println(door.answerQ(ans));
									if(door.getLockStatus() == 1)
										{
											kevin.goThrough(door);
										}
					break;
				case 4:	door = cur.getWest();
						System.out.println(door.getQuestion());
						answers = door.getAnswer();
						for(int k = 0; k < answers.length; k++)
						{
							System.out.println((char)(65+k) + ": " + answers[k]);
						}
						ans = in.next().toUpperCase().charAt(0);
								System.out.println(door.answerQ(ans));
									if(door.getLockStatus() == 1)
										{
											kevin.goThrough(door);
										}
					break;
			}
			
			
			System.out.println("\n");
		}
		
		System.out.println("YOU WIN!");
		
		in.close();
		
		
	}
}
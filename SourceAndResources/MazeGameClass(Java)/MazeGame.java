package cs350_maze;

import java.util.Scanner;

public class MazeGame {

	public static void main(String[] args) {
		runMenu();
	}

	private static void runMenu() {
		
		Scanner in = new Scanner(System.in);
		DataBaseHandler dbh = new DataBaseHandler("db.txt");
		dbh.initDB();
		
		/*
		 * choice options:
		 * 0 - exit
		 * 1 - play the game
		 * 2 - load scores
		 */
		
		int choice = 1;
		
		while(choice != 0)
		{
			displayMenu();
			choice = getChoiceFromUser(in);
			
			if (choice == 1)
				playGame(in, dbh);
			else if (choice == 2)
				loadScores(dbh);
		}
	}

	private static void playGame(Scanner in, DataBaseHandler dbh) {
		
		boolean isEnd = false;
		
		Player player = new Player();
		player.getNameFromUser(in);
		
		MazeMapBuilder mazeBuilder = new MazeMapBuilder(dbh);
		Map currentMap = mazeBuilder.buildMap();
		
		while(!isEnd)
		{
			player.selectDoor();
			isEnd = currentMap.checkIfPlayerStuck(player.getPosition());
			isEnd = currentMap.checkPosition(player.getPosition());
			isEnd = currentMap.checkWin(player.getPosition());
		}
	}

	private static void loadScores(DataBaseHandler dbh) {
		
		String scores = dbh.pullScores();
		System.out.println(scores);
	}
	
	private static int getChoiceFromUser(Scanner in) {
		
		System.out.println("Enter your choice: ");
		int input = in.nextInt();
				
		return input;
	}

	private static void displayMenu() {
		System.out.println("Menu:");
		System.out.println("1. Play a game!");
		System.out.println("2. Load scores");
		System.out.println("0. Exit");
	}
	
}

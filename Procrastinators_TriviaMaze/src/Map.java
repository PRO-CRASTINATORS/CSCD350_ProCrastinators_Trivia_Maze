
public class Map 
{
	
	
	int[] end = new int[2];
	Room[][] map;
	
	public Map(int row, int col)
	{
		map = new Room[row][col];
		String[][] protoMap = MazeGenerator.loadMap("C:/Users/Kevin/Documents/GitHub/CSCD350_ProCrastinators_Trivia_Maze/Procrastinators_TriviaMaze/src/map1.txt");
		map = MazeGenerator.convertMap(protoMap);
	}
	
	public boolean checkIfPlayerStuck(int row, int col)
	{
		if(row == end[0] && col == end[1])
			return false;
		
		try
		{
			if(map[row][col].getNorth() != null)
			{
				this.checkIfPlayerStuck(row-1,col);
			}
		}
		catch(NullPointerException e)
		{
			
		}
		

		try
		{
			if(map[row][col].getEast() != null)
			{
				this.checkIfPlayerStuck(row,col+1);
			}
		}
		catch(NullPointerException e)
		{
			
		}

		try
		{
			if(map[row][col].getSouth() != null)
			{
				this.checkIfPlayerStuck(row+1,col);
			}
		}
		catch(NullPointerException e)
		{
			
		}
		

		try
		{
			if(map[row][col].getWest() != null)
			{
				this.checkIfPlayerStuck(row,col-1);
			}
		}
		catch(NullPointerException e)
		{
			
		}
		
		
		return true;
	}
}

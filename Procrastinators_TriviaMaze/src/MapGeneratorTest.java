public class MapGeneratorTest 
{
	public static void main(String[] args) 
	{
		String[][] protoMap = MazeGenerator.loadMap("C:/Users/Kevin/Documents/GitHub/CSCD350_ProCrastinators_Trivia_Maze/Procrastinators_TriviaMaze/src/map1.txt");

		MazeGenerator.printArray(protoMap);
	}
}
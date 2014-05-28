import java.sql.*;

public class DatabaseHandlerTester {

	public static void main(String[] args) 
	{
		ResultSet rsTester = null;
		
		rsTester = DatabaseHandler.getCategories();
		DatabaseHandler.printCategories(rsTester);
		
		rsTester = DatabaseHandler.getTriviaByCategory("Zelda");
		DatabaseHandler.printTrivia(rsTester);
		
		rsTester = DatabaseHandler.getAllTrivia();
		DatabaseHandler.printTrivia(rsTester);
		
		System.out.println("Tests complete");
	}

}

import java.sql.*;

public class DatabaseHandlerTester {

	public static void main(String[] args) throws SQLException 
	{
		ResultSet rsTester = null;
		DatabaseHandler db = new DatabaseHandler();
		
		rsTester = db.getCategories();
		db.printCategories(rsTester);

		rsTester = db.getTriviaByCategory("Mario");
		db.printTrivia(rsTester);
		
		rsTester = db.getAllTrivia();
		db.printTrivia(rsTester);
		
		db.closeDatabase();
		System.out.println("Tests complete");
	}
}

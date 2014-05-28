import java.sql.*;
public class DatabaseHandler
{
	public static ResultSet getTriviaByCategory(String s)
	{
		Connection cn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try
		{
			Class.forName("org.sqlite.JDBC");
			cn = DriverManager.getConnection("jdbc:sqlite:TriviaItems.db");
			cn.setAutoCommit(false);
			System.out.println("Opened database successfully");
			
			stmt = cn.createStatement();
			rs = stmt.executeQuery( "SELECT * FROM trivia_item WHERE category = '" + s + "';" );
			
			while(rs.next())
			{
				String question = rs.getString("question");
				String answer = rs.getString("answer");
				String a = rs.getString("a");
				String b = rs.getString("b");
				String c = rs.getString("c");
				String d = rs.getString("d");
				int type = rs.getInt("type");
				String category = rs.getString("category");

				System.out.println("Question = " + question);
				System.out.println("Answer = " + answer);
				System.out.println("A = " + a);
				System.out.println("B = " + b);
				System.out.println("C = " + c);
				System.out.println("D = " + d);
				System.out.println("Type = " + type);
				System.out.println("Category = " + category);
			}//end while
			stmt.close();
			cn.close();
			System.out.println("Closed database successfully");
		}//end try
		catch ( Exception e ) 
		{
		      System.err.println( e.getClass().getName() + ": " + e.getMessage() );
		      System.exit(0);
		}//end catch
		System.out.println("Operation done successfully!");
		return rs;
	}//end getTriviaByCategory
	
	
	
	public static ResultSet getAllTrivia()
	{
		Connection cn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try
		{
			Class.forName("org.sqlite.JDBC");
			cn = DriverManager.getConnection("jdbc:sqlite:TriviaItems.db");
			cn.setAutoCommit(false);
			System.out.println("Opened database successfully");
			
			stmt = cn.createStatement();
			rs = stmt.executeQuery( "SELECT * FROM trivia_item" );
			
			while(rs.next())
			{
				String question = rs.getString("question");
				String answer = rs.getString("answer");
				String a = rs.getString("a");
				String b = rs.getString("b");
				String c = rs.getString("c");
				String d = rs.getString("d");
				int type = rs.getInt("type");
				String category = rs.getString("category");

				System.out.println("Question = " + question);
				System.out.println("Answer = " + answer);
				System.out.println("A = " + a);
				System.out.println("B = " + b);
				System.out.println("C = " + c);
				System.out.println("D = " + d);
				System.out.println("Type = " + type);
				System.out.println("Category = " + category);
			}//end while
			stmt.close();
			cn.close();
			System.out.println("Closed database successfully");
		}//end try
		catch ( Exception e ) 
		{
		      System.err.println( e.getClass().getName() + ": " + e.getMessage() );
		      System.exit(0);
		}//end catch
		System.out.println("Operation done successfully!");
		return rs;
	}//end getAllTrivia
	
	
	
	public static ResultSet getCategories()
	{
		Connection cn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try
		{
			Class.forName("org.sqlite.JDBC");
			cn = DriverManager.getConnection("jdbc:sqlite:TriviaItems.db");
			cn.setAutoCommit(false);
			System.out.println("Opened database successfully");
			
			stmt = cn.createStatement();
			rs = stmt.executeQuery( "SELECT DISTINCT category FROM trivia_item;" );
		
			while(rs.next())
			{
				String category = rs.getString("category");
				System.out.println("Category = " + category);
			}//end while
			stmt.close();
			cn.close();
			System.out.println("Closed database successfully");
		}//end try
		catch ( Exception e ) 
		{
		      System.err.println( e.getClass().getName() + ": " + e.getMessage() );
		      System.exit(0);
		}//end catch
		System.out.println("Operation done successfully!");
		return rs;
	}//end getCategories
	
	
	
	public static void printCategories(ResultSet rs)
	{
		try
		{
			while(rs.next())
			{
				String category = rs.getString("category");
				System.out.println("Category = " + category);
			}//end while
		}
		catch(Exception e)
		{
			System.out.println("Error printing result set");
		}
		
	}//end getCategories
	
	
	
	public static void printTrivia(ResultSet rs)
	{
		try
		{
			while(rs.next())
			{
				String question = rs.getString("question");
				String answer = rs.getString("answer");
				String a = rs.getString("a");
				String b = rs.getString("b");
				String c = rs.getString("c");
				String d = rs.getString("d");
				int type = rs.getInt("type");
				String category = rs.getString("category");

				System.out.println("Question = " + question);
				System.out.println("Answer = " + answer);
				System.out.println("A = " + a);
				System.out.println("B = " + b);
				System.out.println("C = " + c);
				System.out.println("D = " + d);
				System.out.println("Type = " + type);
				System.out.println("Category = " + category);
			}//end while
			rs.close();
		}
		catch(Exception e)
		{
			System.out.println("Error printing Trivia");
		}
	}//end getCategories
}//end class

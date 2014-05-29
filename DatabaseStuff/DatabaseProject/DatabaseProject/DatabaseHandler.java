import java.sql.*;
public class DatabaseHandler
{
	private Connection cn = null;
	private Statement stmt = null;
	
	public DatabaseHandler()
	{
		try
		{
			Class.forName("org.sqlite.JDBC");
			cn = DriverManager.getConnection("jdbc:sqlite:TriviaItems.db");
			cn.setAutoCommit(false);
			stmt = cn.createStatement();
			System.out.println("Opened database successfully");
		}
		catch ( Exception e ) 
		{
		      System.err.println( e.getClass().getName() + ": " + e.getMessage() );
		      System.exit(0);
		}//end catch
	}//end DatabaseHandler constructor
	
	
	
	public ResultSet getTriviaByCategory(String s) throws SQLException
	{
		return stmt.executeQuery( "SELECT * FROM trivia_item WHERE category = '" + s + "';" );
	}
	
	
	
	public ResultSet getAllTrivia() throws SQLException
	{
		return stmt.executeQuery( "SELECT * FROM trivia_item" );
	}
	
	
	
	public ResultSet getCategories() throws SQLException
	{
		return stmt.executeQuery( "SELECT DISTINCT category FROM trivia_item;" );
	}
	
	public void printCategories(ResultSet rs)
	{		
		try
		{
			while(rs.next())
			{
				String category = rs.getString("category");
				System.out.println("Category = " + category);
			}//end while
			rs.close();
		}
		catch ( Exception e ) 
		{
		      System.err.println( e.getClass().getName() + ": " + e.getMessage() );
		      System.exit(0);
		}//end catch
	}//end printCategories
	
	
	
	public void printTrivia(ResultSet rs)
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
		catch ( Exception e ) 
		{
		      System.err.println( e.getClass().getName() + ": " + e.getMessage() );
		      System.exit(0);
		}//end catch
	}//end getCategories
	
	
	
	public void closeDatabase() throws SQLException
	{
		this.stmt.close();
		this.cn.close();
		System.out.println("Closed database successfully");
	}
}//end class

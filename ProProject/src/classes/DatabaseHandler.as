package  classes
{
	
	import flash.events.Event;
	import flash.data.SQLConnection;
    import flash.data.SQLResult;
    import flash.data.SQLStatement;
    import flash.events.SQLErrorEvent;
    import flash.events.SQLEvent;
    import flash.filesystem.File;

	
	
	public class DatabaseHandler 
	{
		
		var conn:SQLConnection;
		var dbStatement:SQLStatement;

		function init():void
		{
			conn = new SQLConnection();
			conn.addEventListener(SQLEvent.OPEN, connOpenHandler);
    
			dbStatement = new SQLStatement();
			dbStatement.sqlConnection = conn;
			dbStatement.text = "SELECT question, answer, a, b, c, d, type, category from trivia_item where a = 'Sugar'";
			dbStatement.itemClass = TriviaItem;
    
			var dbFile:File = new File("TriviaItems.db");
			conn.open(dbFile);
		}

		function connOpenHandler(event: SQLEvent):void
		{
			dbStatement.addEventListener(SQLEvent.RESULT, resultHandler);
			dbStatement.execute();
		}

		function resultHandler(event: SQLEvent): SQLResult
		{
			return dbStatement.getResult();
		}
		
	}

}
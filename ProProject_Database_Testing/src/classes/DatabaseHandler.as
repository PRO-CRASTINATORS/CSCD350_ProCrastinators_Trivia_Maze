package  classes
{
	import flash.events.Event;
	import flash.data.SQLConnection;
    import flash.data.SQLResult;
    import flash.data.SQLStatement;
    import flash.events.SQLErrorEvent;
    import flash.events.SQLEvent;
    import flash.filesystem.File;
	import flash.data.SQLMode;
	
	//http://kirill-poletaev.blogspot.com/2011/05/creating-air-application-with-sqlite_07.html
	
	public class DatabaseHandler 
	{
		var connection:SQLConnection;
		var dbStatement:SQLStatement;
		
		//openDatabase();
		
		public function DatabaseHandler():void
		{
			this.init();
		}
		
		private function init():void
		{
			//var dbFile:File = File.applicationStorageDirectory.resolvePath("C:\Users\Kyle\Documents\EWU\CSCD350\ProProject\TriviaItems.db");
			var dbFile:File = File.userDirectory.resolvePath("C:\Users\Kyle\Documents\EWU\CSCD350\ProProject\TriviaItems.db");

			connection = new SQLConnection();
			connection.addEventListener(SQLEvent.OPEN, onOpen);
			connection.openAsync(dbFile, SQLMode.CREATE);
		}
		
		function onOpen(SQLEvent):void
		{
			var stat:SQLStatement = new SQLStatement();
			stat.sqlConnection = connection;
			//stat.text = "CREATE TABLE IF NOT EXISTS contacts (id INTEGER PRIMARY KEY AUTOINCREMENT, fname TEXT, lname TEXT, phone INTEGER)";
			//stat.execute(-1, new Responder(selectItems));
		}
	}
}
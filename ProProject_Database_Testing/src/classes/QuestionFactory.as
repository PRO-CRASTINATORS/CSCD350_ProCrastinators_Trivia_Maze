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
	/**
	 * ...
	 * @author ...
	 */
	public class QuestionFactory 
	{
		private 	var	db						:DatabaseHandler;
		
		//constructor
		public function QuestionFactory() 
		{
			db = new DatabaseHandler();
		}
	}

}
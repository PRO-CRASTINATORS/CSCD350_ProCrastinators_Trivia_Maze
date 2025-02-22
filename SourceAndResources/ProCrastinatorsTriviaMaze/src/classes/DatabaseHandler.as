﻿package  classes
{
	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	import flash.data.SQLResult;
	import flash.events.SQLEvent;
	import flash.errors.SQLError;
	import flash.display.MovieClip;
	import flash.net.Responder;
	import flash.filesystem.File;
	import classes.TriviaItem;
	
	public class DatabaseHandler extends MovieClip
	{

		private var conn				:SQLConnection;
		private var dbStatement			:SQLStatement;
		private var triviaResponder		:Responder;
		private var aQuestions			:Array = new Array();
		private var sType				:String;
		private var dbFile				:File;

		public function DatabaseHandler($type:String = "Zelda") 
		{
			// constructor code
			if($type == "zelda")
				this.sType = "Zelda";
			if($type == "mario")
				this.sType = "Mario";
			if($type == "starwars")
				this.sType = "Star Wars";
			init();
		}
		
		private function init():void
		{
			conn = new SQLConnection();
			conn.addEventListener(SQLEvent.OPEN, connOpenHandler);
			
			dbStatement = new SQLStatement();
			dbStatement.sqlConnection = conn;
			dbStatement.text = "SELECT * FROM trivia_item WHERE category = '"+ this.sType +"';";

			var folder: File = File.applicationDirectory;
			dbFile = folder.resolvePath("./triviaitems.db");
			conn.open(dbFile);
		}
		
		private function connOpenHandler(event:SQLEvent):void
		{
			triviaResponder = new Responder(resultHandler, errorHandler);
			dbStatement.execute(-1, triviaResponder);
		}
		
		private function resultHandler(qResult:SQLResult):void
		{
			if (qResult != null)
			{
				var numRows:int = qResult.data.length;
				for (var i:int = 0; i < numRows; i++)
				{
					var row:Object = qResult.data[i];
					var temp: TriviaItem = new TriviaItem(row.question, row.answer, row.a, row.b, row.c, row.d, row.type);
					this.aQuestions.push(temp);
				}
			}
		}
		
		private function errorHandler(error:SQLError):void
		{
			trace("An error occured while executing the statement.");
		}
		
		public function getQuestions():Array
		{
			return this.aQuestions;
		}
	}
}
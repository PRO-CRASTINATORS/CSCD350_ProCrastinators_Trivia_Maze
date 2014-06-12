package  classes
{
	import flash.net.URLLoader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import classes.Room;
	import classes.Door;
	import classes.QuestionFactory;
	import classes.DatabaseHandler;
	
	public class MazeGen extends MovieClip
	{
		private var aMap		:Array;
		private var rMap		:Array;
		private var mapType		:String;
		private var aDimensions	:Array;
		private var startRow	:Number;
		private var startCol	:Number;
		private var endRow		:int;
		private var endCol		:int;
		private var sType		:String = "zelda";
		private var qfFactory	:QuestionFactory;
		
		public function MazeGen($type:String = null) 
		{
			// constructor code
			this.sType = $type;
			this.qfFactory = new QuestionFactory(new DatabaseHandler(this.sType));
			
		}
		
		public function loadMap($loader:URLLoader):void
		{
			var temp:Array = $loader.data.split("\n");

			var dtemp:String = temp[0];

			aDimensions = dtemp.split("x");

			aMap= new Array(Number(aDimensions[0]));
			
			for(var i:int=1; i <= Number(aDimensions[1]); i++)
			{
				aMap[i-1] = String(temp[i]).split("|");
			}
			this.convertMap();
		}
		
		public function getMap():Array
		{
			return this.rMap;
		}
		
		public function getStartCol():Number
		{
			return this.startCol;
		}
		
		public function getStartRow():Number
		{
			return this.startRow;
		}
		
		public function getEndCol():int
		{
			return this.endCol;
		}
		
		public function getEndRow():int
		{
			return this.endRow;
		}

		private function convertMap():void
		{
			rMap = new Array(Number(aDimensions[0]));
	
			for (var k:int = 0; k < Number(aDimensions[0]); k++) 
			{
				var temp:Array = new Array(Number(aDimensions[1]));
				
				for (var j:int = 0; j < Number(aDimensions[1]); j++) 
				{
					temp[j] = null;
					if (aMap[k][j] == "r" || aMap[k][j] == "f" || aMap[k][j] == "s") 
					{
						if (aMap[k][j] == "f")
						{
							temp[j] = new Room(this.sType, true);
							this.endRow = k;
							this.endCol = j;
						}
						else
							temp[j] = new Room(this.sType);
						
						//check room above's south door (if it exists)
						if (aMap[k-1][j] == "r" || aMap[k-1][j] == "f" || aMap[k-1][j] == "s")
							Room(temp[j]).setNorth(new Door("north", Door(Room(rMap[k-1][j]).getDoors()[3]).getTriviaItem()));
							
						//create east door, never will previously exist
						if (aMap[k][j+1] == "r" || aMap[k][j+1] == "f" || aMap[k][j+1] == "s")
							Room(temp[j]).setEast(new Door("east", this.qfFactory.getTriviaItem()));
							
						//create east door, never will previously exist
						if (aMap[k+1][j] == "r" || aMap[k+1][j] == "f" || aMap[k+1][j] == "s")
							Room(temp[j]).setSouth(new Door("south", this.qfFactory.getTriviaItem()));
							
						//
						if (aMap[k][j-1] == "r" || aMap[k][j-1] == "f" || aMap[k][j-1] == "s")
							Room(temp[j]).setWest(new Door("west",Door(Room(temp[j-1]).getDoors()[1]).getTriviaItem()));
							
						if (aMap[k][j] == "s")
						{
							this.startRow = k;
							this.startCol = j;
						}
					}//end if
				}// end inner for
				rMap[k] = temp;
			}// end outer for
		}
	}
}

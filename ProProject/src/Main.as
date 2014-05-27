package 
{

	import com.natejc.utils.StageRef;
	import flash.display.MovieClip;
	import flash.events.Event;
	import classes.Room;
	import classes.Door;
	import classes.MazeGen;
	import classes.Player;
	import com.natejc.input.KeyboardManager;
	//import com.natejc.input.KeyCode;
	
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	
	/**
	 * ...
	 * @author Zac
	 */
	public class Main extends MovieClip
	{
		
		public 		var mcScreen				:MovieClip;
		public	 	var pool					:Array = new Array(new Link(), new StormTrooper(), new Yoshi());
		private 	var index					:Number = 0;
		private 	var mazeMap					:Array;
		private		var player					:Player;
		private 	var sign					:MovieClip;
		
		private 	var loader					:URLLoader;
		
		public function Main()
		{
			this.stage.focus = this.stage;
			
			StageRef.stage = this.stage;
			
			KeyboardManager.init(this.stage);
			
			this.loader = new URLLoader(new URLRequest("map1.txt"));
			
			this.loader.addEventListener(Event.COMPLETE, loadComplete);
			
		}
		
		public function loadComplete(e:Event):void
		{
			var maze:MazeGen = new MazeGen();
			maze.loadMap(this.loader);
			this.mazeMap = maze.getMap();
			Room(mazeMap[1][4]).addRoomToStage();
			this.player = new Player();
			this.player.setPosCol(4);
			this.player.setPosRow(1);
			this.player.sig.add(this.testCollisions);
			this.player.sigRoom.add(this.getRoom);

		}
		
		private function getRoom(row:Number, col:Number):void
		{
			this.player.rRoom = Room(this.mazeMap[row][col]);
		}
		
		public function testCollisions():void
		{
			if (this.player) 
			{
				var room: Room = Room(mazeMap[this.player.getPosRow()][this.player.getPosCol()]);
				var temp:Array = room.getDoors();
				for (var i:int = 0; i < temp.length; i++)
				{
					if (temp[i])
					{		
						if (player.character.Mask.hitTestObject(Door(temp[i]).getMc()))
						{	
							trace(temp[i]);
							if (!sign)
							{
								sign = new EnterDoor();
								this.stage.addChild(sign);
							}
							sign.x = player.character.x;
							sign.y = player.character.y - 15;
							
							this.player.mcTouchingDoor = Door(temp[i]).getMc();
							
						}
						else if (sign)
						{
							this.player.mcTouchingDoor = null;
							this.stage.removeChild(sign);
							this.sign = null;
						}
					}
					
				}
			}
		}//end of function
		
		
	}
	
}
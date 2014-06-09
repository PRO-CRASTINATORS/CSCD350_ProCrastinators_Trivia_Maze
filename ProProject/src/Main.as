package 
{

	import com.natejc.utils.StageRef;
	import flash.display.MovieClip;
	import flash.events.Event;
	import classes.Room;
	import classes.Door;
	import classes.MazeGen;
	import classes.Player;
	import classes.MenuScreen;
	import com.natejc.input.KeyboardManager;
	//import com.natejc.input.KeyCode;
	
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.events.MouseEvent;
	
	import com.treefortress.sound.SoundAS;
	
	/**
	 * ...
	 * @author Zac
	 */
	public class Main extends MovieClip
	{
		
		public 		var mcScreen				:MovieClip;
//public	 	var pool					:Array = new Array(new Link(), new StormTrooper(), new Yoshi());
		private 	var index					:Number = 0;
		private 	var mazeMap					:Array;
		private		var player					:Player;
		private 	var sign					:MovieClip;
		private 	var loader					:URLLoader;
		private 	var _Menu					:MenuScreen;
		private 	var _Title					:MovieClip;
		private 	var _Type					:String;
		private 	var _Difficulty				:String;
		private 	var _endRow					:int;
		private 	var _endCol					:int;
		
		public function Main()
		{
			this.stage.focus = this.stage;
			
			StageRef.stage = this.stage;
			
			KeyboardManager.init(this.stage);
			
			init();
			
		}
		
		private function init():void
		{
			this._Title = new TitleScreen();
			this.stage.addChild(this._Title);
			this._Title.PlayButton.addEventListener(MouseEvent.CLICK, this.loadMenu, false, 0, true);
			
		}
		
		private function loadMenu($me:MouseEvent):void
		{
			this._Title.PlayButton.removeEventListener(MouseEvent.CLICK, this.loadMenu, false);
			this.stage.removeChild(this._Title);
			this._Title = null;
			
			this._Menu = new MenuScreen();
			this._Menu.sig.addOnce(this.loadGame);
		}
		
		private function loadGame($me:MouseEvent):void
		{
			this._Type = this._Menu.getType();
			this._Difficulty = this._Menu.getDiff();
			
			if(_Type == "zelda")
				stage.frameRate = 12;
			else if(_Type == "mario")
				stage.frameRate = 20;
			else if(_Type == "starwars")
				stage.frameRate = 20;
				
			this._Menu.kill();
			
			//var test:DatabaseHandler = new DatabaseHandler(this._Type);
			
			this.loader = new URLLoader(new URLRequest(getMapInput(_Difficulty)));
			
			this.loader.addEventListener(Event.COMPLETE, loadComplete);
		}
		
		public function loadComplete(e:Event):void
		{
			var maze:MazeGen = new MazeGen(this._Type);
			maze.loadMap(this.loader);
			this.mazeMap = maze.getMap();
			this._endRow = maze.getEndRow();
			this._endCol = maze.getEndCol();
	
			this.player = new Player(this._Type);
			this.player.setPosCol(maze.getStartCol());
			this.player.setPosRow(maze.getStartRow());
			
			this.pushKeys();
			
			this.player.sigColide.add(this.testCollisions);
			this.player.sigRoom.add(this.getRoom);
			this.player.sigStuck.add(this.callCheckIfStuck);
			
			Room(mazeMap[this.player.getPosRow()][this.player.getPosCol()]).addRoomToStage();

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
						if(player.character.Mask.hitTestObject(Door(temp[i]).getMc()))
						{	
							if (!sign)
							{
								sign = Door(temp[i]).getDoorStatus();
								this.stage.addChild(sign);
								this.player.dTouchingDoor = Door(temp[i]);
							}
							sign.x = player.character.x;
							sign.y = player.character.y - 15;
							break;
						}
						else if (sign)
						{
							this.player.dTouchingDoor = null;
							this.stage.removeChild(sign);
							this.sign = null;
						}
						if(room.bTrophy)
						{
							if(player.character.Mask.hitTestObject(room.getTrophy()))
							{
								this.nuke(room);
							}
						}
					}
					
				}
			}
		}//end of function
		
		/*****************************************************************************/
		//Removes all children fro stage.
		private function nuke($room:Room):void
		{
			$room.killRoom();
			this.player.kill();
			SoundAS.fadeTo(this._Type, 0, 0);
			
			this.stage.addChild( new ResultScreen());
			this.stage.addChild( new Congratulations());
			
			SoundAS.play("congratz");
			
   		}
		
		
		
		private function getMapInput(d:String):String
		{
			var i:int = 0;
			
			if(d == "easy")
				i = (Math.random() * 3) + 1;
			else if(d == "med")
				i = (Math.random() * 3) + 4;
			else if(d == "hard")
				i = (Math.random() * 3) + 7;
			
			trace(i);
			
			return "./lib/maps/map" + i + ".txt";
		}
		
		private function resetRoomVisits():void
		{
			for(var k:int=0; k < this.mazeMap.length; k++)
			{
				for(var j:int=0; j < this.mazeMap.length; j++)
				{
					if(this.mazeMap[k][j] != null)
						Room(this.mazeMap[k][j]).setVisited(false);
				}
			}
		}
		
		private function callCheckIfStuck():void
		{
			var b:Boolean = this.checkIfStuck(this._endRow, this._endCol);
			if(b == true)
			{
				Room(this.mazeMap[this.player.getPosRow()][this.player.getPosCol()]).killRoom();
				this.player.kill();
				
				this.stage.addChild( new ResultScreen());
				this.stage.addChild( new GameOver());
				
				SoundAS.fadeTo(this._Type, 0, 0);
				SoundAS.playLoop("gameover");
			}
			this.resetRoomVisits();
		}
		
		private function checkIfStuck(row:int, col:int):Boolean
		{
				var stuck:Boolean = true;
				
				if (Room(mazeMap[row][col]).hasVisited() == true)
					return true;

				Room(mazeMap[row][col]).setVisited(true); 

				if (player.checkInventory() != 0)
					return false;
				
				if(row == player.getPosRow() && col == player.getPosCol())
					return false;
		
				var doors:Array = Room(mazeMap[row][col]).getDoors();
				
				if(doors[0] != null && Door(doors[0]).getDoorLock() != 2)
				{
					stuck = this.checkIfStuck(row-1,col);
			
				}
				
				if (stuck == false)
					return stuck;
				
				if(doors[1] != null && Door(doors[1]).getDoorLock() != 2)
				{
					stuck = this.checkIfStuck(row,col+1);
				}
		
				if (stuck == false)
					return stuck;
				
				if(doors[2] != null && Door(doors[2]).getDoorLock() != 2)
				{
					stuck = this.checkIfStuck(row,col-1);
				}
		
				if (stuck == false)
					return stuck;
				
				if(doors[3] != null && Door(doors[3]).getDoorLock() != 2)
				{
					stuck = this.checkIfStuck(row+1,col);
				}
				
				if (stuck == false)
					return stuck;
		
				return true;

			}
			
			public function pushKeys()
			{
				if(_Difficulty == "easy")
					this.player.addKey();
				else if(_Difficulty == "med")
				{
					this.player.addKey();
					this.player.addKey();
				}
				else if(_Difficulty == "hard")
				{
					this.player.addKey();
					this.player.addKey();
					this.player.addKey();
				}
				
				this.player.addPlayerGUI();
			}
	}
	
}
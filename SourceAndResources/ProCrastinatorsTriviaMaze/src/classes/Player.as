package  classes
{
	import flash.display.MovieClip;	
	import com.natejc.input.KeyboardManager;
	import com.natejc.input.KeyCode;
	import com.natejc.utils.StageRef;
	import flash.events.Event;
	import flash.utils.setTimeout;
	import org.osflash.signals.Signal;
	import classes.Room;
	import classes.Door;
	import classes.QuestionScreen;
	import flash.ui.Keyboard;
	
	public class Player extends MovieClip
	{
		protected 	var posRow					:int; 
		protected 	var posCol					:int;
		protected 	var inventory 				:Array = new Array()//Array(new DoorKey(), new DoorKey(), new DoorKey());
		public 	  	var character				:MovieClip;
		private   	var bAnimation				:Boolean = true;
		public 		var dTouchingDoor			:Door;
		protected 	var _nCharacterSpeed		:Number = 15;
		protected 	var _nDelay					:Number = 130;
		public 		var sigColide				:Signal;
		public 		var sigRoom					:Signal;
		public 		var sigStuck				:Signal;
		public 		var rRoom					:Room;
		private		var topVal					:Number = 40;
		private		var bottomVal				:Number = 330;
		private		var leftVal					:Number = 65;
		private		var rightVal				:Number = 445;
		private 	var inv						:MovieClip;
		
		public function Player($type:String = null) 
		{
			// constructor code
			if($type == "mario")
				character = new Yoshi();
			else if($type == "starwars")
				character = new StormTrooper();
			else
				character = new Link();
			
			this.init();
		}
		
		private function init():void
		{
			sigColide = new Signal();
			sigRoom = new Signal();
			sigStuck = new Signal();
			
			character.x = 250;
			character.y = 180;
			StageRef.stage.addChild(character);
			this.inv = new Inventory();
			StageRef.stage.addChild(this.inv);

			this.addEventListener(Event.ENTER_FRAME, this.enterFrameHandler, false, 0, true);
		}
		
		private function checkIfStuck():void
		{
			sigStuck.dispatch();
		}
		
		private function returnPlayerMovement():void
		{
			this.addEventListener(Event.ENTER_FRAME, this.enterFrameHandler, false, 0, true);
		}
		
		public function kill():void
		{
			this.removeEventListener(Event.ENTER_FRAME, this.enterFrameHandler, false);
			StageRef.stage.removeChild(this.character);
			StageRef.stage.removeChild(this.inv);
			while(this.removeKey());
		}
		
		public function getPosRow():Number
		{
		  return this.posRow;
		}
		
		public function setPosRow(row:Number):void
		{
		  this.posRow = row;
		}
		
		public function getPosCol():Number
		{
		  return this.posCol;
		}
		
		public function setPosCol(col:Number):void
		{
		  this. posCol = col;
		}
		
		public function checkInventory():int
		{
			return this.inventory.length;
		}

		public function addKey():void
		{
			this.inventory.push(new DoorKey());
		}

		public function removeKey():Boolean
		{
			if(this.inventory.length > 0)
			{
				StageRef.stage.removeChild(this.inventory[this.inventory.length-1]);
				this.inventory.splice(this.inventory.length-1,1);
				return true;
			}
			return false;
		}
		
		private function resetBool():void
		{
			this.bAnimation = true;
		}
		
		private function checkKeyPress():void
		{
			if (KeyboardManager.instance.isKeyDown(KeyCode.X) && bAnimation && dTouchingDoor )
			{
				this.bAnimation = false;
				
				//sigRoom.dispatch(this.posRow, this.posCol);
				//this.changeRooms();
				if(this.dTouchingDoor.getDoorLock() == 0)
				{
					this.removeEventListener(Event.ENTER_FRAME, this.enterFrameHandler, false);
					var q: QuestionScreen = new QuestionScreen(this.dTouchingDoor);
					q.sigStuck.addOnce(this.checkIfStuck);
					q.sigMove.addOnce(this.returnPlayerMovement);
				}
				if(this.dTouchingDoor.getDoorLock() == 1)
				{
					sigRoom.dispatch(this.posRow, this.posCol);
					this.changeRooms();
				}
				setTimeout(resetBool, _nDelay);
			}
			if (KeyboardManager.instance.isKeyDown(KeyCode.Y) && bAnimation && dTouchingDoor.getDoorLock() != 1 )
			{
				if(this.removeKey())
				{
					this.dTouchingDoor.setDoorLock(1);
					this.checkIfStuck();
				}
			}
		}
		
		public function changeRooms():void
		{
			if (this.dTouchingDoor.getMc() is zNorthDoor) 
			{
				this.character.y = (bottomVal - character.Mask.height) - 20;
				this.posRow -= 1;
			}
			if (this.dTouchingDoor.getMc() is zSouthDoor) 
			{
				this.character.y = this.topVal + 50;
				this.posRow += 1;
			}
			if (this.dTouchingDoor.getMc() is zEastDoor) 
			{
				this.character.x = this.leftVal + 20;
				this.posCol += 1;
			}
			if (this.dTouchingDoor.getMc() is zWestDoor) 
			{
				this.character.x = this.rightVal - 20;
				this.posCol -= 1;
			}
				
			this.rRoom.killRoom();
			sigRoom.dispatch(this.posRow, this.posCol);
			this.rRoom.addRoomToStage();
		}
		
		public function enterFrameHandler($e:Event):void
		{
			if (this.character)
			{
				sigColide.dispatch();
				
				if (KeyboardManager.instance.isKeyDown(KeyCode.S) && bAnimation)
				{
					this.bAnimation = false;
					character.gotoAndPlay("south walk");

					if((this.character.y + character.Mask.height) < bottomVal)
						this.character.y += _nCharacterSpeed;
					else
						this.character.y = (bottomVal - character.Mask.height);
						
					setTimeout(resetBool, _nDelay);
				}
				else if (KeyboardManager.instance.isKeyDown(KeyCode.W) && bAnimation)
				{
					this.bAnimation = false;
					character.gotoAndPlay("north walk");
					
					if(this.character.y > topVal)
						this.character.y -= _nCharacterSpeed;
					else
						this.character.y = topVal;
						
					setTimeout(resetBool, _nDelay);
				}
				else if (KeyboardManager.instance.isKeyDown(KeyCode.A) && bAnimation)
				{
					this.bAnimation = false;
					character.gotoAndPlay("west walk");

					if(this.character.x > leftVal)
						this.character.x -= _nCharacterSpeed;
					else
						this.character.x = leftVal;
						
					setTimeout(resetBool, _nDelay);
					
				}
				else if (KeyboardManager.instance.isKeyDown(KeyCode.D) && bAnimation)
				{
					this.bAnimation = false;
					character.gotoAndPlay("east walk");
					
					if(this.character.x < rightVal)
						this.character.x += _nCharacterSpeed;
					else
						this.character.x = rightVal;
						
					setTimeout(resetBool, _nDelay);
				}
				
				this.checkKeyPress();
			}
		}// end of function
		
		public function addPlayerGUI()
		{
			var xSpace:int = 0;
			
			for(var x:int=0; x < this.inventory.length; x++)
			{
				StageRef.stage.addChild(this.inventory[x]);
				MovieClip(this.inventory[x]).x = xSpace;
				xSpace += 68;
			}
		}
	}// end of class
}

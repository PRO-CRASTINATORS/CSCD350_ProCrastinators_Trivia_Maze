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
	
	
	public class Player extends MovieClip
	{
		
		//protected var score		:int 
		protected 	var posRow					:int; 
		protected 	var posCol					:int;
		protected 	var inventory 				:Array = new Array(3);
		public 	  	var character				:MovieClip;
		private   	var bAnimation				:Boolean = true;
		public 		var mcTouchingDoor			:MovieClip;
		protected 	var _nCharacterSpeed		:Number = 15;
		protected 	var _nDelay					:Number = 130;
		public 		var sigColide						:Signal;
		public 		var sigRoom					:Signal;
		
		public 		var rRoom					:Room;
		
		private		var topVal					:Number = 40;
		private		var bottomVal				:Number = 330;
		private		var leftVal					:Number = 65;
		private		var rightVal				:Number = 445;
		
		public function Player() {
			// constructor code
			this.init();
		}
		
		private function init():void
		{
			sigColide = new Signal();
			sigRoom = new Signal();
			
			character = new Link();
			character.x = 95;
			character.y = 200;
			StageRef.stage.addChild(character);
			
			this.addEventListener(Event.ENTER_FRAME, this.enterFrameHandler, false, 0, true);
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
			var x:int = 0;
			var k:int = 0;
			
			for(x = 0; x < this.inventory.length; x++)
			{
			 	if(this.inventory[x] == 1)
					k++;
			}
			return k;
		}
		
		public function addKey():void
		{
		 	var x:int = 0;
		 	var added:Boolean = false;
			while(added == false && x != this.inventory.length)
			{
			 	if(this.inventory[x] == 0)
			 	{
					this.inventory[x] = 1;
					added = true;
				}
				x++;
			}
			if(added)
			{
				trace("Key Obtained!");
			}
			else
			{
				trace("Inventory is full!");
			}
		}
		
		public function removeKey():void
		{
			var x:int = 0;
			var added:Boolean = false;
			while(added == false && x != this.inventory.length)
			{
				if(this.inventory[x] == 1)
				{
					this.inventory[x] = 0;
					added = true;
				}
				x++;
			}
			if(added)
			{
				trace("Key Obtained!");
			}
			else
			{
				trace("Inventory is full!");
			}
		}
		
		private function resetBool():void
		{
			this.bAnimation = true;
		}
		
		private function checkKeyPress():void
		{
			if (KeyboardManager.instance.isKeyDown(KeyCode.X) && bAnimation && mcTouchingDoor )
			{
				this.bAnimation = false;
				
				sigRoom.dispatch(this.posRow, this.posCol);
				this.changeRooms();
				
				setTimeout(resetBool, _nDelay);
			}
		}
		
		public function changeRooms():void
		{
			if (this.mcTouchingDoor is zNorthDoor) 
			{
				this.character.y = (bottomVal - character.Mask.height);
				this.posRow -= 1;
			}
			if (this.mcTouchingDoor is zSouthDoor) 
			{
				this.character.y = this.topVal;
				this.posRow += 1;
			}
			if (this.mcTouchingDoor is zEastDoor) 
			{
				this.character.x = this.leftVal;
				this.posCol += 1;
			}
			if (this.mcTouchingDoor is zWestDoor) 
			{
				this.character.x = this.rightVal;
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

	}// end of class
	
}

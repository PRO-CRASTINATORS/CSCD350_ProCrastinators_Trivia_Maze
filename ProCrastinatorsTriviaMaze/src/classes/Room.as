package  classes
{
	import flash.display.MovieClip;
	import com.natejc.utils.StageRef;

	public class Room extends MovieClip
	{
		private var dNorth		:Door;
		private var dSouth		:Door;
		private var dEast 		:Door;
		private var dWest		:Door;
		private var bItem		:Boolean = false;
		private var mcTrophy	:MovieClip  = new Trophy();
		private var mcRoom		:MovieClip;
		private var sType		:String;
		private var bVisited	:Boolean
		public var bTrophy		:Boolean = false;
	
		public function Room($type:String, $trophy:Boolean = false) 
		{
			this.dNorth = null;
			this.dSouth = null;
			this.dEast = null;
			this.dWest = null;
			
			this.bTrophy = $trophy;
			
			this.sType = $type;
			this.bItem = this.itemGen();
			
			this.bVisited = false;
		}
		
		public function addRoomToStage():void
		{
			if (this.sType == "zelda") 
				this.mcRoom = new ZeldaRoom();

			if (this.sType == "mario") 
				this.mcRoom = new MarioRoom()

			if(this.sType == "starwars")
				this.mcRoom = new StarWarsRoom();
				
			StageRef.stage.addChildAt(this.mcRoom, 0);
			
			if (bTrophy)
				StageRef.stage.addChild(this.mcTrophy);
				
			this.addRoomDoors();
		}
		
		private function addRoomDoors():void
		{
			if(dNorth != null)
				dNorth.addDoorToStage();
			if(dSouth != null)
				dSouth.addDoorToStage();
			if(dWest != null)
				dWest.addDoorToStage();
			if(dEast != null)
				dEast.addDoorToStage();
		}
		
		public function getTrophy():MovieClip
		{
			return this.mcTrophy;
		}
		
		public function getItem():Boolean
		{
			return this.bItem;
		}

		public function setNorth($n:Door) :void
		{
			this.dNorth = $n;
		}

		public function setSouth($s:Door) :void
		{
			this.dSouth = $s;
		}

		public function setEast($e:Door) :void
		{
			this.dEast = $e;
		}

		public function setWest($w:Door) :void
		{
			this.dWest = $w;
		}
		
		public function getDoors():Array
		{
			return new Array(this.dNorth, this.dEast, this.dWest, this.dSouth);
		}
		
		public function killRoom():void
		{
			StageRef.stage.removeChild(this.mcRoom);
			this.mcRoom = null;
			
			if (this.bTrophy)
				StageRef.stage.removeChild(this.mcTrophy);
				
			if (this.dEast)
				this.dEast.killDoor();
			if (this.dWest)
				this.dWest.killDoor();
			if (this.dNorth)
				this.dNorth.killDoor();
			if (this.dSouth)
				this.dSouth.killDoor();
		}
		
		private function itemGen():Boolean 
		{
			var rand:int = Math.floor(Math.random() * (10 - 0 + 1) + 0)
			if (rand < 3)
				return true;
			return false;
		}
		
		public function hasVisited():Boolean
		{
			return bVisited;
		}
		
		public function setVisited($visit:Boolean):void
		{
			bVisited = $visit;
		}
	}
}
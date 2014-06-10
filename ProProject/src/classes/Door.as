package  classes
{
	import flash.display.MovieClip;
	import com.natejc.utils.StageRef;
	import classes.TriviaItem;
	/**
	 * ...
	 * @author ...
	 */
	public class Door extends MovieClip
	{
		//private var _locked 	:int = 0;
		private var _sType		:String;
		private var mc			:MovieClip;
		private var tQuestion	:TriviaItem;
		
		public function Door($type:String, $ti:TriviaItem = null) 
		{
			this._sType = $type;
			//this._locked = 0;
			this.tQuestion = $ti;
		}
		
		public function getMc():MovieClip
		{
			return this.mc;
		}
		
		public function getTriviaItem():TriviaItem
		{
			return this.tQuestion;
		}
		
		public function setDoorLock($x:int):void
		{
			this.tQuestion.setDoorLock($x);
		}
		
		public function getDoorLock():int
		{
			return tQuestion.getDoorLock();
		}
		
		public function getDoorStatus():MovieClip
		{
			if(this.tQuestion.getDoorLock() == 0)
				return new UnlockDoor();
			if(this.tQuestion.getDoorLock() == 1)
				return new EnterDoor();
			if(this.tQuestion.getDoorLock() == 2)
				return new LockedDoor();
			return null;
		}
		
		public function killDoor():void
		{
			StageRef.stage.removeChild(this.mc);
			this.mc = null;
		}
		
		public function addDoorToStage():void
		{
			if (this._sType == "north") 
			{
				this.mc = new zNorthDoor();
				StageRef.stage.addChildAt(mc, 1);
			}
			if (this._sType == "south") 
			{
				this.mc = new zSouthDoor();
				StageRef.stage.addChildAt(mc, 1);
			}
			if (this._sType == "west") 
			{
				this.mc = new zWestDoor();
				StageRef.stage.addChildAt(mc, 1);
			}
			if (this._sType == "east") 
			{
				this.mc = new zEastDoor();
				StageRef.stage.addChildAt(mc, 1);
			}
		}
		
	}

}
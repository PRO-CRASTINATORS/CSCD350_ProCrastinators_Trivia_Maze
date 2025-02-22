﻿package  classes
{
	import org.osflash.signals.Signal;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.natejc.utils.StageRef;
	import com.treefortress.sound.SoundAS;
	
	public class MenuScreen 
	{

		private var mcScreen	:MovieClip;
		public var sig			:Signal;
		public var sigBack		:Signal;
		private var sType		:String = "zelda";
		private var sDiff		:String = "easy";
		
		public function MenuScreen() 
		{
			// constructor code
			this.mcScreen = new MenuClip();
			this.sig = new Signal();
			this.sigBack = new Signal();
			init();
		}
		
		public function init()
		{
			SoundAS.loadSound("./lib/soundFX/Zelda_Theme.mp3", "zelda");
			SoundAS.loadSound("./lib/soundFX/Mario_Theme.mp3", "mario");
			SoundAS.loadSound("./lib/soundFX/StarWars_Theme.mp3", "starwars");
			SoundAS.loadSound("./lib/soundFX/Creepy_Laugh.mp3", "gameover");
			SoundAS.loadSound("./lib/soundFX/Congratz.mp3", "congratz");
			SoundAS.loadSound("./lib/soundFX/Wrong.mp3", "wrong");
			SoundAS.loadSound("./lib/soundFX/Correct.mp3", "correct");
			SoundAS.playLoop(this.sType, .5);
			
			StageRef.stage.addChild(this.mcScreen);
									
			this.mcScreen.LinkButton.addEventListener(MouseEvent.CLICK, this.setType, false, 0, true);
			this.mcScreen.YoshiButton.addEventListener(MouseEvent.CLICK, this.setType, false, 0, true);
			this.mcScreen.TrooperButton.addEventListener(MouseEvent.CLICK, this.setType, false, 0, true);
			
			this.mcScreen.EasyButton.addEventListener(MouseEvent.CLICK, this.setDiff, false, 0, true);
			this.mcScreen.MedButton.addEventListener(MouseEvent.CLICK, this.setDiff, false, 0, true);
			this.mcScreen.HardButton.addEventListener(MouseEvent.CLICK, this.setDiff, false, 0, true);
			
			this.mcScreen.OKButton.addEventListener(MouseEvent.CLICK, sig.dispatch, false, 0, true);
			this.mcScreen.BackButton.addEventListener(MouseEvent.CLICK, sigBack.dispatch, false, 0, true);
		}
		
		private function setType($me:MouseEvent):void
		{
			if($me.target.name == "LinkButton")
			{
				this.mcScreen.CharacterChoice.x = 96.25;
				if(this.sType != "zelda")
				{
					SoundAS.fadeTo(this.sType, 0, 1000);
					this.sType = "zelda";
					SoundAS.playLoop(this.sType, .5);
				}
			}
			if($me.target.name == "YoshiButton")
			{
				this.mcScreen.CharacterChoice.x = 272.25;
				if(this.sType != "mario")
				{
					SoundAS.fadeTo(this.sType, 0, 1000);
					this.sType = "mario";
					SoundAS.playLoop(this.sType, .5);
				}
			}
			if($me.target.name == "TrooperButton")
			{
				this.mcScreen.CharacterChoice.x = 450.25;
				if(this.sType != "starwars")
				{
					SoundAS.fadeTo(this.sType, 0, 1000);
					this.sType = "starwars";
					SoundAS.playLoop(this.sType, .5);
				}
			}
		}
		
		public function getType():String
		{
			return this.sType;
		}
		
		private function setDiff($me:MouseEvent):void
		{
			if($me.target.name == "EasyButton")
			{
				this.sDiff = "easy";
				this.mcScreen.DifficultyChoice.x = 164 ;
			}
			if($me.target.name == "MedButton")
			{
				this.sDiff = "med";
				this.mcScreen.DifficultyChoice.x = 338;
			}
			if($me.target.name == "HardButton")
			{
				this.sDiff = "hard";
				this.mcScreen.DifficultyChoice.x = 513;
			}
		}
		
		public function getDiff():String
		{
			return this.sDiff;
		}
		
		public function kill():void
		{
			
			StageRef.stage.removeChild(this.mcScreen);
			
			this.mcScreen.LinkButton.removeEventListener(MouseEvent.CLICK, this.setType, false);
			this.mcScreen.YoshiButton.removeEventListener(MouseEvent.CLICK, this.setType, false);
			this.mcScreen.TrooperButton.removeEventListener(MouseEvent.CLICK, this.setType, false);
			
			this.mcScreen.EasyButton.removeEventListener(MouseEvent.CLICK, this.setDiff, false);
			this.mcScreen.MedButton.removeEventListener(MouseEvent.CLICK, this.setDiff, false);
			this.mcScreen.HardButton.removeEventListener(MouseEvent.CLICK, this.setDiff, false);
		}
	}
}

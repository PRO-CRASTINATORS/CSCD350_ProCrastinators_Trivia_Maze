//Updated 5/13/2014
//ZB

import java.util.Random;


public class Room 
{
	//North Door aDoors[0]
	//South Door aDoors[1]
	//East Door aDoors[2]
	//West Door aDoors[3]
	private Door [] aDoors = new Door[4];
	private boolean bItem = false;
	
	public Room()
	{
		for(int i = 0; i < 4; i++)
		{
			this.aDoors[i] = new Door();
		}
		this.itemGen();
	}
	
	public boolean getItem()
	{
		return this.bItem;
	}
	
	private boolean itemGen()
	{
		Random rand = new Random();
		if(rand.nextInt(1) == 1)
			bItem = true;
		return false;
	}
}

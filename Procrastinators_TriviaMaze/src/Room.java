//Updated 5/14/2014
//ZB

import java.util.Random;

public class Room 
{

	private Door dNorth;
	private Door dSouth;
	private Door dEast;
	private Door dWest;
	private boolean bItem = false;

	public Room() 
	{
		this.dNorth = null;
		this.dSouth = null;
		this.dEast = null;
		this.dWest = null;
		this.bItem = this.itemGen();
	}

	public boolean getItem() 
	{
		return this.bItem;
	}

	public void setNorth(Door n) 
	{
		this.dNorth = n;
	}

	public void setSouth(Door s) 
	{
		this.dSouth = s;
	}

	public void setEast(Door e) 
	{
		this.dEast = e;
	}

	public void setWest(Door w) 
	{
		this.dWest = w;
	}


	private boolean itemGen() 
	{
		Random rand = new Random();
		if (rand.nextInt(10) < 3)
			return true;
		return false;
	}
}

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
	
	public setNorth( Door n ) 
	{
		this.dNorth = n;
	}
	
	public setSouth( Door s )
	{
		this.dSouth = s;
	}
	
	public setEast( Door e )
	{
		this.dEast = e;
	}
	
	public setWest( Door w )
	{
		this.dWest = w;
	}
	
	public boolean getItem()
	{
		return this.bItem;
	}
	
	private boolean itemGen()
	{
		Random rand = new Random();
		if(rand.nextInt(10) < 3)
			return true;
		return false;
	}
}

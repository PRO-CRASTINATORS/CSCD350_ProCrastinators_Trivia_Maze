public class Player
{
   protected String name;
   protected int score, posRow=0, posCol=0;
   protected int [] inventory = new int [3];
   
   public Player()
   {
      this.name = "Default";
      this.score = 0;
   }
   
   public Player(String name)
   {
      this.name = name;
      this.score = 0;
   }
   
   public Player(String name, int score)
   {
      this.name = name;
      this.score = score;
   }
   
   public String getName()
   {
      return this.name;
   }
   
   public void setName(String name)
   {
      this.name = name;
   }
   
   public int getScore()
   {
      return this.score;
   }
   
   public void setScore(int score)
   {
      this.score = score;
   }
   
   public void updateScore(int updateScore)
   {
      this.score += updateScore;
   }
   
   public int getPosRow()
   {
      return this.posRow;
   }
   
   public void setPosRow(int row)
   {
      this.posRow = row;
   }
   
   public int getPosCol()
   {
      return this.posCol;
   }
   
   public void setPosCol(int col)
   {
      this.posCol = col;
   }
   
   public String reportPosition()
   {
      return "Player position: [" + this.posRow + "," + this.posCol + "]";
   }
   
   public void goThrough(Door d)
   {
	   int[] coords = d.getNextRoom();
	   
	   setPosRow(coords[0]);
	   setPosCol(coords[1]);
   }
   
   public int checkInventory()
   {
      int x, k = 0;
      for(x = 0; x < this.inventory.length; x++)
      {
         if(this.inventory[x] == 1)
            k++;
      }
      return k;
   }
   
   public void addKey()
   {
      int x = 0;
      boolean added = false;
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
         System.out.println("Key Obtained!");
      }
      else
      {
         System.out.println("Inventory is full!");
      }
   }
   
   public void removeKey()
   {
      int x = 0;
      boolean added = false;
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
         System.out.println("Key Removed!");
      }
      else
      {
         System.out.println("Inventory is empty!");
      }
   }
   
   public void changeInvSize(int max)
   {
      //note, this will add previously obtained keys back into the inventory
      int k = this.checkInventory();
      this.inventory = new int[max];
      while(k != 0)
      {
         this.addKey();
         k--;
      }
   }
   
   public void clearInventory()
   {
      this.inventory = new int[inventory.length];
      System.out.println("Inventory cleared!");
   }
}
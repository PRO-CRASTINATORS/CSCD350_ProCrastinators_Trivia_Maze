//Designed to test Player class
//Updated 5/12/14
//KP

public class PlayerTester2
{
   public static void main(String [] args)
   {
      Player myPlayer = new Player();
      myPlayer.setName("Kyle");
      
      System.out.println(myPlayer.getName() + " entered a room!");
      myPlayer.addKey();
      System.out.println(myPlayer.getName() + " currently has " + myPlayer.checkInventory() + " key(s)!");
   
      System.out.println(myPlayer.getName() + "is moving to the right one room!");
      myPlayer.setPosCol(myPlayer.getPosCol() + 1);
      System.out.println(myPlayer.getName() + "'s current position is " + myPlayer.reportPosition());
      
      System.out.println(myPlayer.getName() + " used a key to open a door!");
      myPlayer.removeKey();
      System.out.println(myPlayer.getName() + " currently has " + myPlayer.checkInventory() + " key(s)!");      
  
      System.out.println(myPlayer.getName() + " picked up a bag! Item inventory increase!");
      myPlayer.changeInvSize(5);
      
      System.out.println(myPlayer.getName() + " dropped all their items!");
      myPlayer.clearInventory();
   }
}
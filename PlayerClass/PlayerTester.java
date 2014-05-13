//Designed to test Player class
//Updated 5/12/14
//KP

public class PlayerTester
{
   public static void main(String [] args)
   {
      Player tester = new Player();
      Player tester2 = new Player("Kyle");
      Player tester3 = new Player("Kyle", 9001);
      
      //test base player
      System.out.println("Player Name: " + tester.getName());
      System.out.println("Player Score: " + tester.getScore());
      System.out.println("Player Row: " + tester.getPosRow());
      System.out.println("Player Col: " + tester.getPosCol());
      System.out.println(tester.reportPosition());
      
      //test sets
      tester.setName("String");
      tester.setScore(42);
      
      System.out.println("New name: " + tester.getName());
      System.out.println("New Score: " + tester.getScore());

      //test score updater
      tester.updateScore(42);
      System.out.println("New Score: " + tester.getScore());

      //test position setting
      tester.setPosRow(4);
      tester.setPosCol(2);
      
      System.out.println(tester.reportPosition());
      
      tester.setPosRow(tester.getPosRow()+1);
      tester.setPosCol(tester.getPosCol()+1);
      
      System.out.println(tester.reportPosition());
      
      //test adding keys
      System.out.println("Current Keys: " + tester.checkInventory());
      tester.addKey();
      System.out.println("Current Keys: " + tester.checkInventory());
      tester.addKey();
      System.out.println("Current Keys: " + tester.checkInventory());
      tester.addKey();
      System.out.println("Current Keys: " + tester.checkInventory());
      tester.addKey();
      System.out.println("Current Keys: " + tester.checkInventory());
      
      //test removing keys
      System.out.println("Current Keys: " + tester.checkInventory());
      tester.removeKey();
      System.out.println("Current Keys: " + tester.checkInventory());
      tester.removeKey();
      System.out.println("Current Keys: " + tester.checkInventory());
      tester.removeKey();
      System.out.println("Current Keys: " + tester.checkInventory());
      tester.removeKey();
      System.out.println("Current Keys: " + tester.checkInventory());
      
      //test changing inventory size
      tester.addKey();
      tester.addKey();
      tester.changeInvSize(5);
      tester.addKey();
      tester.addKey();
      tester.addKey();
      tester.addKey();
      
      //test removing all keys
      tester.removeKey();
      tester.removeKey();
      tester.removeKey();
      tester.removeKey();
      tester.removeKey();
      tester.removeKey();
      
      //test clearing an inventory
      tester.addKey();
      tester.clearInventory();
   }
}
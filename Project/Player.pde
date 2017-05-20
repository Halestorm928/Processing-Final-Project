public class Player
{
  int x;
  int y;
  int storedDirection;
  boolean canMove;
  boolean stillMoving;
  Node[] nList;
  RectCollision body;
  
  public Player(int x, int y, int wCol, int hCol)
  {
    body = new RectCollision(width/2, height/2, wCol-1, hCol-1);
    this.x = x; this.y = y;
    canMove = false;
  }
  void show()
  {
    rect(this.x, this.y, 49, 49);        
  }
  
  void move(int direction)
  {
    
    if(!board.isTouchingWall())
    {
       switch(direction)
       {
         case 1: y-=1; break;
         case 2: y+=1; break;
         case 3: x-=1; break;
         case 4: x+=1; break;
         default: break;
       }
       canMove = false;
       body.updateCol(x, y);
    }
     if(board.isTouchingWall())
     {
       switch(direction)
       {
         case 1: y+=1; break;
         case 2: y-=1; break;
         case 3: x+=1; break;
         case 4: x-=1; break;
         default: break;
       }
       body.updateCol(x,y);
     }
     if(board.isOLappingNode())
     {
       if(nList[0]!=null && nList[0].getDir()[0] == true && move == 1)
       {
         player.move(1);
       }
       
     }

  }
  
  void queueStore(int direction)
  {
    storedDirection=direction;
  }
  
  void queueMove()
  {
    this.move(storedDirection);
  }
}
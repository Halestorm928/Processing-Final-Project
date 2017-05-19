public class Player
{
  int x;
  int y;
  boolean canMove;
  RectCollision body;
  
  public Player(int x, int y, int xCol, int yCol, int wCol, int hCol)
  {
    body = new RectCollision(xCol, yCol, wCol, hCol);
    this.x = x; this.y = y;
    canMove = false;
  }
  
  void show()
  {
    rect(this.x, this.y, 100, 100);
    
    
  }
  void move(int direction)
  {
    for(int i = 0; i <  1; i++)
    { 
      canMove = false;
      if((board.colList[0] != null && !player.body.isColliding(board.colList[0] )))
      {
        canMove = true;
        
      }

    }
    //System.out.println(player.body.isColliding(board.colList[0] ));
    if(canMove)
    {
       switch(direction)
       {
         case 1: y--; break;
         case 2: y++; break;
         case 3: x--; break;
         case 4: x++; break;
         default: break;
       }
       canMove = false;
       body.updateCol(x, y);
     } 
  }
}
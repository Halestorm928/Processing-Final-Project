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
    rect(this.x, this.y, 50, 50);        
  }
  
  
  
  
  void move(int direction)
  {
    
    if(!board.anyoneTouchDisBooty()) // RENAME THIS
    {
      canMove = true;  
    }
    
    if(canMove)
    {
       switch(direction)
       {
         case 1: y-=4; break;
         case 2: y+=4; break;
         case 3: x-=4; break;
         case 4: x+=4; break;
         default: break;
       }
       canMove = false;
       body.updateCol(x, y);
     }
     while(board.anyoneTouchDisBooty())
     {
       switch(direction)
       {
         case 1: y+=4; break;
         case 2: y-=4; break;
         case 3: x+=4; break;
         case 4: x-=4; break;
         default: break;
       }
       body.updateCol(x,y);
     }

  }
}
public class Player
{
  int x;
  int y;
  int storedDirection;
  boolean canMove;
  boolean stillMoving;
  RectCollision body;
  
  public Player(int x, int y, int xCol, int yCol, int wCol, int hCol)
  {
    body = new RectCollision(width/2, height/2, wCol-1, hCol-1);
    this.x = x; this.y = y;
    canMove = false;
  }
  void show()
  {
    /*
    a++;
      if(a%17==0|| a%18 ==0)
      {
        fill(0,0,0);
      }
      else
        fill(255,255,255);
        */
    rect(this.x, this.y, 49, 49);        
  }
  
  public void amIMovingAndNotTouchingDisBooty(int direction)
  {
    if(!board.anyoneTouchDisBooty())
      {canMove = true; this.move(direction);}
    
    else canMove = false;
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
         case 1: y-=1; break;
         case 2: y+=1; break;
         case 3: x-=1; break;
         case 4: x+=1; break;
         default: break;
       }
       canMove = false;
       body.updateCol(x, y);
     }
     if(board.anyoneTouchDisBooty())
     {
       switch(direction)
       {
         case 1: y+=1; break;
         case 2: y-=1; break;
         case 3: x+=1; break;
         case 4: x-=1; break;
         default: break;
       }
       queueMove();
       body.updateCol(x,y);
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
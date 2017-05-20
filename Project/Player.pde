public class Player
{
  int x;
  int y;
  int a;
  int w;
  boolean canMove;
  boolean stillMoving;
  RectCollision body;
  
  public Player(int x, int y, int xCol, int yCol, int wCol, int hCol)
  {
    body = new RectCollision(width/2, height/2, wCol, hCol);
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
    rect(this.x, this.y, 50, 50);        
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
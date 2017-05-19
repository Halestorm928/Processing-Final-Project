public class Board
{
  public int x,y,w,h;
  RectCollision[] colList;
  
  public Board()
  {
    colList = new RectCollision[64];
    
    x = 500; y = 0; w = 100; h = 100;    
    //rect(x,y,w,h);
    colList[0] = new RectCollision(x,y,w,h);
    
    x = 200; y = 200; w = 350; h = 50;
    //rect(x,y,w,h);
    colList[1] = new RectCollision(x,y,w,h);
    
    x = 200; y = 300; w = 350; h = 50;
    //rect(x,y,w,h);
    colList[2] = new RectCollision(x,y,w,h);
  }
  void show()
  {
    x = 500; y = 0; w = 100; h = 100;    
    rect(x,y,w,h);
    
    x = 200; y = 200; w = 350; h = 50;
    rect(x,y,w,h);
    
    x = 200; y = 300; w = 350; h = 50;
    rect(x,y,w,h);
  }
  
  public boolean anyoneTouchDisBooty()
  {
    for(int i = 0; i < colList.length; i++)
    {
      if(colList[i] != null && player.body.isColliding(colList[i]))
      {
        return true;
      }
    }
    return false;
  }
  
  
}
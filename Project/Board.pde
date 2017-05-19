public class Board
{
  public int x,y,w,h;
  RectCollision[] colList;
  //RectCollision[] isTurnList;
  
  public Board()
  {
    colList = new RectCollision[64];
    //isTurnList = new RectCollision[256];
    
    //top border
    x = 0; y = 0; w = 1336; h = 50;    
    colList[0] = new RectCollision(x,y,w,h);
    
    //right border
    x = 1336; y = 0; w = 50; h = 768;
    colList[3] = new RectCollision(x,y,w,h);
    
    x = 200; y = 200; w = 350; h = 50;
    colList[1] = new RectCollision(x,y,w,h);
    
    x = 200; y = 300; w = 350; h = 50;
    colList[2] = new RectCollision(x,y,w,h);
    
   
    //isTurnList[0] =  new RectCollision(x,y,w,h);
  }
  void show()
  {
    //top border
    x = 0; y = 0; w = 1336; h = 50;    
    rect(x,y,w,h);
    
    //right border
    x = 1336; y = 0; w = 50; h = 768;
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
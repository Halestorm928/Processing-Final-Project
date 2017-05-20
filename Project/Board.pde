
public class Board
{
  PImage background;
  public int x,y,w,h;
  RectCollision[] colList;
  //RectCollision[] isTurnList;
  
  public Board()
  {
    background = loadImage("wacman_layout1.png");
    colList = new RectCollision[64];
    //isTurnList = new RectCollision[256];
    
    //top border
    //x = 0; y = 0; w = 1336; h = 50;    
    //colList[0] = new RectCollision(x,y,w,h);
    
    
    
    
   
    //isTurnList[0] =  new RectCollision(x,y,w,h);
  }
  void show()
  {
    image(background, width/2-300, height/2-400);
    //fill(255,255,255);
    //top border
    //x = 0; y = 0; w = 1336; h = 50;  
    //rect(x,y,w,h);
    
    
    
    
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
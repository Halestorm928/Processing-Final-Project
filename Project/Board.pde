public class Board
{
  RectCollision[] colList;
  public Board()
  {
    colList = new RectCollision[64];
  }
  void show()
  {
    rect(500,0,100,100);
    colList[0] = new RectCollision(500,0,100,100);
    
  }
  
  
  
}
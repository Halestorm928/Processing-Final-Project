
public class Board
{
  PImage background;
  public int x,y,w,h;
  RectCollision[] colList;
  Node[] nList;
  //RectCollision[] isTurnList;
  
  public Board()
  {
    background = loadImage("wacman_layout1.png");
    colList = new RectCollision[64];
    nList = new Node[64];
    
    //x = 0; y = 0; w = 1336; h = 50;    
    //colList[0] = new RectCollision(x,y,w,h);
    
    colList[0] = new RectCollision(width/2-150, height/2-50, 299,49);
    colList[1] = new RectCollision(width/2, height/2+50, 199,49);
    colList[2] = new RectCollision(width/2-300, height/2-400, 599,49);//top
    colList[3] = new RectCollision(width/2-300, height/2-351, 49,750);//left
    colList[4] = new RectCollision(width/2-300, height/2-400+750, 599,49);//bottom
    colList[5] = new RectCollision(width/2-300+550, height/2-400, 49,799);//right
    colList[6] = new RectCollision(width/2-200, height/2+50, 149,49);//right
    colList[7] = new RectCollision(width/2-250, height/2-50, 49,49);
    colList[8] = new RectCollision(width/2-200, height/2-200, 49,99);
    colList[9] = new RectCollision(width/2-200, height/2-300, 49,49);
    colList[10] = new RectCollision(width/2-100, height/2-300, 199,49);
    colList[11] = new RectCollision(width/2+150, height/2-300, 49,49);
    colList[12] = new RectCollision(width/2+150, height/2-200, 49,99);//
    colList[13] = new RectCollision(width/2+200, height/2-50, 49,49);//
    colList[14] = new RectCollision(width/2-100, height/2-200, 199,99);//
    colList[15] = new RectCollision(width/2-200, height/2+150, 199,49);//
    colList[16] = new RectCollision(width/2-100, height/2-200, 199,99);//
    colList[17] = new RectCollision(width/2-200, height/2+150, 49,149);//
    colList[18] = new RectCollision(width/2+50, height/2+150, 149,49);//
    colList[19] = new RectCollision(width/2+150, height/2+150, 49,149);//
    colList[20] = new RectCollision(width/2-100, height/2+250, 199, 49);
    
    nList[0] = new Node(width/2+150, height/2, 49,49, true, false, true, true);
    
  }
  void show()
  {
    image(background, width/2-300, height/2-400);
    //fill(255,255,255);
    //top border
    //x = 0; y = 0; w = 1336; h = 50;  
    //rect(x,y,w,h);
    /*
    rect((width/2)-150, (height/2)-50, 299,49);
    rect(width/2, height/2+50, 199,49);
    rect(width/2-300, height/2-400, 599,49);//top
    rect(width/2-300, height/2-351, 49,750);//left
    rect(width/2-300, height/2-400+750, 599,49);//bottom
    rect(width/2-300+550, height/2-400, 49,799);//right
    rect(width/2-200, height/2+50, 149,49);
    rect(width/2-250, height/2-50, 49,49);
    rect(width/2-200, height/2-200, 49,99);
    rect(width/2-200, height/2-300, 49,49);
    rect(width/2-100, height/2-300, 199,49);
    rect(width/2+150, height/2-300, 49,49);
    rect(width/2+150, height/2-200, 49,99);
    rect(width/2+200, height/2-50, 49,49);
    rect(width/2-100, height/2-200, 199,99);
    rect(width/2-200, height/2+150, 199,49);
    rect(width/2-200, height/2+150, 49,149);
    rect(width/2+50, height/2+150, 149,49);
    rect(width/2+150, height/2+150, 49,149);
    rect(width/2-100, height/2+250, 199, 49);
    */
    fill(255, 0, 0);
    rect(width/2+150, height/2, 49,49);
    fill(255);
  }
  
  public boolean isTouchingWall()
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
  
  public boolean isOLappingNode()
  {
    for(int i = 0; i < nList.length; i++)
    {
      if(nList[i] != null && nList[i].isOver(player.body))
      {
        return true;
      }
    }
    return false;
  }
  
  
}
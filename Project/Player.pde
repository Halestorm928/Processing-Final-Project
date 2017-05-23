public class Player
{
  int x, y, direction, storedDir;
  boolean canMove;
  boolean stillMoving;
  //Node[] nList;
  public Node curNode;
  RectCollision body;
  
  
  //CONSTRUCTOR
  public Player(int x, int y, int wCol, int hCol)
  {
    body = new RectCollision(width/2, height/2, wCol-1, hCol-1);
    this.x = x; this.y = y;    
  }
  //END CONSTUCTOR
  
  //SHOW
  void show()  {    rect(this.x, this.y, 49, 49);          }
  //END SHOW
  
  //Start out on this node:
  public void getFirstNode()
  {
    Node temp = getNodeAtPos();
    if(temp != null)    {      curNode = temp; curNode.setNeighbors(temp.neighbors);    }
    else                {      curNode = board.nList[5];    }
  }
  
  //Check which node the player is at in global space,
  public Node getNodeAtPos()
  {
    int checker = board.isOLappingNode();
    if(checker != -1)
    {
      return board.nList[checker];
    }
    return null;
  }
  
    
  void moveToNode(int dir)
  {
    Node moveToNode = canMove(dir);
    if(moveToNode != null)  
    {
      player.x = moveToNode.x1;
      player.y = moveToNode.y1; 
      body.updateCol(x,y); 
      curNode = moveToNode;
      System.out.println("Player @ ("+ player.x + ", "+ player.y + ")");
    }
  }
  
  Node canMove(int dir)
  {
    Node moveToNode = null;
        
    for(int i = 0; i < curNode.neighbors.length; i++)
    {
      if(curNode.bools[i] == true && i == dir)
      {
        moveToNode = curNode.neighbors[i];
        break;
      }
    }
    return moveToNode;
    
  }
 
}
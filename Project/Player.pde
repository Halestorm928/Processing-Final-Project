public class Player
{
  public int x, y, direction, storedDir;
  
  public Node curNode, prevNode, targetNode;
  RectCollision body;
  
  
  //CONSTRUCTOR
  public Player(int x, int y, int wCol, int hCol)
  {
    body = new RectCollision(width/2, height/2, wCol-1, hCol-1);
    this.x = x; this.y = y;  
    direction = 2;
    changePos(direction);
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
    //changePos(direction);
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
  
  public void changePos(int dir)
  {
    if(dir != direction)  {storedDir = dir;}
    
    if(curNode != null)  
    {
      Node moveToNode = canMove(dir);
      if(moveToNode != null)
      {
        direction = dir;
        targetNode = moveToNode;
        prevNode = curNode;
        curNode = null;
      }
    }
  }
  
  public void move()
  {
    if (targetNode != curNode && targetNode != null)
    {
      if(overShotTarget())
      {
        if(curNode != null)
        {
        player.x = curNode.x1;
        player.y = curNode.y1;
        }
        
        Node moveToNode = canMove(storedDir);
        
        if(moveToNode != null)
          direction = storedDir;
          
        if(moveToNode == null)
          moveToNode = canMove(direction);
          
        if(moveToNode != null)
        {
          targetNode = moveToNode;
          prevNode = curNode;
          curNode = null;
        }
      }
    }
    switch(direction)
    {
      case 0: y--; break;
      case 1: y++; break;
      case 2: x--; break;
      case 3: x++; break;
    }
  }
  
  //THIS MOVES THE CHARACTER TO ONE OF THE POSSIBLE NEIGHBORING NODES  
  public void moveToNode(int dir)
  {
    Node moveToNode = canMove(dir);
    if(moveToNode != null)  
    {
      player.x = moveToNode.x1;
      player.y = moveToNode.y1; 
      body.updateCol(x,y); 
      curNode = moveToNode;
      direction = dir;
      System.out.println("Player @ ("+ player.x + ", "+ player.y + ")");
    }
  }
  //THIS METHOD SUPPLEMENTS "void moveToNode(int dir)"
  public Node canMove(int dir)
  {
    Node moveToNode = null;        
    for(int i = 0; i < curNode.neighbors.length; i++)
    {
      if(curNode.bools[i] == true && i == dir)  {  moveToNode = curNode.neighbors[i];  break;  }
    }
    return moveToNode;    
  }
  // THIS METHOD WILL FIND OUT IF THE PLAYER HAS OVERSHOT THE TARGET NODE THY WERE GOING TO
  public boolean overShotTarget()
  {
    float nodeToTarget = lengthFromNode (targetNode.x1, targetNode.y1);
    float nodeToSelf = lengthFromNode (player.x, player.y);
  
    return nodeToSelf > nodeToTarget;
  }
  //THIS METHOD FINDS OUT THE LENGTH BEWTEEN THE PREVIOUS NODE AND THE TARGET POSITION OF THE NEXT NODE
  public float lengthFromNode (int x, int y)
  {
    int tempX = x - prevNode.x1;
    int tempY = y - prevNode.y1;
    
    return sqrt(abs(sq(tempX)+sq(tempY)));
  }
}
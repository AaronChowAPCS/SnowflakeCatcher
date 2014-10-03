SnowFlake [] particle = new SnowFlake[200];
Catcher stopper = new Catcher();
void setup()
{
  size(400,400);
  background(0);
  frameRate(30);
  for(int index = 0; index < particle.length; index++)
      particle[index] = new SnowFlake();
}
void draw()
{
  for(int index = 0; index < particle.length; index++)
  {
    particle[index].move();
    particle[index].lookDown();
    particle[index].erasePath();
    if(particle[index].myY > 390)
        particle[index].recreate();
    particle[index].show();
  }
  fill(0);
  rect(0,390,width,5);
}
void mouseDragged()
{
  if(mousePressed && mouseButton == LEFT)
    stopper.show();
  else if(mousePressed && mouseButton == RIGHT)
    stopper.remove();
}

class Catcher
{
  void show()
  {
    fill(255,0,0);
    ellipse(mouseX,mouseY, 20, 20);
  }
  void remove()
  {
    fill(0);
    ellipse(mouseX,mouseY, 20, 20);
  }
}
class SnowFlake 
{
  int myX;
  int myY;
  int movementY;
  int movementX;
  int flakeSize;
  boolean isMoving;
  SnowFlake()
  {
    myX = (int)(Math.random() * 400);
    myY = (int)(Math.random() * 400);
    flakeSize = (int)(Math.random() * 3) + 4;
    isMoving = true;
  }

  void show()
  {
    fill(255);
    
    ellipse(myX,myY,flakeSize,flakeSize);
  }
  void move()
  {
    flakeSize = (int)(Math.random() * 3) + 4;
    movementY = (int)(Math.random() * 2) + 1;
    movementX = (int)(Math.random() * 5) - 2;
    if(isMoving == true)
    {
      myY = myY + 2;
      myX = myX + movementX;
    }
    if(myY > 395)
      recreate();
  }
  void recreate()
  {
    myX = (int)(Math.random() * 400);
    myY = 0;
  }
  void erasePath()
  {
    if(isMoving == true)
    {
    fill(0);
    noStroke();
    ellipse(myX-1,myY-1,flakeSize+9,flakeSize+9);
    }
  }
  void lookDown()
  {
    if(get(myX, myY + 6) == color(255,0,0))
        isMoving = false;
    else if(get(myX + 1, myY + 6) == color(255,0,0))
        isMoving = false;
    else if(get(myX - 1, myY + 6) == color(255,0,0))
        isMoving = false;
    else if(get(myX + 2, myY + 6) == color(255,0,0))
        isMoving = false;
    else if(get(myX - 2, myY + 6) == color(255,0,0))
        isMoving = false;
    else 
      isMoving = true;
  }
}



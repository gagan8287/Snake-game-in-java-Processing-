class snake
{
  float size = 20 ;
  float x;
  float y;
  float xspeed= size, yspeed=0;
  float col = floor(width/size);
  float row = floor(height/size);
  float total = 0;

  ArrayList<PVector> tail = new ArrayList<PVector>();
  snake()
  {
    x = floor(random(col))* size;
    y = floor(random(row))* size;
  }

  void display()
  {
    fill(255);
    textSize(20);
    text((int)total+1, 10, 20);
    fill(0);
    int z = 0;
    stroke(255);
    for (PVector v : tail)
    {
      fill(z);
      z = z+10;
      if(z>=255)
      z=1;
      rect(v.x, v.y, size, size);
    }
    rect(x, y, size, size);
  }
  void update()
  {
    if (total > 0) {

      if (total == tail.size() && !tail.isEmpty()) {

        tail.remove(0);
      }

      tail.add(new PVector(x, y));
    }
    x= x +xspeed;
    y = y+yspeed;
  }
  void checkEdges()
  {
    if (x+size > width)
    {
      x = 0;
    }
    if (x < 0)
    {
      x= width-size;
    }
    if (y+size > height)
    {
      y = 0;
    }
    if (y < 0)
    {
      y = height-size;
    }
  }
  void direction(int a, int b)
  {
    if (xspeed != -a)
    {
      xspeed = a;
    }
    if (yspeed != -b)
    {
      yspeed= b;
    }
  }
  boolean eat(float a, float b)
  {
    if (dist(a, b, x, y)<1)
    {
      total++;
      return true;
    } else
    {
      return false;
    }
  }
  void dead()
  {
    for (PVector v : tail)
    {
      if (dist(x, y, v.x, v.y)<1)
      {
        //storing high score to a file
        String[] s = new String[1];
        s[0] = new String(Float.toString(total+1));
        if (hscore < total+1)
        {
          hscore = total+1;
          saveStrings("scorefile.txt", s);
        }
        o.score = total+1;
        total=0;
        tail.clear();
        play = 2;
        frameRate(60);
        break;
      }
    }
  }
}
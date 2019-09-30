import processing.sound.*;
snake s;
food f;
begin st;
over o;
float hscore;
int play =0 ;
SoundFile eat;
void setup()
{
  fullScreen();
  f = new food();
  s = new snake();
  st = new begin();
  o = new over();
  String s[] = loadStrings("scorefile.txt");
  hscore =  Float.parseFloat(s[0]);
  eat = new SoundFile(this,"eat.wav");
}
void draw()
{
  if (play==0)
  {
    background(0, 255, 155);
    st.display();
    st.update();
    textSize(20);
    text("HighScore :", 10, 20);
    text((int)hscore, 120, 20);
    //if (dist(mouseX, mouseY, width/2, height/2)<100)
    //{
    //  cursor(HAND);
    //} else
    //{
    //  cursor(ARROW);
    //}
  }

  if (play==1)
  {
    background(0, 255, 155);
    f.display();
    s.display();
    s.update();
    s.checkEdges();
    if (s.eat(f.x, f.y))
    {
      f.foodlocation();
      eat.play();
    }
    s.dead();
    //if(s.total+1>10)
    //  frameRate(15);
    //else
    //  frameRate(10);
  }
  if (play== 2)
  {
    background(0, 255, 155);
    o.display();
    o.update();
    //if (dist(mouseX, mouseY, width/2, height/2)<200)
    //{
    //  cursor(HAND);
    //} else
    //{
    //  cursor(ARROW);
    //}
  }
}
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      s.direction(0, -20);
    }
    else if (keyCode == DOWN)
    {
      s.direction(0, 20);
    }
    else if (keyCode == RIGHT)
    {
      s.direction(20, 0);
    }
    else if (keyCode == LEFT)
    {
      s.direction(-20, 0);
    }
  }
}
void mouseClicked()
{
  if (dist(mouseX, mouseY, width/2, height/2)<100)
  {
    play =  1;
    frameRate(10);
  }
}

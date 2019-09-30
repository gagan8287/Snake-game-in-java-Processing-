class begin
{
  PVector circle;
  PVector mc;
  float size =200;
  float fixsize = 200;
  begin()
  {
    circle = new PVector(width/2, height/2);
    mc = new PVector(width/2, height/2);
  }
  void display()
  {
    noFill();
    stroke(150, 255, 180);
    ellipse(circle.x, circle.y, fixsize, fixsize);

    ellipse(circle.x, circle.y, size, size);
    fill(255);
    textSize(50);
    text("PLAY", width/2-55, height/2+15);
  }
  void update()
  {
    if (size>300)
    { 
      size = 200;
    }
    size= size+1;
  }
}
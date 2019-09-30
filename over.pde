class over {
  PVector circle;
  PVector mc;
  float size =400;
  float fixsize = 400;
  float score;
  over()
  {
    circle = new PVector(width/2, height/2);
    mc = new PVector(width/2, height/2);
  }
  void display()
  {
    textSize(20);
    text("Your Score : ", width/2-80, 20);
    text((int)score, width/2+50, 20);
    text("Highest Score : ", width/2-100, height-20);
    text((int)hscore, width/2+50, height-20);
    noFill();
    stroke(150, 255, 180);
    ellipse(circle.x, circle.y, fixsize, fixsize);

    ellipse(circle.x, circle.y, size, size);
    fill(255);
    textSize(50);
    text("Play Again", width/2-120, height/2+15);
  }
  void update()
  {
    if (size>500)
    { 
      size = 400;
    }
    size= size+1;
  }
}
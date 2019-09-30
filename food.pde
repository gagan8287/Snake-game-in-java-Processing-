class food
{
  float size = 20 ;
  float x;
  float y;
  float col = floor(width/size);
  float row = floor(height/size);
  food()
  {
    x = floor(random(col))*size;
    y = floor(random(row))*size;
  }
  void foodlocation()
  {
    x = floor(random(col))*size;
    y = floor(random(row))*size;
  }
  void display()
  {
    fill(255, 0, 0);
    stroke(255);
    rect(x, y, size, size);
  }
}
void setup()
{
  size(500,500);
}

void draw()
{
  background(255);
  
  ////
  // Circle 1
  fill(180, 0, 0);
  ellipse(50, 50, 100, 100);
  
  fill(210, 30, 30);
  ellipse(50, 50, 50, 50);
 
  fill(240, 60, 60);
  ellipse(50, 50, 25, 25);
  
  ////
  // Circle 2
  fill(50, 50, 0);
  ellipse(275, 300, 200, 200);
  
  fill(80, 80, 30);
  ellipse(275, 300, 100, 100);
  
  fill(110, 110, 60);
  ellipse(275, 300, 50, 50);
  
  ////
  // Circle 3
  fill(0, 0, 195);
  ellipse(350, 80, 140, 140);
  
  fill(30, 30, 225);
  ellipse(350, 80, 70, 70);
  
  fill(60, 60, 255);
  ellipse(350, 80, 35, 35);
}
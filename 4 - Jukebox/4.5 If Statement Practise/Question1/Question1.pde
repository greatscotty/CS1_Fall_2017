float randomX;

void setup()
{
  size(500,500);
  background(0,51,191);
 }

void draw()
{
    randomX = random(0, width);

    if (randomX >= width/2) {
        fill(230, 230 , 66);
    }
    else {
        fill(255, 0, 0);
    }
    ellipse(randomX,random(0,height),15,15);
}

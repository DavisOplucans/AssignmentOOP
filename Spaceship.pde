class Spaceship
{
  void display()
  {
    strokeWeight(2);
    stroke(255);
    fill(255);
    rect(0, height - 220, width, height);
    triangle(0, height - 280, width - 400, height - 220, 0, height - 220);
    triangle(width, height - 280, 400, height - 220, width, height - 220);
   
   
    stroke(0);
    line(width-1066,height-268,width-1066,height);
    line(width-1066,height-143,0,height-143);
    
    line(550,500,550,800);
    line(815,500,815,800);
    line(815,635,width,635);
  }
}
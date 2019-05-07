class Identifier 
{
  void display_id()
  {
   stroke(0, 0, 255);
   line(mouseX, mouseY, mouseX - 15, mouseY - 15);
   line(mouseX, mouseY, mouseX + 15, mouseY + 15);
   line(mouseX, mouseY, mouseX + 15, mouseY - 15);
   line(mouseX, mouseY, mouseX - 15, mouseY + 15);
   noFill();
   ellipse(mouseX, mouseY, 15*3, 15*3);
  }
}
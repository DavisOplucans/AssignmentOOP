class Target
{
  void display_t()
  {
    stroke(255, 0, 0);
    line(mouseX, mouseY, mouseX, mouseY - 20);
    line(mouseX, mouseY, mouseX, mouseY + 20);
    line(mouseX - 20, mouseY, mouseX, mouseY);
    line(mouseX + 20, mouseY, mouseX, mouseY); 
  }
}
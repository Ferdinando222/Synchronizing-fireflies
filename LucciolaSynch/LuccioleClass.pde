class Lucciola{
  float x,y;
  float size;
  float phi;
  float omega;
  
  Lucciola(float x, float y, float size,float phi,float omega){
    this.x = x;
    this.y = y;
    this.size = size;
    this.phi = phi;
    this.omega = omega;
  }
  
  void update(float brightness){
    x +=random(-2,+2);
    y += random(-2,+2);
    fill(brightness);
    ellipse(x,y,size,size);
  }
}

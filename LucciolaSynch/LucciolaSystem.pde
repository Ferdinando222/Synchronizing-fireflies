class LucciolaSystem{
  int n;
  ArrayList<Lucciola> lucciole = new ArrayList<Lucciola>();
  float distanceThreshold = 300;
  float K;
  ArrayList neighbors = new ArrayList();
  LucciolaSystem(int n,float K){
    this.n = n;
    this.K = K;
    for(int i=0;i<n;i++){
      lucciole.add(new Lucciola(random(width),random(height),random(20,25),random(TWO_PI),random(-0.1,0.1)));
    } 
    println(lucciole.get(1));
  }
  
  void show(){
    for(int i=0;i<lucciole.size();i++){
      lucciole.get(i).phi += lucciole.get(i).omega + K/n * sum(lucciole.get(i).phi,i);  
      float brightness = map(sin(lucciole.get(i).phi), -1, 1, 0, 255);
      lucciole.get(i).update(brightness);
    }
  }
  
  private float sum(float value,int i){
  float total = 0;
  search_neighbors(i);
    for(int j=0;j<neighbors.size();j++){
      int index = (int) neighbors.get(j);
      total+= sin(lucciole.get(index).phi-value);
    }
  return total;
  }
  
  private void search_neighbors(int i){
    neighbors.clear();
    for (int j = 0;j<lucciole.size();j++){
      if(j!=i){
        //compute distances between fireflies
        float dx = lucciole.get(j).x-lucciole.get(i).x;
        float dy = lucciole.get(j).y-lucciole.get(i).y;
        float distance = sqrt(dx*dx-dy*dy);
        //add fireflies to neighbors
        if(distance <= distanceThreshold){
          neighbors.add(j);
        }
      }
    }
  }
  void mousePressed(){
    for(int i=0; i<lucciole.size();i++){
      float dx = mouseX - lucciole.get(i).x;
      float dy = mouseY - lucciole.get(i).y;
      float distance = sqrt(dx*dx + dy*dy);
      if (distance <= 100) {  // 20 is the threshold value
        // set new frequency for firefly
      lucciole.get(i).omega = random(-0.1, 0.1);
      }
    }
  }
  
  void eliminate(int n,int value){
    for(int i = n-1;i>=value;i--){
      lucciole.remove(i);
    }
  }
    
  void add_firefly(int n, int value){
    for(int i = n+1; i<=value;i++){
      lucciole.add(new Lucciola(random(width),random(height),random(20,25),random(TWO_PI),random(-0.1,0.1)));
    }
  }
  
  void change_coupling(float k){
    this.K = k;
  }

}

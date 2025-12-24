
ArrayList<Curve> curves; // ArrayList untuk menyimpan banyak kurva
int numberOfCurves = 79; // Jumlah kurva yang ingin dibuat

void setup(){
  fullScreen(P2D);
  background(255);
  hint(ENABLE_STROKE_PURE);
  smooth();

  // Inisialisasi ArrayList
  curves = new ArrayList<Curve>();

  // Buat kurva-kurva dengan parameter random
  for(int i = 0; i < numberOfCurves; i++) {
    Curve curv = new Curve();
    if(curv.mode == 5 || curv.mode == 6){
     curv.speedX = random(-30,30);
     curv.speedY = random(-30,30);
    }
    curves.add(curv);
  }
}

void draw(){
  // Background transparan untuk efek trail
  fill(0, 15); // Transparansi
  noStroke();
  rect(0, 0, width, height);

  // Jalankan semua kurva
  for(int i = 0; i < curves.size(); i++) {
    Curve c = curves.get(i);
    c.run();
  }
}

// Method untuk menambah kurva baru dengan parameter random
void addRandomCurve() {
  curves.add(new Curve());
}

// Method untuk menambah kurva dengan parameter spesifik
void addCurve(float x, float y, float sx, float sy, float r, float g, float b, float sw,float sa, int mode) {
  curves.add(new Curve(x, y, sx, sy, r, g, b, sw, sa, mode));
}

// Method untuk menghapus semua kurva
void clearCurves() {
  curves.clear();
  background(255);
}

// Method untuk menghapus kurva terakhir
void removeLastCurve() {
  if(curves.size() > 0) {
    curves.remove(curves.size() - 1);
  }
}

// Keyboard controls
void keyPressed() {
  if(key == 'a' || key == 'A') {
    addRandomCurve(); // Tambah kurva random
  }
  else if(key == 'c' || key == 'C') {
    clearCurves(); // Hapus semua kurva
  }
  else if(key == 'r' || key == 'R') {
    clearCurves(); // Reset
    for(int i = 0; i < numberOfCurves; i++) {
      curves.add(new Curve());
    }
  }
  else if(key == 'd' || key == 'D') {
    removeLastCurve(); // Hapus kurva terakhir
  }
  else if(key == '+') {
    // Tambah 5 kurva
    for(int i = 0; i < 5; i++) {
      addRandomCurve();
    }
  }
  else if(key == '-') {
    // Hapus 5 kurva
    for(int i = 0; i < 5 && curves.size() > 0; i++) {
      removeLastCurve();
    }
  }
}

// Mouse click untuk menambah kurva di posisi mouse
void mousePressed() {
  curves.add(new Curve(mouseX, mouseY, random(-8, 8), random(-8, 8),
                      random(255), random(255), random(255),
                      10,random(0,50), floor(random(1, 7))));
}

class Curve {
  float cpx1, cpy1;
  float speedX, speedY;
  float r, g, b;
  float strokeWeightValue;
  int mode; // 1: kurva ke kiri atas, 2: variasi lain

  // Constructor dengan parameter random
  Curve() {
    cpx1 = random(width);
    cpy1 = random(height);
    speedX = random(-8, 8);
    speedY = random(-8, 8);
    r = random(255);
    g = random(255);
    b = random(255);
    strokeWeightValue = random(1, 15);
    mode = floor(random(1, 5)); // Pilih mode 1, 2, atau 3
  }

  // Constructor dengan parameter spesifik
  Curve(float x, float y, float sx, float sy, float red, float green, float blue, float sw, int m) {
    cpx1 = x;
    cpy1 = y;
    speedX = sx;
    speedY = sy;
    r = red;
    g = green;
    b = blue;
    strokeWeightValue = sw;
    mode = m;
  }

  // Method untuk mengupdate posisi
  void update() {
    cpx1 += speedX;
    cpy1 += speedY;

    // Cek batas X
    if (cpx1 > width || cpx1 < 0) {
      speedX *= -1;
    }

    // Cek batas Y
    if (cpy1 > height || cpy1 < 0) {
      speedY *= -1;
    }
  }

  // Method untuk menggambar kurva
  void display() {
    noFill();
    strokeWeight(strokeWeightValue);
    stroke(r, g, b);

    // Berbagai mode kurva
    switch(mode) {
      case 1:
        // Kurva asli (ke kiri atas)
        curve(cpx1, cpy1, width/2, height/2, 0, 0, 0, cpy1);
        break;
      case 2:
        // Kurva ke kanan atas
        curve(cpx1, cpy1, width/2, height/2, width, 0, width, cpy1);
        break;
      case 3:
        // Kurva lingkaran dari tengah
        curve(cpx1, cpy1, width/2, height/2, width, height/2, width-cpx1, height-cpy1);
        break;
     case 4:
        //Kurva ke kiri bawah
        curve(cpx1, cpy1, width/2, height/2, 0, height, 0, 0);
        break;
    }
  }

  // Method untuk menjalankan update dan display
  void run() {
    update();
    display();
  }

  // Method untuk mengubah warna
  void setColor(float red, float green, float blue) {
    r = red;
    g = green;
    b = blue;
  }

  // Method untuk mengubah kecepatan
  void setSpeed(float sx, float sy) {
    speedX = sx;
    speedY = sy;
  }
}

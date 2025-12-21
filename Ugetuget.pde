
float cpx1 = 0, cpy1 = 0;
float speedX = 4; // Arah dan kecepatan X
float speedY = 4; // Arah dan kecepatan Y

void setup(){
  fullScreen(P2D);
  background(255);
  noFill();
  strokeWeight(9);
  stroke(255, 102, 0);
  hint(ENABLE_STROKE_PURE);
  //curve(width, height, width/2, height/2, 0, 0, (width/4), 0);
  smooth();
}

void draw(){
  createCurve();
}

void createCurve(){
    background(255);
   curve(cpx1, cpy1, width/2, height/2, 0, 0, 0, cpy1);
// 1. Update posisi
  cpx1 += speedX;
  cpy1 += speedY;

  // 2. Cek batas X (Kanan atau Kiri)
  if (cpx1 > width || cpx1 < 0) {
    speedX *= -1; // Balikkan arah (positif jadi negatif, negatif jadi positif)
  }

  // 3. Cek batas Y (Atas atau Bawah)
  if (cpy1 > height || cpy1 < 0) {
    speedY *= -1; // Balikkan arah
  }
}

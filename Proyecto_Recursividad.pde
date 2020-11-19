import processing.pdf.*;
import java.lang.management.ManagementFactory;
import com.sun.management.OperatingSystemMXBean;

PImage img, img2, img3, img5, img4, img6, img7, img8, img9, img10, img11, img12, img13, img14, img15, img16;
int a[][]=new int[1000][1000];
float b[][]=new float[100][100];
float espacioh=50, espaciov=50;
int dificultad=0, tiempo3=20, cont=0, caso=0, fila=1, colum=1, posx=0, posy=0, movx=0, movy=0, salidax=0, saliday=0, contador=0, laberinto=0, antex=0, antey=0, x, y, x2, y2, atrasx, atrasy, orden, repeticion=0, repeticion2=0, tiempo=0, tiempo2=0;
boolean auxiliar=false, aux=false, aux2=false, aux3=false, fin=false, solucionado=false, solucionado2=false, iterativo=false, recursivo=false;
int hilo[]=new int[100];
int filas=16, columna=8;
String palabra[]=new String[100];
double valores[]=new double[100];

long total = Runtime.getRuntime().totalMemory();
long usada, usada2;  
double cpu, cpu2, cpu3, cpu4;

PFont font;

void setup() {

  size(1200, 700);
  img=loadImage("imagenes/fondo.png");
  img2=loadImage("imagenes/fondo3.png");
  img3=loadImage("imagenes/circulo.png");
  img4=loadImage("imagenes/x.png");
  img5=loadImage("imagenes/o.png");
  img6=loadImage("imagenes/recargar.png");
  img7=loadImage("imagenes/continuar.png");
  img8=loadImage("imagenes/pausa.png");
  img9=loadImage("imagenes/inicio.png");
  img10=loadImage("imagenes/start.png");
  img11=loadImage("imagenes/fondo2.png");
  img12=loadImage("imagenes/mas.png");
  img13=loadImage("imagenes/menos.png");
  img14=loadImage("imagenes/fondo4.png");
  img15=loadImage("imagenes/fondo5.png");
  img16=loadImage("imagenes/circulo2.png");

  font=loadFont("SegoeUI-BoldItalic-48.vlw");
  textFont(font);
}



void draw() {
  if (caso==0) {
    image(img9, 0, 0);
    image(img10, 250, 450, 700, 100);
    textSize(50);
    text("Continuar", 470, 515);

    //fin
  } else if (caso==1) {
    image(img2, 0, 0);
    image(img10, 250, 300, 700, 80);
    text("Facil", 520, 355);
    image(img10, 250, 400, 700, 80);
    text("Medio", 520, 455);
    image(img10, 250, 500, 700, 80);
    text("Dificil", 520, 555);
    auxiliar=true;

    //fin
  } else if (caso==2) {
    image(img14, 0, 0);
    image(img10, 250, 570, 700, 100);
    textSize(50);
    text("Continuar", 470, 630);

    image(img12, 800, 140, 130, 130);
    image(img13, 250, 140, 130, 130);

    image(img12, 800, 400, 130, 130);
    image(img13, 250, 400, 130, 130);

    text(""+filas, 550, 490);
    text(""+columna, 550, 230);
  } else if (caso==3) {
    image(img, 0, 0);


    if (solucionado==true && solucionado2==true) {
      image(img7, 30, 30, 100, 100);
    } else {
      image(img8, 30, 30, 100, 100);
    }



    stroke(1);

    if (aux==false) {

      x=int (random(filas+1));
      y=int (random(columna+1));
      a[x][y]=2;
      x2=int (random(filas+1));
      y2=int (random(8));

      while (x2==x && y2==y) {
        x2=int (random(filas+1));
        y2=int (random(columna+1));
      }

      a[x2][y2]=3;

      posx=x;
      posy=y;

      salidax=x2;
      saliday=y2;

      System.out.println("posx init 1 "+x);
      System.out.println("posy init 1 "+y);

      System.out.println("posx init 2 "+x2);
      System.out.println("posy init 2 "+y2);

      for (int i=0; i<=filas; i++) {
        for (int j=0; j<=columna; j++) {
          if ( a[i][j]!=2 &&  a[i][j]!=3) {
            a[i][j]=int(random(2));
          }
          System.out.print(a[i][j]);
        }
      }

      aux=true;
    }


    fill(0, 0, 0);
    if (iterativo==true) {
      image(img8, 1000, 30, 100, 100);
    } else {
      image(img3, 1000, 30, 100, 100);
      text("i", 1042, 100);
    }

    textSize(50);
    
    if (recursivo==true) {
      image(img8, 1000, 140, 100, 100);
    } else {
      image(img3, 1000, 140, 100, 100);
      text("R", 1035, 205);
    }
    image(img6, 1000, 250, 100, 100);

    for (int i=0; i<=filas; i++) {
      for (int j=0; j<=columna; j++) {



        if (a[i][j]==0) {
          fill(66, 73, 73);
          rect(i*espacioh+170, j*espaciov+25, 50, 50);
        } else if (a[i][j]==1) {
          fill(255, 255, 255);
          rect(i*espacioh+170, j*espaciov+25, 50, 50);
        } else if (a[i][j]==5) {
          fill(93, 173, 226);
          rect(i*espacioh+170, j*espaciov+25, 50, 50);
        }
        if (a[i][j]==2) {
          fill(255, 255, 255);
          rect(i*espacioh+170, j*espaciov+25, 50, 50);
          image(img4, i*espacioh+170, j*espaciov+25, 50, 50);
        } else if (a[i][j]==3) {
          fill(255, 255, 255);
          rect(i*espacioh+170, j*espaciov+25, 50, 50);
          image(img5, i*espacioh+170, j*espaciov+25, 50, 50);
        }

        if (i==salidax && j==saliday && a[i][j]==5) {
          fill(46, 204, 113);
          rect(i*espacioh+170, j*espaciov+25, 50, 50);
          image(img5, i*espacioh+170, j*espaciov+25, 50, 50);
        }

        if (i==salidax && j==saliday && a[i][j]==1) {
          fill(255, 255, 255);
          rect(i*espacioh+170, j*espaciov+25, 50, 50);
          image(img5, i*espacioh+170, j*espaciov+25, 50, 50);
        }
      }
    }




    //----------------------acaba pantalla---------------------------------------
  } else if (caso==4) {
    image(img15, 0, 0);

    fill(27, 38, 49);
    noStroke();
    rect(50, 30, 1100, 250, 25);
    textSize(30);
    fill(255, 255, 255);
    text("Solucion iterativa:", 100, 70);
    text("Memoria ram Totalal del sistema "+total+" bytes", 100, 110);
    text("Memoria ram utilizada "+usada+" bytes", 100, 140);
    text("uso de CPU del proceso "+cpu+" %", 100, 170);
    text("uso de CPU del sistema "+cpu2+" %", 100, 200);
    text("Numero de repeticiones "+repeticion, 100, 230);

    fill(27, 38, 49);
    noStroke();
    rect(50, 300, 1100, 250, 25);
    textSize(30);
    fill(255, 255, 255);
    text("Solucion recursiva:", 100, 350);
    text("Memoria ram Total "+total+" bytes", 100, 380);
    text("Memoria ram utilizada "+usada2+" bytes", 100, 410);
    text("uso de CPU del proceso "+cpu3+" %", 100, 440);
    text("uso de CPU del sistema "+cpu4+" %", 100, 470);
    text("Numero de repeticiones "+repeticion2, 100, 500);


    image(img10, 250, 580, 700, 100);
    textSize(50);
    text("Continuar", 470, 650);

    //fin
  } else if (caso==5) {
    image(img11, 0, 0);
    fill(66, 73, 73);
    // Manera que mas consumo de ram tuvo
    if (usada>usada2) {
      palabra[1]="Recursiva";
    } else {
      palabra[1]="iterativa";
    }

    // Manera que mas uso de cpu de sistema tuvo
    if (cpu>cpu3) {
      palabra[2]="Recursiva";
    } else {
      palabra[2]="iterativa";
    }

    // Manera que mas uso de cpu de proceso tuvo
    if (cpu2>cpu4) {
      palabra[3]="Recursiva";
    } else {
      palabra[3]="iterativa";
    }

    // cual tuvo mas intentos
    if (repeticion>repeticion2) {
      palabra[4]="Recursiva";
    } else if (repeticion2>repeticion) {
      palabra[4]="iterativa";
    } else {
      palabra[4]="igual";
    }

    if (palabra[1]=="Recursiva") {
      valores[1]=usada2;
      valores[2]=usada-usada2;
    } else {
      valores[1]=usada;
      valores[2]=usada2-usada;
    }

    if (palabra[1]=="Recursiva" && (palabra[3]=="Recursiva" || palabra[2]=="Recursiva" )&& repeticion2<repeticion) {
      palabra[5]="Recursiva";
    } else if (palabra[1]=="iterativa" && (palabra[3]=="iterativa" || palabra[2]=="iterativa")&& repeticion<repeticion2) {
      palabra[5]="iterativa";
    } else if (palabra[1]=="Recursiva" && (palabra[3]=="Recursiva" && palabra[2]=="Recursiva")) {
      palabra[5]="Recursiva";
    } else if (palabra[1]=="iterativa" && (palabra[3]=="iterativa" && palabra[2]=="iterativa")) {
      palabra[5]="iterativa";
    } else if (palabra[1]=="Recursiva" && (palabra[3]=="Recursiva" || palabra[2]=="Recursiva")) {
      palabra[5]="Recursiva";
    } else if (palabra[1]=="iterativa" && (palabra[3]=="iterativa" || palabra[2]=="iterativa")) {
      palabra[5]="iterativa";
    } else if (palabra[1]=="iterativa" && palabra[3]=="iterativa") {
      palabra[5]="iterativa";
    } else if (palabra[1]=="Recursiva" && palabra[3]=="Recursiva") {
      palabra[5]="Recursiva";
    } else if (palabra[3]=="Recursiva" && palabra[2]=="Recursiva") {
      palabra[5]="Recursiva";
    } else if (palabra[3]=="iterativa" && palabra[2]=="iterativa") {
      palabra[5]="iterativa";
    } else {
      palabra[5]="ninguna";
    }


    textSize(25);
    fill(66, 73, 73);
    text("Comparando las soluciones tanto de manera iterativa como recursiva podemos", 125, 100);

    if (palabra[4]=="igual") {
      text("observar que ambas soluciones tuvieron igual cantidad de repeticiones, despues", 125, 130);
    } else {
      text("observar que la manera que menos repeticiones tuvos fue de manera "+palabra[4], 125, 130);
    }

    text("la solucion que menos consumo de ram tuvo fue la solucion "+palabra[1]+" con un", 125, 160);
    text("consumo de ram de "+valores[1]+" bytes, por una diferencia de "+valores[2]+" bytes", 125, 190);
    text("de la otra solucion, siendo la memoria total de "+total+" bytes, y la solucion que", 125, 220);
    text("menos uso de CPU tuvo fue la "+palabra[2]+", esto en el uso de CPU utilizado en proceso,", 125, 250);
    text("y la solucion con menos uso de CPU de sistema fue de manera "+palabra[3]+", por ende", 125, 280);

    if (palabra[5]=="ninguna") {
      text("podemos concluir que ninguna solucion es mas eficiente que la otra ", 125, 310);
    } else {
      text("podemos concluir que la solucion mas eficiente fue de manera "+ palabra[5], 125, 310);
    }
  }
} 

// solucion iteriativa
void mouseClicked() {
  if (mouseX>1000 && mouseX<1100 && mouseY>30 && mouseY<130 && caso==3 && iterativo==false) {
    movx=posx;
    movy=posy;

    repeticion=repeticion+1;

    for (int i=0; i<=filas; i++) {
      for (int j=0; j<=columna; j++) {
        if (a[i][j]==5) {
          a[i][j]=1;
        }
      }
    }




    try {

      if (dificultad==1) {

        while (fin==false) {
          contador=contador+1;
          System.out.println("posx "+movx);
          System.out.println("posy "+movy);

          if (contador==50000) {
            fin=true;
            break;
          }

          if (movx==salidax && movy==saliday) {
            System.out.println("solucionado");
            fin=true;
            solucionado=true;
            iterativo=true;
            usada=Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
            OperatingSystemMXBean bean = (com.sun.management.OperatingSystemMXBean) ManagementFactory
              .getOperatingSystemMXBean();
            cpu=bean.getProcessCpuLoad();
            cpu2=bean.getSystemCpuLoad();
          } else {
            antex=movx;
            antey=movy;

            laberinto=(antex-movx)+(antey-movy);


            if (laberinto==0) {
              cont=cont+1;

              if (cont==50000) {
                System.out.println("no tiene solucion");
                fin=true;
              }
            }
          }

          orden=int(random(4));

          switch(orden) {

          case 0:
            if (a[movx+1][movy]==1 || a[movx+1][movy]==3) {
              movx=movx+1;
              a[movx][movy]=5;
              continue;
            }
            break;
          case 1:

            if (a[movx][movy+1]==1 || a[movx][movy+1]==3) {
              movy=movy+1;
              a[movx][movy]=5;
              continue;
            } 

            break;
          case 2:

            if (a[movx-1][movy]==1 || a[movx-1][movy]==3) {
              movx=movx-1;
              a[movx][movy]=5;
              continue;
            } 

            break;
          case 3:

            if (a[movx][movy-1]==1 || a[movx][movy-1]==3) {
              movy=movy-1;
              a[movx][movy]=5;
              continue;
            }
            break;

          default:
            if (a[movx][movy-1]==1 || a[movx][movy-1]==3) {
              movy=movy-1;
              a[movx][movy]=5;
              continue;
            }
            break;
          }
        }
      } else if (dificultad==2) {

        while (fin==false) {
          contador=contador+1;
          System.out.println("posx "+movx);
          System.out.println("posy "+movy);

          if (contador==5000) {
            fin=true;
            break;
          }

          if (movx==salidax && movy==saliday) {
            System.out.println("solucionado");
            fin=true;
            solucionado=true;
            iterativo=true;
            usada=Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
            OperatingSystemMXBean bean = (com.sun.management.OperatingSystemMXBean) ManagementFactory
              .getOperatingSystemMXBean();
            cpu=bean.getProcessCpuLoad();
            cpu2=bean.getSystemCpuLoad();
          } else {
            antex=movx;
            antey=movy;

            laberinto=(antex-movx)+(antey-movy);


            if (laberinto==0) {
              cont=cont+1;

              if (cont==5000) {
                System.out.println("no tiene solucion");
                fin=true;
              }
            }
          }

          orden=int(random(4));

          switch(orden) {

          case 0:
            if (a[movx+1][movy]==1 || a[movx+1][movy]==3) {
              movx=movx+1;
              a[movx][movy]=5;
              continue;
            }
            break;
          case 1:

            if (a[movx][movy+1]==1 || a[movx][movy+1]==3) {
              movy=movy+1;
              a[movx][movy]=5;
              continue;
            } 

            break;
          case 2:

            if (a[movx-1][movy]==1 || a[movx-1][movy]==3) {
              movx=movx-1;
              a[movx][movy]=5;
              continue;
            } 

            break;
          case 3:

            if (a[movx][movy-1]==1 || a[movx][movy-1]==3) {
              movy=movy-1;
              a[movx][movy]=5;
              continue;
            }
            break;

          default:
            if (a[movx][movy-1]==1 || a[movx][movy-1]==3) {
              movy=movy-1;
              a[movx][movy]=5;
              continue;
            }
            break;
          }
        }
      } else if (dificultad==3) {

        while (fin==false) {
          contador=contador+1;
          System.out.println("posx "+movx);
          System.out.println("posy "+movy);

          if (contador==50) {
            fin=true;
            break;
          }

          if (movx==salidax && movy==saliday) {
            System.out.println("solucionado");
            fin=true;
            solucionado=true;
            iterativo=true;
            usada=Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
            OperatingSystemMXBean bean = (com.sun.management.OperatingSystemMXBean) ManagementFactory
              .getOperatingSystemMXBean();
            cpu=bean.getProcessCpuLoad();
            cpu2=bean.getSystemCpuLoad();
          } else {
            antex=movx;
            antey=movy;

            laberinto=(antex-movx)+(antey-movy);


            if (laberinto==0) {
              cont=cont+1;

              if (cont==50) {
                System.out.println("no tiene solucion");
                fin=true;
              }
            }
          }

          orden=int(random(4));

          switch(orden) {

          case 0:
            if (a[movx+1][movy]==1 || a[movx+1][movy]==3) {
              movx=movx+1;
              a[movx][movy]=5;
              continue;
            }
            break;
          case 1:

            if (a[movx][movy+1]==1 || a[movx][movy+1]==3) {
              movy=movy+1;
              a[movx][movy]=5;
              continue;
            } 

            break;
          case 2:

            if (a[movx-1][movy]==1 || a[movx-1][movy]==3) {
              movx=movx-1;
              a[movx][movy]=5;
              continue;
            } 

            break;
          case 3:

            if (a[movx][movy-1]==1 || a[movx][movy-1]==3) {
              movy=movy-1;
              a[movx][movy]=5;
              continue;
            }
            break;

          default:
            if (a[movx][movy-1]==1 || a[movx][movy-1]==3) {
              movy=movy-1;
              a[movx][movy]=5;
              continue;
            }
            break;
          }
        }
      }


      fin=false;
      cont=0;
      contador=0;
    }
    catch(Exception e) {
    }
  }

  //------------------- solucion recursiva ---------------------------------------------
  if (mouseX>1000 && mouseX<1100 && mouseY>140 && mouseY<240 && caso==3 && recursivo==false) {
    movx=posx;
    movy=posy;

    repeticion2=repeticion2+1;

    for (int i=0; i<=filas; i++) {
      for (int j=0; j<=columna; j++) {
        if (a[i][j]==5) {
          a[i][j]=1;
        }
      }
    }

    if (dificultad==2) {
      resolver(a, movx, movy, 0, 0, salidax, saliday, 0, fin, 0, 0);
    } else if (dificultad==1) {
      resolver2(a, movx, movy, 0, 0, salidax, saliday, 0, fin, 0, 0);
    } else if (dificultad==3) {
      resolver3(a, movx, movy, 0, 0, salidax, saliday, 0, fin, 0, 0);
    }
  }

  //boton para reinicio de matriz 
  if (mouseX>1000 && mouseX<1100 && mouseY>250 && mouseY<350 && caso==3 ) {

    for (int i=0; i<=filas; i++) {
      for (int j=0; j<=columna; j++) {
        a[i][j]=0;
      }
    }

    aux=false;
    solucionado=false;
    solucionado2=false;
    repeticion=0;
    repeticion2=0;
    recursivo=false;
    iterativo=false;
  }

  // boton para continuar al analisis  
  if (mouseX>30 && mouseX<130 && mouseY>30 && mouseY<130 && caso==3 && solucionado==true && solucionado2==true ) {
    caso=4;
  }


  // boton de inicio de la pantalla de inicio
  if (mouseX>250 && mouseX<950 && mouseY>450 && mouseY<550 && caso==0) {
    caso=1;
  }


  // botones para seleccionar dificultad del algoritmo
  if (mouseX>250 && mouseX<950 && mouseY>300 && mouseY<380 && caso==1 && auxiliar==true) {
    caso=2;
    dificultad=1;
  }
  if (mouseX>250 && mouseX<950 && mouseY>400 && mouseY<480 && caso==1 && auxiliar==true) {
    caso=2;
    dificultad=2;
  }
  if (mouseX>250 && mouseX<950 && mouseY>500 && mouseY<580 && caso==1 && auxiliar==true) {
    caso=2;
    dificultad=3;
  }


  // boton de continuar para ver la matriz
  if (mouseX>250 && mouseX<950 && mouseY>570 && mouseY<670 && caso==2) {
    caso=3;
    filas=filas-1;
    columna=columna-1;
  }

  // boton de el cambio de fila y columna
  if (mouseX>800 && mouseX<930 && mouseY>400 && mouseY<530 && caso==2 && filas<30) {
    filas=filas+1;
  }
  if (mouseX>250 && mouseX<380 && mouseY>400 && mouseY<530 && caso==2 && filas>1) {
    filas=filas-1;
  }

  if (mouseX>800 && mouseX<930 && mouseY>140 && mouseY<270 && caso==2 && columna<30) {
    columna=columna+1;
  }
  if (mouseX>250 && mouseX<380 && mouseY>140 && mouseY<270 && caso==2 && columna>1) {
    columna=columna-1;
  }


  // boton de continuar para pasar a ver las conclusiones
  if (mouseX>250 && mouseX<950 && mouseY>580 && mouseY<680 && caso==4) {
    caso=5;
  }

  //fin mouseClicked
}

//------------------ subrutina recursiva nivel de dificultad media--------------------------------
void resolver(int a[][], int movx, int movy, int contador, int cont, int salidax, int saliday, int laberinto, boolean fin, int antex, int antey) {

  try {

    if (fin==false) {

      contador=contador+1;

      System.out.println("\nposx "+movx);
      System.out.println("posy "+movy);

      if (contador==500) {
        fin=true;
      }

      if (movx==salidax && movy==saliday) {
        System.out.println("solucionado");
        solucionado2=true;
        recursivo=true;
        usada2=Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
        OperatingSystemMXBean bean = (com.sun.management.OperatingSystemMXBean) ManagementFactory
          .getOperatingSystemMXBean();
        cpu3=bean.getProcessCpuLoad();
        cpu4=bean.getSystemCpuLoad();
        fin=true;
      } else {
        antex=movx;
        antey=movy;

        laberinto=(antex-movx)+(antey-movy);


        if (laberinto==0) {
          cont=cont+1;

          if (cont==500) {
            System.out.println("no tiene solucion");
            fin=true;
          }
        }
      }

      orden=int(random(4));

      switch(orden) {

      case 0:
        if (a[movx+1][movy]==1 || a[movx+1][movy]==3) {
          a[movx+1][movy]=5;
          movx=movx+1;
          // resolver(a, movx+1, movy, contador, cont, salidax, saliday, laberinto, fin, antex, antey);
        }
        break;
      case 1:

        if (a[movx][movy+1]==1 || a[movx][movy+1]==3) {
          a[movx][movy+1]=5;
          movy=movy+1;
          //  resolver(a, movx, movy+1, contador, cont, salidax, saliday, laberinto, fin, antex, antey);
        } 

        break;
      case 2:

        if (a[movx-1][movy]==1 || a[movx-1][movy]==3) {
          a[movx-1][movy]=5;
          movx=movx-1;
          //   resolver(a, movx-1, movy, contador, cont, salidax, saliday, laberinto, fin, antex, antey);
        } 

        break;
      case 3:

        if (a[movx][movy-1]==1 || a[movx][movy-1]==3) {
          a[movx][movy-1]=5;
          movy=movy-1;
          //   resolver(a, movx, movy-1, contador, cont, salidax, saliday, laberinto, fin, antex, antey);
        }
        break;

      default:
        if (a[movx][movy-1]==1 || a[movx][movy-1]==3) {
          // resolver(a, movx, movy-1, contador, cont, salidax, saliday, laberinto, fin, antex, antey);
          a[movx][movy-1]=5;
          movy=movy-1;
        }
        break;
      }

      resolver(a, movx, movy, contador, cont, salidax, saliday, laberinto, fin, antex, antey);
    }
  }
  catch(Exception e) {
  }



  fin=false;
  cont=0;
  contador=0;
}



//------------------ subrutina recursiva dificultad facil--------------------------------
void resolver2(int a[][], int movx, int movy, int contador, int cont, int salidax, int saliday, int laberinto, boolean fin, int antex, int antey) {

  try {

    if (fin==false) {

      contador=contador+1;
      System.out.println("posx "+movx);
      System.out.println("posy "+movy);

      if (contador==50) {
        fin=true;
      }

      if (movx==salidax && movy==saliday) {
        System.out.println("solucionado");
        solucionado2=true;
        recursivo=true;
        usada2=Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
        OperatingSystemMXBean bean = (com.sun.management.OperatingSystemMXBean) ManagementFactory
          .getOperatingSystemMXBean();
        cpu3=bean.getProcessCpuLoad();
        cpu4=bean.getSystemCpuLoad();
        fin=true;
      } else {
        antex=movx;
        antey=movy;

        laberinto=(antex-movx)+(antey-movy);


        if (laberinto==0) {
          cont=cont+1;

          if (cont==1000) {
            System.out.println("no tiene solucion");
            fin=true;
          }
        }
      }

      orden=int(random(4));

      switch(orden) {

      case 0:
        if (a[movx+1][movy]==1 || a[movx+1][movy]==3) {
          a[movx+1][movy]=5;
          resolver2(a, movx+1, movy, contador, cont, salidax, saliday, laberinto, fin, antex, antey);
        }
        break;
      case 1:

        if (a[movx][movy+1]==1 || a[movx][movy+1]==3) {
          a[movx][movy+1]=5;
          resolver2(a, movx, movy+1, contador, cont, salidax, saliday, laberinto, fin, antex, antey);
        } 

        break;
      case 2:

        if (a[movx-1][movy]==1 || a[movx-1][movy]==3) {
          a[movx-1][movy]=5;
          resolver2(a, movx-1, movy, contador, cont, salidax, saliday, laberinto, fin, antex, antey);
        } 

        break;
      case 3:

        if (a[movx][movy-1]==1 || a[movx][movy-1]==3) {
          a[movx][movy-1]=5;
          resolver2(a, movx, movy-1, contador, cont, salidax, saliday, laberinto, fin, antex, antey);
        }
        break;

      default:
        if (a[movx][movy-1]==1 || a[movx][movy-1]==3) {
          resolver2(a, movx, movy-1, contador, cont, salidax, saliday, laberinto, fin, antex, antey);
          a[movx][movy]=5;
        }
        break;
      }
      resolver2(a, movx, movy, contador, cont, salidax, saliday, laberinto, fin, antex, antey);
    }
  }
  catch(Exception e) {
  }



  fin=false;
  cont=0;
  contador=0;
}


//------------------ subrutina recursiva nivel de dificultad dificil--------------------------------
void resolver3(int a[][], int movx, int movy, int contador, int cont, int salidax, int saliday, int laberinto, boolean fin, int antex, int antey) {

  try {

    if (fin==false) {

      contador=contador+1;

      System.out.println("\nposx "+movx);
      System.out.println("posy "+movy);

      if (contador==25) {
        fin=true;
      }

      if (movx==salidax && movy==saliday) {
        System.out.println("solucionado");
        solucionado2=true;
        recursivo=true;
        usada2=Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
        OperatingSystemMXBean bean = (com.sun.management.OperatingSystemMXBean) ManagementFactory
          .getOperatingSystemMXBean();
        cpu3=bean.getProcessCpuLoad();
        cpu4=bean.getSystemCpuLoad();
        fin=true;
      } else {
        antex=movx;
        antey=movy;

        laberinto=(antex-movx)+(antey-movy);


        if (laberinto==0) {
          cont=cont+1;

          if (cont==25) {
            System.out.println("no tiene solucion");
            fin=true;
          }
        }
      }

      orden=int(random(4));

      switch(orden) {

      case 0:
        if (a[movx+1][movy]==1 || a[movx+1][movy]==3) {
          a[movx+1][movy]=5;
          movx=movx+1;
          // resolver(a, movx+1, movy, contador, cont, salidax, saliday, laberinto, fin, antex, antey);
        }
        break;
      case 1:

        if (a[movx][movy+1]==1 || a[movx][movy+1]==3) {
          a[movx][movy+1]=5;
          movy=movy+1;
          //  resolver(a, movx, movy+1, contador, cont, salidax, saliday, laberinto, fin, antex, antey);
        } 

        break;
      case 2:

        if (a[movx-1][movy]==1 || a[movx-1][movy]==3) {
          a[movx-1][movy]=5;
          movx=movx-1;
          //   resolver(a, movx-1, movy, contador, cont, salidax, saliday, laberinto, fin, antex, antey);
        } 

        break;
      case 3:

        if (a[movx][movy-1]==1 || a[movx][movy-1]==3) {
          a[movx][movy-1]=5;
          movy=movy-1;
          //   resolver(a, movx, movy-1, contador, cont, salidax, saliday, laberinto, fin, antex, antey);
        }
        break;

      default:
        if (a[movx][movy-1]==1 || a[movx][movy-1]==3) {
          // resolver(a, movx, movy-1, contador, cont, salidax, saliday, laberinto, fin, antex, antey);
          a[movx][movy-1]=5;
          movy=movy-1;
        }
        break;
      }

      resolver3(a, movx, movy, contador, cont, salidax, saliday, laberinto, fin, antex, antey);
    }
  }
  catch(Exception e) {
  }



  fin=false;
  cont=0;
  contador=0;
}

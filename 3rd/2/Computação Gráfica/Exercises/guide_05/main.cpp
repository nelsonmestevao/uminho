#include <stdio.h>
#include <time.h>

#include <utility>

#ifdef __APPLE__
#include <GLUT/glut.h>
#else
#include <GL/glut.h>
#endif

#define _USE_MATH_DEFINES
#include <math.h>

float alfa = 0.0f, beta = 0.5f, radius = 100.0f;
float camX, camY, camZ;

void spherical2Cartesian() {
    camX = radius * cos(beta) * sin(alfa);
    camY = radius * sin(beta);
    camZ = radius * cos(beta) * cos(alfa);
}

void changeSize(int w, int h) {
    // Prevent a divide by zero, when window is too short
    // (you cant make a window with zero width).
    if (h == 0) h = 1;

    // compute window's aspect ratio
    float ratio = w * 1.0 / h;

    // Set the projection matrix as current
    glMatrixMode(GL_PROJECTION);
    // Load Identity Matrix
    glLoadIdentity();

    // Set the viewport to be the entire window
    glViewport(0, 0, w, h);

    // Set perspective
    gluPerspective(45.0f, ratio, 1.0f, 1000.0f);

    // return to the model view matrix mode
    glMatrixMode(GL_MODELVIEW);
}

std::pair<float, float> get_rand_pair_between_mod_50_and_100(void) {
    int x = rand() % 190;
    int z = rand() % 190;

    if (x > 95) {
        x = 0 - (x % 95);
    }

    if (z > 95) {
        z = 0 - (z % 95);
    }

    return std::make_pair(x, z);
}

void draw_tree(std::pair<float, float> p) {
    glPushMatrix();
    glTranslatef(p.first, 0, p.second);
    // os cones são desenhados no eixo do z ¯\_(ツ)_/¯
    glRotatef(-90, 1, 0, 0);
    glColor3f(0.3f, 0.2f, 0.0f);
    // raio da base, altura, slices, stacks
    glutSolidCone(1, 5, 50, 50);

    glTranslatef(0, 0, 3);
    glColor3f(0.6f, 1.0f, 0.1f);
    // raio da base, altura, slices, stacks
    glutSolidCone(3, 10, 50, 50);
    glPopMatrix();
}

void draw_blue_teapot(float angulo) {
    glPushMatrix();
    // blue
    glColor3f(0.0f, 0.0f, 1.0f);
    glRotatef(angulo, 0, 1, 0);
    glTranslatef(15, 1.6, 0);
    // dimensão
    glutSolidTeapot(2);
    glPopMatrix();
}

void draw_red_teapot(float angulo) {
    glPushMatrix();
    // red
    glColor3f(1.0f, 0.0f, 0.0f);
    glRotatef(angulo, 0, 1, 0);
    glTranslatef(35, 1.6, 0);
    // dimensão
    glutSolidTeapot(2);
    glPopMatrix();
}

void renderScene(void) {
    // clear buffers
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    // set the camera
    glLoadIdentity();
    gluLookAt(camX, camY, camZ, 0.0, 0.0, 0.0, 0.0f, 1.0f, 0.0f);

    glColor3f(0.2f, 0.8f, 0.2f);
    glBegin(GL_TRIANGLES);
    glVertex3f(100.0f, 0, -100.0f);
    glVertex3f(-100.0f, 0, -100.0f);
    glVertex3f(-100.0f, 0, 100.0f);

    glVertex3f(100.0f, 0, -100.0f);
    glVertex3f(-100.0f, 0, 100.0f);
    glVertex3f(100.0f, 0, 100.0f);
    glEnd();

    // TORUS
    glPushMatrix();
    glColor3f(0.7f, 0.1f, 0.5f);
    // grossura, raio, lados verticais, circulos horizontais
    glutSolidTorus(2, 5, 50, 50);
    glPopMatrix();

    // TEAPOT
    // o clock() dá o numero de ciclo de clock
    double now = clock() / 200000.0 / 60.0;

    float step = 360.0f / 8;
    for (int i = 0; i < 8; i++) {
        draw_blue_teapot(i * step - (now * 360));
    }

    step = 360.0f / 16;
    for (int i = 0; i < 16; i++) {
        draw_red_teapot(i * step + (now * 360));
    }

    // TREES less than 100 of them
    srand(2020);
    for (int i = 0; i < 100; i++) {
        std::pair<float, float> p = get_rand_pair_between_mod_50_and_100();

        if (p.first < 50 && p.first > -50 && p.second < 50 && p.second > -50) {
        } else {
            draw_tree(p);
        }
    }

    // End of frame
    glutSwapBuffers();
}

void processKeys(unsigned char c, int xx, int yy) {
    // put code to process regular keys in here
}

void processSpecialKeys(int key, int xx, int yy) {
    switch (key) {
        case GLUT_KEY_RIGHT:
            alfa -= 0.1;
            break;

        case GLUT_KEY_LEFT:
            alfa += 0.1;
            break;

        case GLUT_KEY_UP:
            beta += 0.1f;
            if (beta > 1.5f) beta = 1.5f;
            break;

        case GLUT_KEY_DOWN:
            beta -= 0.1f;
            if (beta < -1.5f) beta = -1.5f;
            break;

        case GLUT_KEY_PAGE_DOWN:
            radius -= 1.0f;
            if (radius < 1.0f) radius = 1.0f;
            break;

        case GLUT_KEY_PAGE_UP:
            radius += 1.0f;
            break;
    }
    spherical2Cartesian();
    glutPostRedisplay();
}

void printInfo() {
    printf("Vendor: %s\n", glGetString(GL_VENDOR));
    printf("Renderer: %s\n", glGetString(GL_RENDERER));
    printf("Version: %s\n", glGetString(GL_VERSION));

    printf("\nUse Arrows to move the camera up/down and left/right\n");
    printf("Home and End control the distance from the camera to the origin");
}

int main(int argc, char **argv) {
    // init GLUT and the window
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DEPTH | GLUT_DOUBLE | GLUT_RGBA);
    glutInitWindowPosition(100, 100);
    glutInitWindowSize(800, 800);
    glutCreateWindow("CG@DI-UM");

    // Required callback registry
    glutDisplayFunc(renderScene);
    glutReshapeFunc(changeSize);
    // para correr a cada segundo
    glutIdleFunc(renderScene);

    // Callback registration for keyboard processing
    glutKeyboardFunc(processKeys);
    glutSpecialFunc(processSpecialKeys);

    //  OpenGL settings
    glEnable(GL_DEPTH_TEST);
    // glEnable(GL_CULL_FACE);

    spherical2Cartesian();

    printInfo();

    // enter GLUT's main cycle
    glutMainLoop();

    return 1;
}

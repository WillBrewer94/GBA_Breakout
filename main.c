#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"

//State Prototypes
void start();
void initializeStart();
void game();
void initializeGame();
void pause();
void initializePause();
void win();
void initializeWin();
void lose();
void initializeLose();

//State Enums
enum { STARTSCREEN, GAMESCREEN, LOSESCREEN, WINSCREEN, PAUSESCREEN };

//Game Logic Prototypes
void update();
void initialize();
void draw();
void updatePaddle(PADDLE*);
void updateBall(BALL*);
void drawPaddle(PADDLE*);
void drawBall(BALL*);
void drawBrick(BRICK*);
void erasePaddle(PADDLE*);
void eraseBall(BALL*);
void eraseBrick(BRICK*);
int collisionCheckBallBrick(BALL*, BRICK*);
void collisionCheckBallPaddle(BALL*, PADDLE*);

//Buttons
extern int buttons;
extern int oldButtons;

//Paddle
PADDLE paddle;

//Ball
BALL ball;

//Bricks
BRICK bricks[40];
int brickCount;

//Game Variables
int time;
int isOver = 0;
int score = 0;
int state;
int seed;
int isCollision = 0;

int main() {
	initializeStart();

	while(1) {
		oldButtons = buttons;
		buttons = BUTTONS;

		//States
        switch(state) {
        	case STARTSCREEN:
        		start();
        		break;
        	case GAMESCREEN:
        		game();
        		break;
        	case WINSCREEN:
        		win();
        		break;
        	case LOSESCREEN:
        		lose();
        		break;
        	case PAUSESCREEN:
        		pause();
        		break;
        }
	}
}

void initializeGame() {
	score = 0;

	char buffer[41];
	fillScreen(BLACK);
	sprintf(buffer, "Score: %d", score);
	drawString(SCREEN_HEIGHT - 10, 0, buffer, BLACK);
	sprintf(buffer, "Score: %d", score);
	drawString(SCREEN_HEIGHT - 10, 0, buffer, WHITE);

	paddle.oldRow = 0;
	paddle.oldCol = 0;
	paddle.width = 20;
	paddle.height = 5;
	paddle.row = SCREEN_HEIGHT - paddle.height - 10;
	paddle.col = SCREEN_WIDTH/2 - paddle.width/2;
	paddle.color = WHITE;

	ball.row = 80;
	ball.col = 100;
	ball.oldRow = 0;
	ball.oldCol = 0;
	ball.width = 2;
	ball.height = 2;
	ball.rd = 1;
	ball.cd = 1 * rand() % 3;
	ball.color = WHITE;

	BRICK brick;
	brick.height = 5;
	brick.width = 15;
	brick.active = 1;
	brick.color = RED;
	brickCount = 0;

	for(int r = 0; r < 4; r++) {
		for(int c = 0; c < 10; c++) {
			brick.row = 8 + brick.height * r + r * 8;
			brick.col = 8 + brick.width * c + c * 8;
			bricks[brickCount++] = brick;
			drawBrick(&brick);
		}

		if(brickCount >= 30) {
			brick.color = BLUE;
		} else if(brickCount >= 20) {
			brick.color = GREEN;
		} else if(brickCount >= 10) {
			brick.color = YELLOW;
		}
	}

	state = GAMESCREEN;
}

void game() {
	char buffer[41];

	if(!isOver) {
		update();
		waitForVBlank();
		draw();
	}
	
	//TODO: Change to call initializeWin or initializeLoose depending on game state
	if(score == 40) {
		initializeWin();
	} else if(isOver) {
		initializeWin();
	}

	if(BUTTON_PRESSED(BUTTON_START)) {
		initializePause();
	}

	if(isCollision) {
		isCollision = 0;
		sprintf(buffer, "Score: %d", score);
		drawString(SCREEN_HEIGHT - 10, 0, buffer, BLACK);
		score++;
		sprintf(buffer, "Score: %d", score);
		drawString(SCREEN_HEIGHT - 10, 0, buffer, WHITE);
	}
}

void initializeStart() {
	//Switches state to start screen
	//Sets up mode 3, sets start screen color
	REG_DISPCTL = MODE3 | BG2_ENABLE;
	fillScreen(BLACK);
	//Display start text
	drawString(SCREEN_HEIGHT/2 - 20, SCREEN_WIDTH/2 - 60, "Welcome to Breakout", WHITE);
	drawString(SCREEN_HEIGHT/2, SCREEN_WIDTH/2 - 60, "Press Enter to Start", WHITE);
	state = STARTSCREEN;
}

void start() {
	//Pressing enter starts game, calls initializeGame()
	if(!BUTTON_PRESSED(BUTTON_START)) {
		seed++;
	}

	if(BUTTON_PRESSED(BUTTON_START)) {
		initializeGame();
		srand(seed);
	}
}

void initializeLose() {
	//Switches game state to LOOSE
	state = LOSESCREEN;
	//Changes background
	fillScreen(RED);
	//Displays score
	drawString(SCREEN_HEIGHT/2 - 20, SCREEN_WIDTH/2 - 35, "You Suck.", BLACK);
	drawString(SCREEN_HEIGHT/2, SCREEN_WIDTH/2 - 90, " Press [ENTER] to Try Again.", BLACK);
}

void lose() {
	//When enter is pressed, calls initializeStart()
	if(BUTTON_PRESSED(BUTTON_START)) {
		initializeStart();
	}
}

void initializeWin() {
	//Switches game state to WIN
	state = WINSCREEN;
	//Changes background color
	fillScreen(GREEN);
	//Displays score
	drawString(SCREEN_HEIGHT/2 - 40, SCREEN_WIDTH/2 - 60, "Just So You Know...", WHITE);
	drawString(SCREEN_HEIGHT/2 - 20, SCREEN_WIDTH/2 - 80, "You Just Murdered 40 Blocks.", WHITE);
	drawString(SCREEN_HEIGHT/2, SCREEN_WIDTH/2 - 80, "Congratulations, You Monster.", WHITE);
	drawString(SCREEN_HEIGHT/2 + 20, SCREEN_WIDTH/2 - 110, "Press [ENTER] if You Want to Commit", WHITE);
	drawString(SCREEN_HEIGHT/2 + 40, SCREEN_WIDTH/2 - 50, "Genocide Again.", WHITE);
}

void win() {
	//Pressing enter starts game, calls initializeGame()
	if(BUTTON_PRESSED(BUTTON_START)) {
		initializeStart();
	}
}

void initializePause() {
	//Colors screen black
	fillScreen(BLACK);
	//Displays "PAUSE" in white
	drawString(SCREEN_HEIGHT/2 - 20, SCREEN_WIDTH/2 - 75, "This is the Pause Screen.", WHITE);
	drawString(SCREEN_HEIGHT/2, SCREEN_WIDTH/2 - 60, "Not Much Else Here.", WHITE);
	drawString(SCREEN_HEIGHT/2 + 20, SCREEN_WIDTH/2 - 110, "Press [ENTER] to Resume or Whatever.", WHITE);
	//Switches game state to PAUSE
	state = PAUSESCREEN;
}	

void pause() {
	//On enter press, sets game state to GAME
	//Doesn't call initializeGame, as it would reset the game
	if(BUTTON_PRESSED(BUTTON_START)) {
		state = GAMESCREEN;
		fillScreen(BLACK);
	}
}

void update() {
	int score = 0;
	updatePaddle(&paddle);
	updateBall(&ball);
	collisionCheckBallPaddle(&ball, &paddle);

	//Cycle through active bricks to check for collision
	for(int i = 0; i < brickCount; i++) {
		BRICK * b = &bricks[i];
		if(b->active) {
			if(collisionCheckBallBrick(&ball, b)) {
				eraseBrick(b);
				isCollision = 1;
				i = brickCount;
			}
		}
	}

	//Checks if the game is over (no more bricks left)
	if(score == 40) {
		isOver = 1;
	}
}

void updatePaddle(PADDLE* p) {
	//Update oldRow and oldCol
	p->oldRow = p->row;
	p->oldCol = p->col;

	//Check for wall collisions and move paddle
	if(BUTTON_HELD(BUTTON_LEFT) && p->col > 0) {
		p->col -= 2;
	}

	if(BUTTON_HELD(BUTTON_RIGHT) && p->col < SCREEN_WIDTH - (p->width)) {
		p->col += 2;
	}
}

void updateBall(BALL* b) {
	//Update oldRow and oldCol
	b->oldRow = b->row;
	b->oldCol = b->col;

	//Check for wall collision
	if(b->col < 0 || b->col > SCREEN_WIDTH - (b->width)) {
		b->cd = -(b->cd);
	}

	//Check for ceiling/floor collision
	if(b->row < 0) {
		b->rd = -(b->rd);
	}

	if(b->row > SCREEN_HEIGHT - (b->height)) {
		initializeLose();
	}

	//Move ball
	b->row += b->rd;
	b->col += b->cd;
}

void draw() {
	erasePaddle(&paddle);
	eraseBall(&ball);
	drawPaddle(&paddle);
	drawBall(&ball);

	for(int i = 0; i < brickCount; i++) {
		BRICK* b = &bricks[i];

		if(b->active) {
			drawBrick(b);
		}
	}
}

void erasePaddle(PADDLE* p) {
	drawRect(p->oldRow, p->oldCol, p->height, p->width, BLACK);
}

void drawPaddle(PADDLE* p) {
	drawRect(p->row, p->col, p->height, p->width, p->color);
}

void eraseBall(BALL* b) {
	drawRect(b->oldRow, b->oldCol, b->height, b->width, BLACK);
}

void drawBall(BALL* b) {
	drawRect(b->row, b->col, b->height, b->width, b->color);
}

void eraseBrick(BRICK* b) {
	drawRect(b->row, b->col, b->height, b->width, BLACK);
	b->active = 0;
}

void drawBrick(BRICK* b) {
	drawRect(b->row, b->col, b->height, b->width, b->color);
}

void collisionCheckBallPaddle(BALL* b, PADDLE* p) {
	if(b->row + (b->height) > p->row && b->col > p-> col && 
	   b->col + (b->width) < p->col + (p->width)) {
	   	b->rd = -(b->rd);
	}
}

int collisionCheckBallBrick(BALL* b, BRICK* br) {
	//Bottom collision
	if(b->row == br->row + (br->height) && b->col >= br->col && b->col + (b->width) <= br->col + (br->width)) {
		b->rd = -(b->rd);
		return 1;
	}

	//Top collision
	if(b->row + b->height == br->row && b->col >= br->col && b->col + (b->width) <= br->col + (br->width)) {
		b->rd = -(b->rd);
		return 1;
	}

	//Left collision
	if(b->col + (b->width) == br->col && b->row + (b->height) >= br->row && b->row <= br->row + (br->height)) {
		b->cd = -(b->cd);
		return 1;
	}

	//Right collision
	if(b->col == br->col + (br->height) && b->row + (br->height) >= br->row && b->row <= br->row) {
		b->cd = -(b->cd);
		return 1;
	}

	//No collision detected
	return 0;
}
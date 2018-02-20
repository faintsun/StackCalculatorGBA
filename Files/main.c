#include "myLib.h"
#include "text.h"
#include "main.h"
#include <stdio.h>
#include <math.h>

int main() {

	REG_DISPCTL = MODE4 | BG2_ENABLE | BUFFER1FLAG;

	init();

	start();
	flipPage();
	start();
	flipPage();

	while(1) {

		// reset buttons
		oldButtons = buttons;
        buttons = BUTTONS;
        
        // if key pressed, update screen
        update();
        waitForVBlank();

	}
}

void init() {

	// init color indexes
	PALETTE[0] = BLACK;
	PALETTE[1] = WHITE;
	PALETTE[2] = GREEN;
	PALETTE[3] = RED;
	PALETTE[4] = YELLOW;

	// initialize starting vars
	state = BINARY;
	operation = ADD;
	BG_COLOR = 0;
	cursor = 0;
	cursorNumber = 0;

	// fill screen with bg color
	fillScreen(BG_COLOR);

	// init stack with 0s
	for (int i = 0; i < STACKSIZE; i++) {
		stack[i] = 0;
		char str[ 16 ];
		sprintf(str, "%s%d", "", stack[i]);
	}
}

void drawInstructions() {
	
	// instructions
	drawString(10, 10, "this is a bit calculator, wow!!", 4);
	drawString(25, 10, "A: change operation, B: operate", 2);
	drawString(40, 10, "START: move up, SELECT: move down", 2);
	drawString(55, 10, "L: swap, R: change base", 2);

}

void drawBases() {

	// bases
	drawString(75, 15, "Binary", 1);
	drawString(75, 62, "Octal", 1);
	drawString(75, 104, "Decimal", 1);
	drawString(75, 160, "Hexadecimal", 1);
}

// black out stuff
void drawRects() {

	drawRect4(80, 100, 45, 120, BG_COLOR);
	drawRect4(5, 70, 15, 230, BG_COLOR);
}


// for the stuff we gotta draw initially 
void start() {

	drawString(75, 8, "*", 2);
	drawString(130, 85, "+", 2);

	drawCursor(3);

	drawNumbers(1);

	drawBases();
	drawInstructions();


}

void update() {

	drawInstructions();

	// switch stack[0] and stack[1]
	if (BUTTON_PRESSED(BUTTON_L)) {
		drawRects();

		drawBases();
		updateBasePointer();
		updateOperationSign();	
		drawCursor(3);

		flip();
		drawNumbers(1);

		flipPage();
	}

	// switch to next base
	if (BUTTON_PRESSED(BUTTON_R)) {
		drawRects();

		drawBases();
		nextBase();
		updateBasePointer();
		updateOperationSign();	

		checkCursorBounds();
		drawCursor(3);
		flipPage();
	}

	// change operation sign
	if (BUTTON_PRESSED(BUTTON_A)) {
		drawRects();

		drawBases();
		updateBasePointer();
		drawCursor(3);
		drawNumbers(1);

		nextOperation();
		updateOperationSign();	
		flipPage();
	}

	// do operation
	if (BUTTON_PRESSED(BUTTON_B)) {
		drawRects();

		drawBases();
		updateBasePointer();
		updateOperationSign();	

		doOperation();
		drawNumbers(1);
		drawCursor(3);
		flipPage();
	}

	// move cursor left
	if (BUTTON_PRESSED(BUTTON_LEFT)) {
		drawRects();

		drawBases();
		updateBasePointer();
		updateOperationSign();	

		drawNumbers(1);
		moveCursorLeft();
		drawCursor(3);
		flipPage();
	}	

	// move cursor right
	if (BUTTON_PRESSED(BUTTON_RIGHT)) {
		drawRects();

		drawBases();
		updateBasePointer();
		updateOperationSign();	

		drawNumbers(1);
		moveCursorRight();
		drawCursor(3);
		flipPage();
	}

	// increment 
	if (BUTTON_PRESSED(BUTTON_UP)) {
		drawRects();

		drawBases();
		updateBasePointer();
		updateOperationSign();	
		drawCursor(3);

		incrementNumber();
		flipPage();
	}

	// decrement
	if (BUTTON_PRESSED(BUTTON_DOWN)) {
		drawRects();

		drawBases();
		updateBasePointer();
		updateOperationSign();	
		drawCursor(3);

		decrementNumber();
		flipPage();
	}

	// shift up
	if (BUTTON_PRESSED(BUTTON_START)) {
		drawRects();

		drawBases();
		updateBasePointer();
		updateOperationSign();			
		drawCursor(3);

		shiftUp();
		flipPage();
	}

	// shift down
	if (BUTTON_PRESSED(BUTTON_SELECT)) {
		drawRects();

		drawBases();
		updateBasePointer();
		updateOperationSign();			
		drawCursor(3);

		flipPage();
	}
}

// switches to next state in line and redraws numbers
void nextBase() {

	switch(state) {
		case BINARY:
			state = OCTAL;
			break;
		case OCTAL:
			state = DECIMAL;
			break;
		case DECIMAL:
			state = HEXADECIMAL;
			break;
		case HEXADECIMAL:
			state = BINARY;
			break;
	}

	drawNumbers(1);
}

// switches to next operation in line
void nextOperation() {

	switch(operation) {
		case ADD:
			operation = SUBTRACT;
			break;
		case SUBTRACT:
			operation = MULTIPLY;
			break;
		case MULTIPLY:
			operation = INTDIVISION;
			break;
		case INTDIVISION:
			operation = BOOLAND;
			break;
		case BOOLAND:
			operation = BOOLOR;
			break;
		case BOOLOR:
			operation = BOOLNOT;
			break;
		case BOOLNOT:
			operation = BITAND;
			break;
		case BITAND:
			operation = BITOR;
			break;
		case BITOR:
			operation = BITXOR;
			break;
		case BITXOR:
			operation = COMPLEMENT;
			break;
		case COMPLEMENT:
			operation = BITLEFT;
			break;
		case BITLEFT:
			operation = BITRIGHT;
			break;
		case BITRIGHT:
			operation = ADD;
			break;

	}
}

// draws the * next to correct base
void updateBasePointer() {

	switch(state) {
		case BINARY:
			drawString(75, 8, "*", 2);
			break;
		case OCTAL:
			drawString(75, 55, "*", 2);
			break;
		case DECIMAL:
			drawString(75, 97, "*", 2);
			break;
		case HEXADECIMAL:
			drawString(75, 153, "*", 2);
			break;
	}
}

// draws the correct operating sign
void updateOperationSign() {

	int col = 85;
	int row = 130;

	switch(operation) {
		case ADD:
			drawString(row, col, "+", 2);
			break;
		case SUBTRACT:
			drawString(row, col, "-", 2);
			break;
		case MULTIPLY:
			drawString(row, col, "*", 2);
			break;
		case INTDIVISION:
			drawString(row, col, "/", 2);
			break;
		case BOOLAND:
			drawString(row, col, "&&", 2);			
			break;
		case BOOLOR:
			drawString(row, col, "||", 2);			
			break;
		case BOOLNOT:
			drawString(row, col, "!", 2);				
			break;
		case BITAND:
			drawString(row, col, "&", 2);				
			break;
		case BITOR:
			drawString(row, col, "|", 2);				
			break;
		case BITXOR:
			drawString(row, col, "``", 2);				
			break;
		case COMPLEMENT:
			drawString(row, col, "^", 2);				
			break;
		case BITLEFT:
			drawString(row, col, "<<", 2);				
			break;
		case BITRIGHT:
			drawString(row, col, ">>", 2);				
			break;
	}
}

// does whatever operation currently on and shifts numbers accordingly
void doOperation() {

	switch(operation) {
		case ADD:
			stack[0] = stack[0] + stack[1];
			shiftDownNotZero();
			drawNumbers(1);
			break;
		case SUBTRACT:
			stack[0] = stack[1] - stack[0];
			shiftDownNotZero();
			drawNumbers(1);
			break;
		case MULTIPLY:
			stack[0] = stack[0] * stack[1];
			shiftDownNotZero();
			drawNumbers(1);
			break;
		case INTDIVISION:
			stack[0] = stack[1] / stack[0];
			shiftDownNotZero();
			drawNumbers(1);
			break;
		case BOOLAND:
			stack[0] = stack[0] && stack[1];
			shiftDownNotZero();	
			drawNumbers(1);
			break;
		case BOOLOR:
			stack[0] = stack[0] || stack[1];
			shiftDownNotZero();
			drawNumbers(1);
			break;
		case BOOLNOT:
			stack[0] = !stack[0];
			drawLine(0, 1);	
			break;
		case BITAND:
			stack[0] = stack[0] & stack[1];	
			shiftDownNotZero();
			drawNumbers(1);
			break;
		case BITOR:
			stack[0] = stack[0] | stack[1];	
			shiftDownNotZero();
			drawNumbers(1);
			break;
		case BITXOR:
			stack[0] = ~stack[0];	
			drawLine(0, 1);
			break;
		case COMPLEMENT:
			stack[0] = stack[0] ^ stack[1];	
			shiftDownNotZero();
			drawNumbers(1);
			break;
		case BITLEFT:
			stack[0] = stack[0] << 1;
			drawLine(0, 1);	
			break;
		case BITRIGHT:
			stack[0] = stack[0] >> 1;
			drawLine(0, 1);
			break;	
	}

}

// draws the stack in color c
void drawNumbers(char c) {

	char str[16];

	for (int i = 0; i < STACKSIZE; i++) {

		switch(state) {
			case BINARY:
				short2bin(str, stack[i]);
				drawString(130 - 10*i, 100, str, c);
				break;
			case OCTAL:
				sprintf(str, "%016o", stack[i]);
				drawString(130 - 10*i, 100, str, c);
				break;
			case DECIMAL:
				sprintf(str, "%016u", stack[i]);
				drawString(130 - 10*i, 100, str, c);
				break;
			case HEXADECIMAL:
				sprintf(str, "%016x", stack[i]);
				drawString(130 - 10*i, 100, str, c);
				break;
		}
	}
}

// draws specific line i from stack in color c
void drawLine(int i, char c) {

	char str[16];

	switch(state) {
		case BINARY:
			short2bin(str, stack[i]);
			drawString(130 - 10*i, 100, str, c);
			break;
		case OCTAL:
			sprintf(str, "%06o", stack[i]);
			drawString(130 - 10*i, 100 + 6 * 10, str, c);
			break;
		case DECIMAL:
			sprintf(str, "%05u", stack[i]);
			drawString(130 - 10*i, 100 + 6 * 11, str, c);
			break;
		case HEXADECIMAL:
			sprintf(str, "%04x", stack[i]);
			drawString(130 - 10*i, 100 + 6 * 12, str, c);
			break;
	}
}

// draws the cursor on current place
void drawCursor(char c) {
	drawRect4(101 + ( 15 - cursor ) * 6, 140, 2, 6, c);
}

// shifts cursor to right
void moveCursorRight() {
	if (cursor > 0) {
		cursor--;
	}
}

// shifts cursor to left
void moveCursorLeft() {
	cursor++;
	checkCursorBounds();
}

// checks to make sure cursor in bounds
// if out of bounds, restrict to highest possible value
void checkCursorBounds() {

	switch(state) {
		case BINARY:
			if (cursor > 15) {
				cursor = 15;
			}
			break;
		case OCTAL:
			if (cursor > 5) {
				cursor = 5;
			}
			break;
		case DECIMAL:
			if (cursor > 4) {
				cursor = 4;
			}
			break;
		case HEXADECIMAL:
			if (cursor > 3) {
				cursor = 3;
			}
		}
}

// multiply and add number accordingly so cursor place goes up
void incrementNumber() {


	switch(state) {
		case BINARY:
			stack[0] = stack[0] + ( pow(2, cursor) );
			break;
		case OCTAL:
			stack[0] = stack[0] + ( pow(8, cursor) );
			break;
		case DECIMAL:
			stack[0] = stack[0] + ( pow(10, cursor) );
			break;
		case HEXADECIMAL:
			stack[0] = stack[0] + ( pow(16, cursor) );
			break;
	}

	drawNumbers(1);
}

// multiply and subtract number accordingly so cursor place goes down
void decrementNumber() {

	if (stack[0] <= 0) {
		stack[0] = 0;
	} else {

		switch(state) {
			case BINARY:
				stack[0] = stack[0] - ( pow(2, cursor) );
				break;
			case OCTAL:
				stack[0] = stack[0] - ( pow(8, cursor) );
				break;
			case DECIMAL:
				stack[0] = stack[0] - ( pow(10, cursor) );
				break;
			case HEXADECIMAL:
				stack[0] = stack[0] - ( pow(16, cursor) );
				break;
		}
	}

	drawNumbers(1);
}

// shifts the stack up so strack[4] is lost
void shiftUp() {

	stack[3] = stack[2];
	stack[2] = stack[1];
	stack[1] = stack[0];
	stack[0] = 0;

	drawNumbers(1);

}

// shifts the stack down so stack[0] is lost
void shiftDown() {

	stack[0] = stack[1];
	stack[1] = stack[2];
	stack[2] = stack[3];
	stack[3] = 0;

	drawNumbers(1);

}

// shifts everything by stack[0] down
// used in operations
void shiftDownNotZero() {

	stack[1] = stack[2];
	stack[2] = stack[3];
	stack[3] = 0;

	drawNumbers(1);
}

// flips stack[0] and stack[1]
void flip() {

	unsigned short temp = stack[0];
	stack[0] = stack[1];
	stack[1] = temp;
}

// converts short to binary
void short2bin(char* p, short n) {

    int i;
    for(i = 0; i < 16; i++) {

        if(n%2) {
            p[15 - i] = '1';
        }
        else {
            p[15 - i] = '0';
        }
        n = ( n >> 1 );
    }
    p[16] = 0;
}




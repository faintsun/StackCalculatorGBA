#define STACKSIZE 4

// prototypes
void init();

void drawInstructions();
void drawBases();
void drawRects();

void start();
void update();

void nextBase();
void nextOperation();

void updateBasePointer();
void updateOperationSign();

void doOperation();

void drawNumbers(char c);
void drawLine(int line, char c);
void drawCursor(char c);

void moveCursorRight();
void moveCursorLeft();
void checkCursorBounds();

void incrementNumber();
void decrementNumber();

void shiftUp();
void shiftDown();
void shiftDownNotZero();
void flip();

void short2bin(char* p, short n);

// states
enum { BINARY, OCTAL, DECIMAL, HEXADECIMAL };
enum { ADD, SUBTRACT, MULTIPLY, INTDIVISION, BOOLAND, BOOLOR, BOOLNOT, BITAND, BITOR, BITXOR, COMPLEMENT, BITLEFT, BITRIGHT };

// vars for enums above, respectively ^
int state;
int operation;

// cursor
int cursor;
int cursorNumber;

// bg index
char BG_COLOR;

// stack
unsigned short stack[STACKSIZE];

// button vars
unsigned int buttons;
unsigned int oldButtons;
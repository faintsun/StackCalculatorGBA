	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.type	drawCursor.clone.0, %function
drawCursor.clone.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	r3, .L2
	sub	sp, sp, #12
	ldr	r0, [r3, #0]
	sub	r0, r0, r0, asl #2
	mov	r3, #3
	mov	r0, r0, asl #1
	str	r3, [sp, #0]
	mov	r1, #140
	add	r0, r0, #191
	mov	r2, #2
	mov	r3, #6
	ldr	ip, .L2+4
	mov	lr, pc
	bx	ip
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L3:
	.align	2
.L2:
	.word	cursor
	.word	drawRect4
	.size	drawCursor.clone.0, .-drawCursor.clone.0
	.align	2
	.global	init
	.type	init, %function
init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	mov	r2, #83886080
	mvn	ip, #32768
	sub	sp, sp, #20
	strh	ip, [r2, #2]	@ movhi
	mov	ip, #992	@ movhi
	strh	ip, [r2, #4]	@ movhi
	mov	ip, #31	@ movhi
	mov	r3, #0
	strh	ip, [r2, #6]	@ movhi
	mvn	ip, #64512
	strh	r3, [r2, #0]	@ movhi
	strh	ip, [r2, #8]	@ movhi
	ldr	r2, .L8
	str	r3, [r2, #0]
	ldr	r2, .L8+4
	str	r3, [r2, #0]
	ldr	r2, .L8+8
	strb	r3, [r2, #0]
	ldr	r2, .L8+12
	str	r3, [r2, #0]
	ldr	r2, .L8+16
	mov	r0, r3
	str	r3, [r2, #0]
	ldr	r3, .L8+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L8+24
	ldr	r7, .L8+28
	add	r6, r4, #8
	mov	r5, sp
.L5:
	mov	r3, #0	@ movhi
	strh	r3, [r4, #2]!	@ movhi
	mov	r0, sp
	ldr	r1, .L8+32
	ldr	r2, .L8+36
	mov	r3, #0
	mov	lr, pc
	bx	r7
	cmp	r4, r6
	bne	.L5
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	state
	.word	operation
	.word	BG_COLOR
	.word	cursor
	.word	cursorNumber
	.word	fillScreen
	.word	stack-2
	.word	sprintf
	.word	.LC0
	.word	.LC1
	.size	init, .-init
	.align	2
	.global	drawInstructions
	.type	drawInstructions, %function
drawInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #10
	stmfd	sp!, {r4, lr}
	mov	r1, r0
	ldr	r4, .L11
	ldr	r2, .L11+4
	mov	r3, #4
	mov	lr, pc
	bx	r4
	mov	r0, #25
	mov	r1, #10
	ldr	r2, .L11+8
	mov	r3, #2
	mov	lr, pc
	bx	r4
	mov	r0, #40
	mov	r1, #10
	ldr	r2, .L11+12
	mov	r3, #2
	mov	lr, pc
	bx	r4
	mov	r0, #55
	mov	r1, #10
	ldr	r2, .L11+16
	mov	r3, #2
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	drawString
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.size	drawInstructions, .-drawInstructions
	.align	2
	.global	drawBases
	.type	drawBases, %function
drawBases:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r0, #75
	ldr	r4, .L14
	mov	r1, #15
	ldr	r2, .L14+4
	mov	r3, #1
	mov	lr, pc
	bx	r4
	mov	r0, #75
	mov	r1, #62
	ldr	r2, .L14+8
	mov	r3, #1
	mov	lr, pc
	bx	r4
	mov	r0, #75
	mov	r1, #104
	ldr	r2, .L14+12
	mov	r3, #1
	mov	lr, pc
	bx	r4
	mov	r0, #75
	mov	r1, #160
	ldr	r2, .L14+16
	mov	r3, #1
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	drawString
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.size	drawBases, .-drawBases
	.align	2
	.global	drawRects
	.type	drawRects, %function
drawRects:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r5, .L17
	sub	sp, sp, #12
	ldrb	ip, [r5, #0]	@ zero_extendqisi2
	mov	r0, #80
	mov	r1, #100
	mov	r2, #45
	mov	r3, #120
	ldr	r4, .L17+4
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r4
	ldrb	ip, [r5, #0]	@ zero_extendqisi2
	mov	r0, #5
	mov	r1, #70
	mov	r2, #15
	mov	r3, #230
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	BG_COLOR
	.word	drawRect4
	.size	drawRects, .-drawRects
	.align	2
	.global	nextOperation
	.type	nextOperation, %function
nextOperation:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L35
	ldr	r3, [r2, #0]
	cmp	r3, #12
	ldrls	pc, [pc, r3, asl #2]
	b	.L19
.L34:
	.word	.L21
	.word	.L22
	.word	.L23
	.word	.L24
	.word	.L25
	.word	.L26
	.word	.L27
	.word	.L28
	.word	.L29
	.word	.L30
	.word	.L31
	.word	.L32
	.word	.L33
.L33:
	mov	r3, #0
	str	r3, [r2, #0]
.L19:
	bx	lr
.L21:
	mov	r3, #1
	str	r3, [r2, #0]
	bx	lr
.L22:
	mov	r3, #2
	str	r3, [r2, #0]
	bx	lr
.L23:
	mov	r3, #3
	str	r3, [r2, #0]
	bx	lr
.L24:
	mov	r3, #4
	str	r3, [r2, #0]
	bx	lr
.L25:
	mov	r3, #5
	str	r3, [r2, #0]
	bx	lr
.L26:
	mov	r3, #6
	str	r3, [r2, #0]
	bx	lr
.L27:
	mov	r3, #7
	str	r3, [r2, #0]
	bx	lr
.L28:
	mov	r3, #8
	str	r3, [r2, #0]
	bx	lr
.L29:
	mov	r3, #9
	str	r3, [r2, #0]
	bx	lr
.L30:
	mov	r3, #10
	str	r3, [r2, #0]
	bx	lr
.L31:
	mov	r3, #11
	str	r3, [r2, #0]
	bx	lr
.L32:
	mov	r3, #12
	str	r3, [r2, #0]
	bx	lr
.L36:
	.align	2
.L35:
	.word	operation
	.size	nextOperation, .-nextOperation
	.align	2
	.global	updateBasePointer
	.type	updateBasePointer, %function
updateBasePointer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L44
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L37
.L43:
	.word	.L39
	.word	.L40
	.word	.L41
	.word	.L42
.L42:
	mov	r0, #75
	mov	r1, #153
	ldr	r2, .L44+4
	mov	r3, #2
	ldr	ip, .L44+8
	mov	lr, pc
	bx	ip
.L37:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L41:
	mov	r0, #75
	mov	r1, #97
	ldr	r2, .L44+4
	mov	r3, #2
	ldr	ip, .L44+8
	mov	lr, pc
	bx	ip
	b	.L37
.L40:
	mov	r0, #75
	mov	r1, #55
	ldr	r2, .L44+4
	mov	r3, #2
	ldr	ip, .L44+8
	mov	lr, pc
	bx	ip
	b	.L37
.L39:
	mov	r0, #75
	mov	r1, #8
	ldr	r2, .L44+4
	mov	r3, #2
	ldr	ip, .L44+8
	mov	lr, pc
	bx	ip
	b	.L37
.L45:
	.align	2
.L44:
	.word	state
	.word	.LC10
	.word	drawString
	.size	updateBasePointer, .-updateBasePointer
	.align	2
	.global	updateOperationSign
	.type	updateOperationSign, %function
updateOperationSign:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L62
	ldr	r3, [r3, #0]
	cmp	r3, #12
	ldrls	pc, [pc, r3, asl #2]
	b	.L46
.L61:
	.word	.L48
	.word	.L49
	.word	.L50
	.word	.L51
	.word	.L52
	.word	.L53
	.word	.L54
	.word	.L55
	.word	.L56
	.word	.L57
	.word	.L58
	.word	.L59
	.word	.L60
.L60:
	mov	r0, #130
	mov	r1, #85
	ldr	r2, .L62+4
	mov	r3, #2
	ldr	ip, .L62+8
	mov	lr, pc
	bx	ip
.L46:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L48:
	mov	r0, #130
	mov	r1, #85
	ldr	r2, .L62+12
	mov	r3, #2
	ldr	ip, .L62+8
	mov	lr, pc
	bx	ip
	b	.L46
.L49:
	mov	r0, #130
	mov	r1, #85
	ldr	r2, .L62+16
	mov	r3, #2
	ldr	ip, .L62+8
	mov	lr, pc
	bx	ip
	b	.L46
.L50:
	mov	r0, #130
	mov	r1, #85
	ldr	r2, .L62+20
	mov	r3, #2
	ldr	ip, .L62+8
	mov	lr, pc
	bx	ip
	b	.L46
.L51:
	mov	r0, #130
	mov	r1, #85
	ldr	r2, .L62+24
	mov	r3, #2
	ldr	ip, .L62+8
	mov	lr, pc
	bx	ip
	b	.L46
.L52:
	mov	r0, #130
	mov	r1, #85
	ldr	r2, .L62+28
	mov	r3, #2
	ldr	ip, .L62+8
	mov	lr, pc
	bx	ip
	b	.L46
.L53:
	mov	r0, #130
	mov	r1, #85
	ldr	r2, .L62+32
	mov	r3, #2
	ldr	ip, .L62+8
	mov	lr, pc
	bx	ip
	b	.L46
.L54:
	mov	r0, #130
	mov	r1, #85
	ldr	r2, .L62+36
	mov	r3, #2
	ldr	ip, .L62+8
	mov	lr, pc
	bx	ip
	b	.L46
.L55:
	mov	r0, #130
	mov	r1, #85
	ldr	r2, .L62+40
	mov	r3, #2
	ldr	ip, .L62+8
	mov	lr, pc
	bx	ip
	b	.L46
.L56:
	mov	r0, #130
	mov	r1, #85
	ldr	r2, .L62+44
	mov	r3, #2
	ldr	ip, .L62+8
	mov	lr, pc
	bx	ip
	b	.L46
.L57:
	mov	r0, #130
	mov	r1, #85
	ldr	r2, .L62+48
	mov	r3, #2
	ldr	ip, .L62+8
	mov	lr, pc
	bx	ip
	b	.L46
.L58:
	mov	r0, #130
	mov	r1, #85
	ldr	r2, .L62+52
	mov	r3, #2
	ldr	ip, .L62+8
	mov	lr, pc
	bx	ip
	b	.L46
.L59:
	mov	r0, #130
	mov	r1, #85
	ldr	r2, .L62+56
	mov	r3, #2
	ldr	ip, .L62+8
	mov	lr, pc
	bx	ip
	b	.L46
.L63:
	.align	2
.L62:
	.word	operation
	.word	.LC22
	.word	drawString
	.word	.LC11
	.word	.LC12
	.word	.LC10
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.size	updateOperationSign, .-updateOperationSign
	.align	2
	.global	drawCursor
	.type	drawCursor, %function
drawCursor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	r3, .L65
	sub	sp, sp, #12
	ldr	r3, [r3, #0]
	sub	r3, r3, r3, asl #2
	mov	r3, r3, asl #1
	str	r0, [sp, #0]
	mov	r1, #140
	add	r0, r3, #191
	mov	r2, #2
	mov	r3, #6
	ldr	ip, .L65+4
	mov	lr, pc
	bx	ip
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L66:
	.align	2
.L65:
	.word	cursor
	.word	drawRect4
	.size	drawCursor, .-drawCursor
	.align	2
	.global	moveCursorRight
	.type	moveCursorRight, %function
moveCursorRight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L69
	ldr	r2, [r3, #0]
	cmp	r2, #0
	subgt	r2, r2, #1
	strgt	r2, [r3, #0]
	bx	lr
.L70:
	.align	2
.L69:
	.word	cursor
	.size	moveCursorRight, .-moveCursorRight
	.align	2
	.global	checkCursorBounds
	.type	checkCursorBounds, %function
checkCursorBounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L78
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L71
.L77:
	.word	.L73
	.word	.L74
	.word	.L75
	.word	.L76
.L76:
	ldr	r3, .L78+4
	ldr	r2, [r3, #0]
	cmp	r2, #3
	bxle	lr
	mov	r2, #3
	str	r2, [r3, #0]
.L71:
	bx	lr
.L75:
	ldr	r3, .L78+4
	ldr	r2, [r3, #0]
	cmp	r2, #4
	movgt	r2, #4
	strgt	r2, [r3, #0]
	bx	lr
.L74:
	ldr	r3, .L78+4
	ldr	r2, [r3, #0]
	cmp	r2, #5
	movgt	r2, #5
	strgt	r2, [r3, #0]
	bx	lr
.L73:
	ldr	r3, .L78+4
	ldr	r2, [r3, #0]
	cmp	r2, #15
	movgt	r2, #15
	strgt	r2, [r3, #0]
	bx	lr
.L79:
	.align	2
.L78:
	.word	state
	.word	cursor
	.size	checkCursorBounds, .-checkCursorBounds
	.align	2
	.global	moveCursorLeft
	.type	moveCursorLeft, %function
moveCursorLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L81
	ldr	r2, [r3, #0]
	add	r2, r2, #1
	str	r2, [r3, #0]
	b	checkCursorBounds
.L82:
	.align	2
.L81:
	.word	cursor
	.size	moveCursorLeft, .-moveCursorLeft
	.align	2
	.global	flip
	.type	flip, %function
flip:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L84
	ldrh	r2, [r3, #0]
	ldrh	r1, [r3, #2]
	strh	r2, [r3, #2]	@ movhi
	strh	r1, [r3, #0]	@ movhi
	bx	lr
.L85:
	.align	2
.L84:
	.word	stack
	.size	flip, .-flip
	.align	2
	.global	short2bin
	.type	short2bin, %function
short2bin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	mov	r2, r0
	mov	r3, #0
	mov	r4, #48
	mov	ip, #49
	b	.L90
.L91:
	mov	r1, r1, asr #1
.L90:
	tst	r1, #1
	add	r3, r3, #1
	strneb	ip, [r2, #15]
	streqb	r4, [r2, #15]
	cmp	r3, #16
	sub	r2, r2, #1
	bne	.L91
	mov	r3, #0
	strb	r3, [r0, #16]
	ldmfd	sp!, {r4}
	bx	lr
	.size	short2bin, .-short2bin
	.align	2
	.global	drawLine
	.type	drawLine, %function
drawLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, .L99
	sub	sp, sp, #16
	ldr	r3, [r3, #0]
	mov	r4, r0
	mov	r5, r1
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L92
.L98:
	.word	.L94
	.word	.L95
	.word	.L96
	.word	.L97
.L97:
	ldr	r2, .L99+4
	mov	r3, r0, asl #1
	ldrh	r2, [r2, r3]
	ldr	r1, .L99+8
	ldr	r3, .L99+12
	mov	r0, sp
	mov	lr, pc
	bx	r3
	rsb	r0, r4, r4, asl #29
	rsb	r4, r4, r0, asl #2
	mov	r0, r4, asl #1
	add	r0, r0, #130
	mov	r1, #172
	mov	r2, sp
	mov	r3, r5
	ldr	ip, .L99+16
	mov	r6, sp
	mov	lr, pc
	bx	ip
.L92:
	add	sp, sp, #16
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L96:
	ldr	r2, .L99+4
	mov	r3, r0, asl #1
	ldrh	r2, [r2, r3]
	mov	r0, sp
	ldr	r1, .L99+20
	ldr	r3, .L99+12
	mov	lr, pc
	bx	r3
	rsb	r0, r4, r4, asl #29
	rsb	r4, r4, r0, asl #2
	mov	r0, r4, asl #1
	add	r0, r0, #130
	mov	r1, #166
	mov	r2, sp
	mov	r3, r5
	ldr	ip, .L99+16
	mov	r6, sp
	mov	lr, pc
	bx	ip
	b	.L92
.L95:
	ldr	r2, .L99+4
	mov	r3, r0, asl #1
	ldrh	r2, [r2, r3]
	mov	r0, sp
	ldr	r1, .L99+24
	ldr	r3, .L99+12
	mov	lr, pc
	bx	r3
	rsb	r0, r4, r4, asl #29
	rsb	r4, r4, r0, asl #2
	mov	r0, r4, asl #1
	add	r0, r0, #130
	mov	r1, #160
	mov	r2, sp
	mov	r3, r5
	ldr	ip, .L99+16
	mov	r6, sp
	mov	lr, pc
	bx	ip
	b	.L92
.L94:
	ldr	r2, .L99+4
	mov	r3, r0, asl #1
	ldrsh	r1, [r2, r3]
	mov	r0, sp
	bl	short2bin
	rsb	r0, r4, r4, asl #29
	rsb	r4, r4, r0, asl #2
	mov	r0, r4, asl #1
	add	r0, r0, #130
	mov	r1, #100
	mov	r2, sp
	mov	r3, r5
	ldr	ip, .L99+16
	mov	r6, sp
	mov	lr, pc
	bx	ip
	b	.L92
.L100:
	.align	2
.L99:
	.word	state
	.word	stack
	.word	.LC25
	.word	sprintf
	.word	drawString
	.word	.LC24
	.word	.LC23
	.size	drawLine, .-drawLine
	.align	2
	.global	drawNumbers
	.type	drawNumbers, %function
drawNumbers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r7, .L111
	sub	sp, sp, #20
	ldr	r8, .L111+4
	ldr	fp, .L111+8
	ldr	sl, .L111+12
	mov	r9, r0
	mov	r5, #130
	mov	r4, #0
	mov	r6, sp
.L108:
	ldr	r3, [r7, #0]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L102
.L107:
	.word	.L103
	.word	.L104
	.word	.L105
	.word	.L106
.L106:
	ldrh	r2, [r8, r4]
	ldr	r1, .L111+16
	mov	r0, sp
	mov	lr, pc
	bx	fp
.L110:
	mov	r0, r5
	mov	r1, #100
	mov	r2, sp
	mov	r3, r9
	mov	lr, pc
	bx	sl
.L102:
	add	r4, r4, #2
	cmp	r4, #8
	sub	r5, r5, #10
	bne	.L108
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L105:
	ldrh	r2, [r8, r4]
	mov	r0, sp
	ldr	r1, .L111+20
	mov	lr, pc
	bx	fp
	b	.L110
.L104:
	ldrh	r2, [r8, r4]
	mov	r0, sp
	ldr	r1, .L111+24
	mov	lr, pc
	bx	fp
	b	.L110
.L103:
	ldrsh	r1, [r8, r4]
	mov	r0, sp
	bl	short2bin
	b	.L110
.L112:
	.align	2
.L111:
	.word	state
	.word	stack
	.word	sprintf
	.word	drawString
	.word	.LC28
	.word	.LC27
	.word	.LC26
	.size	drawNumbers, .-drawNumbers
	.align	2
	.global	shiftDownNotZero
	.type	shiftDownNotZero, %function
shiftDownNotZero:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L114
	ldrh	r2, [r3, #4]
	strh	r2, [r3, #2]	@ movhi
	ldrh	r2, [r3, #6]
	mov	r0, #1
	strh	r2, [r3, #4]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #6]	@ movhi
	b	drawNumbers
.L115:
	.align	2
.L114:
	.word	stack
	.size	shiftDownNotZero, .-shiftDownNotZero
	.align	2
	.global	shiftDown
	.type	shiftDown, %function
shiftDown:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L117
	ldrh	r2, [r3, #2]
	strh	r2, [r3, #0]	@ movhi
	ldrh	r2, [r3, #4]
	strh	r2, [r3, #2]	@ movhi
	ldrh	r2, [r3, #6]
	mov	r0, #1
	strh	r2, [r3, #4]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #6]	@ movhi
	b	drawNumbers
.L118:
	.align	2
.L117:
	.word	stack
	.size	shiftDown, .-shiftDown
	.align	2
	.global	shiftUp
	.type	shiftUp, %function
shiftUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L120
	ldrh	r2, [r3, #4]
	strh	r2, [r3, #6]	@ movhi
	ldrh	r2, [r3, #2]
	strh	r2, [r3, #4]	@ movhi
	ldrh	r2, [r3, #0]
	mov	r0, #1
	strh	r2, [r3, #2]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #0]	@ movhi
	b	drawNumbers
.L121:
	.align	2
.L120:
	.word	stack
	.size	shiftUp, .-shiftUp
	.global	__aeabi_i2d
	.global	__aeabi_dsub
	.global	__aeabi_d2uiz
	.align	2
	.global	decrementNumber
	.type	decrementNumber, %function
decrementNumber:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r4, .L131
	ldrh	r5, [r4, #0]
	cmp	r5, #0
	streqh	r5, [r4, #0]	@ movhi
	beq	.L124
	ldr	r3, .L131+4
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L124
.L129:
	.word	.L125
	.word	.L126
	.word	.L127
	.word	.L128
.L128:
	ldr	r3, .L131+8
	ldr	r6, .L131+12
	ldr	r0, [r3, #0]
	mov	lr, pc
	bx	r6
	mov	r3, r1
	mov	r1, #1073741824
	mov	r2, r0
	add	r1, r1, #3145728
	mov	r0, #0
.L130:
	ldr	ip, .L131+16
	mov	lr, pc
	bx	ip
	mov	r7, r0
	mov	r8, r1
	mov	r0, r5
	mov	lr, pc
	bx	r6
	mov	r2, r7
	mov	r3, r8
	ldr	ip, .L131+20
	mov	lr, pc
	bx	ip
	ldr	r3, .L131+24
	mov	lr, pc
	bx	r3
	strh	r0, [r4, #0]	@ movhi
.L124:
	mov	r0, #1
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	drawNumbers
.L125:
	ldr	r3, .L131+8
	ldr	r6, .L131+12
	ldr	r0, [r3, #0]
	mov	lr, pc
	bx	r6
	mov	r2, r0
	mov	r3, r1
	mov	r0, #0
	mov	r1, #1073741824
	b	.L130
.L126:
	ldr	r3, .L131+8
	ldr	r6, .L131+12
	ldr	r0, [r3, #0]
	mov	lr, pc
	bx	r6
	mov	r3, r1
	mov	r1, #1073741824
	mov	r2, r0
	add	r1, r1, #2097152
	mov	r0, #0
	b	.L130
.L127:
	ldr	r3, .L131+8
	ldr	r6, .L131+12
	ldr	r0, [r3, #0]
	mov	lr, pc
	bx	r6
	mov	r3, r1
	mov	r1, #1073741824
	mov	r2, r0
	add	r1, r1, #2359296
	mov	r0, #0
	b	.L130
.L132:
	.align	2
.L131:
	.word	stack
	.word	state
	.word	cursor
	.word	__aeabi_i2d
	.word	pow
	.word	__aeabi_dsub
	.word	__aeabi_d2uiz
	.size	decrementNumber, .-decrementNumber
	.global	__aeabi_dadd
	.align	2
	.global	incrementNumber
	.type	incrementNumber, %function
incrementNumber:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L141
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r3, [r3, #0]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L134
.L139:
	.word	.L135
	.word	.L136
	.word	.L137
	.word	.L138
.L138:
	ldr	r4, .L141+4
	ldr	r7, .L141+8
	ldrh	r0, [r4, #0]
	mov	lr, pc
	bx	r7
	ldr	r3, .L141+12
	mov	r5, r0
	ldr	r0, [r3, #0]
	mov	r6, r1
	mov	lr, pc
	bx	r7
	mov	r3, r1
	mov	r1, #1073741824
	mov	r2, r0
	add	r1, r1, #3145728
	mov	r0, #0
.L140:
	ldr	ip, .L141+16
	mov	lr, pc
	bx	ip
	ldr	ip, .L141+20
	mov	r2, r0
	mov	r3, r1
	mov	r0, r5
	mov	r1, r6
	mov	lr, pc
	bx	ip
	ldr	r3, .L141+24
	mov	lr, pc
	bx	r3
	strh	r0, [r4, #0]	@ movhi
.L134:
	mov	r0, #1
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	drawNumbers
.L137:
	ldr	r4, .L141+4
	ldr	r7, .L141+8
	ldrh	r0, [r4, #0]
	mov	lr, pc
	bx	r7
	ldr	r3, .L141+12
	mov	r5, r0
	ldr	r0, [r3, #0]
	mov	r6, r1
	mov	lr, pc
	bx	r7
	mov	r3, r1
	mov	r1, #1073741824
	mov	r2, r0
	add	r1, r1, #2359296
	mov	r0, #0
	b	.L140
.L136:
	ldr	r4, .L141+4
	ldr	r7, .L141+8
	ldrh	r0, [r4, #0]
	mov	lr, pc
	bx	r7
	ldr	r3, .L141+12
	mov	r5, r0
	ldr	r0, [r3, #0]
	mov	r6, r1
	mov	lr, pc
	bx	r7
	mov	r3, r1
	mov	r1, #1073741824
	mov	r2, r0
	add	r1, r1, #2097152
	mov	r0, #0
	b	.L140
.L135:
	ldr	r4, .L141+4
	ldr	r7, .L141+8
	ldrh	r0, [r4, #0]
	mov	lr, pc
	bx	r7
	ldr	r3, .L141+12
	mov	r5, r0
	ldr	r0, [r3, #0]
	mov	r6, r1
	mov	lr, pc
	bx	r7
	mov	r2, r0
	mov	r3, r1
	mov	r0, #0
	mov	r1, #1073741824
	b	.L140
.L142:
	.align	2
.L141:
	.word	state
	.word	stack
	.word	__aeabi_i2d
	.word	cursor
	.word	pow
	.word	__aeabi_dadd
	.word	__aeabi_d2uiz
	.size	incrementNumber, .-incrementNumber
	.global	__aeabi_uidiv
	.align	2
	.global	doOperation
	.type	doOperation, %function
doOperation:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L165
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #0]
	cmp	r3, #12
	ldrls	pc, [pc, r3, asl #2]
	b	.L143
.L158:
	.word	.L145
	.word	.L146
	.word	.L147
	.word	.L148
	.word	.L149
	.word	.L150
	.word	.L151
	.word	.L152
	.word	.L153
	.word	.L154
	.word	.L155
	.word	.L156
	.word	.L157
.L157:
	ldr	r3, .L165+4
	ldrh	r2, [r3, #0]
	mov	r0, #0
	mov	r2, r2, lsr #1
	mov	r1, #1
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	b	drawLine
.L143:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L145:
	ldr	r3, .L165+4
	ldrh	r2, [r3, #0]
	ldrh	r1, [r3, #2]
	add	r2, r1, r2
.L163:
	strh	r2, [r3, #0]	@ movhi
	bl	shiftDownNotZero
	mov	r0, #1
	ldmfd	sp!, {r4, lr}
	b	drawNumbers
.L146:
	ldr	r3, .L165+4
	ldrh	r2, [r3, #0]
	ldrh	r1, [r3, #2]
	rsb	r2, r2, r1
	b	.L163
.L147:
	ldr	r3, .L165+4
	ldrh	r1, [r3, #0]
	ldrh	r2, [r3, #2]
	mul	r2, r1, r2
	b	.L163
.L148:
	ldr	r4, .L165+4
	ldr	r3, .L165+8
	ldrh	r1, [r4, #0]
	ldrh	r0, [r4, #2]
	mov	lr, pc
	bx	r3
	strh	r0, [r4, #0]	@ movhi
	bl	shiftDownNotZero
	mov	r0, #1
	ldmfd	sp!, {r4, lr}
	b	drawNumbers
.L149:
	ldr	r3, .L165+4
	ldrh	r2, [r3, #0]
	cmp	r2, #0
	beq	.L163
.L164:
	ldrh	r2, [r3, #2]
	subs	r2, r2, #0
	movne	r2, #1
	b	.L163
.L150:
	ldr	r3, .L165+4
	ldrh	r2, [r3, #0]
	cmp	r2, #0
	movne	r2, #1
	beq	.L164
	b	.L163
.L151:
	ldr	r3, .L165+4
	ldrh	r2, [r3, #0]
	mov	r0, #0
	cmp	r2, r0
	movne	r2, #0
	moveq	r2, #1
	mov	r1, #1
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	b	drawLine
.L152:
	ldr	r3, .L165+4
	ldrh	r2, [r3, #0]
	ldrh	r1, [r3, #2]
	and	r2, r1, r2
	b	.L163
.L153:
	ldr	r3, .L165+4
	ldrh	r2, [r3, #0]
	ldrh	r1, [r3, #2]
	orr	r2, r1, r2
	b	.L163
.L154:
	ldr	r3, .L165+4
	ldrh	r2, [r3, #0]
	mov	r0, #0
	mvn	r2, r2
	mov	r1, #1
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	b	drawLine
.L155:
	ldr	r3, .L165+4
	ldrh	r2, [r3, #0]
	ldrh	r1, [r3, #2]
	eor	r2, r1, r2
	b	.L163
.L156:
	ldr	r3, .L165+4
	ldrh	r2, [r3, #0]
	mov	r0, #0
	mov	r2, r2, asl #1
	mov	r1, #1
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	b	drawLine
.L166:
	.align	2
.L165:
	.word	operation
	.word	stack
	.word	__aeabi_uidiv
	.size	doOperation, .-doOperation
	.align	2
	.global	nextBase
	.type	nextBase, %function
nextBase:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L174
	ldr	r3, [r2, #0]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L168
.L173:
	.word	.L169
	.word	.L170
	.word	.L171
	.word	.L172
.L172:
	mov	r3, #0
	str	r3, [r2, #0]
.L168:
	mov	r0, #1
	b	drawNumbers
.L171:
	mov	r3, #3
	str	r3, [r2, #0]
	b	.L168
.L170:
	mov	r3, #2
	str	r3, [r2, #0]
	b	.L168
.L169:
	mov	r3, #1
	str	r3, [r2, #0]
	b	.L168
.L175:
	.align	2
.L174:
	.word	state
	.size	nextBase, .-nextBase
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L198
	bl	drawInstructions
	ldr	r3, [r4, #0]
	tst	r3, #512
	beq	.L177
	ldr	r2, .L198+4
	ldr	r2, [r2, #0]
	tst	r2, #512
	beq	.L188
.L177:
	tst	r3, #256
	beq	.L178
	ldr	r2, .L198+4
	ldr	r2, [r2, #0]
	tst	r2, #256
	beq	.L189
.L178:
	tst	r3, #1
	beq	.L179
	ldr	r2, .L198+4
	ldr	r2, [r2, #0]
	tst	r2, #1
	beq	.L190
.L179:
	tst	r3, #2
	beq	.L180
	ldr	r2, .L198+4
	ldr	r2, [r2, #0]
	tst	r2, #2
	beq	.L191
.L180:
	tst	r3, #32
	beq	.L181
	ldr	r2, .L198+4
	ldr	r2, [r2, #0]
	tst	r2, #32
	beq	.L192
.L181:
	tst	r3, #16
	beq	.L182
	ldr	r2, .L198+4
	ldr	r2, [r2, #0]
	tst	r2, #16
	beq	.L193
.L182:
	tst	r3, #64
	beq	.L184
	ldr	r2, .L198+4
	ldr	r2, [r2, #0]
	tst	r2, #64
	beq	.L194
.L184:
	tst	r3, #128
	beq	.L185
	ldr	r2, .L198+4
	ldr	r2, [r2, #0]
	tst	r2, #128
	beq	.L195
.L185:
	tst	r3, #8
	beq	.L186
	ldr	r2, .L198+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L196
.L186:
	tst	r3, #4
	beq	.L176
	ldr	r3, .L198+4
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L197
.L176:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L190:
	bl	drawRects
	bl	drawBases
	bl	updateBasePointer
	bl	drawCursor.clone.0
	mov	r0, #1
	bl	drawNumbers
	bl	nextOperation
	bl	updateOperationSign
	ldr	r3, .L198+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	b	.L179
.L197:
	bl	drawRects
	bl	drawBases
	bl	updateBasePointer
	bl	updateOperationSign
	bl	drawCursor.clone.0
	ldr	r3, .L198+8
	mov	lr, pc
	bx	r3
	b	.L176
.L189:
	bl	drawRects
	bl	drawBases
	bl	nextBase
	bl	updateBasePointer
	bl	updateOperationSign
	bl	checkCursorBounds
	bl	drawCursor.clone.0
	ldr	r3, .L198+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	b	.L178
.L191:
	bl	drawRects
	bl	drawBases
	bl	updateBasePointer
	bl	updateOperationSign
	bl	doOperation
	mov	r0, #1
	bl	drawNumbers
	bl	drawCursor.clone.0
	ldr	r3, .L198+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	b	.L180
.L192:
	bl	drawRects
	bl	drawBases
	bl	updateBasePointer
	bl	updateOperationSign
	mov	r0, #1
	bl	drawNumbers
	bl	moveCursorLeft
	bl	drawCursor.clone.0
	ldr	r3, .L198+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	b	.L181
.L193:
	bl	drawRects
	bl	drawBases
	bl	updateBasePointer
	bl	updateOperationSign
	mov	r0, #1
	bl	drawNumbers
	ldr	r3, .L198+12
	ldr	r2, [r3, #0]
	cmp	r2, #0
	subgt	r2, r2, #1
	strgt	r2, [r3, #0]
	bl	drawCursor.clone.0
	ldr	r3, .L198+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	b	.L182
.L194:
	bl	drawRects
	bl	drawBases
	bl	updateBasePointer
	bl	updateOperationSign
	bl	drawCursor.clone.0
	bl	incrementNumber
	ldr	r3, .L198+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	b	.L184
.L195:
	bl	drawRects
	bl	drawBases
	bl	updateBasePointer
	bl	updateOperationSign
	bl	drawCursor.clone.0
	bl	decrementNumber
	ldr	r3, .L198+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	b	.L185
.L196:
	bl	drawRects
	bl	drawBases
	bl	updateBasePointer
	bl	updateOperationSign
	bl	drawCursor.clone.0
	bl	shiftUp
	ldr	r3, .L198+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	b	.L186
.L188:
	bl	drawRects
	bl	drawBases
	bl	updateBasePointer
	bl	updateOperationSign
	bl	drawCursor.clone.0
	ldr	r3, .L198+16
	ldrh	r2, [r3, #0]
	ldrh	r1, [r3, #2]
	mov	r0, #1
	strh	r1, [r3, #0]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	bl	drawNumbers
	ldr	r3, .L198+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	b	.L177
.L199:
	.align	2
.L198:
	.word	oldButtons
	.word	buttons
	.word	flipPage
	.word	cursor
	.word	stack
	.size	update, .-update
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r0, #75
	ldr	r4, .L201
	mov	r1, #8
	ldr	r2, .L201+4
	mov	r3, #2
	mov	lr, pc
	bx	r4
	mov	r1, #85
	ldr	r2, .L201+8
	mov	r3, #2
	mov	r0, #130
	mov	lr, pc
	bx	r4
	bl	drawCursor.clone.0
	mov	r0, #1
	bl	drawNumbers
	bl	drawBases
	ldmfd	sp!, {r4, lr}
	b	drawInstructions
.L202:
	.align	2
.L201:
	.word	drawString
	.word	.LC10
	.word	.LC11
	.size	start, .-start
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	mov	r3, #1040
	add	r3, r3, #4
	mov	r2, #67108864
	strh	r3, [r2, #0]	@ movhi
	ldr	r4, .L205
	bl	init
	mov	r5, #67108864
	bl	start
	ldr	r7, .L205+4
	mov	lr, pc
	bx	r4
	ldr	r6, .L205+8
	bl	start
	mov	lr, pc
	bx	r4
	ldr	r4, .L205+12
	add	r5, r5, #256
.L204:
	ldrh	r3, [r5, #48]
	ldr	r2, [r4, #0]
	str	r3, [r4, #0]
	str	r2, [r7, #0]
	bl	update
	mov	lr, pc
	bx	r6
	b	.L204
.L206:
	.align	2
.L205:
	.word	flipPage
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.size	main, .-main
	.comm	state,4,4
	.comm	operation,4,4
	.comm	cursor,4,4
	.comm	cursorNumber,4,4
	.comm	BG_COLOR,1,1
	.comm	stack,8,4
	.comm	buttons,4,4
	.comm	oldButtons,4,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%s%d\000"
	.space	3
.LC1:
	.ascii	"\000"
	.space	3
.LC2:
	.ascii	"this is a bit calculator, wow!!\000"
.LC3:
	.ascii	"A: change operation, B: operate\000"
.LC4:
	.ascii	"START: move up, SELECT: move down\000"
	.space	2
.LC5:
	.ascii	"L: swap, R: change base\000"
.LC6:
	.ascii	"Binary\000"
	.space	1
.LC7:
	.ascii	"Octal\000"
	.space	2
.LC8:
	.ascii	"Decimal\000"
.LC9:
	.ascii	"Hexadecimal\000"
.LC10:
	.ascii	"*\000"
	.space	2
.LC11:
	.ascii	"+\000"
	.space	2
.LC12:
	.ascii	"-\000"
	.space	2
.LC13:
	.ascii	"/\000"
	.space	2
.LC14:
	.ascii	"&&\000"
	.space	1
.LC15:
	.ascii	"||\000"
	.space	1
.LC16:
	.ascii	"!\000"
	.space	2
.LC17:
	.ascii	"&\000"
	.space	2
.LC18:
	.ascii	"|\000"
	.space	2
.LC19:
	.ascii	"``\000"
	.space	1
.LC20:
	.ascii	"^\000"
	.space	2
.LC21:
	.ascii	"<<\000"
	.space	1
.LC22:
	.ascii	">>\000"
	.space	1
.LC23:
	.ascii	"%06o\000"
	.space	3
.LC24:
	.ascii	"%05u\000"
	.space	3
.LC25:
	.ascii	"%04x\000"
	.space	3
.LC26:
	.ascii	"%016o\000"
	.space	2
.LC27:
	.ascii	"%016u\000"
	.space	2
.LC28:
	.ascii	"%016x\000"
	.ident	"GCC: (devkitARM release 31) 4.5.0"

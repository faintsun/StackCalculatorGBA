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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r0, r0, r0, asl #4
	add	r0, r1, r0, asl #4
	mov	r0, r0, asl #1
	add	r0, r0, #100663296
	strh	r2, [r0, #0]	@ movhi
	bx	lr
	.size	setPixel, .-setPixel
	.align	2
	.global	setPixel4
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r0, r0, r0, asl #4
	add	r3, r1, r0, asl #4
	ldr	r0, .L5
	add	r3, r3, r3, lsr #31
	ldr	ip, [r0, #0]
	bic	r3, r3, #1
	tst	r1, #1
	ldrh	r1, [ip, r3]
	andne	r1, r1, #255
	biceq	r1, r1, #255
	orrne	r2, r1, r2, asl #8
	orreq	r2, r2, r1
	strneh	r2, [ip, r3]	@ movhi
	streqh	r2, [ip, r3]	@ movhi
	bx	lr
.L6:
	.align	2
.L5:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	waitForVBlank
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L8:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L8
	mov	r2, #67108864
.L10:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L10
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	DMANow
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r0, r0, r0, asl #1
	mov	r0, r0, asl #2
	add	r0, r0, #67108864
	add	ip, r0, #176
	orr	r3, r3, #-2147483648
	str	r1, [r0, #176]
	str	r2, [ip, #4]
	str	r3, [ip, #8]
	bx	lr
	.size	DMANow, .-DMANow
	.align	2
	.global	drawRect
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	sub	sp, sp, #12
	ldrh	ip, [sp, #16]
	cmp	r2, #0
	strh	ip, [sp, #6]	@ movhi
	ble	.L15
	ldr	ip, .L19
	rsb	r1, r1, r1, asl #4
	ldr	ip, [ip, #0]
	add	r0, r0, r1, asl #4
	orr	r4, r3, #-2130706432
	add	r0, ip, r0, asl #1
	mov	r1, #0
	add	r3, sp, #6
	mov	ip, #67108864
.L17:
	add	r1, r1, #1
	cmp	r1, r2
	str	r3, [ip, #212]
	str	r0, [ip, #216]
	str	r4, [ip, #220]
	add	r0, r0, #480
	bne	.L17
.L15:
	add	sp, sp, #12
	ldmfd	sp!, {r4}
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	drawRect4
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	subs	r9, r2, #0
	mov	r4, r0
	mov	fp, r1
	mov	r6, r3
	ldrb	r8, [sp, #40]	@ zero_extendqisi2
	movgt	sl, #0
	ble	.L21
.L25:
	cmp	r6, #0
	addgt	r7, sl, fp
	movgt	r5, #0
	ble	.L26
.L24:
	add	r1, r5, r4
	mov	r0, r7
	mov	r2, r8
	add	r5, r5, #1
	bl	setPixel4
	cmp	r6, r5
	bgt	.L24
.L26:
	add	sl, sl, #1
	cmp	r9, sl
	bgt	.L25
.L21:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
	.size	drawRect4, .-drawRect4
	.align	2
	.global	loadPalette
	.type	loadPalette, %function
loadPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #-2147483648
	mov	r3, #67108864
	add	r2, r2, #256
	mov	r1, #83886080
	str	r0, [r3, #212]
	str	r1, [r3, #216]
	str	r2, [r3, #220]
	bx	lr
	.size	loadPalette, .-loadPalette
	.align	2
	.global	fillScreen
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
	ldr	r2, .L31
	add	r3, sp, #8
	strh	r0, [r3, #-2]!	@ movhi
	mov	r1, #-2130706432
	ldr	r0, [r2, #0]
	add	r1, r1, #38400
	mov	r2, #67108864
	str	r3, [r2, #212]
	str	r0, [r2, #216]
	str	r1, [r2, #220]
	add	sp, sp, #8
	bx	lr
.L32:
	.align	2
.L31:
	.word	.LANCHOR0
	.size	fillScreen, .-fillScreen
	.align	2
	.global	fillScreen4
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
	ldr	r2, .L34
	add	r3, sp, #8
	orr	r0, r0, r0, asl #8
	strh	r0, [r3, #-2]!	@ movhi
	mov	r1, #-2130706432
	ldr	r0, [r2, #0]
	add	r1, r1, #19200
	mov	r2, #67108864
	str	r3, [r2, #212]
	str	r0, [r2, #216]
	str	r1, [r2, #220]
	add	sp, sp, #8
	bx	lr
.L35:
	.align	2
.L34:
	.word	.LANCHOR0
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	flipPage
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r2, [r3, #0]
	tst	r2, #16
	bne	.L39
	orr	r2, r2, #16
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, .L40
	mov	r2, #100663296
	str	r2, [r3, #0]
	bx	lr
.L39:
	bic	r2, r2, #16
	strh	r2, [r3, #0]	@ movhi
	mov	r1, #100663296
	ldr	r3, .L40
	add	r1, r1, #40960
	str	r1, [r3, #0]
	bx	lr
.L41:
	.align	2
.L40:
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 31) 4.5.0"

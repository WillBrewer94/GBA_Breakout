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
	.global	initializeStart
	.type	initializeStart, %function
initializeStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r3, #1024
	mov	r2, #67108864
	add	r3, r3, #3
	strh	r3, [r2, #0]	@ movhi
	mov	r0, #0
	ldr	r3, .L2
	mov	r4, #32512
	mov	lr, pc
	bx	r3
	add	r4, r4, #255
	mov	r0, #60
	mov	r1, r0
	mov	r3, r4
	ldr	r2, .L2+4
	ldr	r5, .L2+8
	mov	lr, pc
	bx	r5
	ldr	r2, .L2+12
	mov	r3, r4
	mov	r0, #80
	mov	r1, #60
	mov	lr, pc
	bx	r5
	ldr	r3, .L2+16
	mov	r2, #0
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	fillScreen
	.word	.LC0
	.word	drawString
	.word	.LC1
	.word	state
	.size	initializeStart, .-initializeStart
	.align	2
	.global	initializeLose
	.type	initializeLose, %function
initializeLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L5
	mov	r2, #2
	stmfd	sp!, {r4, lr}
	mov	r0, #31
	str	r2, [r3, #0]
	ldr	r3, .L5+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L5+8
	mov	r0, #60
	mov	r1, #85
	ldr	r2, .L5+12
	mov	r3, #0
	mov	lr, pc
	bx	r4
	mov	r0, #80
	mov	r1, #30
	ldr	r2, .L5+16
	mov	r3, #0
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	state
	.word	fillScreen
	.word	drawString
	.word	.LC2
	.word	.LC3
	.size	initializeLose, .-initializeLose
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L10
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L10+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	initializeStart
.L11:
	.align	2
.L10:
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	initializeWin
	.type	initializeWin, %function
initializeWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L13
	mov	r2, #3
	mov	r4, #32512
	add	r4, r4, #255
	str	r2, [r3, #0]
	mov	r0, #992
	ldr	r3, .L13+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L13+8
	mov	r3, r4
	mov	r0, #40
	mov	r1, #60
	ldr	r2, .L13+12
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r0, #60
	mov	r1, #40
	ldr	r2, .L13+16
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r0, #80
	mov	r1, #40
	ldr	r2, .L13+20
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r0, #100
	mov	r1, #10
	ldr	r2, .L13+24
	mov	lr, pc
	bx	r5
	mov	r0, #120
	mov	r1, #70
	ldr	r2, .L13+28
	mov	r3, r4
	mov	lr, pc
	bx	r5
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	state
	.word	fillScreen
	.word	drawString
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.size	initializeWin, .-initializeWin
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L17
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L17+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	initializeStart
.L18:
	.align	2
.L17:
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	initializePause
	.type	initializePause, %function
initializePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r4, #32512
	add	r4, r4, #255
	ldr	r3, .L20
	mov	r0, #0
	mov	lr, pc
	bx	r3
	ldr	r5, .L20+4
	mov	r0, #60
	mov	r1, #45
	ldr	r2, .L20+8
	mov	r3, r4
	mov	lr, pc
	bx	r5
	mov	r0, #80
	mov	r1, #60
	ldr	r2, .L20+12
	mov	r3, r4
	mov	lr, pc
	bx	r5
	ldr	r2, .L20+16
	mov	r3, r4
	mov	r0, #100
	mov	r1, #10
	mov	lr, pc
	bx	r5
	ldr	r3, .L20+20
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	fillScreen
	.word	drawString
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	state
	.size	initializePause, .-initializePause
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L25
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L22
	ldr	r3, .L25+4
	ldr	r0, [r3, #0]
	ands	r0, r0, #8
	beq	.L24
.L22:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L24:
	ldr	r3, .L25+8
	mov	r2, #1
	str	r2, [r3, #0]
	ldr	r3, .L25+12
	mov	lr, pc
	bx	r3
	b	.L22
.L26:
	.align	2
.L25:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	fillScreen
	.size	pause, .-pause
	.align	2
	.global	updatePaddle
	.type	updatePaddle, %function
updatePaddle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r1, [r3, #48]
	ldmia	r0, {r2, r3}	@ phole ldm
	tst	r1, #32
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	bne	.L28
	cmp	r3, #0
	subgt	r3, r3, #2
	strgt	r3, [r0, #4]
.L28:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bxne	lr
	ldr	r2, [r0, #16]
	ldr	r3, [r0, #4]
	rsb	r2, r2, #240
	cmp	r3, r2
	addlt	r3, r3, #2
	strlt	r3, [r0, #4]
	bx	lr
	.size	updatePaddle, .-updatePaddle
	.align	2
	.global	updateBall
	.type	updateBall, %function
updateBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r2, [r0, #4]
	ldr	r3, [r0, #0]
	cmp	r2, #0
	mov	r4, r0
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	blt	.L31
	ldr	r1, [r0, #20]
	rsb	r1, r1, #240
	cmp	r2, r1
	bgt	.L31
.L32:
	cmp	r3, #0
	ldrlt	r1, [r4, #24]
	rsblt	r1, r1, #0
	strlt	r1, [r4, #24]
	ldr	r1, [r4, #16]
	rsb	r1, r1, #160
	cmp	r3, r1
	ble	.L34
	bl	initializeLose
	ldr	r3, [r4, #0]
	ldr	r2, [r4, #4]
.L34:
	add	r0, r4, #24
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r3, r3, r0
	add	r2, r2, r1
	str	r3, [r4, #0]
	str	r2, [r4, #4]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L31:
	ldr	r1, [r4, #28]
	rsb	r1, r1, #0
	str	r1, [r4, #28]
	b	.L32
	.size	updateBall, .-updateBall
	.align	2
	.global	erasePaddle
	.type	erasePaddle, %function
erasePaddle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r3, r0
	sub	sp, sp, #12
	mov	ip, #0
	ldr	r1, [r3, #12]
	ldr	r2, [r3, #20]
	ldr	r0, [r0, #8]
	ldr	r3, [r3, #16]
	str	ip, [sp, #0]
	ldr	ip, .L36
	mov	lr, pc
	bx	ip
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L37:
	.align	2
.L36:
	.word	drawRect
	.size	erasePaddle, .-erasePaddle
	.align	2
	.global	drawPaddle
	.type	drawPaddle, %function
drawPaddle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #12
	ldr	lr, [r0, #0]
	ldrh	ip, [r0, #24]
	ldr	r1, [r0, #4]
	ldr	r2, [r0, #20]
	ldr	r3, [r0, #16]
	str	ip, [sp, #0]
	mov	r0, lr
	ldr	ip, .L39
	mov	lr, pc
	bx	ip
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L40:
	.align	2
.L39:
	.word	drawRect
	.size	drawPaddle, .-drawPaddle
	.align	2
	.global	eraseBall
	.type	eraseBall, %function
eraseBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r3, r0
	sub	sp, sp, #12
	mov	ip, #0
	add	r1, r3, #12
	ldmia	r1, {r1, r2}	@ phole ldm
	ldr	r0, [r0, #8]
	ldr	r3, [r3, #20]
	str	ip, [sp, #0]
	ldr	ip, .L42
	mov	lr, pc
	bx	ip
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L43:
	.align	2
.L42:
	.word	drawRect
	.size	eraseBall, .-eraseBall
	.align	2
	.global	drawBall
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #12
	ldr	lr, [r0, #0]
	ldrh	ip, [r0, #32]
	ldr	r1, [r0, #4]
	add	r2, r0, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	mov	r0, lr
	ldr	ip, .L45
	mov	lr, pc
	bx	ip
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L46:
	.align	2
.L45:
	.word	drawRect
	.size	drawBall, .-drawBall
	.align	2
	.global	eraseBrick
	.type	eraseBrick, %function
eraseBrick:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	r4, r0
	sub	sp, sp, #12
	mov	r5, #0
	ldr	r0, [r0, #0]
	ldmib	r4, {r1, r2, r3}	@ phole ldm
	ldr	ip, .L48
	str	r5, [sp, #0]
	mov	lr, pc
	bx	ip
	str	r5, [r4, #16]
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	drawRect
	.size	eraseBrick, .-eraseBrick
	.align	2
	.global	drawBrick
	.type	drawBrick, %function
drawBrick:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #12
	ldr	lr, [r0, #0]
	ldrh	ip, [r0, #20]
	ldmib	r0, {r1, r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	mov	r0, lr
	ldr	ip, .L51
	mov	lr, pc
	bx	ip
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L52:
	.align	2
.L51:
	.word	drawRect
	.size	drawBrick, .-drawBrick
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r0, .L58
	bl	erasePaddle
	ldr	r0, .L58+4
	bl	eraseBall
	ldr	r6, .L58+8
	ldr	r0, .L58
	bl	drawPaddle
	ldr	r0, .L58+4
	bl	drawBall
	ldr	r3, [r6, #0]
	cmp	r3, #0
	ble	.L53
	ldr	r7, .L58+12
	mov	r4, #0
	mov	r5, r7
	b	.L56
.L55:
	ldr	r3, [r6, #0]
	add	r4, r4, #1
	cmp	r3, r4
	add	r5, r5, #24
	ble	.L53
.L56:
	ldr	r3, [r5, #16]
	cmp	r3, #0
	beq	.L55
	add	r0, r4, r4, asl #1
	add	r0, r7, r0, asl #3
	bl	drawBrick
	ldr	r3, [r6, #0]
	add	r4, r4, #1
	cmp	r3, r4
	add	r5, r5, #24
	bgt	.L56
.L53:
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	paddle
	.word	ball
	.word	brickCount
	.word	bricks
	.size	draw, .-draw
	.align	2
	.global	initializeGame
	.type	initializeGame, %function
initializeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r7, .L68
	sub	sp, sp, #76
	mov	r4, #0
	add	r6, sp, #4
	ldr	r3, .L68+4
	str	r4, [r7, #0]
	mov	r0, r4
	mov	lr, pc
	bx	r3
	ldr	r8, .L68+8
	ldr	r2, [r7, #0]
	ldr	r1, .L68+12
	mov	r0, r6
	mov	lr, pc
	bx	r8
	ldr	sl, .L68+16
	mov	r3, r4
	mov	r2, r6
	mov	r1, r4
	mov	r0, #150
	mov	r5, #32512
	mov	lr, pc
	bx	sl
	add	r5, r5, #255
	ldr	r2, [r7, #0]
	mov	r0, r6
	ldr	r1, .L68+12
	mov	lr, pc
	bx	r8
	mov	r2, r6
	mov	r3, r5
	mov	r0, #150
	mov	r1, r4
	mov	lr, pc
	bx	sl
	ldr	r3, .L68+20
	mov	r1, #20
	str	r1, [r3, #16]
	mov	r1, #145
	ldr	r6, .L68+24
	mov	sl, #5
	str	r1, [r3, #0]
	mov	r1, #110
	str	sl, [r3, #20]
	strh	r5, [r3, #24]	@ movhi
	str	r4, [r3, #8]
	str	r4, [r3, #12]
	str	r1, [r3, #4]
	mov	r3, #80
	mov	r2, #2
	mov	r9, #1
	str	r3, [r6, #0]
	mov	r3, #100
	str	r2, [r6, #20]
	str	r2, [r6, #16]
	str	r3, [r6, #4]
	str	r9, [r6, #24]
	str	r4, [r6, #8]
	str	r4, [r6, #12]
	ldr	r3, .L68+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L68+32
	smull	r2, r3, r0, r3
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, asl #1
	mvn	r2, #32768
	ldr	r8, .L68+36
	rsb	r0, r3, r0
	strh	r2, [r6, #32]	@ movhi
	mov	r3, #15
	mov	r2, #31	@ movhi
	add	r0, r0, r9
	add	r7, sp, #48
	str	sl, [sp, #56]
	strh	r2, [sp, #68]	@ movhi
	str	r3, [sp, #60]
	mov	r2, sl
	ldr	sl, .L68+40
	str	r0, [r6, #28]
	str	r9, [sp, #64]
	mov	lr, r4
	mov	r6, r4
	mov	r9, r8
	mov	fp, r8
	mov	r5, r7
.L61:
	mov	r4, #0
	b	.L67
.L62:
	add	r2, sp, #56
	ldmia	r2, {r2, r3}	@ phole ldm
	ldr	lr, [r9, #0]
.L67:
	add	r2, r2, #8
	add	r3, r3, #8
	mul	r3, r4, r3
	mul	r2, r6, r2
	add	r3, r3, #8
	add	r2, r2, #8
	str	r2, [sp, #48]
	str	r3, [sp, #52]
	add	ip, lr, lr, asl #1
	ldmia	r7!, {r0, r1, r2, r3}
	add	ip, sl, ip, asl #3
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r7, {r0, r1}
	add	lr, lr, #1
	stmia	ip, {r0, r1}
	add	r4, r4, #1
	mov	r0, r5
	str	lr, [r8, #0]
	bl	drawBrick
	cmp	r4, #10
	mov	r7, r5
	bne	.L62
	ldr	r3, [fp, #0]
	cmp	r3, #29
	movgt	r3, #31744	@ movhi
	strgth	r3, [sp, #68]	@ movhi
	bgt	.L64
	cmp	r3, #19
	movgt	r2, #992	@ movhi
	strgth	r2, [sp, #68]	@ movhi
	bgt	.L64
	cmp	r3, #9
	movgt	r3, #1020
	addgt	r3, r3, #3
	strgth	r3, [sp, #68]	@ movhi
.L64:
	add	r6, r6, #1
	cmp	r6, #4
	addne	r2, sp, #56
	ldmneia	r2, {r2, r3}	@ phole ldm
	ldrne	lr, [r8, #0]
	bne	.L61
.L66:
	ldr	r3, .L68+44
	mov	r2, #1
	str	r2, [r3, #0]
	add	sp, sp, #76
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L69:
	.align	2
.L68:
	.word	.LANCHOR0
	.word	fillScreen
	.word	sprintf
	.word	.LC12
	.word	drawString
	.word	paddle
	.word	ball
	.word	rand
	.word	1431655766
	.word	brickCount
	.word	bricks
	.word	state
	.size	initializeGame, .-initializeGame
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L77
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L72
	ldr	r3, .L77+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L76
.L72:
	ldr	r3, .L77+8
	ldr	r2, [r3, #0]
	add	r2, r2, #1
	str	r2, [r3, #0]
.L70:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L76:
	bl	initializeGame
	ldr	r3, .L77+8
	ldr	r0, [r3, #0]
	ldr	r3, .L77+12
	mov	lr, pc
	bx	r3
	b	.L70
.L78:
	.align	2
.L77:
	.word	oldButtons
	.word	buttons
	.word	seed
	.word	srand
	.size	start, .-start
	.align	2
	.global	collisionCheckBallPaddle
	.type	collisionCheckBallPaddle, %function
collisionCheckBallPaddle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, [r0, #16]
	ldr	r2, [r0, #0]
	ldr	r3, [r1, #0]
	add	r2, ip, r2
	cmp	r2, r3
	bxle	lr
	ldr	r2, [r0, #4]
	ldr	r3, [r1, #4]
	cmp	r2, r3
	bxle	lr
	ldr	r1, [r1, #16]
	ldr	ip, [r0, #20]
	add	r3, r3, r1
	add	r2, r2, ip
	cmp	r2, r3
	ldrlt	r3, [r0, #24]
	rsblt	r3, r3, #0
	strlt	r3, [r0, #24]
	bx	lr
	.size	collisionCheckBallPaddle, .-collisionCheckBallPaddle
	.align	2
	.global	collisionCheckBallBrick
	.type	collisionCheckBallBrick, %function
collisionCheckBallBrick:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, sl}
	ldr	r3, [r1, #0]
	ldr	r5, [r1, #8]
	ldr	r2, [r0, #0]
	add	r7, r5, r3
	cmp	r2, r7
	beq	.L96
	ldr	r4, [r0, #4]
	ldr	ip, [r1, #4]
.L93:
	ldr	r8, [r0, #20]
.L84:
	ldr	r6, [r0, #16]
	add	r6, r2, r6
	cmp	r3, r6
	beq	.L97
.L86:
	add	r8, r8, r4
.L88:
	cmp	ip, r8
	beq	.L98
.L89:
	add	ip, ip, r5
	cmp	r4, ip
	beq	.L99
.L92:
	mov	r0, #0
.L85:
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl}
	bx	lr
.L99:
	add	r5, r5, r2
	cmp	r3, r5
	bgt	.L92
	cmp	r2, r3
	bgt	.L92
.L94:
	ldr	r3, [r0, #28]
	rsb	r3, r3, #0
	str	r3, [r0, #28]
	mov	r0, #1
	b	.L85
.L97:
	cmp	r4, ip
	blt	.L86
	ldr	r1, [r1, #12]
	add	r8, r8, r4
	add	r1, ip, r1
	cmp	r8, r1
	bgt	.L88
	b	.L95
.L96:
	ldr	r4, [r0, #4]
	ldr	ip, [r1, #4]
	cmp	r4, ip
	blt	.L93
	ldr	r8, [r0, #20]
	ldr	r6, [r1, #12]
	add	sl, r8, r4
	add	r6, ip, r6
	cmp	sl, r6
	bgt	.L84
.L95:
	ldr	r3, [r0, #24]
	rsb	r3, r3, #0
	str	r3, [r0, #24]
	mov	r0, #1
	b	.L85
.L98:
	cmp	r3, r6
	bgt	.L89
	cmp	r2, r7
	bgt	.L89
	b	.L94
	.size	collisionCheckBallBrick, .-collisionCheckBallBrick
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	ldr	r5, .L110
	ldr	r4, .L110+4
	mov	r0, r5
	bl	updatePaddle
	mov	r0, r4
	bl	updateBall
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #0]
	ldr	r3, [r5, #0]
	add	r2, r1, r2
	cmp	r2, r3
	ble	.L101
	ldr	r2, [r4, #4]
	ldr	r3, [r5, #4]
	cmp	r2, r3
	bgt	.L109
.L101:
	ldr	r6, .L110+8
	ldr	r3, [r6, #0]
	cmp	r3, #0
	ble	.L100
	ldr	r7, .L110+12
	ldr	sl, .L110+16
	mov	r4, #0
	mov	r8, #1
.L106:
	add	r5, r4, r4, asl #1
	add	r5, r7, r5, asl #3
	ldr	r3, [r5, #16]
	cmp	r3, #0
	bne	.L103
.L108:
	ldr	r3, [r6, #0]
.L104:
	add	r4, r4, #1
	cmp	r4, r3
	blt	.L106
.L100:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L103:
	mov	r1, r5
	ldr	r0, .L110+4
	bl	collisionCheckBallBrick
	cmp	r0, #0
	beq	.L108
	mov	r0, r5
	bl	eraseBrick
	ldr	r4, [r6, #0]
	str	r8, [sl, #4]
	mov	r3, r4
	b	.L104
.L109:
	ldr	r0, [r4, #20]
	ldr	r1, [r5, #16]
	add	r2, r2, r0
	add	r3, r3, r1
	cmp	r2, r3
	ldrlt	r3, [r4, #24]
	rsblt	r3, r3, #0
	strlt	r3, [r4, #24]
	b	.L101
.L111:
	.align	2
.L110:
	.word	paddle
	.word	ball
	.word	brickCount
	.word	bricks
	.word	.LANCHOR0
	.size	update, .-update
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r4, .L121
	sub	sp, sp, #48
	ldr	r3, [r4, #8]
	cmp	r3, #0
	beq	.L119
.L113:
	ldr	r3, [r4, #0]
	cmp	r3, #40
	beq	.L118
	ldr	r3, .L121
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L118
.L115:
	ldr	r3, .L121+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L116
	ldr	r3, .L121+8
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L120
.L116:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ldr	r4, .L121
	beq	.L112
	add	r5, sp, #4
	mov	r6, #0
	ldr	r1, .L121+12
	ldr	r2, [r4, #0]
	ldr	r7, .L121+16
	mov	r0, r5
	str	r6, [r4, #4]
	ldr	r8, .L121+20
	mov	lr, pc
	bx	r7
	mov	r3, r6
	mov	r0, #150
	mov	r1, r6
	mov	r2, r5
	mov	lr, pc
	bx	r8
	ldr	r3, [r4, #0]
	add	r3, r3, #1
	mov	r2, r3
	ldr	r1, .L121+12
	mov	r0, r5
	str	r3, [r4, #0]
	mov	lr, pc
	bx	r7
	mov	r3, #32512
	mov	r0, #150
	mov	r1, r6
	mov	r2, r5
	add	r3, r3, #255
	mov	lr, pc
	bx	r8
.L112:
	add	sp, sp, #48
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L118:
	bl	initializeWin
	b	.L115
.L119:
	bl	update
	ldr	r3, .L121+24
	mov	lr, pc
	bx	r3
	bl	draw
	b	.L113
.L120:
	bl	initializePause
	b	.L116
.L122:
	.align	2
.L121:
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.word	.LC12
	.word	sprintf
	.word	drawString
	.word	waitForVBlank
	.size	game, .-game
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bl	initializeStart
	mov	r5, #67108864
	ldr	r4, .L135
	ldr	r6, .L135+4
	ldr	r7, .L135+8
	add	r5, r5, #256
.L134:
	ldr	r1, [r4, #0]
	ldr	r3, [r6, #0]
.L125:
	ldrh	r2, [r5, #48]
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L133
.L131:
	.word	.L126
	.word	.L127
	.word	.L128
	.word	.L129
	.word	.L130
.L130:
	str	r2, [r4, #0]
	str	r1, [r7, #0]
	bl	pause
	b	.L134
.L129:
	str	r2, [r4, #0]
	str	r1, [r7, #0]
	bl	win
	b	.L134
.L128:
	str	r2, [r4, #0]
	str	r1, [r7, #0]
	bl	lose
	b	.L134
.L127:
	str	r2, [r4, #0]
	str	r1, [r7, #0]
	bl	game
	b	.L134
.L126:
	str	r2, [r4, #0]
	str	r1, [r7, #0]
	bl	start
	b	.L134
.L133:
	mov	r1, r2
	b	.L125
.L136:
	.align	2
.L135:
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.global	isOver
	.global	score
	.global	isCollision
	.comm	paddle,28,4
	.comm	ball,36,4
	.comm	bricks,960,4
	.comm	brickCount,4,4
	.comm	time,4,4
	.comm	state,4,4
	.comm	seed,4,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Welcome to Breakout\000"
.LC1:
	.ascii	"Press Enter to Start\000"
	.space	3
.LC2:
	.ascii	"You Suck.\000"
	.space	2
.LC3:
	.ascii	" Press [ENTER] to Try Again.\000"
	.space	3
.LC4:
	.ascii	"Just So You Know...\000"
.LC5:
	.ascii	"You Just Murdered 40 Blocks.\000"
	.space	3
.LC6:
	.ascii	"Congratulations, You Monster.\000"
	.space	2
.LC7:
	.ascii	"Press [ENTER] if You Want to Commit\000"
.LC8:
	.ascii	"Genocide Again.\000"
.LC9:
	.ascii	"This is the Pause Screen.\000"
	.space	2
.LC10:
	.ascii	"Not Much Else Here.\000"
.LC11:
	.ascii	"Press [ENTER] to Resume or Whatever.\000"
	.space	3
.LC12:
	.ascii	"Score: %d\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	score, %object
	.size	score, 4
score:
	.space	4
	.type	isCollision, %object
	.size	isCollision, 4
isCollision:
	.space	4
	.type	isOver, %object
	.size	isOver, 4
isOver:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"

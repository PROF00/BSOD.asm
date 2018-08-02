;=========================================================================================================================================================================================================================================
;=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
;=========================================================================================================================================================================================================================================

;bootloader
	bits 16
	org 0x7c00
		
;Here i try to load code located at second two sectors
Load_Code:	
    ;---Setup segments
    xor ax, ax                  ; AX=0
    mov ds, ax                  ; DS=ES=0 because we use an org of 0x7c00 - Segment<<4+offset = 0x0000<<4+0x7c00 = 0x07c00
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00              ; SS:SP= 0x0000:0x7c00 stack just below bootloader
	
	;---Read stage - (128kb)
	mov bx, stage             ; ES: BX must point to the buffer
	mov dh,0                    ; head number
	mov ch,0                    ; track number
	mov cl,2                    ; sector number
	mov al,64                   ; number of sectors to read
	mov ah,2                    ; read function number
	int 13h
	call stage
	
;Endless loop
.endloop:
	hlt
	jmp .endloop
	
	
	
;Fake MBR signature
MBR_Signature:
times 510 - ($ - $$) db 0
dw 0xAA55


;=========================================================================================================================================================================================================================================
;=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
;=========================================================================================================================================================================================================================================

;kernel

stage:
	mov ax, 12h         ; Graphics mode (640x480x16)
	int 10h             ; BIOS draw function
	
	mov ah, 0x07        ; function to call with interrupt
	mov bh, 0x01        ; blue background 
	xor cx, cx          ; (0,0)
	mov dx, 0x1D4F      ; (79,29)
	int 0x10            ; BIOS draw function
	
	mov al, 15          ; color - white
	mov ah, 0ch         ; set pixel
	mov cx, 41          ; x co-ordinate
	mov dx, 14          ; y co-ordinate
	int 10h             ; BIOS draw function

	mov cx, 49
	mov dx, 14
	int 10h
	
	mov cx, 50
	mov dx, 14
	int 10h
	
	mov cx, 51
	mov dx, 14
	int 10h
	
	mov cx, 52
	mov dx, 14
	int 10h
	
	mov cx, 81
	mov dx, 14
	int 10h
	
	mov cx, 113
	mov dx, 14
	int 10h
	
	mov cx, 158
	mov dx, 14
	int 10h
	
	mov cx, 214
	mov dx, 14
	int 10h
	
	mov cx, 246
	mov dx, 14
	int 10h
	
	mov cx, 267
	mov dx, 14
	int 10h
	
	mov cx, 268
	mov dx, 14
	int 10h
	
	mov cx, 286
	mov dx, 14
	int 10h
	
	mov cx, 321
	mov dx, 14
	int 10h
	
	mov cx, 353
	mov dx, 14
	int 10h
	
	mov cx, 401
	mov dx, 14
	int 10h
	
	mov cx, 438
	mov dx, 14
	int 10h
	
	mov cx, 566
	mov dx, 14
	int 10h
	
	mov cx, 41
	mov dx, 15
	int 10h
	
	mov cx, 52
	mov dx, 15
	int 10h
	
	mov cx, 81
	mov dx, 15
	int 10h
	
	mov cx, 113
	mov dx, 15
	int 10h
	
	mov cx, 158
	mov dx, 15
	int 10h
	
	mov cx, 214
	mov dx, 15
	int 10h
	
	mov cx, 246
	mov dx, 15
	int 10h
	
	mov cx, 267
	mov dx, 15
	int 10h
	
	mov cx, 268
	mov dx, 15
	int 10h
	
	mov cx, 286
	mov dx, 15
	int 10h
	
	mov cx, 321
	mov dx, 15
	int 10h
	
	mov cx, 353
	mov dx, 15
	int 10h
	
	mov cx, 401
	mov dx, 15
	int 10h
	
	mov cx, 438
	mov dx, 15
	int 10h
	
	mov cx, 566
	mov dx, 15
	int 10h
	
	mov cx, 3
	mov dx, 16
	int 10h
	
	mov cx, 4
	mov dx, 16
	int 10h
	
	mov cx, 41
	mov dx, 16
	int 10h
	
	mov cx, 52
	mov dx, 16
	int 10h
	
	mov cx, 81
	mov dx, 16
	int 10h
	
	mov cx, 113
	mov dx, 16
	int 10h
	
	mov cx, 158
	mov dx, 16
	int 10h
	
	mov cx, 170
	mov dx, 16
	int 10h
	
	mov cx, 194
	mov dx, 16
	int 10h
	
	mov cx, 214
	mov dx, 16
	int 10h
	
	mov cx, 246
	mov dx, 16
	int 10h
	
	mov cx, 256
	mov dx, 16
	int 10h
	
	mov cx, 263
	mov dx, 16
	int 10h
	
	mov cx, 286
	mov dx, 16
	int 10h
	
	mov cx, 321
	mov dx, 16
	int 10h
	
	mov cx, 353
	mov dx, 16
	int 10h
	
	mov cx, 401
	mov dx, 16
	int 10h
	
	mov cx, 418
	mov dx, 16
	int 10h
	
	mov cx, 438
	mov dx, 16
	int 10h
	
	mov cx, 474
	mov dx, 16
	int 10h
	
	mov cx, 546
	mov dx, 16
	int 10h
	
	mov cx, 566
	mov dx, 16
	int 10h
	
	mov cx, 3
	mov dx, 17
	int 10h
	
	mov cx, 4
	mov dx, 17
	int 10h
	
	mov cx, 17
	mov dx, 17
	int 10h
	
	mov cx, 19
	mov dx, 17
	int 10h
	
	mov cx, 20
	mov dx, 17
	int 10h
	
	mov cx, 21
	mov dx, 17
	int 10h
	
	mov cx, 25
	mov dx, 17
	int 10h
	
	mov cx, 27
	mov dx, 17
	int 10h
	
	mov cx, 28
	mov dx, 17
	int 10h
	
	mov cx, 29
	mov dx, 17
	int 10h
	
	mov cx, 34
	mov dx, 17
	int 10h
	
	mov cx, 35
	mov dx, 17
	int 10h
	
	mov cx, 36
	mov dx, 17
	int 10h
	
	mov cx, 37
	mov dx, 17
	int 10h
	
	mov cx, 41
	mov dx, 17
	int 10h
	
	mov cx, 43
	mov dx, 17
	int 10h
	
	mov cx, 44
	mov dx, 17
	int 10h
	
	mov cx, 45
	mov dx, 17
	int 10h
	
	mov cx, 52
	mov dx, 17
	int 10h
	
	mov cx, 58
	mov dx, 17
	int 10h
	
	mov cx, 59
	mov dx, 17
	int 10h
	
	mov cx, 60
	mov dx, 17
	int 10h
	
	mov cx, 61
	mov dx, 17
	int 10h
	
	mov cx, 64
	mov dx, 17
	int 10h
	
	mov cx, 66
	mov dx, 17
	int 10h
	
	mov cx, 67
	mov dx, 17
	int 10h
	
	mov cx, 69
	mov dx, 17
	int 10h
	
	mov cx, 70
	mov dx, 17
	int 10h
	
	mov cx, 81
	mov dx, 17
	int 10h
	
	mov cx, 83
	mov dx, 17
	int 10h
	
	mov cx, 84
	mov dx, 17
	int 10h
	
	mov cx, 85
	mov dx, 17
	int 10h
	
	mov cx, 90
	mov dx, 17
	int 10h
	
	mov cx, 91
	mov dx, 17
	int 10h
	
	mov cx, 92
	mov dx, 17
	int 10h
	
	mov cx, 98
	mov dx, 17
	int 10h
	
	mov cx, 99
	mov dx, 17
	int 10h
	
	mov cx, 100
	mov dx, 17
	int 10h
	
	mov cx, 101
	mov dx, 17
	int 10h
	
	mov cx, 113
	mov dx, 17
	int 10h
	
	mov cx, 115
	mov dx, 17
	int 10h
	
	mov cx, 116
	mov dx, 17
	int 10h
	
	mov cx, 117
	mov dx, 17
	int 10h
	
	mov cx, 122
	mov dx, 17
	int 10h
	
	mov cx, 123
	mov dx, 17
	int 10h
	
	mov cx, 124
	mov dx, 17
	int 10h
	
	mov cx, 125
	mov dx, 17
	int 10h
	
	mov cx, 130
	mov dx, 17
	int 10h
	
	mov cx, 131
	mov dx, 17
	int 10h
	
	mov cx, 132
	mov dx, 17
	int 10h
	
	mov cx, 133
	mov dx, 17
	int 10h
	
	mov cx, 137
	mov dx, 17
	int 10h
	
	mov cx, 139
	mov dx, 17
	int 10h
	
	mov cx, 140
	mov dx, 17
	int 10h
	
	mov cx, 141
	mov dx, 17
	int 10h
	
	mov cx, 154
	mov dx, 17
	int 10h
	
	mov cx, 155
	mov dx, 17
	int 10h
	
	mov cx, 156
	mov dx, 17
	int 10h
	
	mov cx, 158
	mov dx, 17
	int 10h
	
	mov cx, 162
	mov dx, 17
	int 10h
	
	mov cx, 163
	mov dx, 17
	int 10h
	
	mov cx, 164
	mov dx, 17
	int 10h
	
	mov cx, 165
	mov dx, 17
	int 10h
	
	mov cx, 168
	mov dx, 17
	int 10h
	
	mov cx, 169
	mov dx, 17
	int 10h
	
	mov cx, 170
	mov dx, 17
	int 10h
	
	mov cx, 171
	mov dx, 17
	int 10h
	
	mov cx, 172
	mov dx, 17
	int 10h
	
	mov cx, 173
	mov dx, 17
	int 10h
	
	mov cx, 178
	mov dx, 17
	int 10h
	
	mov cx, 179
	mov dx, 17
	int 10h
	
	mov cx, 180
	mov dx, 17
	int 10h
	
	mov cx, 181
	mov dx, 17
	int 10h
	
	mov cx, 187
	mov dx, 17
	int 10h
	
	mov cx, 188
	mov dx, 17
	int 10h
	
	mov cx, 189
	mov dx, 17
	int 10h
	
	mov cx, 190
	mov dx, 17
	int 10h
	
	mov cx, 192
	mov dx, 17
	int 10h
	
	mov cx, 193
	mov dx, 17
	int 10h
	
	mov cx, 194
	mov dx, 17
	int 10h
	
	mov cx, 195
	mov dx, 17
	int 10h
	
	mov cx, 196
	mov dx, 17
	int 10h
	
	mov cx, 197
	mov dx, 17
	int 10h
	
	mov cx, 202
	mov dx, 17
	int 10h
	
	mov cx, 203
	mov dx, 17
	int 10h
	
	mov cx, 204
	mov dx, 17
	int 10h
	
	mov cx, 205
	mov dx, 17
	int 10h
	
	mov cx, 210
	mov dx, 17
	int 10h
	
	mov cx, 211
	mov dx, 17
	int 10h
	
	mov cx, 212
	mov dx, 17
	int 10h
	
	mov cx, 214
	mov dx, 17
	int 10h
	
	mov cx, 226
	mov dx, 17
	int 10h
	
	mov cx, 227
	mov dx, 17
	int 10h
	
	mov cx, 228
	mov dx, 17
	int 10h
	
	mov cx, 233
	mov dx, 17
	int 10h
	
	mov cx, 235
	mov dx, 17
	int 10h
	
	mov cx, 236
	mov dx, 17
	int 10h
	
	mov cx, 237
	mov dx, 17
	int 10h
	
	mov cx, 242
	mov dx, 17
	int 10h
	
	mov cx, 243
	mov dx, 17
	int 10h
	
	mov cx, 244
	mov dx, 17
	int 10h
	
	mov cx, 246
	mov dx, 17
	int 10h
	
	mov cx, 256
	mov dx, 17
	int 10h
	
	mov cx, 263
	mov dx, 17
	int 10h
	
	mov cx, 265
	mov dx, 17
	int 10h
	
	mov cx, 266
	mov dx, 17
	int 10h
	
	mov cx, 267
	mov dx, 17
	int 10h
	
	mov cx, 268
	mov dx, 17
	int 10h
	
	mov cx, 273
	mov dx, 17
	int 10h
	
	mov cx, 275
	mov dx, 17
	int 10h
	
	mov cx, 276
	mov dx, 17
	int 10h
	
	mov cx, 277
	mov dx, 17
	int 10h
	
	mov cx, 282
	mov dx, 17
	int 10h
	
	mov cx, 283
	mov dx, 17
	int 10h
	
	mov cx, 284
	mov dx, 17
	int 10h
	
	mov cx, 286
	mov dx, 17
	int 10h
	
	mov cx, 290
	mov dx, 17
	int 10h
	
	mov cx, 291
	mov dx, 17
	int 10h
	
	mov cx, 292
	mov dx, 17
	int 10h
	
	mov cx, 293
	mov dx, 17
	int 10h
	
	mov cx, 296
	mov dx, 17
	int 10h
	
	mov cx, 303
	mov dx, 17
	int 10h
	
	mov cx, 306
	mov dx, 17
	int 10h
	
	mov cx, 307
	mov dx, 17
	int 10h
	
	mov cx, 308
	mov dx, 17
	int 10h
	
	mov cx, 309
	mov dx, 17
	int 10h
	
	mov cx, 321
	mov dx, 17
	int 10h
	
	mov cx, 323
	mov dx, 17
	int 10h
	
	mov cx, 324
	mov dx, 17
	int 10h
	
	mov cx, 325
	mov dx, 17
	int 10h
	
	mov cx, 330
	mov dx, 17
	int 10h
	
	mov cx, 331
	mov dx, 17
	int 10h
	
	mov cx, 332
	mov dx, 17
	int 10h
	
	mov cx, 338
	mov dx, 17
	int 10h
	
	mov cx, 339
	mov dx, 17
	int 10h
	
	mov cx, 340
	mov dx, 17
	int 10h
	
	mov cx, 341
	mov dx, 17
	int 10h
	
	mov cx, 353
	mov dx, 17
	int 10h
	
	mov cx, 355
	mov dx, 17
	int 10h
	
	mov cx, 356
	mov dx, 17
	int 10h
	
	mov cx, 357
	mov dx, 17
	int 10h
	
	mov cx, 362
	mov dx, 17
	int 10h
	
	mov cx, 363
	mov dx, 17
	int 10h
	
	mov cx, 364
	mov dx, 17
	int 10h
	
	mov cx, 365
	mov dx, 17
	int 10h
	
	mov cx, 370
	mov dx, 17
	int 10h
	
	mov cx, 371
	mov dx, 17
	int 10h
	
	mov cx, 372
	mov dx, 17
	int 10h
	
	mov cx, 373
	mov dx, 17
	int 10h
	
	mov cx, 377
	mov dx, 17
	int 10h
	
	mov cx, 379
	mov dx, 17
	int 10h
	
	mov cx, 380
	mov dx, 17
	int 10h
	
	mov cx, 381
	mov dx, 17
	int 10h
	
	mov cx, 394
	mov dx, 17
	int 10h
	
	mov cx, 395
	mov dx, 17
	int 10h
	
	mov cx, 396
	mov dx, 17
	int 10h
	
	mov cx, 397
	mov dx, 17
	int 10h
	
	mov cx, 401
	mov dx, 17
	int 10h
	
	mov cx, 403
	mov dx, 17
	int 10h
	
	mov cx, 404
	mov dx, 17
	int 10h
	
	mov cx, 405
	mov dx, 17
	int 10h
	
	mov cx, 409
	mov dx, 17
	int 10h
	
	mov cx, 414
	mov dx, 17
	int 10h
	
	mov cx, 416
	mov dx, 17
	int 10h
	
	mov cx, 417
	mov dx, 17
	int 10h
	
	mov cx, 418
	mov dx, 17
	int 10h
	
	mov cx, 419
	mov dx, 17
	int 10h
	
	mov cx, 420
	mov dx, 17
	int 10h
	
	mov cx, 421
	mov dx, 17
	int 10h
	
	mov cx, 434
	mov dx, 17
	int 10h
	
	mov cx, 435
	mov dx, 17
	int 10h
	
	mov cx, 436
	mov dx, 17
	int 10h
	
	mov cx, 438
	mov dx, 17
	int 10h
	
	mov cx, 442
	mov dx, 17
	int 10h
	
	mov cx, 443
	mov dx, 17
	int 10h
	
	mov cx, 444
	mov dx, 17
	int 10h
	
	mov cx, 445
	mov dx, 17
	int 10h
	
	mov cx, 448
	mov dx, 17
	int 10h
	
	mov cx, 455
	mov dx, 17
	int 10h
	
	mov cx, 457
	mov dx, 17
	int 10h
	
	mov cx, 459
	mov dx, 17
	int 10h
	
	mov cx, 460
	mov dx, 17
	int 10h
	
	mov cx, 461
	mov dx, 17
	int 10h
	
	mov cx, 472
	mov dx, 17
	int 10h
	
	mov cx, 473
	mov dx, 17
	int 10h
	
	mov cx, 474
	mov dx, 17
	int 10h
	
	mov cx, 475
	mov dx, 17
	int 10h
	
	mov cx, 476
	mov dx, 17
	int 10h
	
	mov cx, 477
	mov dx, 17
	int 10h
	
	mov cx, 482
	mov dx, 17
	int 10h
	
	mov cx, 483
	mov dx, 17
	int 10h
	
	mov cx, 484
	mov dx, 17
	int 10h
	
	mov cx, 485
	mov dx, 17
	int 10h
	
	mov cx, 497
	mov dx, 17
	int 10h
	
	mov cx, 499
	mov dx, 17
	int 10h
	
	mov cx, 500
	mov dx, 17
	int 10h
	
	mov cx, 501
	mov dx, 17
	int 10h
	
	mov cx, 505
	mov dx, 17
	int 10h
	
	mov cx, 507
	mov dx, 17
	int 10h
	
	mov cx, 508
	mov dx, 17
	int 10h
	
	mov cx, 509
	mov dx, 17
	int 10h
	
	mov cx, 514
	mov dx, 17
	int 10h
	
	mov cx, 515
	mov dx, 17
	int 10h
	
	mov cx, 516
	mov dx, 17
	int 10h
	
	mov cx, 517
	mov dx, 17
	int 10h
	
	mov cx, 520
	mov dx, 17
	int 10h
	
	mov cx, 526
	mov dx, 17
	int 10h
	
	mov cx, 530
	mov dx, 17
	int 10h
	
	mov cx, 531
	mov dx, 17
	int 10h
	
	mov cx, 532
	mov dx, 17
	int 10h
	
	mov cx, 533
	mov dx, 17
	int 10h
	
	mov cx, 537
	mov dx, 17
	int 10h
	
	mov cx, 539
	mov dx, 17
	int 10h
	
	mov cx, 540
	mov dx, 17
	int 10h
	
	mov cx, 541
	mov dx, 17
	int 10h
	
	mov cx, 544
	mov dx, 17
	int 10h
	
	mov cx, 545
	mov dx, 17
	int 10h
	
	mov cx, 546
	mov dx, 17
	int 10h
	
	mov cx, 547
	mov dx, 17
	int 10h
	
	mov cx, 548
	mov dx, 17
	int 10h
	
	mov cx, 549
	mov dx, 17
	int 10h
	
	mov cx, 562
	mov dx, 17
	int 10h
	
	mov cx, 563
	mov dx, 17
	int 10h
	
	mov cx, 564
	mov dx, 17
	int 10h
	
	mov cx, 566
	mov dx, 17
	int 10h
	
	mov cx, 570
	mov dx, 17
	int 10h
	
	mov cx, 571
	mov dx, 17
	int 10h
	
	mov cx, 572
	mov dx, 17
	int 10h
	
	mov cx, 576
	mov dx, 17
	int 10h
	
	mov cx, 578
	mov dx, 17
	int 10h
	
	mov cx, 579
	mov dx, 17
	int 10h
	
	mov cx, 581
	mov dx, 17
	int 10h
	
	mov cx, 582
	mov dx, 17
	int 10h
	
	mov cx, 586
	mov dx, 17
	int 10h
	
	mov cx, 587
	mov dx, 17
	int 10h
	
	mov cx, 588
	mov dx, 17
	int 10h
	
	mov cx, 594
	mov dx, 17
	int 10h
	
	mov cx, 595
	mov dx, 17
	int 10h
	
	mov cx, 596
	mov dx, 17
	int 10h
	
	mov cx, 598
	mov dx, 17
	int 10h
	
	mov cx, 602
	mov dx, 17
	int 10h
	
	mov cx, 603
	mov dx, 17
	int 10h
	
	mov cx, 604
	mov dx, 17
	int 10h
	
	mov cx, 605
	mov dx, 17
	int 10h
	
	mov cx, 2
	mov dx, 18
	int 10h
	
	mov cx, 5
	mov dx, 18
	int 10h
	
	mov cx, 17
	mov dx, 18
	int 10h
	
	mov cx, 18
	mov dx, 18
	int 10h
	
	mov cx, 22
	mov dx, 18
	int 10h
	
	mov cx, 25
	mov dx, 18
	int 10h
	
	mov cx, 26
	mov dx, 18
	int 10h
	
	mov cx, 29
	mov dx, 18
	int 10h
	
	mov cx, 33
	mov dx, 18
	int 10h
	
	mov cx, 38
	mov dx, 18
	int 10h
	
	mov cx, 41
	mov dx, 18
	int 10h
	
	mov cx, 42
	mov dx, 18
	int 10h
	
	mov cx, 46
	mov dx, 18
	int 10h
	
	mov cx, 52
	mov dx, 18
	int 10h
	
	mov cx, 58
	mov dx, 18
	int 10h
	
	mov cx, 62
	mov dx, 18
	int 10h
	
	mov cx, 64
	mov dx, 18
	int 10h
	
	mov cx, 65
	mov dx, 18
	int 10h
	
	mov cx, 67
	mov dx, 18
	int 10h
	
	mov cx, 68
	mov dx, 18
	int 10h
	
	mov cx, 70
	mov dx, 18
	int 10h
	
	mov cx, 81
	mov dx, 18
	int 10h
	
	mov cx, 82
	mov dx, 18
	int 10h
	
	mov cx, 86
	mov dx, 18
	int 10h
	
	mov cx, 93
	mov dx, 18
	int 10h
	
	mov cx, 97
	mov dx, 18
	int 10h
	
	mov cx, 113
	mov dx, 18
	int 10h
	
	mov cx, 114
	mov dx, 18
	int 10h
	
	mov cx, 118
	mov dx, 18
	int 10h
	
	mov cx, 122
	mov dx, 18
	int 10h
	
	mov cx, 126
	mov dx, 18
	int 10h
	
	mov cx, 130
	mov dx, 18
	int 10h
	
	mov cx, 134
	mov dx, 18
	int 10h
	
	mov cx, 137
	mov dx, 18
	int 10h
	
	mov cx, 138
	mov dx, 18
	int 10h
	
	mov cx, 142
	mov dx, 18
	int 10h
	
	mov cx, 153
	mov dx, 18
	int 10h
	
	mov cx, 157
	mov dx, 18
	int 10h
	
	mov cx, 158
	mov dx, 18
	int 10h
	
	mov cx, 162
	mov dx, 18
	int 10h
	
	mov cx, 166
	mov dx, 18
	int 10h
	
	mov cx, 170
	mov dx, 18
	int 10h
	
	mov cx, 178
	mov dx, 18
	int 10h
	
	mov cx, 182
	mov dx, 18
	int 10h
	
	mov cx, 186
	mov dx, 18
	int 10h
	
	mov cx, 194
	mov dx, 18
	int 10h
	
	mov cx, 202
	mov dx, 18
	int 10h
	
	mov cx, 206
	mov dx, 18
	int 10h
	
	mov cx, 209
	mov dx, 18
	int 10h
	
	mov cx, 213
	mov dx, 18
	int 10h
	
	mov cx, 214
	mov dx, 18
	int 10h
	
	mov cx, 229
	mov dx, 18
	int 10h
	
	mov cx, 233
	mov dx, 18
	int 10h
	
	mov cx, 234
	mov dx, 18
	int 10h
	
	mov cx, 238
	mov dx, 18
	int 10h
	
	mov cx, 241
	mov dx, 18
	int 10h
	
	mov cx, 245
	mov dx, 18
	int 10h
	
	mov cx, 246
	mov dx, 18
	int 10h
	
	mov cx, 256
	mov dx, 18
	int 10h
	
	mov cx, 259
	mov dx, 18
	int 10h
	
	mov cx, 262
	mov dx, 18
	int 10h
	
	mov cx, 268
	mov dx, 18
	int 10h
	
	mov cx, 273
	mov dx, 18
	int 10h
	
	mov cx, 274
	mov dx, 18
	int 10h
	
	mov cx, 278
	mov dx, 18
	int 10h
	
	mov cx, 281
	mov dx, 18
	int 10h
	
	mov cx, 285
	mov dx, 18
	int 10h
	
	mov cx, 286
	mov dx, 18
	int 10h
	
	mov cx, 289
	mov dx, 18
	int 10h
	
	mov cx, 294
	mov dx, 18
	int 10h
	
	mov cx, 296
	mov dx, 18
	int 10h
	
	mov cx, 299
	mov dx, 18
	int 10h
	
	mov cx, 303
	mov dx, 18
	int 10h
	
	mov cx, 305
	mov dx, 18
	int 10h
	
	mov cx, 321
	mov dx, 18
	int 10h
	
	mov cx, 322
	mov dx, 18
	int 10h
	
	mov cx, 326
	mov dx, 18
	int 10h
	
	mov cx, 333
	mov dx, 18
	int 10h
	
	mov cx, 337
	mov dx, 18
	int 10h
	
	mov cx, 353
	mov dx, 18
	int 10h
	
	mov cx, 354
	mov dx, 18
	int 10h
	
	mov cx, 358
	mov dx, 18
	int 10h
	
	mov cx, 362
	mov dx, 18
	int 10h
	
	mov cx, 366
	mov dx, 18
	int 10h
	
	mov cx, 370
	mov dx, 18
	int 10h
	
	mov cx, 374
	mov dx, 18
	int 10h
	
	mov cx, 377
	mov dx, 18
	int 10h
	
	mov cx, 378
	mov dx, 18
	int 10h
	
	mov cx, 382
	mov dx, 18
	int 10h
	
	mov cx, 393
	mov dx, 18
	int 10h
	
	mov cx, 401
	mov dx, 18
	int 10h
	
	mov cx, 402
	mov dx, 18
	int 10h
	
	mov cx, 406
	mov dx, 18
	int 10h
	
	mov cx, 409
	mov dx, 18
	int 10h
	
	mov cx, 414
	mov dx, 18
	int 10h
	
	mov cx, 418
	mov dx, 18
	int 10h
	
	mov cx, 433
	mov dx, 18
	int 10h
	
	mov cx, 437
	mov dx, 18
	int 10h
	
	mov cx, 438
	mov dx, 18
	int 10h
	
	mov cx, 441
	mov dx, 18
	int 10h
	
	mov cx, 446
	mov dx, 18
	int 10h
	
	mov cx, 448
	mov dx, 18
	int 10h
	
	mov cx, 451
	mov dx, 18
	int 10h
	
	mov cx, 455
	mov dx, 18
	int 10h
	
	mov cx, 457
	mov dx, 18
	int 10h
	
	mov cx, 458
	mov dx, 18
	int 10h
	
	mov cx, 462
	mov dx, 18
	int 10h
	
	mov cx, 474
	mov dx, 18
	int 10h
	
	mov cx, 481
	mov dx, 18
	int 10h
	
	mov cx, 486
	mov dx, 18
	int 10h
	
	mov cx, 497
	mov dx, 18
	int 10h
	
	mov cx, 498
	mov dx, 18
	int 10h
	
	mov cx, 502
	mov dx, 18
	int 10h
	
	mov cx, 505
	mov dx, 18
	int 10h
	
	mov cx, 506
	mov dx, 18
	int 10h
	
	mov cx, 509
	mov dx, 18
	int 10h
	
	mov cx, 514
	mov dx, 18
	int 10h
	
	mov cx, 518
	mov dx, 18
	int 10h
	
	mov cx, 521
	mov dx, 18
	int 10h
	
	mov cx, 525
	mov dx, 18
	int 10h
	
	mov cx, 530
	mov dx, 18
	int 10h
	
	mov cx, 534
	mov dx, 18
	int 10h
	
	mov cx, 537
	mov dx, 18
	int 10h
	
	mov cx, 538
	mov dx, 18
	int 10h
	
	mov cx, 542
	mov dx, 18
	int 10h
	
	mov cx, 546
	mov dx, 18
	int 10h
	
	mov cx, 561
	mov dx, 18
	int 10h
	
	mov cx, 565
	mov dx, 18
	int 10h
	
	mov cx, 566
	mov dx, 18
	int 10h
	
	mov cx, 573
	mov dx, 18
	int 10h
	
	mov cx, 576
	mov dx, 18
	int 10h
	
	mov cx, 577
	mov dx, 18
	int 10h
	
	mov cx, 579
	mov dx, 18
	int 10h
	
	mov cx, 580
	mov dx, 18
	int 10h
	
	mov cx, 582
	mov dx, 18
	int 10h
	
	mov cx, 589
	mov dx, 18
	int 10h
	
	mov cx, 593
	mov dx, 18
	int 10h
	
	mov cx, 597
	mov dx, 18
	int 10h
	
	mov cx, 598
	mov dx, 18
	int 10h
	
	mov cx, 602
	mov dx, 18
	int 10h
	
	mov cx, 606
	mov dx, 18
	int 10h
	
	mov cx, 2
	mov dx, 19
	int 10h
	
	mov cx, 5
	mov dx, 19
	int 10h
	
	mov cx, 17
	mov dx, 19
	int 10h
	
	mov cx, 22
	mov dx, 19
	int 10h
	
	mov cx, 25
	mov dx, 19
	int 10h
	
	mov cx, 33
	mov dx, 19
	int 10h
	
	mov cx, 38
	mov dx, 19
	int 10h
	
	mov cx, 41
	mov dx, 19
	int 10h
	
	mov cx, 46
	mov dx, 19
	int 10h
	
	mov cx, 52
	mov dx, 19
	int 10h
	
	mov cx, 57
	mov dx, 19
	int 10h
	
	mov cx, 62
	mov dx, 19
	int 10h
	
	mov cx, 64
	mov dx, 19
	int 10h
	
	mov cx, 67
	mov dx, 19
	int 10h
	
	mov cx, 70
	mov dx, 19
	int 10h
	
	mov cx, 81
	mov dx, 19
	int 10h
	
	mov cx, 86
	mov dx, 19
	int 10h
	
	mov cx, 93
	mov dx, 19
	int 10h
	
	mov cx, 97
	mov dx, 19
	int 10h
	
	mov cx, 98
	mov dx, 19
	int 10h
	
	mov cx, 113
	mov dx, 19
	int 10h
	
	mov cx, 118
	mov dx, 19
	int 10h
	
	mov cx, 121
	mov dx, 19
	int 10h
	
	mov cx, 126
	mov dx, 19
	int 10h
	
	mov cx, 129
	mov dx, 19
	int 10h
	
	mov cx, 134
	mov dx, 19
	int 10h
	
	mov cx, 137
	mov dx, 19
	int 10h
	
	mov cx, 142
	mov dx, 19
	int 10h
	
	mov cx, 153
	mov dx, 19
	int 10h
	
	mov cx, 158
	mov dx, 19
	int 10h
	
	mov cx, 161
	mov dx, 19
	int 10h
	
	mov cx, 166
	mov dx, 19
	int 10h
	
	mov cx, 170
	mov dx, 19
	int 10h
	
	mov cx, 177
	mov dx, 19
	int 10h
	
	mov cx, 182
	mov dx, 19
	int 10h
	
	mov cx, 185
	mov dx, 19
	int 10h
	
	mov cx, 194
	mov dx, 19
	int 10h
	
	mov cx, 201
	mov dx, 19
	int 10h
	
	mov cx, 206
	mov dx, 19
	int 10h
	
	mov cx, 209
	mov dx, 19
	int 10h
	
	mov cx, 214
	mov dx, 19
	int 10h
	
	mov cx, 229
	mov dx, 19
	int 10h
	
	mov cx, 233
	mov dx, 19
	int 10h
	
	mov cx, 238
	mov dx, 19
	int 10h
	
	mov cx, 241
	mov dx, 19
	int 10h
	
	mov cx, 246
	mov dx, 19
	int 10h
	
	mov cx, 257
	mov dx, 19
	int 10h
	
	mov cx, 259
	mov dx, 19
	int 10h
	
	mov cx, 260
	mov dx, 19
	int 10h
	
	mov cx, 262
	mov dx, 19
	int 10h
	
	mov cx, 268
	mov dx, 19
	int 10h
	
	mov cx, 273
	mov dx, 19
	int 10h
	
	mov cx, 278
	mov dx, 19
	int 10h
	
	mov cx, 281
	mov dx, 19
	int 10h
	
	mov cx, 286
	mov dx, 19
	int 10h
	
	mov cx, 289
	mov dx, 19
	int 10h
	
	mov cx, 294
	mov dx, 19
	int 10h
	
	mov cx, 297
	mov dx, 19
	int 10h
	
	mov cx, 299
	mov dx, 19
	int 10h
	
	mov cx, 300
	mov dx, 19
	int 10h
	
	mov cx, 302
	mov dx, 19
	int 10h
	
	mov cx, 305
	mov dx, 19
	int 10h
	
	mov cx, 306
	mov dx, 19
	int 10h
	
	mov cx, 321
	mov dx, 19
	int 10h
	
	mov cx, 326
	mov dx, 19
	int 10h
	
	mov cx, 333
	mov dx, 19
	int 10h
	
	mov cx, 337
	mov dx, 19
	int 10h
	
	mov cx, 338
	mov dx, 19
	int 10h
	
	mov cx, 353
	mov dx, 19
	int 10h
	
	mov cx, 358
	mov dx, 19
	int 10h
	
	mov cx, 361
	mov dx, 19
	int 10h
	
	mov cx, 366
	mov dx, 19
	int 10h
	
	mov cx, 369
	mov dx, 19
	int 10h
	
	mov cx, 374
	mov dx, 19
	int 10h
	
	mov cx, 377
	mov dx, 19
	int 10h
	
	mov cx, 382
	mov dx, 19
	int 10h
	
	mov cx, 393
	mov dx, 19
	int 10h
	
	mov cx, 394
	mov dx, 19
	int 10h
	
	mov cx, 401
	mov dx, 19
	int 10h
	
	mov cx, 406
	mov dx, 19
	int 10h
	
	mov cx, 409
	mov dx, 19
	int 10h
	
	mov cx, 414
	mov dx, 19
	int 10h
	
	mov cx, 418
	mov dx, 19
	int 10h
	
	mov cx, 433
	mov dx, 19
	int 10h
	
	mov cx, 438
	mov dx, 19
	int 10h
	
	mov cx, 441
	mov dx, 19
	int 10h
	
	mov cx, 446
	mov dx, 19
	int 10h
	
	mov cx, 449
	mov dx, 19
	int 10h
	
	mov cx, 451
	mov dx, 19
	int 10h
	
	mov cx, 452
	mov dx, 19
	int 10h
	
	mov cx, 454
	mov dx, 19
	int 10h
	
	mov cx, 457
	mov dx, 19
	int 10h
	
	mov cx, 462
	mov dx, 19
	int 10h
	
	mov cx, 474
	mov dx, 19
	int 10h
	
	mov cx, 481
	mov dx, 19
	int 10h
	
	mov cx, 486
	mov dx, 19
	int 10h
	
	mov cx, 497
	mov dx, 19
	int 10h
	
	mov cx, 502
	mov dx, 19
	int 10h
	
	mov cx, 505
	mov dx, 19
	int 10h
	
	mov cx, 513
	mov dx, 19
	int 10h
	
	mov cx, 518
	mov dx, 19
	int 10h
	
	mov cx, 521
	mov dx, 19
	int 10h
	
	mov cx, 525
	mov dx, 19
	int 10h
	
	mov cx, 529
	mov dx, 19
	int 10h
	
	mov cx, 534
	mov dx, 19
	int 10h
	
	mov cx, 537
	mov dx, 19
	int 10h
	
	mov cx, 542
	mov dx, 19
	int 10h
	
	mov cx, 546
	mov dx, 19
	int 10h
	
	mov cx, 561
	mov dx, 19
	int 10h
	
	mov cx, 566
	mov dx, 19
	int 10h
	
	mov cx, 573
	mov dx, 19
	int 10h
	
	mov cx, 576
	mov dx, 19
	int 10h
	
	mov cx, 579
	mov dx, 19
	int 10h
	
	mov cx, 582
	mov dx, 19
	int 10h
	
	mov cx, 589
	mov dx, 19
	int 10h
	
	mov cx, 593
	mov dx, 19
	int 10h
	
	mov cx, 598
	mov dx, 19
	int 10h
	
	mov cx, 601
	mov dx, 19
	int 10h
	
	mov cx, 606
	mov dx, 19
	int 10h
	
	mov cx, 2
	mov dx, 20
	int 10h
	
	mov cx, 5
	mov dx, 20
	int 10h
	
	mov cx, 17
	mov dx, 20
	int 10h
	
	mov cx, 22
	mov dx, 20
	int 10h
	
	mov cx, 25
	mov dx, 20
	int 10h
	
	mov cx, 33
	mov dx, 20
	int 10h
	
	mov cx, 38
	mov dx, 20
	int 10h
	
	mov cx, 41
	mov dx, 20
	int 10h
	
	mov cx, 46
	mov dx, 20
	int 10h
	
	mov cx, 52
	mov dx, 20
	int 10h
	
	mov cx, 57
	mov dx, 20
	int 10h
	
	mov cx, 58
	mov dx, 20
	int 10h
	
	mov cx, 59
	mov dx, 20
	int 10h
	
	mov cx, 60
	mov dx, 20
	int 10h
	
	mov cx, 61
	mov dx, 20
	int 10h
	
	mov cx, 62
	mov dx, 20
	int 10h
	
	mov cx, 64
	mov dx, 20
	int 10h
	
	mov cx, 67
	mov dx, 20
	int 10h
	
	mov cx, 70
	mov dx, 20
	int 10h
	
	mov cx, 81
	mov dx, 20
	int 10h
	
	mov cx, 86
	mov dx, 20
	int 10h
	
	mov cx, 90
	mov dx, 20
	int 10h
	
	mov cx, 91
	mov dx, 20
	int 10h
	
	mov cx, 92
	mov dx, 20
	int 10h
	
	mov cx, 93
	mov dx, 20
	int 10h
	
	mov cx, 99
	mov dx, 20
	int 10h
	
	mov cx, 100
	mov dx, 20
	int 10h
	
	mov cx, 113
	mov dx, 20
	int 10h
	
	mov cx, 118
	mov dx, 20
	int 10h
	
	mov cx, 121
	mov dx, 20
	int 10h
	
	mov cx, 122
	mov dx, 20
	int 10h
	
	mov cx, 123
	mov dx, 20
	int 10h
	
	mov cx, 124
	mov dx, 20
	int 10h
	
	mov cx, 125
	mov dx, 20
	int 10h
	
	mov cx, 126
	mov dx, 20
	int 10h
	
	mov cx, 129
	mov dx, 20
	int 10h
	
	mov cx, 130
	mov dx, 20
	int 10h
	
	mov cx, 131
	mov dx, 20
	int 10h
	
	mov cx, 132
	mov dx, 20
	int 10h
	
	mov cx, 133
	mov dx, 20
	int 10h
	
	mov cx, 134
	mov dx, 20
	int 10h
	
	mov cx, 137
	mov dx, 20
	int 10h
	
	mov cx, 142
	mov dx, 20
	int 10h
	
	mov cx, 153
	mov dx, 20
	int 10h
	
	mov cx, 158
	mov dx, 20
	int 10h
	
	mov cx, 161
	mov dx, 20
	int 10h
	
	mov cx, 162
	mov dx, 20
	int 10h
	
	mov cx, 163
	mov dx, 20
	int 10h
	
	mov cx, 164
	mov dx, 20
	int 10h
	
	mov cx, 165
	mov dx, 20
	int 10h
	
	mov cx, 166
	mov dx, 20
	int 10h
	
	mov cx, 170
	mov dx, 20
	int 10h
	
	mov cx, 177
	mov dx, 20
	int 10h
	
	mov cx, 178
	mov dx, 20
	int 10h
	
	mov cx, 179
	mov dx, 20
	int 10h
	
	mov cx, 180
	mov dx, 20
	int 10h
	
	mov cx, 181
	mov dx, 20
	int 10h
	
	mov cx, 182
	mov dx, 20
	int 10h
	
	mov cx, 185
	mov dx, 20
	int 10h
	
	mov cx, 194
	mov dx, 20
	int 10h
	
	mov cx, 201
	mov dx, 20
	int 10h
	
	mov cx, 202
	mov dx, 20
	int 10h
	
	mov cx, 203
	mov dx, 20
	int 10h
	
	mov cx, 204
	mov dx, 20
	int 10h
	
	mov cx, 205
	mov dx, 20
	int 10h
	
	mov cx, 206
	mov dx, 20
	int 10h
	
	mov cx, 209
	mov dx, 20
	int 10h
	
	mov cx, 214
	mov dx, 20
	int 10h
	
	mov cx, 226
	mov dx, 20
	int 10h
	
	mov cx, 227
	mov dx, 20
	int 10h
	
	mov cx, 228
	mov dx, 20
	int 10h
	
	mov cx, 229
	mov dx, 20
	int 10h
	
	mov cx, 233
	mov dx, 20
	int 10h
	
	mov cx, 238
	mov dx, 20
	int 10h
	
	mov cx, 241
	mov dx, 20
	int 10h
	
	mov cx, 246
	mov dx, 20
	int 10h
	
	mov cx, 257
	mov dx, 20
	int 10h
	
	mov cx, 259
	mov dx, 20
	int 10h
	
	mov cx, 260
	mov dx, 20
	int 10h
	
	mov cx, 262
	mov dx, 20
	int 10h
	
	mov cx, 268
	mov dx, 20
	int 10h
	
	mov cx, 273
	mov dx, 20
	int 10h
	
	mov cx, 278
	mov dx, 20
	int 10h
	
	mov cx, 281
	mov dx, 20
	int 10h
	
	mov cx, 286
	mov dx, 20
	int 10h
	
	mov cx, 289
	mov dx, 20
	int 10h
	
	mov cx, 294
	mov dx, 20
	int 10h
	
	mov cx, 297
	mov dx, 20
	int 10h
	
	mov cx, 299
	mov dx, 20
	int 10h
	
	mov cx, 300
	mov dx, 20
	int 10h
	
	mov cx, 302
	mov dx, 20
	int 10h
	
	mov cx, 307
	mov dx, 20
	int 10h
	
	mov cx, 308
	mov dx, 20
	int 10h
	
	mov cx, 321
	mov dx, 20
	int 10h
	
	mov cx, 326
	mov dx, 20
	int 10h
	
	mov cx, 330
	mov dx, 20
	int 10h
	
	mov cx, 331
	mov dx, 20
	int 10h
	
	mov cx, 332
	mov dx, 20
	int 10h
	
	mov cx, 333
	mov dx, 20
	int 10h
	
	mov cx, 339
	mov dx, 20
	int 10h
	
	mov cx, 340
	mov dx, 20
	int 10h
	
	mov cx, 353
	mov dx, 20
	int 10h
	
	mov cx, 358
	mov dx, 20
	int 10h
	
	mov cx, 361
	mov dx, 20
	int 10h
	
	mov cx, 362
	mov dx, 20
	int 10h
	
	mov cx, 363
	mov dx, 20
	int 10h
	
	mov cx, 364
	mov dx, 20
	int 10h
	
	mov cx, 365
	mov dx, 20
	int 10h
	
	mov cx, 366
	mov dx, 20
	int 10h
	
	mov cx, 369
	mov dx, 20
	int 10h
	
	mov cx, 370
	mov dx, 20
	int 10h
	
	mov cx, 371
	mov dx, 20
	int 10h
	
	mov cx, 372
	mov dx, 20
	int 10h
	
	mov cx, 373
	mov dx, 20
	int 10h
	
	mov cx, 374
	mov dx, 20
	int 10h
	
	mov cx, 377
	mov dx, 20
	int 10h
	
	mov cx, 382
	mov dx, 20
	int 10h
	
	mov cx, 395
	mov dx, 20
	int 10h
	
	mov cx, 396
	mov dx, 20
	int 10h
	
	mov cx, 401
	mov dx, 20
	int 10h
	
	mov cx, 406
	mov dx, 20
	int 10h
	
	mov cx, 409
	mov dx, 20
	int 10h
	
	mov cx, 414
	mov dx, 20
	int 10h
	
	mov cx, 418
	mov dx, 20
	int 10h
	
	mov cx, 433
	mov dx, 20
	int 10h
	
	mov cx, 438
	mov dx, 20
	int 10h
	
	mov cx, 441
	mov dx, 20
	int 10h
	
	mov cx, 446
	mov dx, 20
	int 10h
	
	mov cx, 449
	mov dx, 20
	int 10h
	
	mov cx, 451
	mov dx, 20
	int 10h
	
	mov cx, 452
	mov dx, 20
	int 10h
	
	mov cx, 454
	mov dx, 20
	int 10h
	
	mov cx, 457
	mov dx, 20
	int 10h
	
	mov cx, 462
	mov dx, 20
	int 10h
	
	mov cx, 474
	mov dx, 20
	int 10h
	
	mov cx, 481
	mov dx, 20
	int 10h
	
	mov cx, 486
	mov dx, 20
	int 10h
	
	mov cx, 497
	mov dx, 20
	int 10h
	
	mov cx, 502
	mov dx, 20
	int 10h
	
	mov cx, 505
	mov dx, 20
	int 10h
	
	mov cx, 513
	mov dx, 20
	int 10h
	
	mov cx, 514
	mov dx, 20
	int 10h
	
	mov cx, 515
	mov dx, 20
	int 10h
	
	mov cx, 516
	mov dx, 20
	int 10h
	
	mov cx, 517
	mov dx, 20
	int 10h
	
	mov cx, 518
	mov dx, 20
	int 10h
	
	mov cx, 521
	mov dx, 20
	int 10h
	
	mov cx, 525
	mov dx, 20
	int 10h
	
	mov cx, 529
	mov dx, 20
	int 10h
	
	mov cx, 530
	mov dx, 20
	int 10h
	
	mov cx, 531
	mov dx, 20
	int 10h
	
	mov cx, 532
	mov dx, 20
	int 10h
	
	mov cx, 533
	mov dx, 20
	int 10h
	
	mov cx, 534
	mov dx, 20
	int 10h
	
	mov cx, 537
	mov dx, 20
	int 10h
	
	mov cx, 542
	mov dx, 20
	int 10h
	
	mov cx, 546
	mov dx, 20
	int 10h
	
	mov cx, 561
	mov dx, 20
	int 10h
	
	mov cx, 566
	mov dx, 20
	int 10h
	
	mov cx, 570
	mov dx, 20
	int 10h
	
	mov cx, 571
	mov dx, 20
	int 10h
	
	mov cx, 572
	mov dx, 20
	int 10h
	
	mov cx, 573
	mov dx, 20
	int 10h
	
	mov cx, 576
	mov dx, 20
	int 10h
	
	mov cx, 579
	mov dx, 20
	int 10h
	
	mov cx, 582
	mov dx, 20
	int 10h
	
	mov cx, 586
	mov dx, 20
	int 10h
	
	mov cx, 587
	mov dx, 20
	int 10h
	
	mov cx, 588
	mov dx, 20
	int 10h
	
	mov cx, 589
	mov dx, 20
	int 10h
	
	mov cx, 593
	mov dx, 20
	int 10h
	
	mov cx, 598
	mov dx, 20
	int 10h
	
	mov cx, 601
	mov dx, 20
	int 10h
	
	mov cx, 602
	mov dx, 20
	int 10h
	
	mov cx, 603
	mov dx, 20
	int 10h
	
	mov cx, 604
	mov dx, 20
	int 10h
	
	mov cx, 605
	mov dx, 20
	int 10h
	
	mov cx, 606
	mov dx, 20
	int 10h
	
	mov cx, 1
	mov dx, 21
	int 10h
	
	mov cx, 2
	mov dx, 21
	int 10h
	
	mov cx, 3
	mov dx, 21
	int 10h
	
	mov cx, 4
	mov dx, 21
	int 10h
	
	mov cx, 5
	mov dx, 21
	int 10h
	
	mov cx, 6
	mov dx, 21
	int 10h
	
	mov cx, 17
	mov dx, 21
	int 10h
	
	mov cx, 22
	mov dx, 21
	int 10h
	
	mov cx, 25
	mov dx, 21
	int 10h
	
	mov cx, 33
	mov dx, 21
	int 10h
	
	mov cx, 38
	mov dx, 21
	int 10h
	
	mov cx, 41
	mov dx, 21
	int 10h
	
	mov cx, 46
	mov dx, 21
	int 10h
	
	mov cx, 52
	mov dx, 21
	int 10h
	
	mov cx, 57
	mov dx, 21
	int 10h
	
	mov cx, 64
	mov dx, 21
	int 10h
	
	mov cx, 67
	mov dx, 21
	int 10h
	
	mov cx, 70
	mov dx, 21
	int 10h
	
	mov cx, 81
	mov dx, 21
	int 10h
	
	mov cx, 86
	mov dx, 21
	int 10h
	
	mov cx, 89
	mov dx, 21
	int 10h
	
	mov cx, 93
	mov dx, 21
	int 10h
	
	mov cx, 101
	mov dx, 21
	int 10h
	
	mov cx, 113
	mov dx, 21
	int 10h
	
	mov cx, 118
	mov dx, 21
	int 10h
	
	mov cx, 121
	mov dx, 21
	int 10h
	
	mov cx, 129
	mov dx, 21
	int 10h
	
	mov cx, 137
	mov dx, 21
	int 10h
	
	mov cx, 142
	mov dx, 21
	int 10h
	
	mov cx, 153
	mov dx, 21
	int 10h
	
	mov cx, 158
	mov dx, 21
	int 10h
	
	mov cx, 161
	mov dx, 21
	int 10h
	
	mov cx, 170
	mov dx, 21
	int 10h
	
	mov cx, 177
	mov dx, 21
	int 10h
	
	mov cx, 185
	mov dx, 21
	int 10h
	
	mov cx, 194
	mov dx, 21
	int 10h
	
	mov cx, 201
	mov dx, 21
	int 10h
	
	mov cx, 209
	mov dx, 21
	int 10h
	
	mov cx, 214
	mov dx, 21
	int 10h
	
	mov cx, 225
	mov dx, 21
	int 10h
	
	mov cx, 229
	mov dx, 21
	int 10h
	
	mov cx, 233
	mov dx, 21
	int 10h
	
	mov cx, 238
	mov dx, 21
	int 10h
	
	mov cx, 241
	mov dx, 21
	int 10h
	
	mov cx, 246
	mov dx, 21
	int 10h
	
	mov cx, 257
	mov dx, 21
	int 10h
	
	mov cx, 258
	mov dx, 21
	int 10h
	
	mov cx, 260
	mov dx, 21
	int 10h
	
	mov cx, 262
	mov dx, 21
	int 10h
	
	mov cx, 268
	mov dx, 21
	int 10h
	
	mov cx, 273
	mov dx, 21
	int 10h
	
	mov cx, 278
	mov dx, 21
	int 10h
	
	mov cx, 281
	mov dx, 21
	int 10h
	
	mov cx, 286
	mov dx, 21
	int 10h
	
	mov cx, 289
	mov dx, 21
	int 10h
	
	mov cx, 294
	mov dx, 21
	int 10h
	
	mov cx, 297
	mov dx, 21
	int 10h
	
	mov cx, 298
	mov dx, 21
	int 10h
	
	mov cx, 300
	mov dx, 21
	int 10h
	
	mov cx, 302
	mov dx, 21
	int 10h
	
	mov cx, 309
	mov dx, 21
	int 10h
	
	mov cx, 321
	mov dx, 21
	int 10h
	
	mov cx, 326
	mov dx, 21
	int 10h
	
	mov cx, 329
	mov dx, 21
	int 10h
	
	mov cx, 333
	mov dx, 21
	int 10h
	
	mov cx, 341
	mov dx, 21
	int 10h
	
	mov cx, 353
	mov dx, 21
	int 10h
	
	mov cx, 358
	mov dx, 21
	int 10h
	
	mov cx, 361
	mov dx, 21
	int 10h
	
	mov cx, 369
	mov dx, 21
	int 10h
	
	mov cx, 377
	mov dx, 21
	int 10h
	
	mov cx, 382
	mov dx, 21
	int 10h
	
	mov cx, 397
	mov dx, 21
	int 10h
	
	mov cx, 401
	mov dx, 21
	int 10h
	
	mov cx, 406
	mov dx, 21
	int 10h
	
	mov cx, 409
	mov dx, 21
	int 10h
	
	mov cx, 414
	mov dx, 21
	int 10h
	
	mov cx, 418
	mov dx, 21
	int 10h
	
	mov cx, 433
	mov dx, 21
	int 10h
	
	mov cx, 438
	mov dx, 21
	int 10h
	
	mov cx, 441
	mov dx, 21
	int 10h
	
	mov cx, 446
	mov dx, 21
	int 10h
	
	mov cx, 449
	mov dx, 21
	int 10h
	
	mov cx, 450
	mov dx, 21
	int 10h
	
	mov cx, 452
	mov dx, 21
	int 10h
	
	mov cx, 454
	mov dx, 21
	int 10h
	
	mov cx, 457
	mov dx, 21
	int 10h
	
	mov cx, 462
	mov dx, 21
	int 10h
	
	mov cx, 474
	mov dx, 21
	int 10h
	
	mov cx, 481
	mov dx, 21
	int 10h
	
	mov cx, 486
	mov dx, 21
	int 10h
	
	mov cx, 497
	mov dx, 21
	int 10h
	
	mov cx, 502
	mov dx, 21
	int 10h
	
	mov cx, 505
	mov dx, 21
	int 10h
	
	mov cx, 513
	mov dx, 21
	int 10h
	
	mov cx, 522
	mov dx, 21
	int 10h
	
	mov cx, 524
	mov dx, 21
	int 10h
	
	mov cx, 529
	mov dx, 21
	int 10h
	
	mov cx, 537
	mov dx, 21
	int 10h
	
	mov cx, 542
	mov dx, 21
	int 10h
	
	mov cx, 546
	mov dx, 21
	int 10h
	
	mov cx, 561
	mov dx, 21
	int 10h
	
	mov cx, 566
	mov dx, 21
	int 10h
	
	mov cx, 569
	mov dx, 21
	int 10h
	
	mov cx, 573
	mov dx, 21
	int 10h
	
	mov cx, 576
	mov dx, 21
	int 10h
	
	mov cx, 579
	mov dx, 21
	int 10h
	
	mov cx, 582
	mov dx, 21
	int 10h
	
	mov cx, 585
	mov dx, 21
	int 10h
	
	mov cx, 589
	mov dx, 21
	int 10h
	
	mov cx, 593
	mov dx, 21
	int 10h
	
	mov cx, 598
	mov dx, 21
	int 10h
	
	mov cx, 601
	mov dx, 21
	int 10h
	
	mov cx, 1
	mov dx, 22
	int 10h
	
	mov cx, 6
	mov dx, 22
	int 10h
	
	mov cx, 17
	mov dx, 22
	int 10h
	
	mov cx, 18
	mov dx, 22
	int 10h
	
	mov cx, 22
	mov dx, 22
	int 10h
	
	mov cx, 25
	mov dx, 22
	int 10h
	
	mov cx, 33
	mov dx, 22
	int 10h
	
	mov cx, 38
	mov dx, 22
	int 10h
	
	mov cx, 41
	mov dx, 22
	int 10h
	
	mov cx, 42
	mov dx, 22
	int 10h
	
	mov cx, 46
	mov dx, 22
	int 10h
	
	mov cx, 52
	mov dx, 22
	int 10h
	
	mov cx, 57
	mov dx, 22
	int 10h
	
	mov cx, 64
	mov dx, 22
	int 10h
	
	mov cx, 67
	mov dx, 22
	int 10h
	
	mov cx, 70
	mov dx, 22
	int 10h
	
	mov cx, 81
	mov dx, 22
	int 10h
	
	mov cx, 86
	mov dx, 22
	int 10h
	
	mov cx, 89
	mov dx, 22
	int 10h
	
	mov cx, 93
	mov dx, 22
	int 10h
	
	mov cx, 101
	mov dx, 22
	int 10h
	
	mov cx, 113
	mov dx, 22
	int 10h
	
	mov cx, 114
	mov dx, 22
	int 10h
	
	mov cx, 118
	mov dx, 22
	int 10h
	
	mov cx, 121
	mov dx, 22
	int 10h
	
	mov cx, 129
	mov dx, 22
	int 10h
	
	mov cx, 137
	mov dx, 22
	int 10h
	
	mov cx, 142
	mov dx, 22
	int 10h
	
	mov cx, 153
	mov dx, 22
	int 10h
	
	mov cx, 157
	mov dx, 22
	int 10h
	
	mov cx, 158
	mov dx, 22
	int 10h
	
	mov cx, 161
	mov dx, 22
	int 10h
	
	mov cx, 170
	mov dx, 22
	int 10h
	
	mov cx, 177
	mov dx, 22
	int 10h
	
	mov cx, 186
	mov dx, 22
	int 10h
	
	mov cx, 194
	mov dx, 22
	int 10h
	
	mov cx, 201
	mov dx, 22
	int 10h
	
	mov cx, 209
	mov dx, 22
	int 10h
	
	mov cx, 213
	mov dx, 22
	int 10h
	
	mov cx, 214
	mov dx, 22
	int 10h
	
	mov cx, 225
	mov dx, 22
	int 10h
	
	mov cx, 229
	mov dx, 22
	int 10h
	
	mov cx, 233
	mov dx, 22
	int 10h
	
	mov cx, 238
	mov dx, 22
	int 10h
	
	mov cx, 241
	mov dx, 22
	int 10h
	
	mov cx, 245
	mov dx, 22
	int 10h
	
	mov cx, 246
	mov dx, 22
	int 10h
	
	mov cx, 257
	mov dx, 22
	int 10h
	
	mov cx, 258
	mov dx, 22
	int 10h
	
	mov cx, 261
	mov dx, 22
	int 10h
	
	mov cx, 262
	mov dx, 22
	int 10h
	
	mov cx, 268
	mov dx, 22
	int 10h
	
	mov cx, 273
	mov dx, 22
	int 10h
	
	mov cx, 278
	mov dx, 22
	int 10h
	
	mov cx, 281
	mov dx, 22
	int 10h
	
	mov cx, 285
	mov dx, 22
	int 10h
	
	mov cx, 286
	mov dx, 22
	int 10h
	
	mov cx, 289
	mov dx, 22
	int 10h
	
	mov cx, 294
	mov dx, 22
	int 10h
	
	mov cx, 298
	mov dx, 22
	int 10h
	
	mov cx, 301
	mov dx, 22
	int 10h
	
	mov cx, 309
	mov dx, 22
	int 10h
	
	mov cx, 321
	mov dx, 22
	int 10h
	
	mov cx, 326
	mov dx, 22
	int 10h
	
	mov cx, 329
	mov dx, 22
	int 10h
	
	mov cx, 333
	mov dx, 22
	int 10h
	
	mov cx, 341
	mov dx, 22
	int 10h
	
	mov cx, 353
	mov dx, 22
	int 10h
	
	mov cx, 354
	mov dx, 22
	int 10h
	
	mov cx, 358
	mov dx, 22
	int 10h
	
	mov cx, 361
	mov dx, 22
	int 10h
	
	mov cx, 369
	mov dx, 22
	int 10h
	
	mov cx, 377
	mov dx, 22
	int 10h
	
	mov cx, 382
	mov dx, 22
	int 10h
	
	mov cx, 397
	mov dx, 22
	int 10h
	
	mov cx, 401
	mov dx, 22
	int 10h
	
	mov cx, 406
	mov dx, 22
	int 10h
	
	mov cx, 409
	mov dx, 22
	int 10h
	
	mov cx, 413
	mov dx, 22
	int 10h
	
	mov cx, 414
	mov dx, 22
	int 10h
	
	mov cx, 418
	mov dx, 22
	int 10h
	
	mov cx, 433
	mov dx, 22
	int 10h
	
	mov cx, 437
	mov dx, 22
	int 10h
	
	mov cx, 438
	mov dx, 22
	int 10h
	
	mov cx, 441
	mov dx, 22
	int 10h
	
	mov cx, 446
	mov dx, 22
	int 10h
	
	mov cx, 450
	mov dx, 22
	int 10h
	
	mov cx, 453
	mov dx, 22
	int 10h
	
	mov cx, 457
	mov dx, 22
	int 10h
	
	mov cx, 462
	mov dx, 22
	int 10h
	
	mov cx, 474
	mov dx, 22
	int 10h
	
	mov cx, 481
	mov dx, 22
	int 10h
	
	mov cx, 486
	mov dx, 22
	int 10h
	
	mov cx, 497
	mov dx, 22
	int 10h
	
	mov cx, 498
	mov dx, 22
	int 10h
	
	mov cx, 502
	mov dx, 22
	int 10h
	
	mov cx, 505
	mov dx, 22
	int 10h
	
	mov cx, 513
	mov dx, 22
	int 10h
	
	mov cx, 522
	mov dx, 22
	int 10h
	
	mov cx, 524
	mov dx, 22
	int 10h
	
	mov cx, 529
	mov dx, 22
	int 10h
	
	mov cx, 537
	mov dx, 22
	int 10h
	
	mov cx, 542
	mov dx, 22
	int 10h
	
	mov cx, 546
	mov dx, 22
	int 10h
	
	mov cx, 561
	mov dx, 22
	int 10h
	
	mov cx, 565
	mov dx, 22
	int 10h
	
	mov cx, 566
	mov dx, 22
	int 10h
	
	mov cx, 569
	mov dx, 22
	int 10h
	
	mov cx, 573
	mov dx, 22
	int 10h
	
	mov cx, 576
	mov dx, 22
	int 10h
	
	mov cx, 579
	mov dx, 22
	int 10h
	
	mov cx, 582
	mov dx, 22
	int 10h
	
	mov cx, 585
	mov dx, 22
	int 10h
	
	mov cx, 589
	mov dx, 22
	int 10h
	
	mov cx, 593
	mov dx, 22
	int 10h
	
	mov cx, 597
	mov dx, 22
	int 10h
	
	mov cx, 598
	mov dx, 22
	int 10h
	
	mov cx, 601
	mov dx, 22
	int 10h
	
	mov cx, 0
	mov dx, 23
	int 10h
	
	mov cx, 7
	mov dx, 23
	int 10h
	
	mov cx, 17
	mov dx, 23
	int 10h
	
	mov cx, 19
	mov dx, 23
	int 10h
	
	mov cx, 20
	mov dx, 23
	int 10h
	
	mov cx, 21
	mov dx, 23
	int 10h
	
	mov cx, 25
	mov dx, 23
	int 10h
	
	mov cx, 34
	mov dx, 23
	int 10h
	
	mov cx, 35
	mov dx, 23
	int 10h
	
	mov cx, 36
	mov dx, 23
	int 10h
	
	mov cx, 37
	mov dx, 23
	int 10h
	
	mov cx, 41
	mov dx, 23
	int 10h
	
	mov cx, 43
	mov dx, 23
	int 10h
	
	mov cx, 44
	mov dx, 23
	int 10h
	
	mov cx, 45
	mov dx, 23
	int 10h
	
	mov cx, 52
	mov dx, 23
	int 10h
	
	mov cx, 58
	mov dx, 23
	int 10h
	
	mov cx, 59
	mov dx, 23
	int 10h
	
	mov cx, 60
	mov dx, 23
	int 10h
	
	mov cx, 61
	mov dx, 23
	int 10h
	
	mov cx, 62
	mov dx, 23
	int 10h
	
	mov cx, 64
	mov dx, 23
	int 10h
	
	mov cx, 67
	mov dx, 23
	int 10h
	
	mov cx, 70
	mov dx, 23
	int 10h
	
	mov cx, 81
	mov dx, 23
	int 10h
	
	mov cx, 86
	mov dx, 23
	int 10h
	
	mov cx, 90
	mov dx, 23
	int 10h
	
	mov cx, 91
	mov dx, 23
	int 10h
	
	mov cx, 92
	mov dx, 23
	int 10h
	
	mov cx, 93
	mov dx, 23
	int 10h
	
	mov cx, 94
	mov dx, 23
	int 10h
	
	mov cx, 97
	mov dx, 23
	int 10h
	
	mov cx, 98
	mov dx, 23
	int 10h
	
	mov cx, 99
	mov dx, 23
	int 10h
	
	mov cx, 100
	mov dx, 23
	int 10h
	
	mov cx, 113
	mov dx, 23
	int 10h
	
	mov cx, 115
	mov dx, 23
	int 10h
	
	mov cx, 116
	mov dx, 23
	int 10h
	
	mov cx, 117
	mov dx, 23
	int 10h
	
	mov cx, 122
	mov dx, 23
	int 10h
	
	mov cx, 123
	mov dx, 23
	int 10h
	
	mov cx, 124
	mov dx, 23
	int 10h
	
	mov cx, 125
	mov dx, 23
	int 10h
	
	mov cx, 126
	mov dx, 23
	int 10h
	
	mov cx, 130
	mov dx, 23
	int 10h
	
	mov cx, 131
	mov dx, 23
	int 10h
	
	mov cx, 132
	mov dx, 23
	int 10h
	
	mov cx, 133
	mov dx, 23
	int 10h
	
	mov cx, 134
	mov dx, 23
	int 10h
	
	mov cx, 137
	mov dx, 23
	int 10h
	
	mov cx, 142
	mov dx, 23
	int 10h
	
	mov cx, 154
	mov dx, 23
	int 10h
	
	mov cx, 155
	mov dx, 23
	int 10h
	
	mov cx, 156
	mov dx, 23
	int 10h
	
	mov cx, 158
	mov dx, 23
	int 10h
	
	mov cx, 162
	mov dx, 23
	int 10h
	
	mov cx, 163
	mov dx, 23
	int 10h
	
	mov cx, 164
	mov dx, 23
	int 10h
	
	mov cx, 165
	mov dx, 23
	int 10h
	
	mov cx, 166
	mov dx, 23
	int 10h
	
	mov cx, 171
	mov dx, 23
	int 10h
	
	mov cx, 172
	mov dx, 23
	int 10h
	
	mov cx, 173
	mov dx, 23
	int 10h
	
	mov cx, 178
	mov dx, 23
	int 10h
	
	mov cx, 179
	mov dx, 23
	int 10h
	
	mov cx, 180
	mov dx, 23
	int 10h
	
	mov cx, 181
	mov dx, 23
	int 10h
	
	mov cx, 182
	mov dx, 23
	int 10h
	
	mov cx, 187
	mov dx, 23
	int 10h
	
	mov cx, 188
	mov dx, 23
	int 10h
	
	mov cx, 189
	mov dx, 23
	int 10h
	
	mov cx, 190
	mov dx, 23
	int 10h
	
	mov cx, 195
	mov dx, 23
	int 10h
	
	mov cx, 196
	mov dx, 23
	int 10h
	
	mov cx, 197
	mov dx, 23
	int 10h
	
	mov cx, 202
	mov dx, 23
	int 10h
	
	mov cx, 203
	mov dx, 23
	int 10h
	
	mov cx, 204
	mov dx, 23
	int 10h
	
	mov cx, 205
	mov dx, 23
	int 10h
	
	mov cx, 206
	mov dx, 23
	int 10h
	
	mov cx, 210
	mov dx, 23
	int 10h
	
	mov cx, 211
	mov dx, 23
	int 10h
	
	mov cx, 212
	mov dx, 23
	int 10h
	
	mov cx, 214
	mov dx, 23
	int 10h
	
	mov cx, 226
	mov dx, 23
	int 10h
	
	mov cx, 227
	mov dx, 23
	int 10h
	
	mov cx, 228
	mov dx, 23
	int 10h
	
	mov cx, 229
	mov dx, 23
	int 10h
	
	mov cx, 230
	mov dx, 23
	int 10h
	
	mov cx, 233
	mov dx, 23
	int 10h
	
	mov cx, 238
	mov dx, 23
	int 10h
	
	mov cx, 242
	mov dx, 23
	int 10h
	
	mov cx, 243
	mov dx, 23
	int 10h
	
	mov cx, 244
	mov dx, 23
	int 10h
	
	mov cx, 246
	mov dx, 23
	int 10h
	
	mov cx, 258
	mov dx, 23
	int 10h
	
	mov cx, 261
	mov dx, 23
	int 10h
	
	mov cx, 268
	mov dx, 23
	int 10h
	
	mov cx, 273
	mov dx, 23
	int 10h
	
	mov cx, 278
	mov dx, 23
	int 10h
	
	mov cx, 282
	mov dx, 23
	int 10h
	
	mov cx, 283
	mov dx, 23
	int 10h
	
	mov cx, 284
	mov dx, 23
	int 10h
	
	mov cx, 286
	mov dx, 23
	int 10h
	
	mov cx, 290
	mov dx, 23
	int 10h
	
	mov cx, 291
	mov dx, 23
	int 10h
	
	mov cx, 292
	mov dx, 23
	int 10h
	
	mov cx, 293
	mov dx, 23
	int 10h
	
	mov cx, 298
	mov dx, 23
	int 10h
	
	mov cx, 301
	mov dx, 23
	int 10h
	
	mov cx, 305
	mov dx, 23
	int 10h
	
	mov cx, 306
	mov dx, 23
	int 10h
	
	mov cx, 307
	mov dx, 23
	int 10h
	
	mov cx, 308
	mov dx, 23
	int 10h
	
	mov cx, 321
	mov dx, 23
	int 10h
	
	mov cx, 326
	mov dx, 23
	int 10h
	
	mov cx, 330
	mov dx, 23
	int 10h
	
	mov cx, 331
	mov dx, 23
	int 10h
	
	mov cx, 332
	mov dx, 23
	int 10h
	
	mov cx, 333
	mov dx, 23
	int 10h
	
	mov cx, 334
	mov dx, 23
	int 10h
	
	mov cx, 337
	mov dx, 23
	int 10h
	
	mov cx, 338
	mov dx, 23
	int 10h
	
	mov cx, 339
	mov dx, 23
	int 10h
	
	mov cx, 340
	mov dx, 23
	int 10h
	
	mov cx, 353
	mov dx, 23
	int 10h
	
	mov cx, 355
	mov dx, 23
	int 10h
	
	mov cx, 356
	mov dx, 23
	int 10h
	
	mov cx, 357
	mov dx, 23
	int 10h
	
	mov cx, 362
	mov dx, 23
	int 10h
	
	mov cx, 363
	mov dx, 23
	int 10h
	
	mov cx, 364
	mov dx, 23
	int 10h
	
	mov cx, 365
	mov dx, 23
	int 10h
	
	mov cx, 366
	mov dx, 23
	int 10h
	
	mov cx, 370
	mov dx, 23
	int 10h
	
	mov cx, 371
	mov dx, 23
	int 10h
	
	mov cx, 372
	mov dx, 23
	int 10h
	
	mov cx, 373
	mov dx, 23
	int 10h
	
	mov cx, 374
	mov dx, 23
	int 10h
	
	mov cx, 377
	mov dx, 23
	int 10h
	
	mov cx, 382
	mov dx, 23
	int 10h
	
	mov cx, 393
	mov dx, 23
	int 10h
	
	mov cx, 394
	mov dx, 23
	int 10h
	
	mov cx, 395
	mov dx, 23
	int 10h
	
	mov cx, 396
	mov dx, 23
	int 10h
	
	mov cx, 401
	mov dx, 23
	int 10h
	
	mov cx, 406
	mov dx, 23
	int 10h
	
	mov cx, 410
	mov dx, 23
	int 10h
	
	mov cx, 411
	mov dx, 23
	int 10h
	
	mov cx, 412
	mov dx, 23
	int 10h
	
	mov cx, 414
	mov dx, 23
	int 10h
	
	mov cx, 419
	mov dx, 23
	int 10h
	
	mov cx, 420
	mov dx, 23
	int 10h
	
	mov cx, 421
	mov dx, 23
	int 10h
	
	mov cx, 434
	mov dx, 23
	int 10h
	
	mov cx, 435
	mov dx, 23
	int 10h
	
	mov cx, 436
	mov dx, 23
	int 10h
	
	mov cx, 438
	mov dx, 23
	int 10h
	
	mov cx, 442
	mov dx, 23
	int 10h
	
	mov cx, 443
	mov dx, 23
	int 10h
	
	mov cx, 444
	mov dx, 23
	int 10h
	
	mov cx, 445
	mov dx, 23
	int 10h
	
	mov cx, 450
	mov dx, 23
	int 10h
	
	mov cx, 453
	mov dx, 23
	int 10h
	
	mov cx, 457
	mov dx, 23
	int 10h
	
	mov cx, 462
	mov dx, 23
	int 10h
	
	mov cx, 475
	mov dx, 23
	int 10h
	
	mov cx, 476
	mov dx, 23
	int 10h
	
	mov cx, 477
	mov dx, 23
	int 10h
	
	mov cx, 482
	mov dx, 23
	int 10h
	
	mov cx, 483
	mov dx, 23
	int 10h
	
	mov cx, 484
	mov dx, 23
	int 10h
	
	mov cx, 485
	mov dx, 23
	int 10h
	
	mov cx, 497
	mov dx, 23
	int 10h
	
	mov cx, 499
	mov dx, 23
	int 10h
	
	mov cx, 500
	mov dx, 23
	int 10h
	
	mov cx, 501
	mov dx, 23
	int 10h
	
	mov cx, 505
	mov dx, 23
	int 10h
	
	mov cx, 514
	mov dx, 23
	int 10h
	
	mov cx, 515
	mov dx, 23
	int 10h
	
	mov cx, 516
	mov dx, 23
	int 10h
	
	mov cx, 517
	mov dx, 23
	int 10h
	
	mov cx, 518
	mov dx, 23
	int 10h
	
	mov cx, 523
	mov dx, 23
	int 10h
	
	mov cx, 530
	mov dx, 23
	int 10h
	
	mov cx, 531
	mov dx, 23
	int 10h
	
	mov cx, 532
	mov dx, 23
	int 10h
	
	mov cx, 533
	mov dx, 23
	int 10h
	
	mov cx, 534
	mov dx, 23
	int 10h
	
	mov cx, 537
	mov dx, 23
	int 10h
	
	mov cx, 542
	mov dx, 23
	int 10h
	
	mov cx, 547
	mov dx, 23
	int 10h
	
	mov cx, 548
	mov dx, 23
	int 10h
	
	mov cx, 549
	mov dx, 23
	int 10h
	
	mov cx, 562
	mov dx, 23
	int 10h
	
	mov cx, 563
	mov dx, 23
	int 10h
	
	mov cx, 564
	mov dx, 23
	int 10h
	
	mov cx, 566
	mov dx, 23
	int 10h
	
	mov cx, 570
	mov dx, 23
	int 10h
	
	mov cx, 571
	mov dx, 23
	int 10h
	
	mov cx, 572
	mov dx, 23
	int 10h
	
	mov cx, 573
	mov dx, 23
	int 10h
	
	mov cx, 574
	mov dx, 23
	int 10h
	
	mov cx, 576
	mov dx, 23
	int 10h
	
	mov cx, 579
	mov dx, 23
	int 10h
	
	mov cx, 582
	mov dx, 23
	int 10h
	
	mov cx, 586
	mov dx, 23
	int 10h
	
	mov cx, 587
	mov dx, 23
	int 10h
	
	mov cx, 588
	mov dx, 23
	int 10h
	
	mov cx, 589
	mov dx, 23
	int 10h
	
	mov cx, 590
	mov dx, 23
	int 10h
	
	mov cx, 594
	mov dx, 23
	int 10h
	
	mov cx, 595
	mov dx, 23
	int 10h
	
	mov cx, 596
	mov dx, 23
	int 10h
	
	mov cx, 598
	mov dx, 23
	int 10h
	
	mov cx, 602
	mov dx, 23
	int 10h
	
	mov cx, 603
	mov dx, 23
	int 10h
	
	mov cx, 604
	mov dx, 23
	int 10h
	
	mov cx, 605
	mov dx, 23
	int 10h
	
	mov cx, 606
	mov dx, 23
	int 10h
	
	mov cx, 17
	mov dx, 24
	int 10h
	
	mov cx, 497
	mov dx, 24
	int 10h
	
	mov cx, 598
	mov dx, 24
	int 10h
	
	mov cx, 17
	mov dx, 25
	int 10h
	
	mov cx, 497
	mov dx, 25
	int 10h
	
	mov cx, 598
	mov dx, 25
	int 10h
	
	mov cx, 17
	mov dx, 26
	int 10h
	
	mov cx, 497
	mov dx, 26
	int 10h
	
	mov cx, 594
	mov dx, 26
	int 10h
	
	mov cx, 595
	mov dx, 26
	int 10h
	
	mov cx, 596
	mov dx, 26
	int 10h
	
	mov cx, 597
	mov dx, 26
	int 10h
	
	mov cx, 2
	mov dx, 30
	int 10h
	
	mov cx, 106
	mov dx, 30
	int 10h
	
	mov cx, 0
	mov dx, 31
	int 10h
	
	mov cx, 1
	mov dx, 31
	int 10h
	
	mov cx, 2
	mov dx, 31
	int 10h
	
	mov cx, 3
	mov dx, 31
	int 10h
	
	mov cx, 4
	mov dx, 31
	int 10h
	
	mov cx, 5
	mov dx, 31
	int 10h
	
	mov cx, 10
	mov dx, 31
	int 10h
	
	mov cx, 11
	mov dx, 31
	int 10h
	
	mov cx, 12
	mov dx, 31
	int 10h
	
	mov cx, 13
	mov dx, 31
	int 10h
	
	mov cx, 24
	mov dx, 31
	int 10h
	
	mov cx, 31
	mov dx, 31
	int 10h
	
	mov cx, 34
	mov dx, 31
	int 10h
	
	mov cx, 35
	mov dx, 31
	int 10h
	
	mov cx, 36
	mov dx, 31
	int 10h
	
	mov cx, 37
	mov dx, 31
	int 10h
	
	mov cx, 41
	mov dx, 31
	int 10h
	
	mov cx, 46
	mov dx, 31
	int 10h
	
	mov cx, 49
	mov dx, 31
	int 10h
	
	mov cx, 51
	mov dx, 31
	int 10h
	
	mov cx, 52
	mov dx, 31
	int 10h
	
	mov cx, 53
	mov dx, 31
	int 10h
	
	mov cx, 67
	mov dx, 31
	int 10h
	
	mov cx, 68
	mov dx, 31
	int 10h
	
	mov cx, 69
	mov dx, 31
	int 10h
	
	mov cx, 70
	mov dx, 31
	int 10h
	
	mov cx, 74
	mov dx, 31
	int 10h
	
	mov cx, 75
	mov dx, 31
	int 10h
	
	mov cx, 76
	mov dx, 31
	int 10h
	
	mov cx, 77
	mov dx, 31
	int 10h
	
	mov cx, 80
	mov dx, 31
	int 10h
	
	mov cx, 82
	mov dx, 31
	int 10h
	
	mov cx, 83
	mov dx, 31
	int 10h
	
	mov cx, 85
	mov dx, 31
	int 10h
	
	mov cx, 86
	mov dx, 31
	int 10h
	
	mov cx, 89
	mov dx, 31
	int 10h
	
	mov cx, 91
	mov dx, 31
	int 10h
	
	mov cx, 92
	mov dx, 31
	int 10h
	
	mov cx, 93
	mov dx, 31
	int 10h
	
	mov cx, 97
	mov dx, 31
	int 10h
	
	mov cx, 102
	mov dx, 31
	int 10h
	
	mov cx, 104
	mov dx, 31
	int 10h
	
	mov cx, 105
	mov dx, 31
	int 10h
	
	mov cx, 106
	mov dx, 31
	int 10h
	
	mov cx, 107
	mov dx, 31
	int 10h
	
	mov cx, 108
	mov dx, 31
	int 10h
	
	mov cx, 109
	mov dx, 31
	int 10h
	
	mov cx, 114
	mov dx, 31
	int 10h
	
	mov cx, 115
	mov dx, 31
	int 10h
	
	mov cx, 116
	mov dx, 31
	int 10h
	
	mov cx, 117
	mov dx, 31
	int 10h
	
	mov cx, 121
	mov dx, 31
	int 10h
	
	mov cx, 123
	mov dx, 31
	int 10h
	
	mov cx, 124
	mov dx, 31
	int 10h
	
	mov cx, 125
	mov dx, 31
	int 10h
	
	mov cx, 2
	mov dx, 32
	int 10h
	
	mov cx, 9
	mov dx, 32
	int 10h
	
	mov cx, 14
	mov dx, 32
	int 10h
	
	mov cx, 25
	mov dx, 32
	int 10h
	
	mov cx, 30
	mov dx, 32
	int 10h
	
	mov cx, 33
	mov dx, 32
	int 10h
	
	mov cx, 38
	mov dx, 32
	int 10h
	
	mov cx, 41
	mov dx, 32
	int 10h
	
	mov cx, 46
	mov dx, 32
	int 10h
	
	mov cx, 49
	mov dx, 32
	int 10h
	
	mov cx, 50
	mov dx, 32
	int 10h
	
	mov cx, 53
	mov dx, 32
	int 10h
	
	mov cx, 66
	mov dx, 32
	int 10h
	
	mov cx, 73
	mov dx, 32
	int 10h
	
	mov cx, 78
	mov dx, 32
	int 10h
	
	mov cx, 80
	mov dx, 32
	int 10h
	
	mov cx, 81
	mov dx, 32
	int 10h
	
	mov cx, 83
	mov dx, 32
	int 10h
	
	mov cx, 84
	mov dx, 32
	int 10h
	
	mov cx, 86
	mov dx, 32
	int 10h
	
	mov cx, 89
	mov dx, 32
	int 10h
	
	mov cx, 90
	mov dx, 32
	int 10h
	
	mov cx, 94
	mov dx, 32
	int 10h
	
	mov cx, 97
	mov dx, 32
	int 10h
	
	mov cx, 102
	mov dx, 32
	int 10h
	
	mov cx, 106
	mov dx, 32
	int 10h
	
	mov cx, 114
	mov dx, 32
	int 10h
	
	mov cx, 118
	mov dx, 32
	int 10h
	
	mov cx, 121
	mov dx, 32
	int 10h
	
	mov cx, 122
	mov dx, 32
	int 10h
	
	mov cx, 125
	mov dx, 32
	int 10h
	
	mov cx, 2
	mov dx, 33
	int 10h
	
	mov cx, 9
	mov dx, 33
	int 10h
	
	mov cx, 14
	mov dx, 33
	int 10h
	
	mov cx, 25
	mov dx, 33
	int 10h
	
	mov cx, 30
	mov dx, 33
	int 10h
	
	mov cx, 33
	mov dx, 33
	int 10h
	
	mov cx, 38
	mov dx, 33
	int 10h
	
	mov cx, 41
	mov dx, 33
	int 10h
	
	mov cx, 46
	mov dx, 33
	int 10h
	
	mov cx, 49
	mov dx, 33
	int 10h
	
	mov cx, 65
	mov dx, 33
	int 10h
	
	mov cx, 73
	mov dx, 33
	int 10h
	
	mov cx, 78
	mov dx, 33
	int 10h
	
	mov cx, 80
	mov dx, 33
	int 10h
	
	mov cx, 83
	mov dx, 33
	int 10h
	
	mov cx, 86
	mov dx, 33
	int 10h
	
	mov cx, 89
	mov dx, 33
	int 10h
	
	mov cx, 94
	mov dx, 33
	int 10h
	
	mov cx, 97
	mov dx, 33
	int 10h
	
	mov cx, 102
	mov dx, 33
	int 10h
	
	mov cx, 106
	mov dx, 33
	int 10h
	
	mov cx, 113
	mov dx, 33
	int 10h
	
	mov cx, 118
	mov dx, 33
	int 10h
	
	mov cx, 121
	mov dx, 33
	int 10h
	
	mov cx, 2
	mov dx, 34
	int 10h
	
	mov cx, 9
	mov dx, 34
	int 10h
	
	mov cx, 14
	mov dx, 34
	int 10h
	
	mov cx, 26
	mov dx, 34
	int 10h
	
	mov cx, 29
	mov dx, 34
	int 10h
	
	mov cx, 33
	mov dx, 34
	int 10h
	
	mov cx, 38
	mov dx, 34
	int 10h
	
	mov cx, 41
	mov dx, 34
	int 10h
	
	mov cx, 46
	mov dx, 34
	int 10h
	
	mov cx, 49
	mov dx, 34
	int 10h
	
	mov cx, 65
	mov dx, 34
	int 10h
	
	mov cx, 73
	mov dx, 34
	int 10h
	
	mov cx, 78
	mov dx, 34
	int 10h
	
	mov cx, 80
	mov dx, 34
	int 10h
	
	mov cx, 83
	mov dx, 34
	int 10h
	
	mov cx, 86
	mov dx, 34
	int 10h
	
	mov cx, 89
	mov dx, 34
	int 10h
	
	mov cx, 94
	mov dx, 34
	int 10h
	
	mov cx, 97
	mov dx, 34
	int 10h
	
	mov cx, 102
	mov dx, 34
	int 10h
	
	mov cx, 106
	mov dx, 34
	int 10h
	
	mov cx, 113
	mov dx, 34
	int 10h
	
	mov cx, 114
	mov dx, 34
	int 10h
	
	mov cx, 115
	mov dx, 34
	int 10h
	
	mov cx, 116
	mov dx, 34
	int 10h
	
	mov cx, 117
	mov dx, 34
	int 10h
	
	mov cx, 118
	mov dx, 34
	int 10h
	
	mov cx, 121
	mov dx, 34
	int 10h
	
	mov cx, 2
	mov dx, 35
	int 10h
	
	mov cx, 9
	mov dx, 35
	int 10h
	
	mov cx, 14
	mov dx, 35
	int 10h
	
	mov cx, 26
	mov dx, 35
	int 10h
	
	mov cx, 29
	mov dx, 35
	int 10h
	
	mov cx, 33
	mov dx, 35
	int 10h
	
	mov cx, 38
	mov dx, 35
	int 10h
	
	mov cx, 41
	mov dx, 35
	int 10h
	
	mov cx, 46
	mov dx, 35
	int 10h
	
	mov cx, 49
	mov dx, 35
	int 10h
	
	mov cx, 65
	mov dx, 35
	int 10h
	
	mov cx, 73
	mov dx, 35
	int 10h
	
	mov cx, 78
	mov dx, 35
	int 10h
	
	mov cx, 80
	mov dx, 35
	int 10h
	
	mov cx, 83
	mov dx, 35
	int 10h
	
	mov cx, 86
	mov dx, 35
	int 10h
	
	mov cx, 89
	mov dx, 35
	int 10h
	
	mov cx, 94
	mov dx, 35
	int 10h
	
	mov cx, 97
	mov dx, 35
	int 10h
	
	mov cx, 102
	mov dx, 35
	int 10h
	
	mov cx, 106
	mov dx, 35
	int 10h
	
	mov cx, 113
	mov dx, 35
	int 10h
	
	mov cx, 121
	mov dx, 35
	int 10h
	
	mov cx, 2
	mov dx, 36
	int 10h
	
	mov cx, 9
	mov dx, 36
	int 10h
	
	mov cx, 14
	mov dx, 36
	int 10h
	
	mov cx, 27
	mov dx, 36
	int 10h
	
	mov cx, 28
	mov dx, 36
	int 10h
	
	mov cx, 33
	mov dx, 36
	int 10h
	
	mov cx, 38
	mov dx, 36
	int 10h
	
	mov cx, 41
	mov dx, 36
	int 10h
	
	mov cx, 45
	mov dx, 36
	int 10h
	
	mov cx, 46
	mov dx, 36
	int 10h
	
	mov cx, 49
	mov dx, 36
	int 10h
	
	mov cx, 66
	mov dx, 36
	int 10h
	
	mov cx, 73
	mov dx, 36
	int 10h
	
	mov cx, 78
	mov dx, 36
	int 10h
	
	mov cx, 80
	mov dx, 36
	int 10h
	
	mov cx, 83
	mov dx, 36
	int 10h
	
	mov cx, 86
	mov dx, 36
	int 10h
	
	mov cx, 89
	mov dx, 36
	int 10h
	
	mov cx, 90
	mov dx, 36
	int 10h
	
	mov cx, 94
	mov dx, 36
	int 10h
	
	mov cx, 97
	mov dx, 36
	int 10h
	
	mov cx, 101
	mov dx, 36
	int 10h
	
	mov cx, 102
	mov dx, 36
	int 10h
	
	mov cx, 106
	mov dx, 36
	int 10h
	
	mov cx, 113
	mov dx, 36
	int 10h
	
	mov cx, 121
	mov dx, 36
	int 10h
	
	mov cx, 130
	mov dx, 36
	int 10h
	
	mov cx, 131
	mov dx, 36
	int 10h
	
	mov cx, 3
	mov dx, 37
	int 10h
	
	mov cx, 4
	mov dx, 37
	int 10h
	
	mov cx, 5
	mov dx, 37
	int 10h
	
	mov cx, 10
	mov dx, 37
	int 10h
	
	mov cx, 11
	mov dx, 37
	int 10h
	
	mov cx, 12
	mov dx, 37
	int 10h
	
	mov cx, 13
	mov dx, 37
	int 10h
	
	mov cx, 27
	mov dx, 37
	int 10h
	
	mov cx, 28
	mov dx, 37
	int 10h
	
	mov cx, 34
	mov dx, 37
	int 10h
	
	mov cx, 35
	mov dx, 37
	int 10h
	
	mov cx, 36
	mov dx, 37
	int 10h
	
	mov cx, 37
	mov dx, 37
	int 10h
	
	mov cx, 42
	mov dx, 37
	int 10h
	
	mov cx, 43
	mov dx, 37
	int 10h
	
	mov cx, 44
	mov dx, 37
	int 10h
	
	mov cx, 46
	mov dx, 37
	int 10h
	
	mov cx, 49
	mov dx, 37
	int 10h
	
	mov cx, 67
	mov dx, 37
	int 10h
	
	mov cx, 68
	mov dx, 37
	int 10h
	
	mov cx, 69
	mov dx, 37
	int 10h
	
	mov cx, 70
	mov dx, 37
	int 10h
	
	mov cx, 74
	mov dx, 37
	int 10h
	
	mov cx, 75
	mov dx, 37
	int 10h
	
	mov cx, 76
	mov dx, 37
	int 10h
	
	mov cx, 77
	mov dx, 37
	int 10h
	
	mov cx, 80
	mov dx, 37
	int 10h
	
	mov cx, 83
	mov dx, 37
	int 10h
	
	mov cx, 86
	mov dx, 37
	int 10h
	
	mov cx, 89
	mov dx, 37
	int 10h
	
	mov cx, 91
	mov dx, 37
	int 10h
	
	mov cx, 92
	mov dx, 37
	int 10h
	
	mov cx, 93
	mov dx, 37
	int 10h
	
	mov cx, 98
	mov dx, 37
	int 10h
	
	mov cx, 99
	mov dx, 37
	int 10h
	
	mov cx, 100
	mov dx, 37
	int 10h
	
	mov cx, 102
	mov dx, 37
	int 10h
	
	mov cx, 107
	mov dx, 37
	int 10h
	
	mov cx, 108
	mov dx, 37
	int 10h
	
	mov cx, 109
	mov dx, 37
	int 10h
	
	mov cx, 114
	mov dx, 37
	int 10h
	
	mov cx, 115
	mov dx, 37
	int 10h
	
	mov cx, 116
	mov dx, 37
	int 10h
	
	mov cx, 117
	mov dx, 37
	int 10h
	
	mov cx, 118
	mov dx, 37
	int 10h
	
	mov cx, 121
	mov dx, 37
	int 10h
	
	mov cx, 130
	mov dx, 37
	int 10h
	
	mov cx, 131
	mov dx, 37
	int 10h
	
	mov cx, 27
	mov dx, 38
	int 10h
	
	mov cx, 89
	mov dx, 38
	int 10h
	
	mov cx, 26
	mov dx, 39
	int 10h
	
	mov cx, 27
	mov dx, 39
	int 10h
	
	mov cx, 89
	mov dx, 39
	int 10h
	
	mov cx, 24
	mov dx, 40
	int 10h
	
	mov cx, 25
	mov dx, 40
	int 10h
	
	mov cx, 26
	mov dx, 40
	int 10h
	
	mov cx, 89
	mov dx, 40
	int 10h
	
	mov cx, 9
	mov dx, 56
	int 10h
	
	mov cx, 57
	mov dx, 56
	int 10h
	
	mov cx, 65
	mov dx, 56
	int 10h
	
	mov cx, 66
	mov dx, 56
	int 10h
	
	mov cx, 67
	mov dx, 56
	int 10h
	
	mov cx, 68
	mov dx, 56
	int 10h
	
	mov cx, 169
	mov dx, 56
	int 10h
	
	mov cx, 238
	mov dx, 56
	int 10h
	
	mov cx, 249
	mov dx, 56
	int 10h
	
	mov cx, 281
	mov dx, 56
	int 10h
	
	mov cx, 307
	mov dx, 56
	int 10h
	
	mov cx, 308
	mov dx, 56
	int 10h
	
	mov cx, 309
	mov dx, 56
	int 10h
	
	mov cx, 310
	mov dx, 56
	int 10h
	
	mov cx, 321
	mov dx, 56
	int 10h
	
	mov cx, 322
	mov dx, 56
	int 10h
	
	mov cx, 323
	mov dx, 56
	int 10h
	
	mov cx, 324
	mov dx, 56
	int 10h
	
	mov cx, 329
	mov dx, 56
	int 10h
	
	mov cx, 330
	mov dx, 56
	int 10h
	
	mov cx, 331
	mov dx, 56
	int 10h
	
	mov cx, 332
	mov dx, 56
	int 10h
	
	mov cx, 355
	mov dx, 56
	int 10h
	
	mov cx, 356
	mov dx, 56
	int 10h
	
	mov cx, 387
	mov dx, 56
	int 10h
	
	mov cx, 388
	mov dx, 56
	int 10h
	
	mov cx, 389
	mov dx, 56
	int 10h
	
	mov cx, 390
	mov dx, 56
	int 10h
	
	mov cx, 395
	mov dx, 56
	int 10h
	
	mov cx, 396
	mov dx, 56
	int 10h
	
	mov cx, 401
	mov dx, 56
	int 10h
	
	mov cx, 402
	mov dx, 56
	int 10h
	
	mov cx, 403
	mov dx, 56
	int 10h
	
	mov cx, 404
	mov dx, 56
	int 10h
	
	mov cx, 9
	mov dx, 57
	int 10h
	
	mov cx, 57
	mov dx, 57
	int 10h
	
	mov cx, 68
	mov dx, 57
	int 10h
	
	mov cx, 169
	mov dx, 57
	int 10h
	
	mov cx, 238
	mov dx, 57
	int 10h
	
	mov cx, 249
	mov dx, 57
	int 10h
	
	mov cx, 281
	mov dx, 57
	int 10h
	
	mov cx, 306
	mov dx, 57
	int 10h
	
	mov cx, 324
	mov dx, 57
	int 10h
	
	mov cx, 332
	mov dx, 57
	int 10h
	
	mov cx, 355
	mov dx, 57
	int 10h
	
	mov cx, 356
	mov dx, 57
	int 10h
	
	mov cx, 386
	mov dx, 57
	int 10h
	
	mov cx, 395
	mov dx, 57
	int 10h
	
	mov cx, 396
	mov dx, 57
	int 10h
	
	mov cx, 404
	mov dx, 57
	int 10h
	
	mov cx, 0
	mov dx, 58
	int 10h
	
	mov cx, 1
	mov dx, 58
	int 10h
	
	mov cx, 2
	mov dx, 58
	int 10h
	
	mov cx, 3
	mov dx, 58
	int 10h
	
	mov cx, 4
	mov dx, 58
	int 10h
	
	mov cx, 5
	mov dx, 58
	int 10h
	
	mov cx, 6
	mov dx, 58
	int 10h
	
	mov cx, 9
	mov dx, 58
	int 10h
	
	mov cx, 57
	mov dx, 58
	int 10h
	
	mov cx, 68
	mov dx, 58
	int 10h
	
	mov cx, 146
	mov dx, 58
	int 10h
	
	mov cx, 169
	mov dx, 58
	int 10h
	
	mov cx, 238
	mov dx, 58
	int 10h
	
	mov cx, 249
	mov dx, 58
	int 10h
	
	mov cx, 274
	mov dx, 58
	int 10h
	
	mov cx, 281
	mov dx, 58
	int 10h
	
	mov cx, 306
	mov dx, 58
	int 10h
	
	mov cx, 324
	mov dx, 58
	int 10h
	
	mov cx, 332
	mov dx, 58
	int 10h
	
	mov cx, 386
	mov dx, 58
	int 10h
	
	mov cx, 404
	mov dx, 58
	int 10h
	
	mov cx, 434
	mov dx, 58
	int 10h
	
	mov cx, 435
	mov dx, 58
	int 10h
	
	mov cx, 436
	mov dx, 58
	int 10h
	
	mov cx, 437
	mov dx, 58
	int 10h
	
	mov cx, 438
	mov dx, 58
	int 10h
	
	mov cx, 441
	mov dx, 58
	int 10h
	
	mov cx, 442
	mov dx, 58
	int 10h
	
	mov cx, 443
	mov dx, 58
	int 10h
	
	mov cx, 444
	mov dx, 58
	int 10h
	
	mov cx, 445
	mov dx, 58
	int 10h
	
	mov cx, 450
	mov dx, 58
	int 10h
	
	mov cx, 451
	mov dx, 58
	int 10h
	
	mov cx, 452
	mov dx, 58
	int 10h
	
	mov cx, 453
	mov dx, 58
	int 10h
	
	mov cx, 454
	mov dx, 58
	int 10h
	
	mov cx, 456
	mov dx, 58
	int 10h
	
	mov cx, 457
	mov dx, 58
	int 10h
	
	mov cx, 461
	mov dx, 58
	int 10h
	
	mov cx, 462
	mov dx, 58
	int 10h
	
	mov cx, 465
	mov dx, 58
	int 10h
	
	mov cx, 466
	mov dx, 58
	int 10h
	
	mov cx, 467
	mov dx, 58
	int 10h
	
	mov cx, 468
	mov dx, 58
	int 10h
	
	mov cx, 474
	mov dx, 58
	int 10h
	
	mov cx, 475
	mov dx, 58
	int 10h
	
	mov cx, 476
	mov dx, 58
	int 10h
	
	mov cx, 477
	mov dx, 58
	int 10h
	
	mov cx, 478
	mov dx, 58
	int 10h
	
	mov cx, 482
	mov dx, 58
	int 10h
	
	mov cx, 483
	mov dx, 58
	int 10h
	
	mov cx, 484
	mov dx, 58
	int 10h
	
	mov cx, 489
	mov dx, 58
	int 10h
	
	mov cx, 494
	mov dx, 58
	int 10h
	
	mov cx, 506
	mov dx, 58
	int 10h
	
	mov cx, 507
	mov dx, 58
	int 10h
	
	mov cx, 508
	mov dx, 58
	int 10h
	
	mov cx, 509
	mov dx, 58
	int 10h
	
	mov cx, 510
	mov dx, 58
	int 10h
	
	mov cx, 512
	mov dx, 58
	int 10h
	
	mov cx, 518
	mov dx, 58
	int 10h
	
	mov cx, 522
	mov dx, 58
	int 10h
	
	mov cx, 523
	mov dx, 58
	int 10h
	
	mov cx, 524
	mov dx, 58
	int 10h
	
	mov cx, 525
	mov dx, 58
	int 10h
	
	mov cx, 526
	mov dx, 58
	int 10h
	
	mov cx, 3
	mov dx, 59
	int 10h
	
	mov cx, 9
	mov dx, 59
	int 10h
	
	mov cx, 11
	mov dx, 59
	int 10h
	
	mov cx, 12
	mov dx, 59
	int 10h
	
	mov cx, 13
	mov dx, 59
	int 10h
	
	mov cx, 18
	mov dx, 59
	int 10h
	
	mov cx, 19
	mov dx, 59
	int 10h
	
	mov cx, 20
	mov dx, 59
	int 10h
	
	mov cx, 21
	mov dx, 59
	int 10h
	
	mov cx, 33
	mov dx, 59
	int 10h
	
	mov cx, 35
	mov dx, 59
	int 10h
	
	mov cx, 36
	mov dx, 59
	int 10h
	
	mov cx, 37
	mov dx, 59
	int 10h
	
	mov cx, 41
	mov dx, 59
	int 10h
	
	mov cx, 43
	mov dx, 59
	int 10h
	
	mov cx, 44
	mov dx, 59
	int 10h
	
	mov cx, 45
	mov dx, 59
	int 10h
	
	mov cx, 50
	mov dx, 59
	int 10h
	
	mov cx, 51
	mov dx, 59
	int 10h
	
	mov cx, 52
	mov dx, 59
	int 10h
	
	mov cx, 53
	mov dx, 59
	int 10h
	
	mov cx, 57
	mov dx, 59
	int 10h
	
	mov cx, 59
	mov dx, 59
	int 10h
	
	mov cx, 60
	mov dx, 59
	int 10h
	
	mov cx, 61
	mov dx, 59
	int 10h
	
	mov cx, 68
	mov dx, 59
	int 10h
	
	mov cx, 74
	mov dx, 59
	int 10h
	
	mov cx, 75
	mov dx, 59
	int 10h
	
	mov cx, 76
	mov dx, 59
	int 10h
	
	mov cx, 77
	mov dx, 59
	int 10h
	
	mov cx, 80
	mov dx, 59
	int 10h
	
	mov cx, 82
	mov dx, 59
	int 10h
	
	mov cx, 83
	mov dx, 59
	int 10h
	
	mov cx, 85
	mov dx, 59
	int 10h
	
	mov cx, 86
	mov dx, 59
	int 10h
	
	mov cx, 98
	mov dx, 59
	int 10h
	
	mov cx, 99
	mov dx, 59
	int 10h
	
	mov cx, 100
	mov dx, 59
	int 10h
	
	mov cx, 101
	mov dx, 59
	int 10h
	
	mov cx, 106
	mov dx, 59
	int 10h
	
	mov cx, 107
	mov dx, 59
	int 10h
	
	mov cx, 108
	mov dx, 59
	int 10h
	
	mov cx, 109
	mov dx, 59
	int 10h
	
	mov cx, 114
	mov dx, 59
	int 10h
	
	mov cx, 115
	mov dx, 59
	int 10h
	
	mov cx, 116
	mov dx, 59
	int 10h
	
	mov cx, 117
	mov dx, 59
	int 10h
	
	mov cx, 120
	mov dx, 59
	int 10h
	
	mov cx, 122
	mov dx, 59
	int 10h
	
	mov cx, 123
	mov dx, 59
	int 10h
	
	mov cx, 125
	mov dx, 59
	int 10h
	
	mov cx, 126
	mov dx, 59
	int 10h
	
	mov cx, 130
	mov dx, 59
	int 10h
	
	mov cx, 131
	mov dx, 59
	int 10h
	
	mov cx, 132
	mov dx, 59
	int 10h
	
	mov cx, 133
	mov dx, 59
	int 10h
	
	mov cx, 144
	mov dx, 59
	int 10h
	
	mov cx, 145
	mov dx, 59
	int 10h
	
	mov cx, 146
	mov dx, 59
	int 10h
	
	mov cx, 147
	mov dx, 59
	int 10h
	
	mov cx, 148
	mov dx, 59
	int 10h
	
	mov cx, 149
	mov dx, 59
	int 10h
	
	mov cx, 154
	mov dx, 59
	int 10h
	
	mov cx, 155
	mov dx, 59
	int 10h
	
	mov cx, 156
	mov dx, 59
	int 10h
	
	mov cx, 157
	mov dx, 59
	int 10h
	
	mov cx, 169
	mov dx, 59
	int 10h
	
	mov cx, 171
	mov dx, 59
	int 10h
	
	mov cx, 172
	mov dx, 59
	int 10h
	
	mov cx, 173
	mov dx, 59
	int 10h
	
	mov cx, 178
	mov dx, 59
	int 10h
	
	mov cx, 179
	mov dx, 59
	int 10h
	
	mov cx, 180
	mov dx, 59
	int 10h
	
	mov cx, 181
	mov dx, 59
	int 10h
	
	mov cx, 195
	mov dx, 59
	int 10h
	
	mov cx, 196
	mov dx, 59
	int 10h
	
	mov cx, 197
	mov dx, 59
	int 10h
	
	mov cx, 198
	mov dx, 59
	int 10h
	
	mov cx, 202
	mov dx, 59
	int 10h
	
	mov cx, 203
	mov dx, 59
	int 10h
	
	mov cx, 204
	mov dx, 59
	int 10h
	
	mov cx, 209
	mov dx, 59
	int 10h
	
	mov cx, 214
	mov dx, 59
	int 10h
	
	mov cx, 218
	mov dx, 59
	int 10h
	
	mov cx, 219
	mov dx, 59
	int 10h
	
	mov cx, 220
	mov dx, 59
	int 10h
	
	mov cx, 221
	mov dx, 59
	int 10h
	
	mov cx, 226
	mov dx, 59
	int 10h
	
	mov cx, 227
	mov dx, 59
	int 10h
	
	mov cx, 228
	mov dx, 59
	int 10h
	
	mov cx, 229
	mov dx, 59
	int 10h
	
	mov cx, 234
	mov dx, 59
	int 10h
	
	mov cx, 235
	mov dx, 59
	int 10h
	
	mov cx, 236
	mov dx, 59
	int 10h
	
	mov cx, 238
	mov dx, 59
	int 10h
	
	mov cx, 249
	mov dx, 59
	int 10h
	
	mov cx, 251
	mov dx, 59
	int 10h
	
	mov cx, 252
	mov dx, 59
	int 10h
	
	mov cx, 253
	mov dx, 59
	int 10h
	
	mov cx, 256
	mov dx, 59
	int 10h
	
	mov cx, 263
	mov dx, 59
	int 10h
	
	mov cx, 272
	mov dx, 59
	int 10h
	
	mov cx, 273
	mov dx, 59
	int 10h
	
	mov cx, 274
	mov dx, 59
	int 10h
	
	mov cx, 275
	mov dx, 59
	int 10h
	
	mov cx, 276
	mov dx, 59
	int 10h
	
	mov cx, 277
	mov dx, 59
	int 10h
	
	mov cx, 281
	mov dx, 59
	int 10h
	
	mov cx, 283
	mov dx, 59
	int 10h
	
	mov cx, 284
	mov dx, 59
	int 10h
	
	mov cx, 285
	mov dx, 59
	int 10h
	
	mov cx, 290
	mov dx, 59
	int 10h
	
	mov cx, 291
	mov dx, 59
	int 10h
	
	mov cx, 292
	mov dx, 59
	int 10h
	
	mov cx, 293
	mov dx, 59
	int 10h
	
	mov cx, 304
	mov dx, 59
	int 10h
	
	mov cx, 305
	mov dx, 59
	int 10h
	
	mov cx, 306
	mov dx, 59
	int 10h
	
	mov cx, 307
	mov dx, 59
	int 10h
	
	mov cx, 308
	mov dx, 59
	int 10h
	
	mov cx, 309
	mov dx, 59
	int 10h
	
	mov cx, 310
	mov dx, 59
	int 10h
	
	mov cx, 314
	mov dx, 59
	int 10h
	
	mov cx, 315
	mov dx, 59
	int 10h
	
	mov cx, 316
	mov dx, 59
	int 10h
	
	mov cx, 317
	mov dx, 59
	int 10h
	
	mov cx, 324
	mov dx, 59
	int 10h
	
	mov cx, 332
	mov dx, 59
	int 10h
	
	mov cx, 338
	mov dx, 59
	int 10h
	
	mov cx, 339
	mov dx, 59
	int 10h
	
	mov cx, 340
	mov dx, 59
	int 10h
	
	mov cx, 341
	mov dx, 59
	int 10h
	
	mov cx, 344
	mov dx, 59
	int 10h
	
	mov cx, 351
	mov dx, 59
	int 10h
	
	mov cx, 353
	mov dx, 59
	int 10h
	
	mov cx, 354
	mov dx, 59
	int 10h
	
	mov cx, 355
	mov dx, 59
	int 10h
	
	mov cx, 356
	mov dx, 59
	int 10h
	
	mov cx, 361
	mov dx, 59
	int 10h
	
	mov cx, 363
	mov dx, 59
	int 10h
	
	mov cx, 364
	mov dx, 59
	int 10h
	
	mov cx, 365
	mov dx, 59
	int 10h
	
	mov cx, 370
	mov dx, 59
	int 10h
	
	mov cx, 371
	mov dx, 59
	int 10h
	
	mov cx, 372
	mov dx, 59
	int 10h
	
	mov cx, 374
	mov dx, 59
	int 10h
	
	mov cx, 384
	mov dx, 59
	int 10h
	
	mov cx, 385
	mov dx, 59
	int 10h
	
	mov cx, 386
	mov dx, 59
	int 10h
	
	mov cx, 387
	mov dx, 59
	int 10h
	
	mov cx, 388
	mov dx, 59
	int 10h
	
	mov cx, 389
	mov dx, 59
	int 10h
	
	mov cx, 390
	mov dx, 59
	int 10h
	
	mov cx, 393
	mov dx, 59
	int 10h
	
	mov cx, 394
	mov dx, 59
	int 10h
	
	mov cx, 395
	mov dx, 59
	int 10h
	
	mov cx, 396
	mov dx, 59
	int 10h
	
	mov cx, 404
	mov dx, 59
	int 10h
	
	mov cx, 410
	mov dx, 59
	int 10h
	
	mov cx, 411
	mov dx, 59
	int 10h
	
	mov cx, 412
	mov dx, 59
	int 10h
	
	mov cx, 413
	mov dx, 59
	int 10h
	
	mov cx, 419
	mov dx, 59
	int 10h
	
	mov cx, 420
	mov dx, 59
	int 10h
	
	mov cx, 433
	mov dx, 59
	int 10h
	
	mov cx, 441
	mov dx, 59
	int 10h
	
	mov cx, 446
	mov dx, 59
	int 10h
	
	mov cx, 449
	mov dx, 59
	int 10h
	
	mov cx, 456
	mov dx, 59
	int 10h
	
	mov cx, 457
	mov dx, 59
	int 10h
	
	mov cx, 461
	mov dx, 59
	int 10h
	
	mov cx, 462
	mov dx, 59
	int 10h
	
	mov cx, 465
	mov dx, 59
	int 10h
	
	mov cx, 469
	mov dx, 59
	int 10h
	
	mov cx, 473
	mov dx, 59
	int 10h
	
	mov cx, 481
	mov dx, 59
	int 10h
	
	mov cx, 485
	mov dx, 59
	int 10h
	
	mov cx, 489
	mov dx, 59
	int 10h
	
	mov cx, 490
	mov dx, 59
	int 10h
	
	mov cx, 494
	mov dx, 59
	int 10h
	
	mov cx, 505
	mov dx, 59
	int 10h
	
	mov cx, 513
	mov dx, 59
	int 10h
	
	mov cx, 517
	mov dx, 59
	int 10h
	
	mov cx, 521
	mov dx, 59
	int 10h
	
	mov cx, 3
	mov dx, 60
	int 10h
	
	mov cx, 9
	mov dx, 60
	int 10h
	
	mov cx, 10
	mov dx, 60
	int 10h
	
	mov cx, 14
	mov dx, 60
	int 10h
	
	mov cx, 18
	mov dx, 60
	int 10h
	
	mov cx, 22
	mov dx, 60
	int 10h
	
	mov cx, 33
	mov dx, 60
	int 10h
	
	mov cx, 34
	mov dx, 60
	int 10h
	
	mov cx, 38
	mov dx, 60
	int 10h
	
	mov cx, 41
	mov dx, 60
	int 10h
	
	mov cx, 42
	mov dx, 60
	int 10h
	
	mov cx, 45
	mov dx, 60
	int 10h
	
	mov cx, 49
	mov dx, 60
	int 10h
	
	mov cx, 54
	mov dx, 60
	int 10h
	
	mov cx, 57
	mov dx, 60
	int 10h
	
	mov cx, 58
	mov dx, 60
	int 10h
	
	mov cx, 62
	mov dx, 60
	int 10h
	
	mov cx, 68
	mov dx, 60
	int 10h
	
	mov cx, 74
	mov dx, 60
	int 10h
	
	mov cx, 78
	mov dx, 60
	int 10h
	
	mov cx, 80
	mov dx, 60
	int 10h
	
	mov cx, 81
	mov dx, 60
	int 10h
	
	mov cx, 83
	mov dx, 60
	int 10h
	
	mov cx, 84
	mov dx, 60
	int 10h
	
	mov cx, 86
	mov dx, 60
	int 10h
	
	mov cx, 97
	mov dx, 60
	int 10h
	
	mov cx, 106
	mov dx, 60
	int 10h
	
	mov cx, 110
	mov dx, 60
	int 10h
	
	mov cx, 114
	mov dx, 60
	int 10h
	
	mov cx, 118
	mov dx, 60
	int 10h
	
	mov cx, 120
	mov dx, 60
	int 10h
	
	mov cx, 121
	mov dx, 60
	int 10h
	
	mov cx, 123
	mov dx, 60
	int 10h
	
	mov cx, 124
	mov dx, 60
	int 10h
	
	mov cx, 126
	mov dx, 60
	int 10h
	
	mov cx, 129
	mov dx, 60
	int 10h
	
	mov cx, 146
	mov dx, 60
	int 10h
	
	mov cx, 153
	mov dx, 60
	int 10h
	
	mov cx, 158
	mov dx, 60
	int 10h
	
	mov cx, 169
	mov dx, 60
	int 10h
	
	mov cx, 170
	mov dx, 60
	int 10h
	
	mov cx, 174
	mov dx, 60
	int 10h
	
	mov cx, 178
	mov dx, 60
	int 10h
	
	mov cx, 182
	mov dx, 60
	int 10h
	
	mov cx, 194
	mov dx, 60
	int 10h
	
	mov cx, 205
	mov dx, 60
	int 10h
	
	mov cx, 209
	mov dx, 60
	int 10h
	
	mov cx, 214
	mov dx, 60
	int 10h
	
	mov cx, 217
	mov dx, 60
	int 10h
	
	mov cx, 226
	mov dx, 60
	int 10h
	
	mov cx, 230
	mov dx, 60
	int 10h
	
	mov cx, 233
	mov dx, 60
	int 10h
	
	mov cx, 237
	mov dx, 60
	int 10h
	
	mov cx, 238
	mov dx, 60
	int 10h
	
	mov cx, 249
	mov dx, 60
	int 10h
	
	mov cx, 250
	mov dx, 60
	int 10h
	
	mov cx, 254
	mov dx, 60
	int 10h
	
	mov cx, 257
	mov dx, 60
	int 10h
	
	mov cx, 262
	mov dx, 60
	int 10h
	
	mov cx, 274
	mov dx, 60
	int 10h
	
	mov cx, 281
	mov dx, 60
	int 10h
	
	mov cx, 282
	mov dx, 60
	int 10h
	
	mov cx, 286
	mov dx, 60
	int 10h
	
	mov cx, 290
	mov dx, 60
	int 10h
	
	mov cx, 294
	mov dx, 60
	int 10h
	
	mov cx, 306
	mov dx, 60
	int 10h
	
	mov cx, 313
	mov dx, 60
	int 10h
	
	mov cx, 318
	mov dx, 60
	int 10h
	
	mov cx, 324
	mov dx, 60
	int 10h
	
	mov cx, 332
	mov dx, 60
	int 10h
	
	mov cx, 337
	mov dx, 60
	int 10h
	
	mov cx, 342
	mov dx, 60
	int 10h
	
	mov cx, 344
	mov dx, 60
	int 10h
	
	mov cx, 347
	mov dx, 60
	int 10h
	
	mov cx, 351
	mov dx, 60
	int 10h
	
	mov cx, 356
	mov dx, 60
	int 10h
	
	mov cx, 361
	mov dx, 60
	int 10h
	
	mov cx, 362
	mov dx, 60
	int 10h
	
	mov cx, 366
	mov dx, 60
	int 10h
	
	mov cx, 369
	mov dx, 60
	int 10h
	
	mov cx, 373
	mov dx, 60
	int 10h
	
	mov cx, 374
	mov dx, 60
	int 10h
	
	mov cx, 386
	mov dx, 60
	int 10h
	
	mov cx, 396
	mov dx, 60
	int 10h
	
	mov cx, 404
	mov dx, 60
	int 10h
	
	mov cx, 410
	mov dx, 60
	int 10h
	
	mov cx, 414
	mov dx, 60
	int 10h
	
	mov cx, 419
	mov dx, 60
	int 10h
	
	mov cx, 420
	mov dx, 60
	int 10h
	
	mov cx, 433
	mov dx, 60
	int 10h
	
	mov cx, 441
	mov dx, 60
	int 10h
	
	mov cx, 446
	mov dx, 60
	int 10h
	
	mov cx, 448
	mov dx, 60
	int 10h
	
	mov cx, 456
	mov dx, 60
	int 10h
	
	mov cx, 458
	mov dx, 60
	int 10h
	
	mov cx, 460
	mov dx, 60
	int 10h
	
	mov cx, 462
	mov dx, 60
	int 10h
	
	mov cx, 465
	mov dx, 60
	int 10h
	
	mov cx, 470
	mov dx, 60
	int 10h
	
	mov cx, 472
	mov dx, 60
	int 10h
	
	mov cx, 480
	mov dx, 60
	int 10h
	
	mov cx, 486
	mov dx, 60
	int 10h
	
	mov cx, 489
	mov dx, 60
	int 10h
	
	mov cx, 491
	mov dx, 60
	int 10h
	
	mov cx, 494
	mov dx, 60
	int 10h
	
	mov cx, 505
	mov dx, 60
	int 10h
	
	mov cx, 514
	mov dx, 60
	int 10h
	
	mov cx, 516
	mov dx, 60
	int 10h
	
	mov cx, 521
	mov dx, 60
	int 10h
	
	mov cx, 3
	mov dx, 61
	int 10h
	
	mov cx, 9
	mov dx, 61
	int 10h
	
	mov cx, 14
	mov dx, 61
	int 10h
	
	mov cx, 17
	mov dx, 61
	int 10h
	
	mov cx, 22
	mov dx, 61
	int 10h
	
	mov cx, 33
	mov dx, 61
	int 10h
	
	mov cx, 38
	mov dx, 61
	int 10h
	
	mov cx, 41
	mov dx, 61
	int 10h
	
	mov cx, 49
	mov dx, 61
	int 10h
	
	mov cx, 54
	mov dx, 61
	int 10h
	
	mov cx, 57
	mov dx, 61
	int 10h
	
	mov cx, 62
	mov dx, 61
	int 10h
	
	mov cx, 68
	mov dx, 61
	int 10h
	
	mov cx, 73
	mov dx, 61
	int 10h
	
	mov cx, 78
	mov dx, 61
	int 10h
	
	mov cx, 80
	mov dx, 61
	int 10h
	
	mov cx, 83
	mov dx, 61
	int 10h
	
	mov cx, 86
	mov dx, 61
	int 10h
	
	mov cx, 97
	mov dx, 61
	int 10h
	
	mov cx, 98
	mov dx, 61
	int 10h
	
	mov cx, 105
	mov dx, 61
	int 10h
	
	mov cx, 110
	mov dx, 61
	int 10h
	
	mov cx, 113
	mov dx, 61
	int 10h
	
	mov cx, 118
	mov dx, 61
	int 10h
	
	mov cx, 120
	mov dx, 61
	int 10h
	
	mov cx, 123
	mov dx, 61
	int 10h
	
	mov cx, 126
	mov dx, 61
	int 10h
	
	mov cx, 129
	mov dx, 61
	int 10h
	
	mov cx, 130
	mov dx, 61
	int 10h
	
	mov cx, 146
	mov dx, 61
	int 10h
	
	mov cx, 153
	mov dx, 61
	int 10h
	
	mov cx, 158
	mov dx, 61
	int 10h
	
	mov cx, 169
	mov dx, 61
	int 10h
	
	mov cx, 174
	mov dx, 61
	int 10h
	
	mov cx, 177
	mov dx, 61
	int 10h
	
	mov cx, 182
	mov dx, 61
	int 10h
	
	mov cx, 193
	mov dx, 61
	int 10h
	
	mov cx, 205
	mov dx, 61
	int 10h
	
	mov cx, 209
	mov dx, 61
	int 10h
	
	mov cx, 214
	mov dx, 61
	int 10h
	
	mov cx, 217
	mov dx, 61
	int 10h
	
	mov cx, 218
	mov dx, 61
	int 10h
	
	mov cx, 225
	mov dx, 61
	int 10h
	
	mov cx, 230
	mov dx, 61
	int 10h
	
	mov cx, 233
	mov dx, 61
	int 10h
	
	mov cx, 238
	mov dx, 61
	int 10h
	
	mov cx, 249
	mov dx, 61
	int 10h
	
	mov cx, 254
	mov dx, 61
	int 10h
	
	mov cx, 257
	mov dx, 61
	int 10h
	
	mov cx, 262
	mov dx, 61
	int 10h
	
	mov cx, 274
	mov dx, 61
	int 10h
	
	mov cx, 281
	mov dx, 61
	int 10h
	
	mov cx, 286
	mov dx, 61
	int 10h
	
	mov cx, 289
	mov dx, 61
	int 10h
	
	mov cx, 294
	mov dx, 61
	int 10h
	
	mov cx, 306
	mov dx, 61
	int 10h
	
	mov cx, 313
	mov dx, 61
	int 10h
	
	mov cx, 318
	mov dx, 61
	int 10h
	
	mov cx, 324
	mov dx, 61
	int 10h
	
	mov cx, 332
	mov dx, 61
	int 10h
	
	mov cx, 337
	mov dx, 61
	int 10h
	
	mov cx, 342
	mov dx, 61
	int 10h
	
	mov cx, 345
	mov dx, 61
	int 10h
	
	mov cx, 347
	mov dx, 61
	int 10h
	
	mov cx, 348
	mov dx, 61
	int 10h
	
	mov cx, 350
	mov dx, 61
	int 10h
	
	mov cx, 356
	mov dx, 61
	int 10h
	
	mov cx, 361
	mov dx, 61
	int 10h
	
	mov cx, 366
	mov dx, 61
	int 10h
	
	mov cx, 369
	mov dx, 61
	int 10h
	
	mov cx, 374
	mov dx, 61
	int 10h
	
	mov cx, 386
	mov dx, 61
	int 10h
	
	mov cx, 396
	mov dx, 61
	int 10h
	
	mov cx, 404
	mov dx, 61
	int 10h
	
	mov cx, 409
	mov dx, 61
	int 10h
	
	mov cx, 414
	mov dx, 61
	int 10h
	
	mov cx, 434
	mov dx, 61
	int 10h
	
	mov cx, 435
	mov dx, 61
	int 10h
	
	mov cx, 436
	mov dx, 61
	int 10h
	
	mov cx, 441
	mov dx, 61
	int 10h
	
	mov cx, 446
	mov dx, 61
	int 10h
	
	mov cx, 448
	mov dx, 61
	int 10h
	
	mov cx, 456
	mov dx, 61
	int 10h
	
	mov cx, 458
	mov dx, 61
	int 10h
	
	mov cx, 460
	mov dx, 61
	int 10h
	
	mov cx, 462
	mov dx, 61
	int 10h
	
	mov cx, 465
	mov dx, 61
	int 10h
	
	mov cx, 470
	mov dx, 61
	int 10h
	
	mov cx, 472
	mov dx, 61
	int 10h
	
	mov cx, 480
	mov dx, 61
	int 10h
	
	mov cx, 486
	mov dx, 61
	int 10h
	
	mov cx, 489
	mov dx, 61
	int 10h
	
	mov cx, 491
	mov dx, 61
	int 10h
	
	mov cx, 494
	mov dx, 61
	int 10h
	
	mov cx, 506
	mov dx, 61
	int 10h
	
	mov cx, 507
	mov dx, 61
	int 10h
	
	mov cx, 508
	mov dx, 61
	int 10h
	
	mov cx, 514
	mov dx, 61
	int 10h
	
	mov cx, 516
	mov dx, 61
	int 10h
	
	mov cx, 522
	mov dx, 61
	int 10h
	
	mov cx, 523
	mov dx, 61
	int 10h
	
	mov cx, 524
	mov dx, 61
	int 10h
	
	mov cx, 3
	mov dx, 62
	int 10h
	
	mov cx, 9
	mov dx, 62
	int 10h
	
	mov cx, 14
	mov dx, 62
	int 10h
	
	mov cx, 17
	mov dx, 62
	int 10h
	
	mov cx, 18
	mov dx, 62
	int 10h
	
	mov cx, 19
	mov dx, 62
	int 10h
	
	mov cx, 20
	mov dx, 62
	int 10h
	
	mov cx, 21
	mov dx, 62
	int 10h
	
	mov cx, 22
	mov dx, 62
	int 10h
	
	mov cx, 33
	mov dx, 62
	int 10h
	
	mov cx, 38
	mov dx, 62
	int 10h
	
	mov cx, 41
	mov dx, 62
	int 10h
	
	mov cx, 49
	mov dx, 62
	int 10h
	
	mov cx, 54
	mov dx, 62
	int 10h
	
	mov cx, 57
	mov dx, 62
	int 10h
	
	mov cx, 62
	mov dx, 62
	int 10h
	
	mov cx, 68
	mov dx, 62
	int 10h
	
	mov cx, 73
	mov dx, 62
	int 10h
	
	mov cx, 74
	mov dx, 62
	int 10h
	
	mov cx, 75
	mov dx, 62
	int 10h
	
	mov cx, 76
	mov dx, 62
	int 10h
	
	mov cx, 77
	mov dx, 62
	int 10h
	
	mov cx, 78
	mov dx, 62
	int 10h
	
	mov cx, 80
	mov dx, 62
	int 10h
	
	mov cx, 83
	mov dx, 62
	int 10h
	
	mov cx, 86
	mov dx, 62
	int 10h
	
	mov cx, 99
	mov dx, 62
	int 10h
	
	mov cx, 100
	mov dx, 62
	int 10h
	
	mov cx, 105
	mov dx, 62
	int 10h
	
	mov cx, 106
	mov dx, 62
	int 10h
	
	mov cx, 107
	mov dx, 62
	int 10h
	
	mov cx, 108
	mov dx, 62
	int 10h
	
	mov cx, 109
	mov dx, 62
	int 10h
	
	mov cx, 110
	mov dx, 62
	int 10h
	
	mov cx, 113
	mov dx, 62
	int 10h
	
	mov cx, 114
	mov dx, 62
	int 10h
	
	mov cx, 115
	mov dx, 62
	int 10h
	
	mov cx, 116
	mov dx, 62
	int 10h
	
	mov cx, 117
	mov dx, 62
	int 10h
	
	mov cx, 118
	mov dx, 62
	int 10h
	
	mov cx, 120
	mov dx, 62
	int 10h
	
	mov cx, 123
	mov dx, 62
	int 10h
	
	mov cx, 126
	mov dx, 62
	int 10h
	
	mov cx, 131
	mov dx, 62
	int 10h
	
	mov cx, 132
	mov dx, 62
	int 10h
	
	mov cx, 146
	mov dx, 62
	int 10h
	
	mov cx, 153
	mov dx, 62
	int 10h
	
	mov cx, 158
	mov dx, 62
	int 10h
	
	mov cx, 169
	mov dx, 62
	int 10h
	
	mov cx, 174
	mov dx, 62
	int 10h
	
	mov cx, 177
	mov dx, 62
	int 10h
	
	mov cx, 178
	mov dx, 62
	int 10h
	
	mov cx, 179
	mov dx, 62
	int 10h
	
	mov cx, 180
	mov dx, 62
	int 10h
	
	mov cx, 181
	mov dx, 62
	int 10h
	
	mov cx, 182
	mov dx, 62
	int 10h
	
	mov cx, 193
	mov dx, 62
	int 10h
	
	mov cx, 202
	mov dx, 62
	int 10h
	
	mov cx, 203
	mov dx, 62
	int 10h
	
	mov cx, 204
	mov dx, 62
	int 10h
	
	mov cx, 205
	mov dx, 62
	int 10h
	
	mov cx, 209
	mov dx, 62
	int 10h
	
	mov cx, 214
	mov dx, 62
	int 10h
	
	mov cx, 219
	mov dx, 62
	int 10h
	
	mov cx, 220
	mov dx, 62
	int 10h
	
	mov cx, 225
	mov dx, 62
	int 10h
	
	mov cx, 226
	mov dx, 62
	int 10h
	
	mov cx, 227
	mov dx, 62
	int 10h
	
	mov cx, 228
	mov dx, 62
	int 10h
	
	mov cx, 229
	mov dx, 62
	int 10h
	
	mov cx, 230
	mov dx, 62
	int 10h
	
	mov cx, 233
	mov dx, 62
	int 10h
	
	mov cx, 238
	mov dx, 62
	int 10h
	
	mov cx, 249
	mov dx, 62
	int 10h
	
	mov cx, 254
	mov dx, 62
	int 10h
	
	mov cx, 258
	mov dx, 62
	int 10h
	
	mov cx, 261
	mov dx, 62
	int 10h
	
	mov cx, 274
	mov dx, 62
	int 10h
	
	mov cx, 281
	mov dx, 62
	int 10h
	
	mov cx, 286
	mov dx, 62
	int 10h
	
	mov cx, 289
	mov dx, 62
	int 10h
	
	mov cx, 290
	mov dx, 62
	int 10h
	
	mov cx, 291
	mov dx, 62
	int 10h
	
	mov cx, 292
	mov dx, 62
	int 10h
	
	mov cx, 293
	mov dx, 62
	int 10h
	
	mov cx, 294
	mov dx, 62
	int 10h
	
	mov cx, 306
	mov dx, 62
	int 10h
	
	mov cx, 313
	mov dx, 62
	int 10h
	
	mov cx, 318
	mov dx, 62
	int 10h
	
	mov cx, 324
	mov dx, 62
	int 10h
	
	mov cx, 332
	mov dx, 62
	int 10h
	
	mov cx, 337
	mov dx, 62
	int 10h
	
	mov cx, 342
	mov dx, 62
	int 10h
	
	mov cx, 345
	mov dx, 62
	int 10h
	
	mov cx, 347
	mov dx, 62
	int 10h
	
	mov cx, 348
	mov dx, 62
	int 10h
	
	mov cx, 350
	mov dx, 62
	int 10h
	
	mov cx, 356
	mov dx, 62
	int 10h
	
	mov cx, 361
	mov dx, 62
	int 10h
	
	mov cx, 366
	mov dx, 62
	int 10h
	
	mov cx, 369
	mov dx, 62
	int 10h
	
	mov cx, 374
	mov dx, 62
	int 10h
	
	mov cx, 386
	mov dx, 62
	int 10h
	
	mov cx, 396
	mov dx, 62
	int 10h
	
	mov cx, 404
	mov dx, 62
	int 10h
	
	mov cx, 409
	mov dx, 62
	int 10h
	
	mov cx, 410
	mov dx, 62
	int 10h
	
	mov cx, 411
	mov dx, 62
	int 10h
	
	mov cx, 412
	mov dx, 62
	int 10h
	
	mov cx, 413
	mov dx, 62
	int 10h
	
	mov cx, 414
	mov dx, 62
	int 10h
	
	mov cx, 437
	mov dx, 62
	int 10h
	
	mov cx, 441
	mov dx, 62
	int 10h
	
	mov cx, 442
	mov dx, 62
	int 10h
	
	mov cx, 443
	mov dx, 62
	int 10h
	
	mov cx, 444
	mov dx, 62
	int 10h
	
	mov cx, 445
	mov dx, 62
	int 10h
	
	mov cx, 448
	mov dx, 62
	int 10h
	
	mov cx, 456
	mov dx, 62
	int 10h
	
	mov cx, 458
	mov dx, 62
	int 10h
	
	mov cx, 460
	mov dx, 62
	int 10h
	
	mov cx, 462
	mov dx, 62
	int 10h
	
	mov cx, 465
	mov dx, 62
	int 10h
	
	mov cx, 470
	mov dx, 62
	int 10h
	
	mov cx, 472
	mov dx, 62
	int 10h
	
	mov cx, 480
	mov dx, 62
	int 10h
	
	mov cx, 486
	mov dx, 62
	int 10h
	
	mov cx, 489
	mov dx, 62
	int 10h
	
	mov cx, 492
	mov dx, 62
	int 10h
	
	mov cx, 494
	mov dx, 62
	int 10h
	
	mov cx, 509
	mov dx, 62
	int 10h
	
	mov cx, 515
	mov dx, 62
	int 10h
	
	mov cx, 525
	mov dx, 62
	int 10h
	
	mov cx, 3
	mov dx, 63
	int 10h
	
	mov cx, 9
	mov dx, 63
	int 10h
	
	mov cx, 14
	mov dx, 63
	int 10h
	
	mov cx, 17
	mov dx, 63
	int 10h
	
	mov cx, 33
	mov dx, 63
	int 10h
	
	mov cx, 38
	mov dx, 63
	int 10h
	
	mov cx, 41
	mov dx, 63
	int 10h
	
	mov cx, 49
	mov dx, 63
	int 10h
	
	mov cx, 54
	mov dx, 63
	int 10h
	
	mov cx, 57
	mov dx, 63
	int 10h
	
	mov cx, 62
	mov dx, 63
	int 10h
	
	mov cx, 68
	mov dx, 63
	int 10h
	
	mov cx, 73
	mov dx, 63
	int 10h
	
	mov cx, 80
	mov dx, 63
	int 10h
	
	mov cx, 83
	mov dx, 63
	int 10h
	
	mov cx, 86
	mov dx, 63
	int 10h
	
	mov cx, 101
	mov dx, 63
	int 10h
	
	mov cx, 105
	mov dx, 63
	int 10h
	
	mov cx, 113
	mov dx, 63
	int 10h
	
	mov cx, 120
	mov dx, 63
	int 10h
	
	mov cx, 123
	mov dx, 63
	int 10h
	
	mov cx, 126
	mov dx, 63
	int 10h
	
	mov cx, 133
	mov dx, 63
	int 10h
	
	mov cx, 146
	mov dx, 63
	int 10h
	
	mov cx, 153
	mov dx, 63
	int 10h
	
	mov cx, 158
	mov dx, 63
	int 10h
	
	mov cx, 169
	mov dx, 63
	int 10h
	
	mov cx, 174
	mov dx, 63
	int 10h
	
	mov cx, 177
	mov dx, 63
	int 10h
	
	mov cx, 193
	mov dx, 63
	int 10h
	
	mov cx, 201
	mov dx, 63
	int 10h
	
	mov cx, 205
	mov dx, 63
	int 10h
	
	mov cx, 209
	mov dx, 63
	int 10h
	
	mov cx, 214
	mov dx, 63
	int 10h
	
	mov cx, 221
	mov dx, 63
	int 10h
	
	mov cx, 225
	mov dx, 63
	int 10h
	
	mov cx, 233
	mov dx, 63
	int 10h
	
	mov cx, 238
	mov dx, 63
	int 10h
	
	mov cx, 249
	mov dx, 63
	int 10h
	
	mov cx, 254
	mov dx, 63
	int 10h
	
	mov cx, 258
	mov dx, 63
	int 10h
	
	mov cx, 261
	mov dx, 63
	int 10h
	
	mov cx, 274
	mov dx, 63
	int 10h
	
	mov cx, 281
	mov dx, 63
	int 10h
	
	mov cx, 286
	mov dx, 63
	int 10h
	
	mov cx, 289
	mov dx, 63
	int 10h
	
	mov cx, 306
	mov dx, 63
	int 10h
	
	mov cx, 313
	mov dx, 63
	int 10h
	
	mov cx, 318
	mov dx, 63
	int 10h
	
	mov cx, 324
	mov dx, 63
	int 10h
	
	mov cx, 332
	mov dx, 63
	int 10h
	
	mov cx, 337
	mov dx, 63
	int 10h
	
	mov cx, 342
	mov dx, 63
	int 10h
	
	mov cx, 345
	mov dx, 63
	int 10h
	
	mov cx, 346
	mov dx, 63
	int 10h
	
	mov cx, 348
	mov dx, 63
	int 10h
	
	mov cx, 350
	mov dx, 63
	int 10h
	
	mov cx, 356
	mov dx, 63
	int 10h
	
	mov cx, 361
	mov dx, 63
	int 10h
	
	mov cx, 366
	mov dx, 63
	int 10h
	
	mov cx, 369
	mov dx, 63
	int 10h
	
	mov cx, 374
	mov dx, 63
	int 10h
	
	mov cx, 386
	mov dx, 63
	int 10h
	
	mov cx, 396
	mov dx, 63
	int 10h
	
	mov cx, 404
	mov dx, 63
	int 10h
	
	mov cx, 409
	mov dx, 63
	int 10h
	
	mov cx, 438
	mov dx, 63
	int 10h
	
	mov cx, 441
	mov dx, 63
	int 10h
	
	mov cx, 448
	mov dx, 63
	int 10h
	
	mov cx, 456
	mov dx, 63
	int 10h
	
	mov cx, 459
	mov dx, 63
	int 10h
	
	mov cx, 462
	mov dx, 63
	int 10h
	
	mov cx, 465
	mov dx, 63
	int 10h
	
	mov cx, 470
	mov dx, 63
	int 10h
	
	mov cx, 472
	mov dx, 63
	int 10h
	
	mov cx, 480
	mov dx, 63
	int 10h
	
	mov cx, 486
	mov dx, 63
	int 10h
	
	mov cx, 489
	mov dx, 63
	int 10h
	
	mov cx, 492
	mov dx, 63
	int 10h
	
	mov cx, 494
	mov dx, 63
	int 10h
	
	mov cx, 510
	mov dx, 63
	int 10h
	
	mov cx, 515
	mov dx, 63
	int 10h
	
	mov cx, 526
	mov dx, 63
	int 10h
	
	mov cx, 3
	mov dx, 64
	int 10h
	
	mov cx, 9
	mov dx, 64
	int 10h
	
	mov cx, 14
	mov dx, 64
	int 10h
	
	mov cx, 17
	mov dx, 64
	int 10h
	
	mov cx, 33
	mov dx, 64
	int 10h
	
	mov cx, 34
	mov dx, 64
	int 10h
	
	mov cx, 38
	mov dx, 64
	int 10h
	
	mov cx, 41
	mov dx, 64
	int 10h
	
	mov cx, 49
	mov dx, 64
	int 10h
	
	mov cx, 54
	mov dx, 64
	int 10h
	
	mov cx, 57
	mov dx, 64
	int 10h
	
	mov cx, 58
	mov dx, 64
	int 10h
	
	mov cx, 62
	mov dx, 64
	int 10h
	
	mov cx, 68
	mov dx, 64
	int 10h
	
	mov cx, 73
	mov dx, 64
	int 10h
	
	mov cx, 80
	mov dx, 64
	int 10h
	
	mov cx, 83
	mov dx, 64
	int 10h
	
	mov cx, 86
	mov dx, 64
	int 10h
	
	mov cx, 101
	mov dx, 64
	int 10h
	
	mov cx, 105
	mov dx, 64
	int 10h
	
	mov cx, 113
	mov dx, 64
	int 10h
	
	mov cx, 120
	mov dx, 64
	int 10h
	
	mov cx, 123
	mov dx, 64
	int 10h
	
	mov cx, 126
	mov dx, 64
	int 10h
	
	mov cx, 133
	mov dx, 64
	int 10h
	
	mov cx, 146
	mov dx, 64
	int 10h
	
	mov cx, 153
	mov dx, 64
	int 10h
	
	mov cx, 158
	mov dx, 64
	int 10h
	
	mov cx, 169
	mov dx, 64
	int 10h
	
	mov cx, 170
	mov dx, 64
	int 10h
	
	mov cx, 174
	mov dx, 64
	int 10h
	
	mov cx, 177
	mov dx, 64
	int 10h
	
	mov cx, 194
	mov dx, 64
	int 10h
	
	mov cx, 201
	mov dx, 64
	int 10h
	
	mov cx, 205
	mov dx, 64
	int 10h
	
	mov cx, 209
	mov dx, 64
	int 10h
	
	mov cx, 213
	mov dx, 64
	int 10h
	
	mov cx, 214
	mov dx, 64
	int 10h
	
	mov cx, 221
	mov dx, 64
	int 10h
	
	mov cx, 225
	mov dx, 64
	int 10h
	
	mov cx, 233
	mov dx, 64
	int 10h
	
	mov cx, 237
	mov dx, 64
	int 10h
	
	mov cx, 238
	mov dx, 64
	int 10h
	
	mov cx, 249
	mov dx, 64
	int 10h
	
	mov cx, 250
	mov dx, 64
	int 10h
	
	mov cx, 254
	mov dx, 64
	int 10h
	
	mov cx, 259
	mov dx, 64
	int 10h
	
	mov cx, 260
	mov dx, 64
	int 10h
	
	mov cx, 274
	mov dx, 64
	int 10h
	
	mov cx, 281
	mov dx, 64
	int 10h
	
	mov cx, 286
	mov dx, 64
	int 10h
	
	mov cx, 289
	mov dx, 64
	int 10h
	
	mov cx, 306
	mov dx, 64
	int 10h
	
	mov cx, 313
	mov dx, 64
	int 10h
	
	mov cx, 318
	mov dx, 64
	int 10h
	
	mov cx, 324
	mov dx, 64
	int 10h
	
	mov cx, 332
	mov dx, 64
	int 10h
	
	mov cx, 337
	mov dx, 64
	int 10h
	
	mov cx, 342
	mov dx, 64
	int 10h
	
	mov cx, 346
	mov dx, 64
	int 10h
	
	mov cx, 349
	mov dx, 64
	int 10h
	
	mov cx, 356
	mov dx, 64
	int 10h
	
	mov cx, 361
	mov dx, 64
	int 10h
	
	mov cx, 366
	mov dx, 64
	int 10h
	
	mov cx, 369
	mov dx, 64
	int 10h
	
	mov cx, 373
	mov dx, 64
	int 10h
	
	mov cx, 374
	mov dx, 64
	int 10h
	
	mov cx, 386
	mov dx, 64
	int 10h
	
	mov cx, 396
	mov dx, 64
	int 10h
	
	mov cx, 404
	mov dx, 64
	int 10h
	
	mov cx, 409
	mov dx, 64
	int 10h
	
	mov cx, 419
	mov dx, 64
	int 10h
	
	mov cx, 420
	mov dx, 64
	int 10h
	
	mov cx, 438
	mov dx, 64
	int 10h
	
	mov cx, 441
	mov dx, 64
	int 10h
	
	mov cx, 449
	mov dx, 64
	int 10h
	
	mov cx, 456
	mov dx, 64
	int 10h
	
	mov cx, 462
	mov dx, 64
	int 10h
	
	mov cx, 465
	mov dx, 64
	int 10h
	
	mov cx, 469
	mov dx, 64
	int 10h
	
	mov cx, 473
	mov dx, 64
	int 10h
	
	mov cx, 481
	mov dx, 64
	int 10h
	
	mov cx, 485
	mov dx, 64
	int 10h
	
	mov cx, 489
	mov dx, 64
	int 10h
	
	mov cx, 493
	mov dx, 64
	int 10h
	
	mov cx, 494
	mov dx, 64
	int 10h
	
	mov cx, 498
	mov dx, 64
	int 10h
	
	mov cx, 499
	mov dx, 64
	int 10h
	
	mov cx, 510
	mov dx, 64
	int 10h
	
	mov cx, 515
	mov dx, 64
	int 10h
	
	mov cx, 526
	mov dx, 64
	int 10h
	
	mov cx, 3
	mov dx, 65
	int 10h
	
	mov cx, 9
	mov dx, 65
	int 10h
	
	mov cx, 14
	mov dx, 65
	int 10h
	
	mov cx, 18
	mov dx, 65
	int 10h
	
	mov cx, 19
	mov dx, 65
	int 10h
	
	mov cx, 20
	mov dx, 65
	int 10h
	
	mov cx, 21
	mov dx, 65
	int 10h
	
	mov cx, 22
	mov dx, 65
	int 10h
	
	mov cx, 33
	mov dx, 65
	int 10h
	
	mov cx, 35
	mov dx, 65
	int 10h
	
	mov cx, 36
	mov dx, 65
	int 10h
	
	mov cx, 37
	mov dx, 65
	int 10h
	
	mov cx, 41
	mov dx, 65
	int 10h
	
	mov cx, 50
	mov dx, 65
	int 10h
	
	mov cx, 51
	mov dx, 65
	int 10h
	
	mov cx, 52
	mov dx, 65
	int 10h
	
	mov cx, 53
	mov dx, 65
	int 10h
	
	mov cx, 57
	mov dx, 65
	int 10h
	
	mov cx, 59
	mov dx, 65
	int 10h
	
	mov cx, 60
	mov dx, 65
	int 10h
	
	mov cx, 61
	mov dx, 65
	int 10h
	
	mov cx, 68
	mov dx, 65
	int 10h
	
	mov cx, 74
	mov dx, 65
	int 10h
	
	mov cx, 75
	mov dx, 65
	int 10h
	
	mov cx, 76
	mov dx, 65
	int 10h
	
	mov cx, 77
	mov dx, 65
	int 10h
	
	mov cx, 78
	mov dx, 65
	int 10h
	
	mov cx, 80
	mov dx, 65
	int 10h
	
	mov cx, 83
	mov dx, 65
	int 10h
	
	mov cx, 86
	mov dx, 65
	int 10h
	
	mov cx, 97
	mov dx, 65
	int 10h
	
	mov cx, 98
	mov dx, 65
	int 10h
	
	mov cx, 99
	mov dx, 65
	int 10h
	
	mov cx, 100
	mov dx, 65
	int 10h
	
	mov cx, 106
	mov dx, 65
	int 10h
	
	mov cx, 107
	mov dx, 65
	int 10h
	
	mov cx, 108
	mov dx, 65
	int 10h
	
	mov cx, 109
	mov dx, 65
	int 10h
	
	mov cx, 110
	mov dx, 65
	int 10h
	
	mov cx, 114
	mov dx, 65
	int 10h
	
	mov cx, 115
	mov dx, 65
	int 10h
	
	mov cx, 116
	mov dx, 65
	int 10h
	
	mov cx, 117
	mov dx, 65
	int 10h
	
	mov cx, 118
	mov dx, 65
	int 10h
	
	mov cx, 120
	mov dx, 65
	int 10h
	
	mov cx, 123
	mov dx, 65
	int 10h
	
	mov cx, 126
	mov dx, 65
	int 10h
	
	mov cx, 129
	mov dx, 65
	int 10h
	
	mov cx, 130
	mov dx, 65
	int 10h
	
	mov cx, 131
	mov dx, 65
	int 10h
	
	mov cx, 132
	mov dx, 65
	int 10h
	
	mov cx, 147
	mov dx, 65
	int 10h
	
	mov cx, 148
	mov dx, 65
	int 10h
	
	mov cx, 149
	mov dx, 65
	int 10h
	
	mov cx, 154
	mov dx, 65
	int 10h
	
	mov cx, 155
	mov dx, 65
	int 10h
	
	mov cx, 156
	mov dx, 65
	int 10h
	
	mov cx, 157
	mov dx, 65
	int 10h
	
	mov cx, 169
	mov dx, 65
	int 10h
	
	mov cx, 171
	mov dx, 65
	int 10h
	
	mov cx, 172
	mov dx, 65
	int 10h
	
	mov cx, 173
	mov dx, 65
	int 10h
	
	mov cx, 178
	mov dx, 65
	int 10h
	
	mov cx, 179
	mov dx, 65
	int 10h
	
	mov cx, 180
	mov dx, 65
	int 10h
	
	mov cx, 181
	mov dx, 65
	int 10h
	
	mov cx, 182
	mov dx, 65
	int 10h
	
	mov cx, 195
	mov dx, 65
	int 10h
	
	mov cx, 196
	mov dx, 65
	int 10h
	
	mov cx, 197
	mov dx, 65
	int 10h
	
	mov cx, 198
	mov dx, 65
	int 10h
	
	mov cx, 202
	mov dx, 65
	int 10h
	
	mov cx, 203
	mov dx, 65
	int 10h
	
	mov cx, 204
	mov dx, 65
	int 10h
	
	mov cx, 205
	mov dx, 65
	int 10h
	
	mov cx, 206
	mov dx, 65
	int 10h
	
	mov cx, 210
	mov dx, 65
	int 10h
	
	mov cx, 211
	mov dx, 65
	int 10h
	
	mov cx, 212
	mov dx, 65
	int 10h
	
	mov cx, 214
	mov dx, 65
	int 10h
	
	mov cx, 217
	mov dx, 65
	int 10h
	
	mov cx, 218
	mov dx, 65
	int 10h
	
	mov cx, 219
	mov dx, 65
	int 10h
	
	mov cx, 220
	mov dx, 65
	int 10h
	
	mov cx, 226
	mov dx, 65
	int 10h
	
	mov cx, 227
	mov dx, 65
	int 10h
	
	mov cx, 228
	mov dx, 65
	int 10h
	
	mov cx, 229
	mov dx, 65
	int 10h
	
	mov cx, 230
	mov dx, 65
	int 10h
	
	mov cx, 234
	mov dx, 65
	int 10h
	
	mov cx, 235
	mov dx, 65
	int 10h
	
	mov cx, 236
	mov dx, 65
	int 10h
	
	mov cx, 238
	mov dx, 65
	int 10h
	
	mov cx, 249
	mov dx, 65
	int 10h
	
	mov cx, 251
	mov dx, 65
	int 10h
	
	mov cx, 252
	mov dx, 65
	int 10h
	
	mov cx, 253
	mov dx, 65
	int 10h
	
	mov cx, 259
	mov dx, 65
	int 10h
	
	mov cx, 260
	mov dx, 65
	int 10h
	
	mov cx, 275
	mov dx, 65
	int 10h
	
	mov cx, 276
	mov dx, 65
	int 10h
	
	mov cx, 277
	mov dx, 65
	int 10h
	
	mov cx, 281
	mov dx, 65
	int 10h
	
	mov cx, 286
	mov dx, 65
	int 10h
	
	mov cx, 290
	mov dx, 65
	int 10h
	
	mov cx, 291
	mov dx, 65
	int 10h
	
	mov cx, 292
	mov dx, 65
	int 10h
	
	mov cx, 293
	mov dx, 65
	int 10h
	
	mov cx, 294
	mov dx, 65
	int 10h
	
	mov cx, 306
	mov dx, 65
	int 10h
	
	mov cx, 314
	mov dx, 65
	int 10h
	
	mov cx, 315
	mov dx, 65
	int 10h
	
	mov cx, 316
	mov dx, 65
	int 10h
	
	mov cx, 317
	mov dx, 65
	int 10h
	
	mov cx, 324
	mov dx, 65
	int 10h
	
	mov cx, 332
	mov dx, 65
	int 10h
	
	mov cx, 338
	mov dx, 65
	int 10h
	
	mov cx, 339
	mov dx, 65
	int 10h
	
	mov cx, 340
	mov dx, 65
	int 10h
	
	mov cx, 341
	mov dx, 65
	int 10h
	
	mov cx, 346
	mov dx, 65
	int 10h
	
	mov cx, 349
	mov dx, 65
	int 10h
	
	mov cx, 356
	mov dx, 65
	int 10h
	
	mov cx, 361
	mov dx, 65
	int 10h
	
	mov cx, 366
	mov dx, 65
	int 10h
	
	mov cx, 370
	mov dx, 65
	int 10h
	
	mov cx, 371
	mov dx, 65
	int 10h
	
	mov cx, 372
	mov dx, 65
	int 10h
	
	mov cx, 374
	mov dx, 65
	int 10h
	
	mov cx, 386
	mov dx, 65
	int 10h
	
	mov cx, 396
	mov dx, 65
	int 10h
	
	mov cx, 404
	mov dx, 65
	int 10h
	
	mov cx, 410
	mov dx, 65
	int 10h
	
	mov cx, 411
	mov dx, 65
	int 10h
	
	mov cx, 412
	mov dx, 65
	int 10h
	
	mov cx, 413
	mov dx, 65
	int 10h
	
	mov cx, 414
	mov dx, 65
	int 10h
	
	mov cx, 419
	mov dx, 65
	int 10h
	
	mov cx, 420
	mov dx, 65
	int 10h
	
	mov cx, 433
	mov dx, 65
	int 10h
	
	mov cx, 434
	mov dx, 65
	int 10h
	
	mov cx, 435
	mov dx, 65
	int 10h
	
	mov cx, 436
	mov dx, 65
	int 10h
	
	mov cx, 437
	mov dx, 65
	int 10h
	
	mov cx, 441
	mov dx, 65
	int 10h
	
	mov cx, 450
	mov dx, 65
	int 10h
	
	mov cx, 451
	mov dx, 65
	int 10h
	
	mov cx, 452
	mov dx, 65
	int 10h
	
	mov cx, 453
	mov dx, 65
	int 10h
	
	mov cx, 454
	mov dx, 65
	int 10h
	
	mov cx, 456
	mov dx, 65
	int 10h
	
	mov cx, 462
	mov dx, 65
	int 10h
	
	mov cx, 465
	mov dx, 65
	int 10h
	
	mov cx, 466
	mov dx, 65
	int 10h
	
	mov cx, 467
	mov dx, 65
	int 10h
	
	mov cx, 468
	mov dx, 65
	int 10h
	
	mov cx, 474
	mov dx, 65
	int 10h
	
	mov cx, 475
	mov dx, 65
	int 10h
	
	mov cx, 476
	mov dx, 65
	int 10h
	
	mov cx, 477
	mov dx, 65
	int 10h
	
	mov cx, 478
	mov dx, 65
	int 10h
	
	mov cx, 482
	mov dx, 65
	int 10h
	
	mov cx, 483
	mov dx, 65
	int 10h
	
	mov cx, 484
	mov dx, 65
	int 10h
	
	mov cx, 489
	mov dx, 65
	int 10h
	
	mov cx, 494
	mov dx, 65
	int 10h
	
	mov cx, 498
	mov dx, 65
	int 10h
	
	mov cx, 499
	mov dx, 65
	int 10h
	
	mov cx, 505
	mov dx, 65
	int 10h
	
	mov cx, 506
	mov dx, 65
	int 10h
	
	mov cx, 507
	mov dx, 65
	int 10h
	
	mov cx, 508
	mov dx, 65
	int 10h
	
	mov cx, 509
	mov dx, 65
	int 10h
	
	mov cx, 515
	mov dx, 65
	int 10h
	
	mov cx, 521
	mov dx, 65
	int 10h
	
	mov cx, 522
	mov dx, 65
	int 10h
	
	mov cx, 523
	mov dx, 65
	int 10h
	
	mov cx, 524
	mov dx, 65
	int 10h
	
	mov cx, 525
	mov dx, 65
	int 10h
	
	mov cx, 33
	mov dx, 66
	int 10h
	
	mov cx, 259
	mov dx, 66
	int 10h
	
	mov cx, 374
	mov dx, 66
	int 10h
	
	mov cx, 33
	mov dx, 67
	int 10h
	
	mov cx, 258
	mov dx, 67
	int 10h
	
	mov cx, 259
	mov dx, 67
	int 10h
	
	mov cx, 374
	mov dx, 67
	int 10h
	
	mov cx, 33
	mov dx, 68
	int 10h
	
	mov cx, 256
	mov dx, 68
	int 10h
	
	mov cx, 257
	mov dx, 68
	int 10h
	
	mov cx, 258
	mov dx, 68
	int 10h
	
	mov cx, 370
	mov dx, 68
	int 10h
	
	mov cx, 371
	mov dx, 68
	int 10h
	
	mov cx, 372
	mov dx, 68
	int 10h
	
	mov cx, 373
	mov dx, 68
	int 10h
	
	mov cx, 1
	mov dx, 86
	int 10h
	
	mov cx, 2
	mov dx, 86
	int 10h
	
	mov cx, 3
	mov dx, 86
	int 10h
	
	mov cx, 4
	mov dx, 86
	int 10h
	
	mov cx, 5
	mov dx, 86
	int 10h
	
	mov cx, 11
	mov dx, 86
	int 10h
	
	mov cx, 12
	mov dx, 86
	int 10h
	
	mov cx, 18
	mov dx, 86
	int 10h
	
	mov cx, 19
	mov dx, 86
	int 10h
	
	mov cx, 20
	mov dx, 86
	int 10h
	
	mov cx, 21
	mov dx, 86
	int 10h
	
	mov cx, 22
	mov dx, 86
	int 10h
	
	mov cx, 25
	mov dx, 86
	int 10h
	
	mov cx, 26
	mov dx, 86
	int 10h
	
	mov cx, 27
	mov dx, 86
	int 10h
	
	mov cx, 28
	mov dx, 86
	int 10h
	
	mov cx, 29
	mov dx, 86
	int 10h
	
	mov cx, 30
	mov dx, 86
	int 10h
	
	mov cx, 41
	mov dx, 86
	int 10h
	
	mov cx, 42
	mov dx, 86
	int 10h
	
	mov cx, 43
	mov dx, 86
	int 10h
	
	mov cx, 44
	mov dx, 86
	int 10h
	
	mov cx, 45
	mov dx, 86
	int 10h
	
	mov cx, 46
	mov dx, 86
	int 10h
	
	mov cx, 51
	mov dx, 86
	int 10h
	
	mov cx, 52
	mov dx, 86
	int 10h
	
	mov cx, 57
	mov dx, 86
	int 10h
	
	mov cx, 62
	mov dx, 86
	int 10h
	
	mov cx, 65
	mov dx, 86
	int 10h
	
	mov cx, 72
	mov dx, 86
	int 10h
	
	mov cx, 73
	mov dx, 86
	int 10h
	
	mov cx, 74
	mov dx, 86
	int 10h
	
	mov cx, 75
	mov dx, 86
	int 10h
	
	mov cx, 76
	mov dx, 86
	int 10h
	
	mov cx, 77
	mov dx, 86
	int 10h
	
	mov cx, 78
	mov dx, 86
	int 10h
	
	mov cx, 89
	mov dx, 86
	int 10h
	
	mov cx, 90
	mov dx, 86
	int 10h
	
	mov cx, 91
	mov dx, 86
	int 10h
	
	mov cx, 92
	mov dx, 86
	int 10h
	
	mov cx, 93
	mov dx, 86
	int 10h
	
	mov cx, 97
	mov dx, 86
	int 10h
	
	mov cx, 102
	mov dx, 86
	int 10h
	
	mov cx, 113
	mov dx, 86
	int 10h
	
	mov cx, 118
	mov dx, 86
	int 10h
	
	mov cx, 122
	mov dx, 86
	int 10h
	
	mov cx, 123
	mov dx, 86
	int 10h
	
	mov cx, 124
	mov dx, 86
	int 10h
	
	mov cx, 129
	mov dx, 86
	int 10h
	
	mov cx, 134
	mov dx, 86
	int 10h
	
	mov cx, 137
	mov dx, 86
	int 10h
	
	mov cx, 138
	mov dx, 86
	int 10h
	
	mov cx, 139
	mov dx, 86
	int 10h
	
	mov cx, 140
	mov dx, 86
	int 10h
	
	mov cx, 141
	mov dx, 86
	int 10h
	
	mov cx, 147
	mov dx, 86
	int 10h
	
	mov cx, 148
	mov dx, 86
	int 10h
	
	mov cx, 154
	mov dx, 86
	int 10h
	
	mov cx, 155
	mov dx, 86
	int 10h
	
	mov cx, 156
	mov dx, 86
	int 10h
	
	mov cx, 157
	mov dx, 86
	int 10h
	
	mov cx, 158
	mov dx, 86
	int 10h
	
	mov cx, 161
	mov dx, 86
	int 10h
	
	mov cx, 162
	mov dx, 86
	int 10h
	
	mov cx, 163
	mov dx, 86
	int 10h
	
	mov cx, 164
	mov dx, 86
	int 10h
	
	mov cx, 165
	mov dx, 86
	int 10h
	
	mov cx, 166
	mov dx, 86
	int 10h
	
	mov cx, 169
	mov dx, 86
	int 10h
	
	mov cx, 170
	mov dx, 86
	int 10h
	
	mov cx, 171
	mov dx, 86
	int 10h
	
	mov cx, 172
	mov dx, 86
	int 10h
	
	mov cx, 187
	mov dx, 86
	int 10h
	
	mov cx, 188
	mov dx, 86
	int 10h
	
	mov cx, 193
	mov dx, 86
	int 10h
	
	mov cx, 194
	mov dx, 86
	int 10h
	
	mov cx, 195
	mov dx, 86
	int 10h
	
	mov cx, 196
	mov dx, 86
	int 10h
	
	mov cx, 201
	mov dx, 86
	int 10h
	
	mov cx, 202
	mov dx, 86
	int 10h
	
	mov cx, 203
	mov dx, 86
	int 10h
	
	mov cx, 204
	mov dx, 86
	int 10h
	
	mov cx, 205
	mov dx, 86
	int 10h
	
	mov cx, 206
	mov dx, 86
	int 10h
	
	mov cx, 211
	mov dx, 86
	int 10h
	
	mov cx, 212
	mov dx, 86
	int 10h
	
	mov cx, 1
	mov dx, 87
	int 10h
	
	mov cx, 6
	mov dx, 87
	int 10h
	
	mov cx, 11
	mov dx, 87
	int 10h
	
	mov cx, 12
	mov dx, 87
	int 10h
	
	mov cx, 17
	mov dx, 87
	int 10h
	
	mov cx, 25
	mov dx, 87
	int 10h
	
	mov cx, 41
	mov dx, 87
	int 10h
	
	mov cx, 51
	mov dx, 87
	int 10h
	
	mov cx, 52
	mov dx, 87
	int 10h
	
	mov cx, 57
	mov dx, 87
	int 10h
	
	mov cx, 62
	mov dx, 87
	int 10h
	
	mov cx, 65
	mov dx, 87
	int 10h
	
	mov cx, 75
	mov dx, 87
	int 10h
	
	mov cx, 91
	mov dx, 87
	int 10h
	
	mov cx, 97
	mov dx, 87
	int 10h
	
	mov cx, 98
	mov dx, 87
	int 10h
	
	mov cx, 102
	mov dx, 87
	int 10h
	
	mov cx, 113
	mov dx, 87
	int 10h
	
	mov cx, 114
	mov dx, 87
	int 10h
	
	mov cx, 118
	mov dx, 87
	int 10h
	
	mov cx, 121
	mov dx, 87
	int 10h
	
	mov cx, 125
	mov dx, 87
	int 10h
	
	mov cx, 129
	mov dx, 87
	int 10h
	
	mov cx, 130
	mov dx, 87
	int 10h
	
	mov cx, 134
	mov dx, 87
	int 10h
	
	mov cx, 137
	mov dx, 87
	int 10h
	
	mov cx, 142
	mov dx, 87
	int 10h
	
	mov cx, 147
	mov dx, 87
	int 10h
	
	mov cx, 148
	mov dx, 87
	int 10h
	
	mov cx, 153
	mov dx, 87
	int 10h
	
	mov cx, 161
	mov dx, 87
	int 10h
	
	mov cx, 169
	mov dx, 87
	int 10h
	
	mov cx, 173
	mov dx, 87
	int 10h
	
	mov cx, 187
	mov dx, 87
	int 10h
	
	mov cx, 188
	mov dx, 87
	int 10h
	
	mov cx, 193
	mov dx, 87
	int 10h
	
	mov cx, 197
	mov dx, 87
	int 10h
	
	mov cx, 201
	mov dx, 87
	int 10h
	
	mov cx, 211
	mov dx, 87
	int 10h
	
	mov cx, 212
	mov dx, 87
	int 10h
	
	mov cx, 1
	mov dx, 88
	int 10h
	
	mov cx, 6
	mov dx, 88
	int 10h
	
	mov cx, 10
	mov dx, 88
	int 10h
	
	mov cx, 13
	mov dx, 88
	int 10h
	
	mov cx, 16
	mov dx, 88
	int 10h
	
	mov cx, 25
	mov dx, 88
	int 10h
	
	mov cx, 41
	mov dx, 88
	int 10h
	
	mov cx, 50
	mov dx, 88
	int 10h
	
	mov cx, 53
	mov dx, 88
	int 10h
	
	mov cx, 57
	mov dx, 88
	int 10h
	
	mov cx, 62
	mov dx, 88
	int 10h
	
	mov cx, 65
	mov dx, 88
	int 10h
	
	mov cx, 75
	mov dx, 88
	int 10h
	
	mov cx, 91
	mov dx, 88
	int 10h
	
	mov cx, 97
	mov dx, 88
	int 10h
	
	mov cx, 99
	mov dx, 88
	int 10h
	
	mov cx, 102
	mov dx, 88
	int 10h
	
	mov cx, 113
	mov dx, 88
	int 10h
	
	mov cx, 115
	mov dx, 88
	int 10h
	
	mov cx, 118
	mov dx, 88
	int 10h
	
	mov cx, 120
	mov dx, 88
	int 10h
	
	mov cx, 126
	mov dx, 88
	int 10h
	
	mov cx, 129
	mov dx, 88
	int 10h
	
	mov cx, 131
	mov dx, 88
	int 10h
	
	mov cx, 134
	mov dx, 88
	int 10h
	
	mov cx, 137
	mov dx, 88
	int 10h
	
	mov cx, 142
	mov dx, 88
	int 10h
	
	mov cx, 146
	mov dx, 88
	int 10h
	
	mov cx, 149
	mov dx, 88
	int 10h
	
	mov cx, 152
	mov dx, 88
	int 10h
	
	mov cx, 161
	mov dx, 88
	int 10h
	
	mov cx, 169
	mov dx, 88
	int 10h
	
	mov cx, 174
	mov dx, 88
	int 10h
	
	mov cx, 186
	mov dx, 88
	int 10h
	
	mov cx, 189
	mov dx, 88
	int 10h
	
	mov cx, 193
	mov dx, 88
	int 10h
	
	mov cx, 197
	mov dx, 88
	int 10h
	
	mov cx, 201
	mov dx, 88
	int 10h
	
	mov cx, 210
	mov dx, 88
	int 10h
	
	mov cx, 213
	mov dx, 88
	int 10h
	
	mov cx, 1
	mov dx, 89
	int 10h
	
	mov cx, 6
	mov dx, 89
	int 10h
	
	mov cx, 10
	mov dx, 89
	int 10h
	
	mov cx, 13
	mov dx, 89
	int 10h
	
	mov cx, 16
	mov dx, 89
	int 10h
	
	mov cx, 25
	mov dx, 89
	int 10h
	
	mov cx, 41
	mov dx, 89
	int 10h
	
	mov cx, 50
	mov dx, 89
	int 10h
	
	mov cx, 53
	mov dx, 89
	int 10h
	
	mov cx, 57
	mov dx, 89
	int 10h
	
	mov cx, 62
	mov dx, 89
	int 10h
	
	mov cx, 65
	mov dx, 89
	int 10h
	
	mov cx, 75
	mov dx, 89
	int 10h
	
	mov cx, 91
	mov dx, 89
	int 10h
	
	mov cx, 97
	mov dx, 89
	int 10h
	
	mov cx, 99
	mov dx, 89
	int 10h
	
	mov cx, 102
	mov dx, 89
	int 10h
	
	mov cx, 113
	mov dx, 89
	int 10h
	
	mov cx, 115
	mov dx, 89
	int 10h
	
	mov cx, 118
	mov dx, 89
	int 10h
	
	mov cx, 120
	mov dx, 89
	int 10h
	
	mov cx, 126
	mov dx, 89
	int 10h
	
	mov cx, 129
	mov dx, 89
	int 10h
	
	mov cx, 131
	mov dx, 89
	int 10h
	
	mov cx, 134
	mov dx, 89
	int 10h
	
	mov cx, 137
	mov dx, 89
	int 10h
	
	mov cx, 142
	mov dx, 89
	int 10h
	
	mov cx, 146
	mov dx, 89
	int 10h
	
	mov cx, 149
	mov dx, 89
	int 10h
	
	mov cx, 152
	mov dx, 89
	int 10h
	
	mov cx, 161
	mov dx, 89
	int 10h
	
	mov cx, 169
	mov dx, 89
	int 10h
	
	mov cx, 174
	mov dx, 89
	int 10h
	
	mov cx, 186
	mov dx, 89
	int 10h
	
	mov cx, 189
	mov dx, 89
	int 10h
	
	mov cx, 193
	mov dx, 89
	int 10h
	
	mov cx, 197
	mov dx, 89
	int 10h
	
	mov cx, 201
	mov dx, 89
	int 10h
	
	mov cx, 210
	mov dx, 89
	int 10h
	
	mov cx, 213
	mov dx, 89
	int 10h
	
	mov cx, 1
	mov dx, 90
	int 10h
	
	mov cx, 2
	mov dx, 90
	int 10h
	
	mov cx, 3
	mov dx, 90
	int 10h
	
	mov cx, 4
	mov dx, 90
	int 10h
	
	mov cx, 5
	mov dx, 90
	int 10h
	
	mov cx, 10
	mov dx, 90
	int 10h
	
	mov cx, 13
	mov dx, 90
	int 10h
	
	mov cx, 16
	mov dx, 90
	int 10h
	
	mov cx, 20
	mov dx, 90
	int 10h
	
	mov cx, 21
	mov dx, 90
	int 10h
	
	mov cx, 22
	mov dx, 90
	int 10h
	
	mov cx, 25
	mov dx, 90
	int 10h
	
	mov cx, 26
	mov dx, 90
	int 10h
	
	mov cx, 27
	mov dx, 90
	int 10h
	
	mov cx, 28
	mov dx, 90
	int 10h
	
	mov cx, 29
	mov dx, 90
	int 10h
	
	mov cx, 41
	mov dx, 90
	int 10h
	
	mov cx, 42
	mov dx, 90
	int 10h
	
	mov cx, 43
	mov dx, 90
	int 10h
	
	mov cx, 44
	mov dx, 90
	int 10h
	
	mov cx, 45
	mov dx, 90
	int 10h
	
	mov cx, 50
	mov dx, 90
	int 10h
	
	mov cx, 53
	mov dx, 90
	int 10h
	
	mov cx, 57
	mov dx, 90
	int 10h
	
	mov cx, 62
	mov dx, 90
	int 10h
	
	mov cx, 65
	mov dx, 90
	int 10h
	
	mov cx, 75
	mov dx, 90
	int 10h
	
	mov cx, 91
	mov dx, 90
	int 10h
	
	mov cx, 97
	mov dx, 90
	int 10h
	
	mov cx, 100
	mov dx, 90
	int 10h
	
	mov cx, 102
	mov dx, 90
	int 10h
	
	mov cx, 113
	mov dx, 90
	int 10h
	
	mov cx, 116
	mov dx, 90
	int 10h
	
	mov cx, 118
	mov dx, 90
	int 10h
	
	mov cx, 120
	mov dx, 90
	int 10h
	
	mov cx, 126
	mov dx, 90
	int 10h
	
	mov cx, 129
	mov dx, 90
	int 10h
	
	mov cx, 132
	mov dx, 90
	int 10h
	
	mov cx, 134
	mov dx, 90
	int 10h
	
	mov cx, 137
	mov dx, 90
	int 10h
	
	mov cx, 138
	mov dx, 90
	int 10h
	
	mov cx, 139
	mov dx, 90
	int 10h
	
	mov cx, 140
	mov dx, 90
	int 10h
	
	mov cx, 141
	mov dx, 90
	int 10h
	
	mov cx, 146
	mov dx, 90
	int 10h
	
	mov cx, 149
	mov dx, 90
	int 10h
	
	mov cx, 152
	mov dx, 90
	int 10h
	
	mov cx, 156
	mov dx, 90
	int 10h
	
	mov cx, 157
	mov dx, 90
	int 10h
	
	mov cx, 158
	mov dx, 90
	int 10h
	
	mov cx, 161
	mov dx, 90
	int 10h
	
	mov cx, 162
	mov dx, 90
	int 10h
	
	mov cx, 163
	mov dx, 90
	int 10h
	
	mov cx, 164
	mov dx, 90
	int 10h
	
	mov cx, 165
	mov dx, 90
	int 10h
	
	mov cx, 169
	mov dx, 90
	int 10h
	
	mov cx, 174
	mov dx, 90
	int 10h
	
	mov cx, 186
	mov dx, 90
	int 10h
	
	mov cx, 189
	mov dx, 90
	int 10h
	
	mov cx, 193
	mov dx, 90
	int 10h
	
	mov cx, 194
	mov dx, 90
	int 10h
	
	mov cx, 195
	mov dx, 90
	int 10h
	
	mov cx, 196
	mov dx, 90
	int 10h
	
	mov cx, 201
	mov dx, 90
	int 10h
	
	mov cx, 202
	mov dx, 90
	int 10h
	
	mov cx, 203
	mov dx, 90
	int 10h
	
	mov cx, 204
	mov dx, 90
	int 10h
	
	mov cx, 205
	mov dx, 90
	int 10h
	
	mov cx, 210
	mov dx, 90
	int 10h
	
	mov cx, 213
	mov dx, 90
	int 10h
	
	mov cx, 1
	mov dx, 91
	int 10h
	
	mov cx, 9
	mov dx, 91
	int 10h
	
	mov cx, 10
	mov dx, 91
	int 10h
	
	mov cx, 11
	mov dx, 91
	int 10h
	
	mov cx, 12
	mov dx, 91
	int 10h
	
	mov cx, 13
	mov dx, 91
	int 10h
	
	mov cx, 14
	mov dx, 91
	int 10h
	
	mov cx, 16
	mov dx, 91
	int 10h
	
	mov cx, 22
	mov dx, 91
	int 10h
	
	mov cx, 25
	mov dx, 91
	int 10h
	
	mov cx, 41
	mov dx, 91
	int 10h
	
	mov cx, 49
	mov dx, 91
	int 10h
	
	mov cx, 50
	mov dx, 91
	int 10h
	
	mov cx, 51
	mov dx, 91
	int 10h
	
	mov cx, 52
	mov dx, 91
	int 10h
	
	mov cx, 53
	mov dx, 91
	int 10h
	
	mov cx, 54
	mov dx, 91
	int 10h
	
	mov cx, 57
	mov dx, 91
	int 10h
	
	mov cx, 62
	mov dx, 91
	int 10h
	
	mov cx, 65
	mov dx, 91
	int 10h
	
	mov cx, 75
	mov dx, 91
	int 10h
	
	mov cx, 91
	mov dx, 91
	int 10h
	
	mov cx, 97
	mov dx, 91
	int 10h
	
	mov cx, 100
	mov dx, 91
	int 10h
	
	mov cx, 102
	mov dx, 91
	int 10h
	
	mov cx, 113
	mov dx, 91
	int 10h
	
	mov cx, 116
	mov dx, 91
	int 10h
	
	mov cx, 118
	mov dx, 91
	int 10h
	
	mov cx, 120
	mov dx, 91
	int 10h
	
	mov cx, 126
	mov dx, 91
	int 10h
	
	mov cx, 129
	mov dx, 91
	int 10h
	
	mov cx, 132
	mov dx, 91
	int 10h
	
	mov cx, 134
	mov dx, 91
	int 10h
	
	mov cx, 137
	mov dx, 91
	int 10h
	
	mov cx, 145
	mov dx, 91
	int 10h
	
	mov cx, 146
	mov dx, 91
	int 10h
	
	mov cx, 147
	mov dx, 91
	int 10h
	
	mov cx, 148
	mov dx, 91
	int 10h
	
	mov cx, 149
	mov dx, 91
	int 10h
	
	mov cx, 150
	mov dx, 91
	int 10h
	
	mov cx, 152
	mov dx, 91
	int 10h
	
	mov cx, 158
	mov dx, 91
	int 10h
	
	mov cx, 161
	mov dx, 91
	int 10h
	
	mov cx, 169
	mov dx, 91
	int 10h
	
	mov cx, 174
	mov dx, 91
	int 10h
	
	mov cx, 185
	mov dx, 91
	int 10h
	
	mov cx, 186
	mov dx, 91
	int 10h
	
	mov cx, 187
	mov dx, 91
	int 10h
	
	mov cx, 188
	mov dx, 91
	int 10h
	
	mov cx, 189
	mov dx, 91
	int 10h
	
	mov cx, 190
	mov dx, 91
	int 10h
	
	mov cx, 193
	mov dx, 91
	int 10h
	
	mov cx, 196
	mov dx, 91
	int 10h
	
	mov cx, 201
	mov dx, 91
	int 10h
	
	mov cx, 209
	mov dx, 91
	int 10h
	
	mov cx, 210
	mov dx, 91
	int 10h
	
	mov cx, 211
	mov dx, 91
	int 10h
	
	mov cx, 212
	mov dx, 91
	int 10h
	
	mov cx, 213
	mov dx, 91
	int 10h
	
	mov cx, 214
	mov dx, 91
	int 10h
	
	mov cx, 1
	mov dx, 92
	int 10h
	
	mov cx, 9
	mov dx, 92
	int 10h
	
	mov cx, 14
	mov dx, 92
	int 10h
	
	mov cx, 17
	mov dx, 92
	int 10h
	
	mov cx, 22
	mov dx, 92
	int 10h
	
	mov cx, 25
	mov dx, 92
	int 10h
	
	mov cx, 41
	mov dx, 92
	int 10h
	
	mov cx, 49
	mov dx, 92
	int 10h
	
	mov cx, 54
	mov dx, 92
	int 10h
	
	mov cx, 57
	mov dx, 92
	int 10h
	
	mov cx, 62
	mov dx, 92
	int 10h
	
	mov cx, 65
	mov dx, 92
	int 10h
	
	mov cx, 75
	mov dx, 92
	int 10h
	
	mov cx, 91
	mov dx, 92
	int 10h
	
	mov cx, 97
	mov dx, 92
	int 10h
	
	mov cx, 101
	mov dx, 92
	int 10h
	
	mov cx, 102
	mov dx, 92
	int 10h
	
	mov cx, 113
	mov dx, 92
	int 10h
	
	mov cx, 117
	mov dx, 92
	int 10h
	
	mov cx, 118
	mov dx, 92
	int 10h
	
	mov cx, 121
	mov dx, 92
	int 10h
	
	mov cx, 125
	mov dx, 92
	int 10h
	
	mov cx, 129
	mov dx, 92
	int 10h
	
	mov cx, 133
	mov dx, 92
	int 10h
	
	mov cx, 134
	mov dx, 92
	int 10h
	
	mov cx, 137
	mov dx, 92
	int 10h
	
	mov cx, 145
	mov dx, 92
	int 10h
	
	mov cx, 150
	mov dx, 92
	int 10h
	
	mov cx, 153
	mov dx, 92
	int 10h
	
	mov cx, 158
	mov dx, 92
	int 10h
	
	mov cx, 161
	mov dx, 92
	int 10h
	
	mov cx, 169
	mov dx, 92
	int 10h
	
	mov cx, 173
	mov dx, 92
	int 10h
	
	mov cx, 185
	mov dx, 92
	int 10h
	
	mov cx, 190
	mov dx, 92
	int 10h
	
	mov cx, 193
	mov dx, 92
	int 10h
	
	mov cx, 197
	mov dx, 92
	int 10h
	
	mov cx, 201
	mov dx, 92
	int 10h
	
	mov cx, 209
	mov dx, 92
	int 10h
	
	mov cx, 214
	mov dx, 92
	int 10h
	
	mov cx, 1
	mov dx, 93
	int 10h
	
	mov cx, 8
	mov dx, 93
	int 10h
	
	mov cx, 15
	mov dx, 93
	int 10h
	
	mov cx, 18
	mov dx, 93
	int 10h
	
	mov cx, 19
	mov dx, 93
	int 10h
	
	mov cx, 20
	mov dx, 93
	int 10h
	
	mov cx, 21
	mov dx, 93
	int 10h
	
	mov cx, 22
	mov dx, 93
	int 10h
	
	mov cx, 25
	mov dx, 93
	int 10h
	
	mov cx, 26
	mov dx, 93
	int 10h
	
	mov cx, 27
	mov dx, 93
	int 10h
	
	mov cx, 28
	mov dx, 93
	int 10h
	
	mov cx, 29
	mov dx, 93
	int 10h
	
	mov cx, 30
	mov dx, 93
	int 10h
	
	mov cx, 41
	mov dx, 93
	int 10h
	
	mov cx, 48
	mov dx, 93
	int 10h
	
	mov cx, 55
	mov dx, 93
	int 10h
	
	mov cx, 58
	mov dx, 93
	int 10h
	
	mov cx, 59
	mov dx, 93
	int 10h
	
	mov cx, 60
	mov dx, 93
	int 10h
	
	mov cx, 61
	mov dx, 93
	int 10h
	
	mov cx, 65
	mov dx, 93
	int 10h
	
	mov cx, 66
	mov dx, 93
	int 10h
	
	mov cx, 67
	mov dx, 93
	int 10h
	
	mov cx, 68
	mov dx, 93
	int 10h
	
	mov cx, 69
	mov dx, 93
	int 10h
	
	mov cx, 70
	mov dx, 93
	int 10h
	
	mov cx, 75
	mov dx, 93
	int 10h
	
	mov cx, 89
	mov dx, 93
	int 10h
	
	mov cx, 90
	mov dx, 93
	int 10h
	
	mov cx, 91
	mov dx, 93
	int 10h
	
	mov cx, 92
	mov dx, 93
	int 10h
	
	mov cx, 93
	mov dx, 93
	int 10h
	
	mov cx, 97
	mov dx, 93
	int 10h
	
	mov cx, 102
	mov dx, 93
	int 10h
	
	mov cx, 113
	mov dx, 93
	int 10h
	
	mov cx, 118
	mov dx, 93
	int 10h
	
	mov cx, 122
	mov dx, 93
	int 10h
	
	mov cx, 123
	mov dx, 93
	int 10h
	
	mov cx, 124
	mov dx, 93
	int 10h
	
	mov cx, 129
	mov dx, 93
	int 10h
	
	mov cx, 134
	mov dx, 93
	int 10h
	
	mov cx, 137
	mov dx, 93
	int 10h
	
	mov cx, 144
	mov dx, 93
	int 10h
	
	mov cx, 151
	mov dx, 93
	int 10h
	
	mov cx, 154
	mov dx, 93
	int 10h
	
	mov cx, 155
	mov dx, 93
	int 10h
	
	mov cx, 156
	mov dx, 93
	int 10h
	
	mov cx, 157
	mov dx, 93
	int 10h
	
	mov cx, 158
	mov dx, 93
	int 10h
	
	mov cx, 161
	mov dx, 93
	int 10h
	
	mov cx, 162
	mov dx, 93
	int 10h
	
	mov cx, 163
	mov dx, 93
	int 10h
	
	mov cx, 164
	mov dx, 93
	int 10h
	
	mov cx, 165
	mov dx, 93
	int 10h
	
	mov cx, 166
	mov dx, 93
	int 10h
	
	mov cx, 169
	mov dx, 93
	int 10h
	
	mov cx, 170
	mov dx, 93
	int 10h
	
	mov cx, 171
	mov dx, 93
	int 10h
	
	mov cx, 172
	mov dx, 93
	int 10h
	
	mov cx, 184
	mov dx, 93
	int 10h
	
	mov cx, 191
	mov dx, 93
	int 10h
	
	mov cx, 193
	mov dx, 93
	int 10h
	
	mov cx, 198
	mov dx, 93
	int 10h
	
	mov cx, 201
	mov dx, 93
	int 10h
	
	mov cx, 202
	mov dx, 93
	int 10h
	
	mov cx, 203
	mov dx, 93
	int 10h
	
	mov cx, 204
	mov dx, 93
	int 10h
	
	mov cx, 205
	mov dx, 93
	int 10h
	
	mov cx, 206
	mov dx, 93
	int 10h
	
	mov cx, 208
	mov dx, 93
	int 10h
	
	mov cx, 215
	mov dx, 93
	int 10h
	
	mov cx, 32
	mov dx, 94
	int 10h
	
	mov cx, 33
	mov dx, 94
	int 10h
	
	mov cx, 34
	mov dx, 94
	int 10h
	
	mov cx, 35
	mov dx, 94
	int 10h
	
	mov cx, 36
	mov dx, 94
	int 10h
	
	mov cx, 37
	mov dx, 94
	int 10h
	
	mov cx, 38
	mov dx, 94
	int 10h
	
	mov cx, 39
	mov dx, 94
	int 10h
	
	mov cx, 80
	mov dx, 94
	int 10h
	
	mov cx, 81
	mov dx, 94
	int 10h
	
	mov cx, 82
	mov dx, 94
	int 10h
	
	mov cx, 83
	mov dx, 94
	int 10h
	
	mov cx, 84
	mov dx, 94
	int 10h
	
	mov cx, 85
	mov dx, 94
	int 10h
	
	mov cx, 86
	mov dx, 94
	int 10h
	
	mov cx, 87
	mov dx, 94
	int 10h
	
	mov cx, 104
	mov dx, 94
	int 10h
	
	mov cx, 105
	mov dx, 94
	int 10h
	
	mov cx, 106
	mov dx, 94
	int 10h
	
	mov cx, 107
	mov dx, 94
	int 10h
	
	mov cx, 108
	mov dx, 94
	int 10h
	
	mov cx, 109
	mov dx, 94
	int 10h
	
	mov cx, 110
	mov dx, 94
	int 10h
	
	mov cx, 111
	mov dx, 94
	int 10h
	
	mov cx, 176
	mov dx, 94
	int 10h
	
	mov cx, 177
	mov dx, 94
	int 10h
	
	mov cx, 178
	mov dx, 94
	int 10h
	
	mov cx, 179
	mov dx, 94
	int 10h
	
	mov cx, 180
	mov dx, 94
	int 10h
	
	mov cx, 181
	mov dx, 94
	int 10h
	
	mov cx, 182
	mov dx, 94
	int 10h
	
	mov cx, 183
	mov dx, 94
	int 10h
	
	mov cx, 11
	mov dx, 112
	int 10h
	
	mov cx, 12
	mov dx, 112
	int 10h
	
	mov cx, 13
	mov dx, 112
	int 10h
	
	mov cx, 14
	mov dx, 112
	int 10h
	
	mov cx, 33
	mov dx, 112
	int 10h
	
	mov cx, 43
	mov dx, 112
	int 10h
	
	mov cx, 44
	mov dx, 112
	int 10h
	
	mov cx, 67
	mov dx, 112
	int 10h
	
	mov cx, 68
	mov dx, 112
	int 10h
	
	mov cx, 97
	mov dx, 112
	int 10h
	
	mov cx, 123
	mov dx, 112
	int 10h
	
	mov cx, 124
	mov dx, 112
	int 10h
	
	mov cx, 125
	mov dx, 112
	int 10h
	
	mov cx, 126
	mov dx, 112
	int 10h
	
	mov cx, 131
	mov dx, 112
	int 10h
	
	mov cx, 132
	mov dx, 112
	int 10h
	
	mov cx, 179
	mov dx, 112
	int 10h
	
	mov cx, 180
	mov dx, 112
	int 10h
	
	mov cx, 235
	mov dx, 112
	int 10h
	
	mov cx, 313
	mov dx, 112
	int 10h
	
	mov cx, 323
	mov dx, 112
	int 10h
	
	mov cx, 324
	mov dx, 112
	int 10h
	
	mov cx, 10
	mov dx, 113
	int 10h
	
	mov cx, 33
	mov dx, 113
	int 10h
	
	mov cx, 43
	mov dx, 113
	int 10h
	
	mov cx, 44
	mov dx, 113
	int 10h
	
	mov cx, 67
	mov dx, 113
	int 10h
	
	mov cx, 68
	mov dx, 113
	int 10h
	
	mov cx, 97
	mov dx, 113
	int 10h
	
	mov cx, 122
	mov dx, 113
	int 10h
	
	mov cx, 131
	mov dx, 113
	int 10h
	
	mov cx, 132
	mov dx, 113
	int 10h
	
	mov cx, 179
	mov dx, 113
	int 10h
	
	mov cx, 180
	mov dx, 113
	int 10h
	
	mov cx, 235
	mov dx, 113
	int 10h
	
	mov cx, 313
	mov dx, 113
	int 10h
	
	mov cx, 323
	mov dx, 113
	int 10h
	
	mov cx, 324
	mov dx, 113
	int 10h
	
	mov cx, 1
	mov dx, 114
	int 10h
	
	mov cx, 2
	mov dx, 114
	int 10h
	
	mov cx, 3
	mov dx, 114
	int 10h
	
	mov cx, 4
	mov dx, 114
	int 10h
	
	mov cx, 5
	mov dx, 114
	int 10h
	
	mov cx, 10
	mov dx, 114
	int 10h
	
	mov cx, 26
	mov dx, 114
	int 10h
	
	mov cx, 33
	mov dx, 114
	int 10h
	
	mov cx, 90
	mov dx, 114
	int 10h
	
	mov cx, 97
	mov dx, 114
	int 10h
	
	mov cx, 122
	mov dx, 114
	int 10h
	
	mov cx, 154
	mov dx, 114
	int 10h
	
	mov cx, 170
	mov dx, 114
	int 10h
	
	mov cx, 235
	mov dx, 114
	int 10h
	
	mov cx, 306
	mov dx, 114
	int 10h
	
	mov cx, 313
	mov dx, 114
	int 10h
	
	mov cx, 346
	mov dx, 114
	int 10h
	
	mov cx, 347
	mov dx, 114
	int 10h
	
	mov cx, 348
	mov dx, 114
	int 10h
	
	mov cx, 349
	mov dx, 114
	int 10h
	
	mov cx, 350
	mov dx, 114
	int 10h
	
	mov cx, 354
	mov dx, 114
	int 10h
	
	mov cx, 3
	mov dx, 115
	int 10h
	
	mov cx, 8
	mov dx, 115
	int 10h
	
	mov cx, 9
	mov dx, 115
	int 10h
	
	mov cx, 10
	mov dx, 115
	int 10h
	
	mov cx, 11
	mov dx, 115
	int 10h
	
	mov cx, 12
	mov dx, 115
	int 10h
	
	mov cx, 13
	mov dx, 115
	int 10h
	
	mov cx, 14
	mov dx, 115
	int 10h
	
	mov cx, 24
	mov dx, 115
	int 10h
	
	mov cx, 25
	mov dx, 115
	int 10h
	
	mov cx, 26
	mov dx, 115
	int 10h
	
	mov cx, 27
	mov dx, 115
	int 10h
	
	mov cx, 28
	mov dx, 115
	int 10h
	
	mov cx, 29
	mov dx, 115
	int 10h
	
	mov cx, 33
	mov dx, 115
	int 10h
	
	mov cx, 35
	mov dx, 115
	int 10h
	
	mov cx, 36
	mov dx, 115
	int 10h
	
	mov cx, 37
	mov dx, 115
	int 10h
	
	mov cx, 41
	mov dx, 115
	int 10h
	
	mov cx, 42
	mov dx, 115
	int 10h
	
	mov cx, 43
	mov dx, 115
	int 10h
	
	mov cx, 44
	mov dx, 115
	int 10h
	
	mov cx, 50
	mov dx, 115
	int 10h
	
	mov cx, 51
	mov dx, 115
	int 10h
	
	mov cx, 52
	mov dx, 115
	int 10h
	
	mov cx, 53
	mov dx, 115
	int 10h
	
	mov cx, 65
	mov dx, 115
	int 10h
	
	mov cx, 66
	mov dx, 115
	int 10h
	
	mov cx, 67
	mov dx, 115
	int 10h
	
	mov cx, 68
	mov dx, 115
	int 10h
	
	mov cx, 74
	mov dx, 115
	int 10h
	
	mov cx, 75
	mov dx, 115
	int 10h
	
	mov cx, 76
	mov dx, 115
	int 10h
	
	mov cx, 77
	mov dx, 115
	int 10h
	
	mov cx, 88
	mov dx, 115
	int 10h
	
	mov cx, 89
	mov dx, 115
	int 10h
	
	mov cx, 90
	mov dx, 115
	int 10h
	
	mov cx, 91
	mov dx, 115
	int 10h
	
	mov cx, 92
	mov dx, 115
	int 10h
	
	mov cx, 93
	mov dx, 115
	int 10h
	
	mov cx, 97
	mov dx, 115
	int 10h
	
	mov cx, 99
	mov dx, 115
	int 10h
	
	mov cx, 100
	mov dx, 115
	int 10h
	
	mov cx, 101
	mov dx, 115
	int 10h
	
	mov cx, 106
	mov dx, 115
	int 10h
	
	mov cx, 107
	mov dx, 115
	int 10h
	
	mov cx, 108
	mov dx, 115
	int 10h
	
	mov cx, 109
	mov dx, 115
	int 10h
	
	mov cx, 120
	mov dx, 115
	int 10h
	
	mov cx, 121
	mov dx, 115
	int 10h
	
	mov cx, 122
	mov dx, 115
	int 10h
	
	mov cx, 123
	mov dx, 115
	int 10h
	
	mov cx, 124
	mov dx, 115
	int 10h
	
	mov cx, 125
	mov dx, 115
	int 10h
	
	mov cx, 126
	mov dx, 115
	int 10h
	
	mov cx, 129
	mov dx, 115
	int 10h
	
	mov cx, 130
	mov dx, 115
	int 10h
	
	mov cx, 131
	mov dx, 115
	int 10h
	
	mov cx, 132
	mov dx, 115
	int 10h
	
	mov cx, 137
	mov dx, 115
	int 10h
	
	mov cx, 139
	mov dx, 115
	int 10h
	
	mov cx, 140
	mov dx, 115
	int 10h
	
	mov cx, 141
	mov dx, 115
	int 10h
	
	mov cx, 146
	mov dx, 115
	int 10h
	
	mov cx, 147
	mov dx, 115
	int 10h
	
	mov cx, 148
	mov dx, 115
	int 10h
	
	mov cx, 149
	mov dx, 115
	int 10h
	
	mov cx, 152
	mov dx, 115
	int 10h
	
	mov cx, 153
	mov dx, 115
	int 10h
	
	mov cx, 154
	mov dx, 115
	int 10h
	
	mov cx, 155
	mov dx, 115
	int 10h
	
	mov cx, 156
	mov dx, 115
	int 10h
	
	mov cx, 157
	mov dx, 115
	int 10h
	
	mov cx, 168
	mov dx, 115
	int 10h
	
	mov cx, 169
	mov dx, 115
	int 10h
	
	mov cx, 170
	mov dx, 115
	int 10h
	
	mov cx, 171
	mov dx, 115
	int 10h
	
	mov cx, 172
	mov dx, 115
	int 10h
	
	mov cx, 173
	mov dx, 115
	int 10h
	
	mov cx, 177
	mov dx, 115
	int 10h
	
	mov cx, 178
	mov dx, 115
	int 10h
	
	mov cx, 179
	mov dx, 115
	int 10h
	
	mov cx, 180
	mov dx, 115
	int 10h
	
	mov cx, 184
	mov dx, 115
	int 10h
	
	mov cx, 186
	mov dx, 115
	int 10h
	
	mov cx, 187
	mov dx, 115
	int 10h
	
	mov cx, 189
	mov dx, 115
	int 10h
	
	mov cx, 190
	mov dx, 115
	int 10h
	
	mov cx, 194
	mov dx, 115
	int 10h
	
	mov cx, 195
	mov dx, 115
	int 10h
	
	mov cx, 196
	mov dx, 115
	int 10h
	
	mov cx, 197
	mov dx, 115
	int 10h
	
	mov cx, 208
	mov dx, 115
	int 10h
	
	mov cx, 215
	mov dx, 115
	int 10h
	
	mov cx, 218
	mov dx, 115
	int 10h
	
	mov cx, 219
	mov dx, 115
	int 10h
	
	mov cx, 220
	mov dx, 115
	int 10h
	
	mov cx, 221
	mov dx, 115
	int 10h
	
	mov cx, 225
	mov dx, 115
	int 10h
	
	mov cx, 230
	mov dx, 115
	int 10h
	
	mov cx, 240
	mov dx, 115
	int 10h
	
	mov cx, 246
	mov dx, 115
	int 10h
	
	mov cx, 250
	mov dx, 115
	int 10h
	
	mov cx, 251
	mov dx, 115
	int 10h
	
	mov cx, 252
	mov dx, 115
	int 10h
	
	mov cx, 253
	mov dx, 115
	int 10h
	
	mov cx, 266
	mov dx, 115
	int 10h
	
	mov cx, 267
	mov dx, 115
	int 10h
	
	mov cx, 268
	mov dx, 115
	int 10h
	
	mov cx, 269
	mov dx, 115
	int 10h
	
	mov cx, 274
	mov dx, 115
	int 10h
	
	mov cx, 275
	mov dx, 115
	int 10h
	
	mov cx, 276
	mov dx, 115
	int 10h
	
	mov cx, 277
	mov dx, 115
	int 10h
	
	mov cx, 282
	mov dx, 115
	int 10h
	
	mov cx, 283
	mov dx, 115
	int 10h
	
	mov cx, 284
	mov dx, 115
	int 10h
	
	mov cx, 285
	mov dx, 115
	int 10h
	
	mov cx, 289
	mov dx, 115
	int 10h
	
	mov cx, 291
	mov dx, 115
	int 10h
	
	mov cx, 292
	mov dx, 115
	int 10h
	
	mov cx, 293
	mov dx, 115
	int 10h
	
	mov cx, 304
	mov dx, 115
	int 10h
	
	mov cx, 305
	mov dx, 115
	int 10h
	
	mov cx, 306
	mov dx, 115
	int 10h
	
	mov cx, 307
	mov dx, 115
	int 10h
	
	mov cx, 308
	mov dx, 115
	int 10h
	
	mov cx, 309
	mov dx, 115
	int 10h
	
	mov cx, 313
	mov dx, 115
	int 10h
	
	mov cx, 315
	mov dx, 115
	int 10h
	
	mov cx, 316
	mov dx, 115
	int 10h
	
	mov cx, 317
	mov dx, 115
	int 10h
	
	mov cx, 321
	mov dx, 115
	int 10h
	
	mov cx, 322
	mov dx, 115
	int 10h
	
	mov cx, 323
	mov dx, 115
	int 10h
	
	mov cx, 324
	mov dx, 115
	int 10h
	
	mov cx, 330
	mov dx, 115
	int 10h
	
	mov cx, 331
	mov dx, 115
	int 10h
	
	mov cx, 332
	mov dx, 115
	int 10h
	
	mov cx, 333
	mov dx, 115
	int 10h
	
	mov cx, 345
	mov dx, 115
	int 10h
	
	mov cx, 352
	mov dx, 115
	int 10h
	
	mov cx, 353
	mov dx, 115
	int 10h
	
	mov cx, 354
	mov dx, 115
	int 10h
	
	mov cx, 355
	mov dx, 115
	int 10h
	
	mov cx, 356
	mov dx, 115
	int 10h
	
	mov cx, 357
	mov dx, 115
	int 10h
	
	mov cx, 362
	mov dx, 115
	int 10h
	
	mov cx, 363
	mov dx, 115
	int 10h
	
	mov cx, 364
	mov dx, 115
	int 10h
	
	mov cx, 365
	mov dx, 115
	int 10h
	
	mov cx, 369
	mov dx, 115
	int 10h
	
	mov cx, 371
	mov dx, 115
	int 10h
	
	mov cx, 372
	mov dx, 115
	int 10h
	
	mov cx, 373
	mov dx, 115
	int 10h
	
	mov cx, 386
	mov dx, 115
	int 10h
	
	mov cx, 387
	mov dx, 115
	int 10h
	
	mov cx, 388
	mov dx, 115
	int 10h
	
	mov cx, 389
	mov dx, 115
	int 10h
	
	mov cx, 393
	mov dx, 115
	int 10h
	
	mov cx, 395
	mov dx, 115
	int 10h
	
	mov cx, 396
	mov dx, 115
	int 10h
	
	mov cx, 397
	mov dx, 115
	int 10h
	
	mov cx, 401
	mov dx, 115
	int 10h
	
	mov cx, 403
	mov dx, 115
	int 10h
	
	mov cx, 404
	mov dx, 115
	int 10h
	
	mov cx, 405
	mov dx, 115
	int 10h
	
	mov cx, 410
	mov dx, 115
	int 10h
	
	mov cx, 411
	mov dx, 115
	int 10h
	
	mov cx, 412
	mov dx, 115
	int 10h
	
	mov cx, 413
	mov dx, 115
	int 10h
	
	mov cx, 417
	mov dx, 115
	int 10h
	
	mov cx, 419
	mov dx, 115
	int 10h
	
	mov cx, 420
	mov dx, 115
	int 10h
	
	mov cx, 421
	mov dx, 115
	int 10h
	
	mov cx, 434
	mov dx, 115
	int 10h
	
	mov cx, 435
	mov dx, 115
	int 10h
	
	mov cx, 436
	mov dx, 115
	int 10h
	
	mov cx, 437
	mov dx, 115
	int 10h
	
	mov cx, 443
	mov dx, 115
	int 10h
	
	mov cx, 444
	mov dx, 115
	int 10h
	
	mov cx, 445
	mov dx, 115
	int 10h
	
	mov cx, 446
	mov dx, 115
	int 10h
	
	mov cx, 449
	mov dx, 115
	int 10h
	
	mov cx, 451
	mov dx, 115
	int 10h
	
	mov cx, 452
	mov dx, 115
	int 10h
	
	mov cx, 453
	mov dx, 115
	int 10h
	
	mov cx, 458
	mov dx, 115
	int 10h
	
	mov cx, 459
	mov dx, 115
	int 10h
	
	mov cx, 460
	mov dx, 115
	int 10h
	
	mov cx, 461
	mov dx, 115
	int 10h
	
	mov cx, 466
	mov dx, 115
	int 10h
	
	mov cx, 467
	mov dx, 115
	int 10h
	
	mov cx, 468
	mov dx, 115
	int 10h
	
	mov cx, 469
	mov dx, 115
	int 10h
	
	mov cx, 473
	mov dx, 115
	int 10h
	
	mov cx, 475
	mov dx, 115
	int 10h
	
	mov cx, 476
	mov dx, 115
	int 10h
	
	mov cx, 477
	mov dx, 115
	int 10h
	
	mov cx, 3
	mov dx, 116
	int 10h
	
	mov cx, 10
	mov dx, 116
	int 10h
	
	mov cx, 26
	mov dx, 116
	int 10h
	
	mov cx, 33
	mov dx, 116
	int 10h
	
	mov cx, 34
	mov dx, 116
	int 10h
	
	mov cx, 38
	mov dx, 116
	int 10h
	
	mov cx, 44
	mov dx, 116
	int 10h
	
	mov cx, 49
	mov dx, 116
	int 10h
	
	mov cx, 68
	mov dx, 116
	int 10h
	
	mov cx, 73
	mov dx, 116
	int 10h
	
	mov cx, 90
	mov dx, 116
	int 10h
	
	mov cx, 97
	mov dx, 116
	int 10h
	
	mov cx, 98
	mov dx, 116
	int 10h
	
	mov cx, 102
	mov dx, 116
	int 10h
	
	mov cx, 106
	mov dx, 116
	int 10h
	
	mov cx, 110
	mov dx, 116
	int 10h
	
	mov cx, 122
	mov dx, 116
	int 10h
	
	mov cx, 132
	mov dx, 116
	int 10h
	
	mov cx, 137
	mov dx, 116
	int 10h
	
	mov cx, 138
	mov dx, 116
	int 10h
	
	mov cx, 141
	mov dx, 116
	int 10h
	
	mov cx, 145
	mov dx, 116
	int 10h
	
	mov cx, 154
	mov dx, 116
	int 10h
	
	mov cx, 170
	mov dx, 116
	int 10h
	
	mov cx, 180
	mov dx, 116
	int 10h
	
	mov cx, 184
	mov dx, 116
	int 10h
	
	mov cx, 185
	mov dx, 116
	int 10h
	
	mov cx, 187
	mov dx, 116
	int 10h
	
	mov cx, 188
	mov dx, 116
	int 10h
	
	mov cx, 190
	mov dx, 116
	int 10h
	
	mov cx, 194
	mov dx, 116
	int 10h
	
	mov cx, 198
	mov dx, 116
	int 10h
	
	mov cx, 209
	mov dx, 116
	int 10h
	
	mov cx, 214
	mov dx, 116
	int 10h
	
	mov cx, 217
	mov dx, 116
	int 10h
	
	mov cx, 222
	mov dx, 116
	int 10h
	
	mov cx, 225
	mov dx, 116
	int 10h
	
	mov cx, 230
	mov dx, 116
	int 10h
	
	mov cx, 241
	mov dx, 116
	int 10h
	
	mov cx, 245
	mov dx, 116
	int 10h
	
	mov cx, 250
	mov dx, 116
	int 10h
	
	mov cx, 254
	mov dx, 116
	int 10h
	
	mov cx, 265
	mov dx, 116
	int 10h
	
	mov cx, 274
	mov dx, 116
	int 10h
	
	mov cx, 278
	mov dx, 116
	int 10h
	
	mov cx, 282
	mov dx, 116
	int 10h
	
	mov cx, 286
	mov dx, 116
	int 10h
	
	mov cx, 289
	mov dx, 116
	int 10h
	
	mov cx, 290
	mov dx, 116
	int 10h
	
	mov cx, 294
	mov dx, 116
	int 10h
	
	mov cx, 306
	mov dx, 116
	int 10h
	
	mov cx, 313
	mov dx, 116
	int 10h
	
	mov cx, 314
	mov dx, 116
	int 10h
	
	mov cx, 318
	mov dx, 116
	int 10h
	
	mov cx, 324
	mov dx, 116
	int 10h
	
	mov cx, 329
	mov dx, 116
	int 10h
	
	mov cx, 345
	mov dx, 116
	int 10h
	
	mov cx, 354
	mov dx, 116
	int 10h
	
	mov cx, 361
	mov dx, 116
	int 10h
	
	mov cx, 366
	mov dx, 116
	int 10h
	
	mov cx, 369
	mov dx, 116
	int 10h
	
	mov cx, 370
	mov dx, 116
	int 10h
	
	mov cx, 374
	mov dx, 116
	int 10h
	
	mov cx, 386
	mov dx, 116
	int 10h
	
	mov cx, 390
	mov dx, 116
	int 10h
	
	mov cx, 393
	mov dx, 116
	int 10h
	
	mov cx, 394
	mov dx, 116
	int 10h
	
	mov cx, 397
	mov dx, 116
	int 10h
	
	mov cx, 401
	mov dx, 116
	int 10h
	
	mov cx, 402
	mov dx, 116
	int 10h
	
	mov cx, 405
	mov dx, 116
	int 10h
	
	mov cx, 409
	mov dx, 116
	int 10h
	
	mov cx, 414
	mov dx, 116
	int 10h
	
	mov cx, 417
	mov dx, 116
	int 10h
	
	mov cx, 418
	mov dx, 116
	int 10h
	
	mov cx, 421
	mov dx, 116
	int 10h
	
	mov cx, 433
	mov dx, 116
	int 10h
	
	mov cx, 442
	mov dx, 116
	int 10h
	
	mov cx, 449
	mov dx, 116
	int 10h
	
	mov cx, 450
	mov dx, 116
	int 10h
	
	mov cx, 453
	mov dx, 116
	int 10h
	
	mov cx, 458
	mov dx, 116
	int 10h
	
	mov cx, 462
	mov dx, 116
	int 10h
	
	mov cx, 466
	mov dx, 116
	int 10h
	
	mov cx, 470
	mov dx, 116
	int 10h
	
	mov cx, 473
	mov dx, 116
	int 10h
	
	mov cx, 474
	mov dx, 116
	int 10h
	
	mov cx, 478
	mov dx, 116
	int 10h
	
	mov cx, 3
	mov dx, 117
	int 10h
	
	mov cx, 10
	mov dx, 117
	int 10h
	
	mov cx, 26
	mov dx, 117
	int 10h
	
	mov cx, 33
	mov dx, 117
	int 10h
	
	mov cx, 38
	mov dx, 117
	int 10h
	
	mov cx, 44
	mov dx, 117
	int 10h
	
	mov cx, 49
	mov dx, 117
	int 10h
	
	mov cx, 50
	mov dx, 117
	int 10h
	
	mov cx, 68
	mov dx, 117
	int 10h
	
	mov cx, 73
	mov dx, 117
	int 10h
	
	mov cx, 74
	mov dx, 117
	int 10h
	
	mov cx, 90
	mov dx, 117
	int 10h
	
	mov cx, 97
	mov dx, 117
	int 10h
	
	mov cx, 102
	mov dx, 117
	int 10h
	
	mov cx, 105
	mov dx, 117
	int 10h
	
	mov cx, 110
	mov dx, 117
	int 10h
	
	mov cx, 122
	mov dx, 117
	int 10h
	
	mov cx, 132
	mov dx, 117
	int 10h
	
	mov cx, 137
	mov dx, 117
	int 10h
	
	mov cx, 145
	mov dx, 117
	int 10h
	
	mov cx, 146
	mov dx, 117
	int 10h
	
	mov cx, 154
	mov dx, 117
	int 10h
	
	mov cx, 170
	mov dx, 117
	int 10h
	
	mov cx, 180
	mov dx, 117
	int 10h
	
	mov cx, 184
	mov dx, 117
	int 10h
	
	mov cx, 187
	mov dx, 117
	int 10h
	
	mov cx, 190
	mov dx, 117
	int 10h
	
	mov cx, 193
	mov dx, 117
	int 10h
	
	mov cx, 198
	mov dx, 117
	int 10h
	
	mov cx, 209
	mov dx, 117
	int 10h
	
	mov cx, 214
	mov dx, 117
	int 10h
	
	mov cx, 217
	mov dx, 117
	int 10h
	
	mov cx, 222
	mov dx, 117
	int 10h
	
	mov cx, 225
	mov dx, 117
	int 10h
	
	mov cx, 230
	mov dx, 117
	int 10h
	
	mov cx, 241
	mov dx, 117
	int 10h
	
	mov cx, 245
	mov dx, 117
	int 10h
	
	mov cx, 249
	mov dx, 117
	int 10h
	
	mov cx, 254
	mov dx, 117
	int 10h
	
	mov cx, 265
	mov dx, 117
	int 10h
	
	mov cx, 266
	mov dx, 117
	int 10h
	
	mov cx, 273
	mov dx, 117
	int 10h
	
	mov cx, 278
	mov dx, 117
	int 10h
	
	mov cx, 281
	mov dx, 117
	int 10h
	
	mov cx, 286
	mov dx, 117
	int 10h
	
	mov cx, 289
	mov dx, 117
	int 10h
	
	mov cx, 294
	mov dx, 117
	int 10h
	
	mov cx, 306
	mov dx, 117
	int 10h
	
	mov cx, 313
	mov dx, 117
	int 10h
	
	mov cx, 318
	mov dx, 117
	int 10h
	
	mov cx, 324
	mov dx, 117
	int 10h
	
	mov cx, 329
	mov dx, 117
	int 10h
	
	mov cx, 330
	mov dx, 117
	int 10h
	
	mov cx, 346
	mov dx, 117
	int 10h
	
	mov cx, 347
	mov dx, 117
	int 10h
	
	mov cx, 348
	mov dx, 117
	int 10h
	
	mov cx, 354
	mov dx, 117
	int 10h
	
	mov cx, 361
	mov dx, 117
	int 10h
	
	mov cx, 366
	mov dx, 117
	int 10h
	
	mov cx, 369
	mov dx, 117
	int 10h
	
	mov cx, 374
	mov dx, 117
	int 10h
	
	mov cx, 385
	mov dx, 117
	int 10h
	
	mov cx, 390
	mov dx, 117
	int 10h
	
	mov cx, 393
	mov dx, 117
	int 10h
	
	mov cx, 401
	mov dx, 117
	int 10h
	
	mov cx, 409
	mov dx, 117
	int 10h
	
	mov cx, 414
	mov dx, 117
	int 10h
	
	mov cx, 417
	mov dx, 117
	int 10h
	
	mov cx, 433
	mov dx, 117
	int 10h
	
	mov cx, 434
	mov dx, 117
	int 10h
	
	mov cx, 441
	mov dx, 117
	int 10h
	
	mov cx, 449
	mov dx, 117
	int 10h
	
	mov cx, 457
	mov dx, 117
	int 10h
	
	mov cx, 462
	mov dx, 117
	int 10h
	
	mov cx, 465
	mov dx, 117
	int 10h
	
	mov cx, 470
	mov dx, 117
	int 10h
	
	mov cx, 473
	mov dx, 117
	int 10h
	
	mov cx, 478
	mov dx, 117
	int 10h
	
	mov cx, 3
	mov dx, 118
	int 10h
	
	mov cx, 10
	mov dx, 118
	int 10h
	
	mov cx, 26
	mov dx, 118
	int 10h
	
	mov cx, 33
	mov dx, 118
	int 10h
	
	mov cx, 38
	mov dx, 118
	int 10h
	
	mov cx, 44
	mov dx, 118
	int 10h
	
	mov cx, 51
	mov dx, 118
	int 10h
	
	mov cx, 52
	mov dx, 118
	int 10h
	
	mov cx, 68
	mov dx, 118
	int 10h
	
	mov cx, 75
	mov dx, 118
	int 10h
	
	mov cx, 76
	mov dx, 118
	int 10h
	
	mov cx, 90
	mov dx, 118
	int 10h
	
	mov cx, 97
	mov dx, 118
	int 10h
	
	mov cx, 102
	mov dx, 118
	int 10h
	
	mov cx, 105
	mov dx, 118
	int 10h
	
	mov cx, 106
	mov dx, 118
	int 10h
	
	mov cx, 107
	mov dx, 118
	int 10h
	
	mov cx, 108
	mov dx, 118
	int 10h
	
	mov cx, 109
	mov dx, 118
	int 10h
	
	mov cx, 110
	mov dx, 118
	int 10h
	
	mov cx, 122
	mov dx, 118
	int 10h
	
	mov cx, 132
	mov dx, 118
	int 10h
	
	mov cx, 137
	mov dx, 118
	int 10h
	
	mov cx, 147
	mov dx, 118
	int 10h
	
	mov cx, 148
	mov dx, 118
	int 10h
	
	mov cx, 154
	mov dx, 118
	int 10h
	
	mov cx, 170
	mov dx, 118
	int 10h
	
	mov cx, 180
	mov dx, 118
	int 10h
	
	mov cx, 184
	mov dx, 118
	int 10h
	
	mov cx, 187
	mov dx, 118
	int 10h
	
	mov cx, 190
	mov dx, 118
	int 10h
	
	mov cx, 193
	mov dx, 118
	int 10h
	
	mov cx, 194
	mov dx, 118
	int 10h
	
	mov cx, 195
	mov dx, 118
	int 10h
	
	mov cx, 196
	mov dx, 118
	int 10h
	
	mov cx, 197
	mov dx, 118
	int 10h
	
	mov cx, 198
	mov dx, 118
	int 10h
	
	mov cx, 210
	mov dx, 118
	int 10h
	
	mov cx, 213
	mov dx, 118
	int 10h
	
	mov cx, 217
	mov dx, 118
	int 10h
	
	mov cx, 222
	mov dx, 118
	int 10h
	
	mov cx, 225
	mov dx, 118
	int 10h
	
	mov cx, 230
	mov dx, 118
	int 10h
	
	mov cx, 241
	mov dx, 118
	int 10h
	
	mov cx, 245
	mov dx, 118
	int 10h
	
	mov cx, 249
	mov dx, 118
	int 10h
	
	mov cx, 250
	mov dx, 118
	int 10h
	
	mov cx, 251
	mov dx, 118
	int 10h
	
	mov cx, 252
	mov dx, 118
	int 10h
	
	mov cx, 253
	mov dx, 118
	int 10h
	
	mov cx, 254
	mov dx, 118
	int 10h
	
	mov cx, 267
	mov dx, 118
	int 10h
	
	mov cx, 268
	mov dx, 118
	int 10h
	
	mov cx, 273
	mov dx, 118
	int 10h
	
	mov cx, 274
	mov dx, 118
	int 10h
	
	mov cx, 275
	mov dx, 118
	int 10h
	
	mov cx, 276
	mov dx, 118
	int 10h
	
	mov cx, 277
	mov dx, 118
	int 10h
	
	mov cx, 278
	mov dx, 118
	int 10h
	
	mov cx, 281
	mov dx, 118
	int 10h
	
	mov cx, 282
	mov dx, 118
	int 10h
	
	mov cx, 283
	mov dx, 118
	int 10h
	
	mov cx, 284
	mov dx, 118
	int 10h
	
	mov cx, 285
	mov dx, 118
	int 10h
	
	mov cx, 286
	mov dx, 118
	int 10h
	
	mov cx, 289
	mov dx, 118
	int 10h
	
	mov cx, 294
	mov dx, 118
	int 10h
	
	mov cx, 306
	mov dx, 118
	int 10h
	
	mov cx, 313
	mov dx, 118
	int 10h
	
	mov cx, 318
	mov dx, 118
	int 10h
	
	mov cx, 324
	mov dx, 118
	int 10h
	
	mov cx, 331
	mov dx, 118
	int 10h
	
	mov cx, 332
	mov dx, 118
	int 10h
	
	mov cx, 349
	mov dx, 118
	int 10h
	
	mov cx, 354
	mov dx, 118
	int 10h
	
	mov cx, 361
	mov dx, 118
	int 10h
	
	mov cx, 366
	mov dx, 118
	int 10h
	
	mov cx, 369
	mov dx, 118
	int 10h
	
	mov cx, 374
	mov dx, 118
	int 10h
	
	mov cx, 385
	mov dx, 118
	int 10h
	
	mov cx, 386
	mov dx, 118
	int 10h
	
	mov cx, 387
	mov dx, 118
	int 10h
	
	mov cx, 388
	mov dx, 118
	int 10h
	
	mov cx, 389
	mov dx, 118
	int 10h
	
	mov cx, 390
	mov dx, 118
	int 10h
	
	mov cx, 393
	mov dx, 118
	int 10h
	
	mov cx, 401
	mov dx, 118
	int 10h
	
	mov cx, 409
	mov dx, 118
	int 10h
	
	mov cx, 414
	mov dx, 118
	int 10h
	
	mov cx, 417
	mov dx, 118
	int 10h
	
	mov cx, 435
	mov dx, 118
	int 10h
	
	mov cx, 436
	mov dx, 118
	int 10h
	
	mov cx, 441
	mov dx, 118
	int 10h
	
	mov cx, 449
	mov dx, 118
	int 10h
	
	mov cx, 457
	mov dx, 118
	int 10h
	
	mov cx, 458
	mov dx, 118
	int 10h
	
	mov cx, 459
	mov dx, 118
	int 10h
	
	mov cx, 460
	mov dx, 118
	int 10h
	
	mov cx, 461
	mov dx, 118
	int 10h
	
	mov cx, 462
	mov dx, 118
	int 10h
	
	mov cx, 465
	mov dx, 118
	int 10h
	
	mov cx, 466
	mov dx, 118
	int 10h
	
	mov cx, 467
	mov dx, 118
	int 10h
	
	mov cx, 468
	mov dx, 118
	int 10h
	
	mov cx, 469
	mov dx, 118
	int 10h
	
	mov cx, 470
	mov dx, 118
	int 10h
	
	mov cx, 473
	mov dx, 118
	int 10h
	
	mov cx, 478
	mov dx, 118
	int 10h
	
	mov cx, 3
	mov dx, 119
	int 10h
	
	mov cx, 10
	mov dx, 119
	int 10h
	
	mov cx, 26
	mov dx, 119
	int 10h
	
	mov cx, 33
	mov dx, 119
	int 10h
	
	mov cx, 38
	mov dx, 119
	int 10h
	
	mov cx, 44
	mov dx, 119
	int 10h
	
	mov cx, 53
	mov dx, 119
	int 10h
	
	mov cx, 68
	mov dx, 119
	int 10h
	
	mov cx, 77
	mov dx, 119
	int 10h
	
	mov cx, 90
	mov dx, 119
	int 10h
	
	mov cx, 97
	mov dx, 119
	int 10h
	
	mov cx, 102
	mov dx, 119
	int 10h
	
	mov cx, 105
	mov dx, 119
	int 10h
	
	mov cx, 122
	mov dx, 119
	int 10h
	
	mov cx, 132
	mov dx, 119
	int 10h
	
	mov cx, 137
	mov dx, 119
	int 10h
	
	mov cx, 149
	mov dx, 119
	int 10h
	
	mov cx, 154
	mov dx, 119
	int 10h
	
	mov cx, 170
	mov dx, 119
	int 10h
	
	mov cx, 180
	mov dx, 119
	int 10h
	
	mov cx, 184
	mov dx, 119
	int 10h
	
	mov cx, 187
	mov dx, 119
	int 10h
	
	mov cx, 190
	mov dx, 119
	int 10h
	
	mov cx, 193
	mov dx, 119
	int 10h
	
	mov cx, 210
	mov dx, 119
	int 10h
	
	mov cx, 213
	mov dx, 119
	int 10h
	
	mov cx, 217
	mov dx, 119
	int 10h
	
	mov cx, 222
	mov dx, 119
	int 10h
	
	mov cx, 225
	mov dx, 119
	int 10h
	
	mov cx, 230
	mov dx, 119
	int 10h
	
	mov cx, 242
	mov dx, 119
	int 10h
	
	mov cx, 244
	mov dx, 119
	int 10h
	
	mov cx, 249
	mov dx, 119
	int 10h
	
	mov cx, 269
	mov dx, 119
	int 10h
	
	mov cx, 273
	mov dx, 119
	int 10h
	
	mov cx, 281
	mov dx, 119
	int 10h
	
	mov cx, 289
	mov dx, 119
	int 10h
	
	mov cx, 294
	mov dx, 119
	int 10h
	
	mov cx, 306
	mov dx, 119
	int 10h
	
	mov cx, 313
	mov dx, 119
	int 10h
	
	mov cx, 318
	mov dx, 119
	int 10h
	
	mov cx, 324
	mov dx, 119
	int 10h
	
	mov cx, 333
	mov dx, 119
	int 10h
	
	mov cx, 350
	mov dx, 119
	int 10h
	
	mov cx, 354
	mov dx, 119
	int 10h
	
	mov cx, 361
	mov dx, 119
	int 10h
	
	mov cx, 366
	mov dx, 119
	int 10h
	
	mov cx, 369
	mov dx, 119
	int 10h
	
	mov cx, 374
	mov dx, 119
	int 10h
	
	mov cx, 385
	mov dx, 119
	int 10h
	
	mov cx, 393
	mov dx, 119
	int 10h
	
	mov cx, 401
	mov dx, 119
	int 10h
	
	mov cx, 409
	mov dx, 119
	int 10h
	
	mov cx, 414
	mov dx, 119
	int 10h
	
	mov cx, 417
	mov dx, 119
	int 10h
	
	mov cx, 437
	mov dx, 119
	int 10h
	
	mov cx, 441
	mov dx, 119
	int 10h
	
	mov cx, 449
	mov dx, 119
	int 10h
	
	mov cx, 457
	mov dx, 119
	int 10h
	
	mov cx, 465
	mov dx, 119
	int 10h
	
	mov cx, 473
	mov dx, 119
	int 10h
	
	mov cx, 478
	mov dx, 119
	int 10h
	
	mov cx, 3
	mov dx, 120
	int 10h
	
	mov cx, 10
	mov dx, 120
	int 10h
	
	mov cx, 26
	mov dx, 120
	int 10h
	
	mov cx, 33
	mov dx, 120
	int 10h
	
	mov cx, 38
	mov dx, 120
	int 10h
	
	mov cx, 44
	mov dx, 120
	int 10h
	
	mov cx, 53
	mov dx, 120
	int 10h
	
	mov cx, 68
	mov dx, 120
	int 10h
	
	mov cx, 77
	mov dx, 120
	int 10h
	
	mov cx, 90
	mov dx, 120
	int 10h
	
	mov cx, 97
	mov dx, 120
	int 10h
	
	mov cx, 102
	mov dx, 120
	int 10h
	
	mov cx, 105
	mov dx, 120
	int 10h
	
	mov cx, 122
	mov dx, 120
	int 10h
	
	mov cx, 132
	mov dx, 120
	int 10h
	
	mov cx, 137
	mov dx, 120
	int 10h
	
	mov cx, 149
	mov dx, 120
	int 10h
	
	mov cx, 154
	mov dx, 120
	int 10h
	
	mov cx, 170
	mov dx, 120
	int 10h
	
	mov cx, 180
	mov dx, 120
	int 10h
	
	mov cx, 184
	mov dx, 120
	int 10h
	
	mov cx, 187
	mov dx, 120
	int 10h
	
	mov cx, 190
	mov dx, 120
	int 10h
	
	mov cx, 193
	mov dx, 120
	int 10h
	
	mov cx, 211
	mov dx, 120
	int 10h
	
	mov cx, 212
	mov dx, 120
	int 10h
	
	mov cx, 217
	mov dx, 120
	int 10h
	
	mov cx, 222
	mov dx, 120
	int 10h
	
	mov cx, 225
	mov dx, 120
	int 10h
	
	mov cx, 229
	mov dx, 120
	int 10h
	
	mov cx, 230
	mov dx, 120
	int 10h
	
	mov cx, 242
	mov dx, 120
	int 10h
	
	mov cx, 244
	mov dx, 120
	int 10h
	
	mov cx, 249
	mov dx, 120
	int 10h
	
	mov cx, 269
	mov dx, 120
	int 10h
	
	mov cx, 273
	mov dx, 120
	int 10h
	
	mov cx, 281
	mov dx, 120
	int 10h
	
	mov cx, 289
	mov dx, 120
	int 10h
	
	mov cx, 294
	mov dx, 120
	int 10h
	
	mov cx, 306
	mov dx, 120
	int 10h
	
	mov cx, 313
	mov dx, 120
	int 10h
	
	mov cx, 318
	mov dx, 120
	int 10h
	
	mov cx, 324
	mov dx, 120
	int 10h
	
	mov cx, 333
	mov dx, 120
	int 10h
	
	mov cx, 350
	mov dx, 120
	int 10h
	
	mov cx, 354
	mov dx, 120
	int 10h
	
	mov cx, 361
	mov dx, 120
	int 10h
	
	mov cx, 366
	mov dx, 120
	int 10h
	
	mov cx, 369
	mov dx, 120
	int 10h
	
	mov cx, 370
	mov dx, 120
	int 10h
	
	mov cx, 374
	mov dx, 120
	int 10h
	
	mov cx, 385
	mov dx, 120
	int 10h
	
	mov cx, 393
	mov dx, 120
	int 10h
	
	mov cx, 401
	mov dx, 120
	int 10h
	
	mov cx, 409
	mov dx, 120
	int 10h
	
	mov cx, 414
	mov dx, 120
	int 10h
	
	mov cx, 417
	mov dx, 120
	int 10h
	
	mov cx, 437
	mov dx, 120
	int 10h
	
	mov cx, 442
	mov dx, 120
	int 10h
	
	mov cx, 449
	mov dx, 120
	int 10h
	
	mov cx, 457
	mov dx, 120
	int 10h
	
	mov cx, 465
	mov dx, 120
	int 10h
	
	mov cx, 473
	mov dx, 120
	int 10h
	
	mov cx, 478
	mov dx, 120
	int 10h
	
	mov cx, 482
	mov dx, 120
	int 10h
	
	mov cx, 483
	mov dx, 120
	int 10h
	
	mov cx, 1
	mov dx, 121
	int 10h
	
	mov cx, 2
	mov dx, 121
	int 10h
	
	mov cx, 3
	mov dx, 121
	int 10h
	
	mov cx, 4
	mov dx, 121
	int 10h
	
	mov cx, 5
	mov dx, 121
	int 10h
	
	mov cx, 10
	mov dx, 121
	int 10h
	
	mov cx, 27
	mov dx, 121
	int 10h
	
	mov cx, 28
	mov dx, 121
	int 10h
	
	mov cx, 29
	mov dx, 121
	int 10h
	
	mov cx, 33
	mov dx, 121
	int 10h
	
	mov cx, 38
	mov dx, 121
	int 10h
	
	mov cx, 44
	mov dx, 121
	int 10h
	
	mov cx, 49
	mov dx, 121
	int 10h
	
	mov cx, 50
	mov dx, 121
	int 10h
	
	mov cx, 51
	mov dx, 121
	int 10h
	
	mov cx, 52
	mov dx, 121
	int 10h
	
	mov cx, 68
	mov dx, 121
	int 10h
	
	mov cx, 73
	mov dx, 121
	int 10h
	
	mov cx, 74
	mov dx, 121
	int 10h
	
	mov cx, 75
	mov dx, 121
	int 10h
	
	mov cx, 76
	mov dx, 121
	int 10h
	
	mov cx, 91
	mov dx, 121
	int 10h
	
	mov cx, 92
	mov dx, 121
	int 10h
	
	mov cx, 93
	mov dx, 121
	int 10h
	
	mov cx, 97
	mov dx, 121
	int 10h
	
	mov cx, 102
	mov dx, 121
	int 10h
	
	mov cx, 106
	mov dx, 121
	int 10h
	
	mov cx, 107
	mov dx, 121
	int 10h
	
	mov cx, 108
	mov dx, 121
	int 10h
	
	mov cx, 109
	mov dx, 121
	int 10h
	
	mov cx, 110
	mov dx, 121
	int 10h
	
	mov cx, 122
	mov dx, 121
	int 10h
	
	mov cx, 132
	mov dx, 121
	int 10h
	
	mov cx, 137
	mov dx, 121
	int 10h
	
	mov cx, 145
	mov dx, 121
	int 10h
	
	mov cx, 146
	mov dx, 121
	int 10h
	
	mov cx, 147
	mov dx, 121
	int 10h
	
	mov cx, 148
	mov dx, 121
	int 10h
	
	mov cx, 155
	mov dx, 121
	int 10h
	
	mov cx, 156
	mov dx, 121
	int 10h
	
	mov cx, 157
	mov dx, 121
	int 10h
	
	mov cx, 171
	mov dx, 121
	int 10h
	
	mov cx, 172
	mov dx, 121
	int 10h
	
	mov cx, 173
	mov dx, 121
	int 10h
	
	mov cx, 180
	mov dx, 121
	int 10h
	
	mov cx, 184
	mov dx, 121
	int 10h
	
	mov cx, 187
	mov dx, 121
	int 10h
	
	mov cx, 190
	mov dx, 121
	int 10h
	
	mov cx, 194
	mov dx, 121
	int 10h
	
	mov cx, 195
	mov dx, 121
	int 10h
	
	mov cx, 196
	mov dx, 121
	int 10h
	
	mov cx, 197
	mov dx, 121
	int 10h
	
	mov cx, 198
	mov dx, 121
	int 10h
	
	mov cx, 211
	mov dx, 121
	int 10h
	
	mov cx, 212
	mov dx, 121
	int 10h
	
	mov cx, 218
	mov dx, 121
	int 10h
	
	mov cx, 219
	mov dx, 121
	int 10h
	
	mov cx, 220
	mov dx, 121
	int 10h
	
	mov cx, 221
	mov dx, 121
	int 10h
	
	mov cx, 226
	mov dx, 121
	int 10h
	
	mov cx, 227
	mov dx, 121
	int 10h
	
	mov cx, 228
	mov dx, 121
	int 10h
	
	mov cx, 230
	mov dx, 121
	int 10h
	
	mov cx, 243
	mov dx, 121
	int 10h
	
	mov cx, 250
	mov dx, 121
	int 10h
	
	mov cx, 251
	mov dx, 121
	int 10h
	
	mov cx, 252
	mov dx, 121
	int 10h
	
	mov cx, 253
	mov dx, 121
	int 10h
	
	mov cx, 254
	mov dx, 121
	int 10h
	
	mov cx, 265
	mov dx, 121
	int 10h
	
	mov cx, 266
	mov dx, 121
	int 10h
	
	mov cx, 267
	mov dx, 121
	int 10h
	
	mov cx, 268
	mov dx, 121
	int 10h
	
	mov cx, 274
	mov dx, 121
	int 10h
	
	mov cx, 275
	mov dx, 121
	int 10h
	
	mov cx, 276
	mov dx, 121
	int 10h
	
	mov cx, 277
	mov dx, 121
	int 10h
	
	mov cx, 278
	mov dx, 121
	int 10h
	
	mov cx, 282
	mov dx, 121
	int 10h
	
	mov cx, 283
	mov dx, 121
	int 10h
	
	mov cx, 284
	mov dx, 121
	int 10h
	
	mov cx, 285
	mov dx, 121
	int 10h
	
	mov cx, 286
	mov dx, 121
	int 10h
	
	mov cx, 289
	mov dx, 121
	int 10h
	
	mov cx, 294
	mov dx, 121
	int 10h
	
	mov cx, 307
	mov dx, 121
	int 10h
	
	mov cx, 308
	mov dx, 121
	int 10h
	
	mov cx, 309
	mov dx, 121
	int 10h
	
	mov cx, 313
	mov dx, 121
	int 10h
	
	mov cx, 318
	mov dx, 121
	int 10h
	
	mov cx, 324
	mov dx, 121
	int 10h
	
	mov cx, 329
	mov dx, 121
	int 10h
	
	mov cx, 330
	mov dx, 121
	int 10h
	
	mov cx, 331
	mov dx, 121
	int 10h
	
	mov cx, 332
	mov dx, 121
	int 10h
	
	mov cx, 345
	mov dx, 121
	int 10h
	
	mov cx, 346
	mov dx, 121
	int 10h
	
	mov cx, 347
	mov dx, 121
	int 10h
	
	mov cx, 348
	mov dx, 121
	int 10h
	
	mov cx, 349
	mov dx, 121
	int 10h
	
	mov cx, 355
	mov dx, 121
	int 10h
	
	mov cx, 356
	mov dx, 121
	int 10h
	
	mov cx, 357
	mov dx, 121
	int 10h
	
	mov cx, 362
	mov dx, 121
	int 10h
	
	mov cx, 363
	mov dx, 121
	int 10h
	
	mov cx, 364
	mov dx, 121
	int 10h
	
	mov cx, 365
	mov dx, 121
	int 10h
	
	mov cx, 369
	mov dx, 121
	int 10h
	
	mov cx, 371
	mov dx, 121
	int 10h
	
	mov cx, 372
	mov dx, 121
	int 10h
	
	mov cx, 373
	mov dx, 121
	int 10h
	
	mov cx, 386
	mov dx, 121
	int 10h
	
	mov cx, 387
	mov dx, 121
	int 10h
	
	mov cx, 388
	mov dx, 121
	int 10h
	
	mov cx, 389
	mov dx, 121
	int 10h
	
	mov cx, 390
	mov dx, 121
	int 10h
	
	mov cx, 393
	mov dx, 121
	int 10h
	
	mov cx, 401
	mov dx, 121
	int 10h
	
	mov cx, 410
	mov dx, 121
	int 10h
	
	mov cx, 411
	mov dx, 121
	int 10h
	
	mov cx, 412
	mov dx, 121
	int 10h
	
	mov cx, 413
	mov dx, 121
	int 10h
	
	mov cx, 417
	mov dx, 121
	int 10h
	
	mov cx, 433
	mov dx, 121
	int 10h
	
	mov cx, 434
	mov dx, 121
	int 10h
	
	mov cx, 435
	mov dx, 121
	int 10h
	
	mov cx, 436
	mov dx, 121
	int 10h
	
	mov cx, 443
	mov dx, 121
	int 10h
	
	mov cx, 444
	mov dx, 121
	int 10h
	
	mov cx, 445
	mov dx, 121
	int 10h
	
	mov cx, 446
	mov dx, 121
	int 10h
	
	mov cx, 449
	mov dx, 121
	int 10h
	
	mov cx, 458
	mov dx, 121
	int 10h
	
	mov cx, 459
	mov dx, 121
	int 10h
	
	mov cx, 460
	mov dx, 121
	int 10h
	
	mov cx, 461
	mov dx, 121
	int 10h
	
	mov cx, 462
	mov dx, 121
	int 10h
	
	mov cx, 466
	mov dx, 121
	int 10h
	
	mov cx, 467
	mov dx, 121
	int 10h
	
	mov cx, 468
	mov dx, 121
	int 10h
	
	mov cx, 469
	mov dx, 121
	int 10h
	
	mov cx, 470
	mov dx, 121
	int 10h
	
	mov cx, 473
	mov dx, 121
	int 10h
	
	mov cx, 478
	mov dx, 121
	int 10h
	
	mov cx, 482
	mov dx, 121
	int 10h
	
	mov cx, 483
	mov dx, 121
	int 10h
	
	mov cx, 211
	mov dx, 122
	int 10h
	
	mov cx, 369
	mov dx, 122
	int 10h
	
	mov cx, 483
	mov dx, 122
	int 10h
	
	mov cx, 210
	mov dx, 123
	int 10h
	
	mov cx, 211
	mov dx, 123
	int 10h
	
	mov cx, 369
	mov dx, 123
	int 10h
	
	mov cx, 482
	mov dx, 123
	int 10h
	
	mov cx, 208
	mov dx, 124
	int 10h
	
	mov cx, 209
	mov dx, 124
	int 10h
	
	mov cx, 210
	mov dx, 124
	int 10h
	
	mov cx, 369
	mov dx, 124
	int 10h
	
	mov cx, 195
	mov dx, 126
	int 10h
	
	mov cx, 196
	mov dx, 126
	int 10h
	
	mov cx, 197
	mov dx, 126
	int 10h
	
	mov cx, 198
	mov dx, 126
	int 10h
	
	mov cx, 217
	mov dx, 126
	int 10h
	
	mov cx, 227
	mov dx, 126
	int 10h
	
	mov cx, 228
	mov dx, 126
	int 10h
	
	mov cx, 395
	mov dx, 126
	int 10h
	
	mov cx, 396
	mov dx, 126
	int 10h
	
	mov cx, 427
	mov dx, 126
	int 10h
	
	mov cx, 428
	mov dx, 126
	int 10h
	
	mov cx, 429
	mov dx, 126
	int 10h
	
	mov cx, 430
	mov dx, 126
	int 10h
	
	mov cx, 441
	mov dx, 126
	int 10h
	
	mov cx, 442
	mov dx, 126
	int 10h
	
	mov cx, 443
	mov dx, 126
	int 10h
	
	mov cx, 444
	mov dx, 126
	int 10h
	
	mov cx, 449
	mov dx, 126
	int 10h
	
	mov cx, 450
	mov dx, 126
	int 10h
	
	mov cx, 451
	mov dx, 126
	int 10h
	
	mov cx, 452
	mov dx, 126
	int 10h
	
	mov cx, 194
	mov dx, 127
	int 10h
	
	mov cx, 217
	mov dx, 127
	int 10h
	
	mov cx, 227
	mov dx, 127
	int 10h
	
	mov cx, 228
	mov dx, 127
	int 10h
	
	mov cx, 395
	mov dx, 127
	int 10h
	
	mov cx, 396
	mov dx, 127
	int 10h
	
	mov cx, 426
	mov dx, 127
	int 10h
	
	mov cx, 444
	mov dx, 127
	int 10h
	
	mov cx, 452
	mov dx, 127
	int 10h
	
	mov cx, 26
	mov dx, 128
	int 10h
	
	mov cx, 50
	mov dx, 128
	int 10h
	
	mov cx, 146
	mov dx, 128
	int 10h
	
	mov cx, 185
	mov dx, 128
	int 10h
	
	mov cx, 186
	mov dx, 128
	int 10h
	
	mov cx, 187
	mov dx, 128
	int 10h
	
	mov cx, 188
	mov dx, 128
	int 10h
	
	mov cx, 189
	mov dx, 128
	int 10h
	
	mov cx, 194
	mov dx, 128
	int 10h
	
	mov cx, 210
	mov dx, 128
	int 10h
	
	mov cx, 217
	mov dx, 128
	int 10h
	
	mov cx, 426
	mov dx, 128
	int 10h
	
	mov cx, 444
	mov dx, 128
	int 10h
	
	mov cx, 452
	mov dx, 128
	int 10h
	
	mov cx, 1
	mov dx, 129
	int 10h
	
	mov cx, 3
	mov dx, 129
	int 10h
	
	mov cx, 4
	mov dx, 129
	int 10h
	
	mov cx, 5
	mov dx, 129
	int 10h
	
	mov cx, 10
	mov dx, 129
	int 10h
	
	mov cx, 11
	mov dx, 129
	int 10h
	
	mov cx, 12
	mov dx, 129
	int 10h
	
	mov cx, 13
	mov dx, 129
	int 10h
	
	mov cx, 18
	mov dx, 129
	int 10h
	
	mov cx, 19
	mov dx, 129
	int 10h
	
	mov cx, 20
	mov dx, 129
	int 10h
	
	mov cx, 21
	mov dx, 129
	int 10h
	
	mov cx, 24
	mov dx, 129
	int 10h
	
	mov cx, 25
	mov dx, 129
	int 10h
	
	mov cx, 26
	mov dx, 129
	int 10h
	
	mov cx, 27
	mov dx, 129
	int 10h
	
	mov cx, 28
	mov dx, 129
	int 10h
	
	mov cx, 29
	mov dx, 129
	int 10h
	
	mov cx, 34
	mov dx, 129
	int 10h
	
	mov cx, 35
	mov dx, 129
	int 10h
	
	mov cx, 36
	mov dx, 129
	int 10h
	
	mov cx, 41
	mov dx, 129
	int 10h
	
	mov cx, 43
	mov dx, 129
	int 10h
	
	mov cx, 44
	mov dx, 129
	int 10h
	
	mov cx, 45
	mov dx, 129
	int 10h
	
	mov cx, 48
	mov dx, 129
	int 10h
	
	mov cx, 49
	mov dx, 129
	int 10h
	
	mov cx, 50
	mov dx, 129
	int 10h
	
	mov cx, 51
	mov dx, 129
	int 10h
	
	mov cx, 52
	mov dx, 129
	int 10h
	
	mov cx, 53
	mov dx, 129
	int 10h
	
	mov cx, 64
	mov dx, 129
	int 10h
	
	mov cx, 71
	mov dx, 129
	int 10h
	
	mov cx, 74
	mov dx, 129
	int 10h
	
	mov cx, 75
	mov dx, 129
	int 10h
	
	mov cx, 76
	mov dx, 129
	int 10h
	
	mov cx, 77
	mov dx, 129
	int 10h
	
	mov cx, 81
	mov dx, 129
	int 10h
	
	mov cx, 86
	mov dx, 129
	int 10h
	
	mov cx, 89
	mov dx, 129
	int 10h
	
	mov cx, 91
	mov dx, 129
	int 10h
	
	mov cx, 92
	mov dx, 129
	int 10h
	
	mov cx, 93
	mov dx, 129
	int 10h
	
	mov cx, 107
	mov dx, 129
	int 10h
	
	mov cx, 108
	mov dx, 129
	int 10h
	
	mov cx, 109
	mov dx, 129
	int 10h
	
	mov cx, 110
	mov dx, 129
	int 10h
	
	mov cx, 114
	mov dx, 129
	int 10h
	
	mov cx, 115
	mov dx, 129
	int 10h
	
	mov cx, 116
	mov dx, 129
	int 10h
	
	mov cx, 117
	mov dx, 129
	int 10h
	
	mov cx, 120
	mov dx, 129
	int 10h
	
	mov cx, 122
	mov dx, 129
	int 10h
	
	mov cx, 123
	mov dx, 129
	int 10h
	
	mov cx, 125
	mov dx, 129
	int 10h
	
	mov cx, 126
	mov dx, 129
	int 10h
	
	mov cx, 129
	mov dx, 129
	int 10h
	
	mov cx, 131
	mov dx, 129
	int 10h
	
	mov cx, 132
	mov dx, 129
	int 10h
	
	mov cx, 133
	mov dx, 129
	int 10h
	
	mov cx, 137
	mov dx, 129
	int 10h
	
	mov cx, 142
	mov dx, 129
	int 10h
	
	mov cx, 144
	mov dx, 129
	int 10h
	
	mov cx, 145
	mov dx, 129
	int 10h
	
	mov cx, 146
	mov dx, 129
	int 10h
	
	mov cx, 147
	mov dx, 129
	int 10h
	
	mov cx, 148
	mov dx, 129
	int 10h
	
	mov cx, 149
	mov dx, 129
	int 10h
	
	mov cx, 154
	mov dx, 129
	int 10h
	
	mov cx, 155
	mov dx, 129
	int 10h
	
	mov cx, 156
	mov dx, 129
	int 10h
	
	mov cx, 157
	mov dx, 129
	int 10h
	
	mov cx, 161
	mov dx, 129
	int 10h
	
	mov cx, 163
	mov dx, 129
	int 10h
	
	mov cx, 164
	mov dx, 129
	int 10h
	
	mov cx, 165
	mov dx, 129
	int 10h
	
	mov cx, 187
	mov dx, 129
	int 10h
	
	mov cx, 192
	mov dx, 129
	int 10h
	
	mov cx, 193
	mov dx, 129
	int 10h
	
	mov cx, 194
	mov dx, 129
	int 10h
	
	mov cx, 195
	mov dx, 129
	int 10h
	
	mov cx, 196
	mov dx, 129
	int 10h
	
	mov cx, 197
	mov dx, 129
	int 10h
	
	mov cx, 198
	mov dx, 129
	int 10h
	
	mov cx, 208
	mov dx, 129
	int 10h
	
	mov cx, 209
	mov dx, 129
	int 10h
	
	mov cx, 210
	mov dx, 129
	int 10h
	
	mov cx, 211
	mov dx, 129
	int 10h
	
	mov cx, 212
	mov dx, 129
	int 10h
	
	mov cx, 213
	mov dx, 129
	int 10h
	
	mov cx, 217
	mov dx, 129
	int 10h
	
	mov cx, 219
	mov dx, 129
	int 10h
	
	mov cx, 220
	mov dx, 129
	int 10h
	
	mov cx, 221
	mov dx, 129
	int 10h
	
	mov cx, 225
	mov dx, 129
	int 10h
	
	mov cx, 226
	mov dx, 129
	int 10h
	
	mov cx, 227
	mov dx, 129
	int 10h
	
	mov cx, 228
	mov dx, 129
	int 10h
	
	mov cx, 234
	mov dx, 129
	int 10h
	
	mov cx, 235
	mov dx, 129
	int 10h
	
	mov cx, 236
	mov dx, 129
	int 10h
	
	mov cx, 237
	mov dx, 129
	int 10h
	
	mov cx, 250
	mov dx, 129
	int 10h
	
	mov cx, 251
	mov dx, 129
	int 10h
	
	mov cx, 252
	mov dx, 129
	int 10h
	
	mov cx, 253
	mov dx, 129
	int 10h
	
	mov cx, 259
	mov dx, 129
	int 10h
	
	mov cx, 260
	mov dx, 129
	int 10h
	
	mov cx, 261
	mov dx, 129
	int 10h
	
	mov cx, 262
	mov dx, 129
	int 10h
	
	mov cx, 265
	mov dx, 129
	int 10h
	
	mov cx, 267
	mov dx, 129
	int 10h
	
	mov cx, 268
	mov dx, 129
	int 10h
	
	mov cx, 269
	mov dx, 129
	int 10h
	
	mov cx, 274
	mov dx, 129
	int 10h
	
	mov cx, 275
	mov dx, 129
	int 10h
	
	mov cx, 276
	mov dx, 129
	int 10h
	
	mov cx, 277
	mov dx, 129
	int 10h
	
	mov cx, 282
	mov dx, 129
	int 10h
	
	mov cx, 283
	mov dx, 129
	int 10h
	
	mov cx, 284
	mov dx, 129
	int 10h
	
	mov cx, 285
	mov dx, 129
	int 10h
	
	mov cx, 289
	mov dx, 129
	int 10h
	
	mov cx, 291
	mov dx, 129
	int 10h
	
	mov cx, 292
	mov dx, 129
	int 10h
	
	mov cx, 293
	mov dx, 129
	int 10h
	
	mov cx, 306
	mov dx, 129
	int 10h
	
	mov cx, 307
	mov dx, 129
	int 10h
	
	mov cx, 308
	mov dx, 129
	int 10h
	
	mov cx, 313
	mov dx, 129
	int 10h
	
	mov cx, 315
	mov dx, 129
	int 10h
	
	mov cx, 316
	mov dx, 129
	int 10h
	
	mov cx, 317
	mov dx, 129
	int 10h
	
	mov cx, 321
	mov dx, 129
	int 10h
	
	mov cx, 323
	mov dx, 129
	int 10h
	
	mov cx, 324
	mov dx, 129
	int 10h
	
	mov cx, 325
	mov dx, 129
	int 10h
	
	mov cx, 330
	mov dx, 129
	int 10h
	
	mov cx, 331
	mov dx, 129
	int 10h
	
	mov cx, 332
	mov dx, 129
	int 10h
	
	mov cx, 333
	mov dx, 129
	int 10h
	
	mov cx, 338
	mov dx, 129
	int 10h
	
	mov cx, 339
	mov dx, 129
	int 10h
	
	mov cx, 340
	mov dx, 129
	int 10h
	
	mov cx, 345
	mov dx, 129
	int 10h
	
	mov cx, 347
	mov dx, 129
	int 10h
	
	mov cx, 348
	mov dx, 129
	int 10h
	
	mov cx, 349
	mov dx, 129
	int 10h
	
	mov cx, 354
	mov dx, 129
	int 10h
	
	mov cx, 355
	mov dx, 129
	int 10h
	
	mov cx, 356
	mov dx, 129
	int 10h
	
	mov cx, 357
	mov dx, 129
	int 10h
	
	mov cx, 370
	mov dx, 129
	int 10h
	
	mov cx, 371
	mov dx, 129
	int 10h
	
	mov cx, 372
	mov dx, 129
	int 10h
	
	mov cx, 378
	mov dx, 129
	int 10h
	
	mov cx, 379
	mov dx, 129
	int 10h
	
	mov cx, 380
	mov dx, 129
	int 10h
	
	mov cx, 382
	mov dx, 129
	int 10h
	
	mov cx, 386
	mov dx, 129
	int 10h
	
	mov cx, 387
	mov dx, 129
	int 10h
	
	mov cx, 388
	mov dx, 129
	int 10h
	
	mov cx, 393
	mov dx, 129
	int 10h
	
	mov cx, 394
	mov dx, 129
	int 10h
	
	mov cx, 395
	mov dx, 129
	int 10h
	
	mov cx, 396
	mov dx, 129
	int 10h
	
	mov cx, 401
	mov dx, 129
	int 10h
	
	mov cx, 403
	mov dx, 129
	int 10h
	
	mov cx, 404
	mov dx, 129
	int 10h
	
	mov cx, 405
	mov dx, 129
	int 10h
	
	mov cx, 424
	mov dx, 129
	int 10h
	
	mov cx, 425
	mov dx, 129
	int 10h
	
	mov cx, 426
	mov dx, 129
	int 10h
	
	mov cx, 427
	mov dx, 129
	int 10h
	
	mov cx, 428
	mov dx, 129
	int 10h
	
	mov cx, 429
	mov dx, 129
	int 10h
	
	mov cx, 430
	mov dx, 129
	int 10h
	
	mov cx, 434
	mov dx, 129
	int 10h
	
	mov cx, 435
	mov dx, 129
	int 10h
	
	mov cx, 436
	mov dx, 129
	int 10h
	
	mov cx, 437
	mov dx, 129
	int 10h
	
	mov cx, 444
	mov dx, 129
	int 10h
	
	mov cx, 452
	mov dx, 129
	int 10h
	
	mov cx, 458
	mov dx, 129
	int 10h
	
	mov cx, 459
	mov dx, 129
	int 10h
	
	mov cx, 460
	mov dx, 129
	int 10h
	
	mov cx, 461
	mov dx, 129
	int 10h
	
	mov cx, 464
	mov dx, 129
	int 10h
	
	mov cx, 471
	mov dx, 129
	int 10h
	
	mov cx, 1
	mov dx, 130
	int 10h
	
	mov cx, 2
	mov dx, 130
	int 10h
	
	mov cx, 5
	mov dx, 130
	int 10h
	
	mov cx, 10
	mov dx, 130
	int 10h
	
	mov cx, 14
	mov dx, 130
	int 10h
	
	mov cx, 17
	mov dx, 130
	int 10h
	
	mov cx, 26
	mov dx, 130
	int 10h
	
	mov cx, 37
	mov dx, 130
	int 10h
	
	mov cx, 41
	mov dx, 130
	int 10h
	
	mov cx, 42
	mov dx, 130
	int 10h
	
	mov cx, 45
	mov dx, 130
	int 10h
	
	mov cx, 50
	mov dx, 130
	int 10h
	
	mov cx, 65
	mov dx, 130
	int 10h
	
	mov cx, 70
	mov dx, 130
	int 10h
	
	mov cx, 73
	mov dx, 130
	int 10h
	
	mov cx, 78
	mov dx, 130
	int 10h
	
	mov cx, 81
	mov dx, 130
	int 10h
	
	mov cx, 86
	mov dx, 130
	int 10h
	
	mov cx, 89
	mov dx, 130
	int 10h
	
	mov cx, 90
	mov dx, 130
	int 10h
	
	mov cx, 93
	mov dx, 130
	int 10h
	
	mov cx, 106
	mov dx, 130
	int 10h
	
	mov cx, 113
	mov dx, 130
	int 10h
	
	mov cx, 118
	mov dx, 130
	int 10h
	
	mov cx, 120
	mov dx, 130
	int 10h
	
	mov cx, 121
	mov dx, 130
	int 10h
	
	mov cx, 123
	mov dx, 130
	int 10h
	
	mov cx, 124
	mov dx, 130
	int 10h
	
	mov cx, 126
	mov dx, 130
	int 10h
	
	mov cx, 129
	mov dx, 130
	int 10h
	
	mov cx, 130
	mov dx, 130
	int 10h
	
	mov cx, 134
	mov dx, 130
	int 10h
	
		mov cx, 137
	mov dx, 130
	int 10h
	
	mov cx, 142
	mov dx, 130
	int 10h
	
	mov cx, 146
	mov dx, 130
	int 10h
	
	mov cx, 154
	mov dx, 130
	int 10h
	
	mov cx, 158
	mov dx, 130
	int 10h
	
	mov cx, 161
	mov dx, 130
	int 10h
	
	mov cx, 162
	mov dx, 130
	int 10h
	
	mov cx, 165
	mov dx, 130
	int 10h
	
	mov cx, 187
	mov dx, 130
	int 10h
	
	mov cx, 194
	mov dx, 130
	int 10h
	
	mov cx, 210
	mov dx, 130
	int 10h
	
	mov cx, 217
	mov dx, 130
	int 10h
	
	mov cx, 218
	mov dx, 130
	int 10h
	
	mov cx, 222
	mov dx, 130
	int 10h
	
	mov cx, 228
	mov dx, 130
	int 10h
	
	mov cx, 233
	mov dx, 130
	int 10h
	
	mov cx, 249
	mov dx, 130
	int 10h
	
	mov cx, 258
	mov dx, 130
	int 10h
	
	mov cx, 265
	mov dx, 130
	int 10h
	
	mov cx, 266
	mov dx, 130
	int 10h
	
	mov cx, 269
	mov dx, 130
	int 10h
	
	mov cx, 274
	mov dx, 130
	int 10h
	
	mov cx, 278
	mov dx, 130
	int 10h
	
	mov cx, 282
	mov dx, 130
	int 10h
	
	mov cx, 286
	mov dx, 130
	int 10h
	
	mov cx, 289
	mov dx, 130
	int 10h
	
	mov cx, 290
	mov dx, 130
	int 10h
	
	mov cx, 294
	mov dx, 130
	int 10h
	
	mov cx, 309
	mov dx, 130
	int 10h
	
	mov cx, 313
	mov dx, 130
	int 10h
	
	mov cx, 314
	mov dx, 130
	int 10h
	
	mov cx, 318
	mov dx, 130
	int 10h
	
	mov cx, 321
	mov dx, 130
	int 10h
	
	mov cx, 322
	mov dx, 130
	int 10h
	
	mov cx, 326
	mov dx, 130
	int 10h
	
	mov cx, 330
	mov dx, 130
	int 10h
	
	mov cx, 334
	mov dx, 130
	int 10h
	
	mov cx, 341
	mov dx, 130
	int 10h
	
	mov cx, 345
	mov dx, 130
	int 10h
	
	mov cx, 346
	mov dx, 130
	int 10h
	
	mov cx, 349
	mov dx, 130
	int 10h
	
	mov cx, 353
	mov dx, 130
	int 10h
	
	mov cx, 373
	mov dx, 130
	int 10h
	
	mov cx, 377
	mov dx, 130
	int 10h
	
	mov cx, 381
	mov dx, 130
	int 10h
	
	mov cx, 382
	mov dx, 130
	int 10h
	
	mov cx, 389
	mov dx, 130
	int 10h
	
	mov cx, 396
	mov dx, 130
	int 10h
	
	mov cx, 401
	mov dx, 130
	int 10h
	
	mov cx, 402
	mov dx, 130
	int 10h
	
	mov cx, 406
	mov dx, 130
	int 10h
	
	mov cx, 426
	mov dx, 130
	int 10h
	
	mov cx, 433
	mov dx, 130
	int 10h
	
	mov cx, 438
	mov dx, 130
	int 10h
	
	mov cx, 444
	mov dx, 130
	int 10h
	
	mov cx, 452
	mov dx, 130
	int 10h
	
	mov cx, 457
	mov dx, 130
	int 10h
	
	mov cx, 462
	mov dx, 130
	int 10h
	
	mov cx, 464
	mov dx, 130
	int 10h
	
	mov cx, 467
	mov dx, 130
	int 10h
	
	mov cx, 471
	mov dx, 130
	int 10h
	
	mov cx, 1
	mov dx, 131
	int 10h
	
	mov cx, 9
	mov dx, 131
	int 10h
	
	mov cx, 14
	mov dx, 131
	int 10h
	
		mov cx, 17
	mov dx, 131
	int 10h
	
	mov cx, 18
	mov dx, 131
	int 10h
	
	mov cx, 26
	mov dx, 131
	int 10h
	
	mov cx, 37
	mov dx, 131
	int 10h
	
	mov cx, 41
	mov dx, 131
	int 10h
	
	mov cx, 50
	mov dx, 131
	int 10h
	
	mov cx, 65
	mov dx, 131
	int 10h
	
	mov cx, 70
	mov dx, 131
	int 10h
	
	mov cx, 73
	mov dx, 131
	int 10h
	
	mov cx, 78
	mov dx, 131
	int 10h
	
	mov cx, 81
	mov dx, 131
	int 10h
	
	mov cx, 86
	mov dx, 131
	int 10h
	
	mov cx, 89
	mov dx, 131
	int 10h
	
	mov cx, 105
	mov dx, 131
	int 10h
	
	mov cx, 113
	mov dx, 131
	int 10h
	
	mov cx, 118
	mov dx, 131
	int 10h
	
	mov cx, 120
	mov dx, 131
	int 10h
	
	mov cx, 123
	mov dx, 131
	int 10h
	
	mov cx, 126
	mov dx, 131
	int 10h
	
	mov cx, 129
	mov dx, 131
	int 10h
	
	mov cx, 134
	mov dx, 131
	int 10h
	
	mov cx, 137
	mov dx, 131
	int 10h
	
	mov cx, 142
	mov dx, 131
	int 10h
	
	mov cx, 146
	mov dx, 131
	int 10h
	
	mov cx, 153
	mov dx, 131
	int 10h
	
	mov cx, 158
	mov dx, 131
	int 10h
	
	mov cx, 161
	mov dx, 131
	int 10h
	
	mov cx, 187
	mov dx, 131
	int 10h
	
	mov cx, 194
	mov dx, 131
	int 10h
	
	mov cx, 210
	mov dx, 131
	int 10h
	
	mov cx, 217
	mov dx, 131
	int 10h
	
	mov cx, 222
	mov dx, 131
	int 10h
	
	mov cx, 228
	mov dx, 131
	int 10h
	
	mov cx, 233
	mov dx, 131
	int 10h
	
	mov cx, 234
	mov dx, 131
	int 10h
	
	mov cx, 249
	mov dx, 131
	int 10h
	
	mov cx, 250
	mov dx, 131
	int 10h
	
	mov cx, 257
	mov dx, 131
	int 10h
	
	mov cx, 265
	mov dx, 131
	int 10h
	
	mov cx, 273
	mov dx, 131
	int 10h
	
	mov cx, 278
	mov dx, 131
	int 10h
	
	mov cx, 281
	mov dx, 131
	int 10h
	
	mov cx, 286
	mov dx, 131
	int 10h
	
	mov cx, 289
	mov dx, 131
	int 10h
	
	mov cx, 294
	mov dx, 131
	int 10h
	
	mov cx, 309
	mov dx, 131
	int 10h
	
	mov cx, 313
	mov dx, 131
	int 10h
	
	mov cx, 318
	mov dx, 131
	int 10h
	
	mov cx, 321
	mov dx, 131
	int 10h
	
	mov cx, 326
	mov dx, 131
	int 10h
	
	mov cx, 329
	mov dx, 131
	int 10h
	
	mov cx, 334
	mov dx, 131
	int 10h
	
	mov cx, 341
	mov dx, 131
	int 10h
	
	mov cx, 345
	mov dx, 131
	int 10h
	
	mov cx, 353
	mov dx, 131
	int 10h
	
	mov cx, 354
	mov dx, 131
	int 10h
	
	mov cx, 373
	mov dx, 131
	int 10h
	
	mov cx, 377
	mov dx, 131
	int 10h
	
	mov cx, 382
	mov dx, 131
	int 10h
	
	mov cx, 389
	mov dx, 131
	int 10h
	
	mov cx, 396
	mov dx, 131
	int 10h
	
	mov cx, 401
	mov dx, 131
	int 10h
	
	mov cx, 406
	mov dx, 131
	int 10h
	
	mov cx, 426
	mov dx, 131
	int 10h
	
	mov cx, 433
	mov dx, 131
	int 10h
	
	mov cx, 438
	mov dx, 131
	int 10h
	
	mov cx, 444
	mov dx, 131
	int 10h
	
	mov cx, 452
	mov dx, 131
	int 10h
	
	mov cx, 457
	mov dx, 131
	int 10h
	
	mov cx, 462
	mov dx, 131
	int 10h
	
	mov cx, 465
	mov dx, 131
	int 10h
	
	mov cx, 467
	mov dx, 131
	int 10h
	
	mov cx, 468
	mov dx, 131
	int 10h
	
	mov cx, 470
	mov dx, 131
	int 10h
	
	mov cx, 1
	mov dx, 132
	int 10h
	
	mov cx, 9
	mov dx, 132
	int 10h
	
	mov cx, 10
	mov dx, 132
	int 10h
	
	mov cx, 11
	mov dx, 132
	int 10h
	
	mov cx, 12
	mov dx, 132
	int 10h
	
	mov cx, 13
	mov dx, 132
	int 10h
	
	mov cx, 14
	mov dx, 132
	int 10h
	
	mov cx, 19
	mov dx, 132
	int 10h
	
	mov cx, 20
	mov dx, 132
	int 10h
	
	mov cx, 26
	mov dx, 132
	int 10h
	
	mov cx, 34
	mov dx, 132
	int 10h
	
	mov cx, 35
	mov dx, 132
	int 10h
	
	mov cx, 36
	mov dx, 132
	int 10h
	
	mov cx, 37
	mov dx, 132
	int 10h
	
	mov cx, 41
	mov dx, 132
	int 10h
	
	mov cx, 50
	mov dx, 132
	int 10h
	
	mov cx, 66
	mov dx, 132
	int 10h
	
	mov cx, 69
	mov dx, 132
	int 10h
	
	mov cx, 73
	mov dx, 132
	int 10h
	
	mov cx, 78
	mov dx, 132
	int 10h
	
	mov cx, 81
	mov dx, 132
	int 10h
	
	mov cx, 86
	mov dx, 132
	int 10h
	
	mov cx, 89
	mov dx, 132
	int 10h
	
	mov cx, 105
	mov dx, 132
	int 10h
	
	mov cx, 113
	mov dx, 132
	int 10h
	
	mov cx, 118
	mov dx, 132
	int 10h
	
	mov cx, 120
	mov dx, 132
	int 10h
	
	mov cx, 123
	mov dx, 132
	int 10h
	
	mov cx, 126
	mov dx, 132
	int 10h
	
	mov cx, 129
	mov dx, 132
	int 10h
	
	mov cx, 134
	mov dx, 132
	int 10h
	
	mov cx, 137
	mov dx, 132
	int 10h
	
	mov cx, 142
	mov dx, 132
	int 10h
	
	mov cx, 146
	mov dx, 132
	int 10h
	
	mov cx, 153
	mov dx, 132
	int 10h
	
	mov cx, 154
	mov dx, 132
	int 10h
	
	mov cx, 155
	mov dx, 132
	int 10h
	
	mov cx, 156
	mov dx, 132
	int 10h
	
	mov cx, 157
	mov dx, 132
	int 10h
	
	mov cx, 158
	mov dx, 132
	int 10h
	
	mov cx, 161
	mov dx, 132
	int 10h
	
	mov cx, 187
	mov dx, 132
	int 10h
	
	mov cx, 194
	mov dx, 132
	int 10h
	
	mov cx, 210
	mov dx, 132
	int 10h
	
	mov cx, 217
	mov dx, 132
	int 10h
	
	mov cx, 222
	mov dx, 132
	int 10h
	
	mov cx, 228
	mov dx, 132
	int 10h
	
	mov cx, 235
	mov dx, 132
	int 10h
	
	mov cx, 236
	mov dx, 132
	int 10h
	
	mov cx, 251
	mov dx, 132
	int 10h
	
	mov cx, 252
	mov dx, 132
	int 10h
	
	mov cx, 257
	mov dx, 132
	int 10h
	
	mov cx, 265
	mov dx, 132
	int 10h
	
	mov cx, 273
	mov dx, 132
	int 10h
	
	mov cx, 274
	mov dx, 132
	int 10h
	
	mov cx, 275
	mov dx, 132
	int 10h
	
	mov cx, 276
	mov dx, 132
	int 10h
	
	mov cx, 277
	mov dx, 132
	int 10h
	
	mov cx, 278
	mov dx, 132
	int 10h
	
	mov cx, 281
	mov dx, 132
	int 10h
	
	mov cx, 282
	mov dx, 132
	int 10h
	
	mov cx, 283
	mov dx, 132
	int 10h
	
	mov cx, 284
	mov dx, 132
	int 10h
	
	mov cx, 285
	mov dx, 132
	int 10h
	
	mov cx, 286
	mov dx, 132
	int 10h
	
	mov cx, 289
	mov dx, 132
	int 10h
	
	mov cx, 294
	mov dx, 132
	int 10h
	
	mov cx, 306
	mov dx, 132
	int 10h
	
	mov cx, 307
	mov dx, 132
	int 10h
	
	mov cx, 308
	mov dx, 132
	int 10h
	
	mov cx, 309
	mov dx, 132
	int 10h
	
	mov cx, 313
	mov dx, 132
	int 10h
	
	mov cx, 318
	mov dx, 132
	int 10h
	
	mov cx, 321
	mov dx, 132
	int 10h
	
	mov cx, 326
	mov dx, 132
	int 10h
	
	mov cx, 329
	mov dx, 132
	int 10h
	
	mov cx, 330
	mov dx, 132
	int 10h
	
	mov cx, 331
	mov dx, 132
	int 10h
	
	mov cx, 332
	mov dx, 132
	int 10h
	
	mov cx, 333
	mov dx, 132
	int 10h
	
	mov cx, 334
	mov dx, 132
	int 10h
	
	mov cx, 338
	mov dx, 132
	int 10h
	
	mov cx, 339
	mov dx, 132
	int 10h
	
	mov cx, 340
	mov dx, 132
	int 10h
	
	mov cx, 341
	mov dx, 132
	int 10h
	
	mov cx, 345
	mov dx, 132
	int 10h
	
	mov cx, 355
	mov dx, 132
	int 10h
	
	mov cx, 356
	mov dx, 132
	int 10h
	
	mov cx, 370
	mov dx, 132
	int 10h
	
	mov cx, 371
	mov dx, 132
	int 10h
	
	mov cx, 372
	mov dx, 132
	int 10h
	
	mov cx, 373
	mov dx, 132
	int 10h
	
	mov cx, 377
	mov dx, 132
	int 10h
	
	mov cx, 382
	mov dx, 132
	int 10h
	
	mov cx, 386
	mov dx, 132
	int 10h
	
	mov cx, 387
	mov dx, 132
	int 10h
	
	mov cx, 388
	mov dx, 132
	int 10h
	
	mov cx, 389
	mov dx, 132
	int 10h
	
	mov cx, 396
	mov dx, 132
	int 10h
	
	mov cx, 401
	mov dx, 132
	int 10h
	
	mov cx, 406
	mov dx, 132
	int 10h
	
	mov cx, 426
	mov dx, 132
	int 10h
	
	mov cx, 433
	mov dx, 132
	int 10h
	
	mov cx, 438
	mov dx, 132
	int 10h
	
	mov cx, 444
	mov dx, 132
	int 10h
	
	mov cx, 452
	mov dx, 132
	int 10h
	
	mov cx, 457
	mov dx, 132
	int 10h
	
	mov cx, 462
	mov dx, 132
	int 10h
	
	mov cx, 465
	mov dx, 132
	int 10h
	
	mov cx, 467
	mov dx, 132
	int 10h
	
	mov cx, 468
	mov dx, 132
	int 10h
	
	mov cx, 470
	mov dx, 132
	int 10h
	
	mov cx, 1
	mov dx, 133
	int 10h
	
	mov cx, 9
	mov dx, 133
	int 10h
	
	mov cx, 21
	mov dx, 133
	int 10h
	
	mov cx, 26
	mov dx, 133
	int 10h
	
	mov cx, 33
	mov dx, 133
	int 10h
	
	mov cx, 37
	mov dx, 133
	int 10h
	
	mov cx, 41
	mov dx, 133
	int 10h
	
	mov cx, 50
	mov dx, 133
	int 10h
	
	mov cx, 66
	mov dx, 133
	int 10h
	
	mov cx, 69
	mov dx, 133
	int 10h
	
	mov cx, 73
	mov dx, 133
	int 10h
	
	mov cx, 78
	mov dx, 133
	int 10h
	
	mov cx, 81
	mov dx, 133
	int 10h
	
	mov cx, 86
	mov dx, 133
	int 10h
	
	mov cx, 89
	mov dx, 133
	int 10h
	
	mov cx, 105
	mov dx, 133
	int 10h
	
	mov cx, 113
	mov dx, 133
	int 10h
	
	mov cx, 118
	mov dx, 133
	int 10h
	
	mov cx, 120
	mov dx, 133
	int 10h
	
	mov cx, 123
	mov dx, 133
	int 10h
	
	mov cx, 126
	mov dx, 133
	int 10h
	
	mov cx, 129
	mov dx, 133
	int 10h
	
	mov cx, 134
	mov dx, 133
	int 10h
	
	mov cx, 137
	mov dx, 133
	int 10h
	
	mov cx, 142
	mov dx, 133
	int 10h
	
	mov cx, 146
	mov dx, 133
	int 10h
	
	mov cx, 153
	mov dx, 133
	int 10h
	
	mov cx, 161
	mov dx, 133
	int 10h
	
	mov cx, 187
	mov dx, 133
	int 10h
	
	mov cx, 194
	mov dx, 133
	int 10h
	
	mov cx, 210
	mov dx, 133
	int 10h
	
	mov cx, 217
	mov dx, 133
	int 10h
	
	mov cx, 222
	mov dx, 133
	int 10h
	
	mov cx, 228
	mov dx, 133
	int 10h
	
	mov cx, 237
	mov dx, 133
	int 10h
	
	mov cx, 253
	mov dx, 133
	int 10h
	
	mov cx, 257
	mov dx, 133
	int 10h
	
	mov cx, 265
	mov dx, 133
	int 10h
	
	mov cx, 273
	mov dx, 133
	int 10h
	
	mov cx, 281
	mov dx, 133
	int 10h
	
	mov cx, 289
	mov dx, 133
	int 10h
	
	mov cx, 294
	mov dx, 133
	int 10h
	
	mov cx, 305
	mov dx, 133
	int 10h
	
	mov cx, 309
	mov dx, 133
	int 10h
	
	mov cx, 313
	mov dx, 133
	int 10h
	
	mov cx, 318
	mov dx, 133
	int 10h
	
	mov cx, 321
	mov dx, 133
	int 10h
	
	mov cx, 326
	mov dx, 133
	int 10h
	
	mov cx, 329
	mov dx, 133
	int 10h
	
	mov cx, 337
	mov dx, 133
	int 10h
	
	mov cx, 341
	mov dx, 133
	int 10h
	
	mov cx, 345
	mov dx, 133
	int 10h
	
	mov cx, 357
	mov dx, 133
	int 10h
	
	mov cx, 369
	mov dx, 133
	int 10h
	
	mov cx, 373
	mov dx, 133
	int 10h
	
	mov cx, 377
	mov dx, 133
	int 10h
	
	mov cx, 382
	mov dx, 133
	int 10h
	
	mov cx, 385
	mov dx, 133
	int 10h
	
	mov cx, 389
	mov dx, 133
	int 10h
	
	mov cx, 396
	mov dx, 133
	int 10h
	
	mov cx, 401
	mov dx, 133
	int 10h
	
	mov cx, 406
	mov dx, 133
	int 10h
	
	mov cx, 426
	mov dx, 133
	int 10h
	
	mov cx, 433
	mov dx, 133
	int 10h
	
	mov cx, 438
	mov dx, 133
	int 10h
	
	mov cx, 444
	mov dx, 133
	int 10h
	
	mov cx, 452
	mov dx, 133
	int 10h
	
	mov cx, 457
	mov dx, 133
	int 10h
	
	mov cx, 462
	mov dx, 133
	int 10h
	
	mov cx, 465
	mov dx, 133
	int 10h
	
	mov cx, 466
	mov dx, 133
	int 10h
	
	mov cx, 468
	mov dx, 133
	int 10h
	
	mov cx, 470
	mov dx, 133
	int 10h
	
	mov cx, 1
	mov dx, 134
	int 10h
	
	mov cx, 9
	mov dx, 134
	int 10h
	
	mov cx, 21
	mov dx, 134
	int 10h
	
	mov cx, 26
	mov dx, 134
	int 10h
	
	mov cx, 33
	mov dx, 134
	int 10h
	
	mov cx, 37
	mov dx, 134
	int 10h
	
	mov cx, 41
	mov dx, 134
	int 10h
	
	mov cx, 50
	mov dx, 134
	int 10h
	
	mov cx, 67
	mov dx, 134
	int 10h
	
	mov cx, 68
	mov dx, 134
	int 10h
	
	mov cx, 73
	mov dx, 134
	int 10h
	
	mov cx, 78
	mov dx, 134
	int 10h
	
	mov cx, 81
	mov dx, 134
	int 10h
	
	mov cx, 85
	mov dx, 134
	int 10h
	
	mov cx, 86
	mov dx, 134
	int 10h
	
	mov cx, 89
	mov dx, 134
	int 10h
	
	mov cx, 106
	mov dx, 134
	int 10h
	
	mov cx, 113
	mov dx, 134
	int 10h
	
	mov cx, 118
	mov dx, 134
	int 10h
	
	mov cx, 120
	mov dx, 134
	int 10h
	
	mov cx, 123
	mov dx, 134
	int 10h
	
	mov cx, 126
	mov dx, 134
	int 10h
	
	mov cx, 129
	mov dx, 134
	int 10h
	
	mov cx, 130
	mov dx, 134
	int 10h
	
	mov cx, 134
	mov dx, 134
	int 10h
	
	mov cx, 137
	mov dx, 134
	int 10h
	
	mov cx, 141
	mov dx, 134
	int 10h
	
	mov cx, 142
	mov dx, 134
	int 10h
	
	mov cx, 146
	mov dx, 134
	int 10h
	
	mov cx, 153
	mov dx, 134
	int 10h
	
	mov cx, 161
	mov dx, 134
	int 10h
	
	mov cx, 170
	mov dx, 134
	int 10h
	
	mov cx, 171
	mov dx, 134
	int 10h
	
	mov cx, 187
	mov dx, 134
	int 10h
	
	mov cx, 194
	mov dx, 134
	int 10h
	
	mov cx, 210
	mov dx, 134
	int 10h
	
	mov cx, 217
	mov dx, 134
	int 10h
	
	mov cx, 222
	mov dx, 134
	int 10h
	
	mov cx, 228
	mov dx, 134
	int 10h
	
	mov cx, 237
	mov dx, 134
	int 10h
	
	mov cx, 253
	mov dx, 134
	int 10h
	
	mov cx, 258
	mov dx, 134
	int 10h
	
	mov cx, 265
	mov dx, 134
	int 10h
	
	mov cx, 273
	mov dx, 134
	int 10h
	
	mov cx, 281
	mov dx, 134
	int 10h
	
	mov cx, 289
	mov dx, 134
	int 10h
	
	mov cx, 294
	mov dx, 134
	int 10h
	
	mov cx, 305
	mov dx, 134
	int 10h
	
	mov cx, 309
	mov dx, 134
	int 10h
	
	mov cx, 313
	mov dx, 134
	int 10h
	
	mov cx, 314
	mov dx, 134
	int 10h
	
	mov cx, 318
	mov dx, 134
	int 10h
	
	mov cx, 321
	mov dx, 134
	int 10h
	
	mov cx, 322
	mov dx, 134
	int 10h
	
	mov cx, 326
	mov dx, 134
	int 10h
	
	mov cx, 329
	mov dx, 134
	int 10h
	
	mov cx, 337
	mov dx, 134
	int 10h
	
	mov cx, 341
	mov dx, 134
	int 10h
	
	mov cx, 345
	mov dx, 134
	int 10h
	
	mov cx, 357
	mov dx, 134
	int 10h
	
	mov cx, 369
	mov dx, 134
	int 10h
	
	mov cx, 373
	mov dx, 134
	int 10h
	
	mov cx, 377
	mov dx, 134
	int 10h
	
	mov cx, 381
	mov dx, 134
	int 10h
	
	mov cx, 382
	mov dx, 134
	int 10h
	
	mov cx, 385
	mov dx, 134
	int 10h
	
	mov cx, 389
	mov dx, 134
	int 10h
	
	mov cx, 396
	mov dx, 134
	int 10h
	
	mov cx, 401
	mov dx, 134
	int 10h
	
	mov cx, 406
	mov dx, 134
	int 10h
	
	mov cx, 410
	mov dx, 134
	int 10h
	
	mov cx, 411
	mov dx, 134
	int 10h
	
	mov cx, 426
	mov dx, 134
	int 10h
	
	mov cx, 433
	mov dx, 134
	int 10h
	
	mov cx, 438
	mov dx, 134
	int 10h
	
	mov cx, 444
	mov dx, 134
	int 10h
	
	mov cx, 452
	mov dx, 134
	int 10h
	
	mov cx, 457
	mov dx, 134
	int 10h
	
	mov cx, 462
	mov dx, 134
	int 10h
	
	mov cx, 466
	mov dx, 134
	int 10h
	
	mov cx, 469
	mov dx, 134
	int 10h
	
	mov cx, 1
	mov dx, 135
	int 10h
	
	mov cx, 10
	mov dx, 135
	int 10h
	
	mov cx, 11
	mov dx, 135
	int 10h
	
	mov cx, 12
	mov dx, 135
	int 10h
	
	mov cx, 13
	mov dx, 135
	int 10h
	
	mov cx, 14
	mov dx, 135
	int 10h
	
	mov cx, 17
	mov dx, 135
	int 10h
	
	mov cx, 18
	mov dx, 135
	int 10h
	
	mov cx, 19
	mov dx, 135
	int 10h
	
	mov cx, 20
	mov dx, 135
	int 10h
	
	mov cx, 27
	mov dx, 135
	int 10h
	
	mov cx, 28
	mov dx, 135
	int 10h
	
	mov cx, 29
	mov dx, 135
	int 10h
	
	mov cx, 34
	mov dx, 135
	int 10h
	
	mov cx, 35
	mov dx, 135
	int 10h
	
	mov cx, 36
	mov dx, 135
	int 10h
	
	mov cx, 37
	mov dx, 135
	int 10h
	
	mov cx, 38
	mov dx, 135
	int 10h
	
	mov cx, 41
	mov dx, 135
	int 10h
	
	mov cx, 51
	mov dx, 135
	int 10h
	
	mov cx, 52
	mov dx, 135
	int 10h
	
	mov cx, 53
	mov dx, 135
	int 10h
	
	mov cx, 67
	mov dx, 135
	int 10h
	
	mov cx, 68
	mov dx, 135
	int 10h
	
	mov cx, 74
	mov dx, 135
	int 10h
	
	mov cx, 75
	mov dx, 135
	int 10h
	
	mov cx, 76
	mov dx, 135
	int 10h
	
	mov cx, 77
	mov dx, 135
	int 10h
	
	mov cx, 82
	mov dx, 135
	int 10h
	
	mov cx, 83
	mov dx, 135
	int 10h
	
	mov cx, 84
	mov dx, 135
	int 10h
	
	mov cx, 86
	mov dx, 135
	int 10h
	
	mov cx, 89
	mov dx, 135
	int 10h
	
	mov cx, 107
	mov dx, 135
	int 10h
	
	mov cx, 108
	mov dx, 135
	int 10h
	
	mov cx, 109
	mov dx, 135
	int 10h
	
	mov cx, 110
	mov dx, 135
	int 10h
	
	mov cx, 114
	mov dx, 135
	int 10h
	
	mov cx, 115
	mov dx, 135
	int 10h
	
	mov cx, 116
	mov dx, 135
	int 10h
	
	mov cx, 117
	mov dx, 135
	int 10h
	
	mov cx, 120
	mov dx, 135
	int 10h
	
	mov cx, 123
	mov dx, 135
	int 10h
	
	mov cx, 126
	mov dx, 135
	int 10h
	
	mov cx, 129
	mov dx, 135
	int 10h
	
	mov cx, 131
	mov dx, 135
	int 10h
	
	mov cx, 132
	mov dx, 135
	int 10h
	
	mov cx, 133
	mov dx, 135
	int 10h
	
	mov cx, 138
	mov dx, 135
	int 10h
	
	mov cx, 139
	mov dx, 135
	int 10h
	
	mov cx, 140
	mov dx, 135
	int 10h
	
	mov cx, 142
	mov dx, 135
	int 10h
	
	mov cx, 147
	mov dx, 135
	int 10h
	
	mov cx, 148
	mov dx, 135
	int 10h
	
	mov cx, 149
	mov dx, 135
	int 10h
	
	mov cx, 154
	mov dx, 135
	int 10h
	
	mov cx, 155
	mov dx, 135
	int 10h
	
	mov cx, 156
	mov dx, 135
	int 10h
	
	mov cx, 157
	mov dx, 135
	int 10h
	
	mov cx, 158
	mov dx, 135
	int 10h
	
	mov cx, 161
	mov dx, 135
	int 10h
	
	mov cx, 170
	mov dx, 135
	int 10h
	
	mov cx, 171
	mov dx, 135
	int 10h
	
	mov cx, 185
	mov dx, 135
	int 10h
	
	mov cx, 186
	mov dx, 135
	int 10h
	
	mov cx, 187
	mov dx, 135
	int 10h
	
	mov cx, 188
	mov dx, 135
	int 10h
	
	mov cx, 189
	mov dx, 135
	int 10h
	
	mov cx, 194
	mov dx, 135
	int 10h
	
	mov cx, 211
	mov dx, 135
	int 10h
	
	mov cx, 212
	mov dx, 135
	int 10h
	
	mov cx, 213
	mov dx, 135
	int 10h
	
	mov cx, 217
	mov dx, 135
	int 10h
	
	mov cx, 222
	mov dx, 135
	int 10h
	
	mov cx, 228
	mov dx, 135
	int 10h
	
	mov cx, 233
	mov dx, 135
	int 10h
	
	mov cx, 234
	mov dx, 135
	int 10h
	
	mov cx, 235
	mov dx, 135
	int 10h
	
	mov cx, 236
	mov dx, 135
	int 10h
	
	mov cx, 249
	mov dx, 135
	int 10h
	
	mov cx, 250
	mov dx, 135
	int 10h
	
	mov cx, 251
	mov dx, 135
	int 10h
	
	mov cx, 252
	mov dx, 135
	int 10h
	
	mov cx, 259
	mov dx, 135
	int 10h
	
	mov cx, 260
	mov dx, 135
	int 10h
	
	mov cx, 261
	mov dx, 135
	int 10h
	
	mov cx, 262
	mov dx, 135
	int 10h
	
	mov cx, 265
	mov dx, 135
	int 10h
	
	mov cx, 274
	mov dx, 135
	int 10h
	
	mov cx, 275
	mov dx, 135
	int 10h
	
	mov cx, 276
	mov dx, 135
	int 10h
	
	mov cx, 277
	mov dx, 135
	int 10h
	
	mov cx, 278
	mov dx, 135
	int 10h
	
	mov cx, 282
	mov dx, 135
	int 10h
	
	mov cx, 283
	mov dx, 135
	int 10h
	
	mov cx, 284
	mov dx, 135
	int 10h
	
	mov cx, 285
	mov dx, 135
	int 10h
	
	mov cx, 286
	mov dx, 135
	int 10h
	
	mov cx, 289
	mov dx, 135
	int 10h
	
	mov cx, 294
	mov dx, 135
	int 10h
	
	mov cx, 306
	mov dx, 135
	int 10h
	
	mov cx, 307
	mov dx, 135
	int 10h
	
	mov cx, 308
	mov dx, 135
	int 10h
	
	mov cx, 309
	mov dx, 135
	int 10h
	
	mov cx, 310
	mov dx, 135
	int 10h
	
	mov cx, 313
	mov dx, 135
	int 10h
	
	mov cx, 315
	mov dx, 135
	int 10h
	
	mov cx, 316
	mov dx, 135
	int 10h
	
	mov cx, 317
	mov dx, 135
	int 10h
	
	mov cx, 321
	mov dx, 135
	int 10h
	
	mov cx, 323
	mov dx, 135
	int 10h
	
	mov cx, 324
	mov dx, 135
	int 10h
	
	mov cx, 325
	mov dx, 135
	int 10h
	
	mov cx, 330
	mov dx, 135
	int 10h
	
	mov cx, 331
	mov dx, 135
	int 10h
	
	mov cx, 332
	mov dx, 135
	int 10h
	
	mov cx, 333
	mov dx, 135
	int 10h
	
	mov cx, 334
	mov dx, 135
	int 10h
	
	mov cx, 338
	mov dx, 135
	int 10h
	
	mov cx, 339
	mov dx, 135
	int 10h
	
	mov cx, 340
	mov dx, 135
	int 10h
	
	mov cx, 341
	mov dx, 135
	int 10h
	
	mov cx, 342
	mov dx, 135
	int 10h
	
	mov cx, 345
	mov dx, 135
	int 10h
	
	mov cx, 353
	mov dx, 135
	int 10h
	
	mov cx, 354
	mov dx, 135
	int 10h
	
	mov cx, 355
	mov dx, 135
	int 10h
	
	mov cx, 356
	mov dx, 135
	int 10h
	
	mov cx, 370
	mov dx, 135
	int 10h
	
	mov cx, 371
	mov dx, 135
	int 10h
	
	mov cx, 372
	mov dx, 135
	int 10h
	
	mov cx, 373
	mov dx, 135
	int 10h
	
	mov cx, 374
	mov dx, 135
	int 10h
	
	mov cx, 378
	mov dx, 135
	int 10h
	
	mov cx, 379
	mov dx, 135
	int 10h
	
	mov cx, 380
	mov dx, 135
	int 10h
	
	mov cx, 382
	mov dx, 135
	int 10h
	
	mov cx, 386
	mov dx, 135
	int 10h
	
	mov cx, 387
	mov dx, 135
	int 10h
	
	mov cx, 388
	mov dx, 135
	int 10h
	
	mov cx, 389
	mov dx, 135
	int 10h
	
	mov cx, 390
	mov dx, 135
	int 10h
	
	mov cx, 396
	mov dx, 135
	int 10h
	
	mov cx, 401
	mov dx, 135
	int 10h
	
	mov cx, 406
	mov dx, 135
	int 10h
	
	mov cx, 410
	mov dx, 135
	int 10h
	
	mov cx, 411
	mov dx, 135
	int 10h
	
	mov cx, 426
	mov dx, 135
	int 10h
	
	mov cx, 434
	mov dx, 135
	int 10h
	
	mov cx, 435
	mov dx, 135
	int 10h
	
	mov cx, 436
	mov dx, 135
	int 10h
	
	mov cx, 437
	mov dx, 135
	int 10h
	
	mov cx, 444
	mov dx, 135
	int 10h
	
	mov cx, 452
	mov dx, 135
	int 10h
	
	mov cx, 458
	mov dx, 135
	int 10h
	
	mov cx, 459
	mov dx, 135
	int 10h
	
	mov cx, 460
	mov dx, 135
	int 10h
	
	mov cx, 461
	mov dx, 135
	int 10h
	
	mov cx, 466
	mov dx, 135
	int 10h
	
	mov cx, 469
	mov dx, 135
	int 10h
	
	mov cx, 67
	mov dx, 136
	int 10h
	
	mov cx, 129
	mov dx, 136
	int 10h
	
	mov cx, 313
	mov dx, 136
	int 10h
	
	mov cx, 321
	mov dx, 136
	int 10h
	
	mov cx, 382
	mov dx, 136
	int 10h
	
	mov cx, 411
	mov dx, 136
	int 10h
	
	mov cx, 66
	mov dx, 137
	int 10h
	
	mov cx, 67
	mov dx, 137
	int 10h
	
	mov cx, 129
	mov dx, 137
	int 10h
	
	mov cx, 313
	mov dx, 137
	int 10h
	
	mov cx, 321
	mov dx, 137
	int 10h
	
	mov cx, 382
	mov dx, 137
	int 10h
	
	mov cx, 410
	mov dx, 137
	int 10h
	
	mov cx, 64
	mov dx, 138
	int 10h
	
	mov cx, 65
	mov dx, 138
	int 10h
	
	mov cx, 66
	mov dx, 138
	int 10h
	
	mov cx, 129
	mov dx, 138
	int 10h
	
	mov cx, 313
	mov dx, 138
	int 10h
	
	mov cx, 321
	mov dx, 138
	int 10h
	
	mov cx, 378
	mov dx, 138
	int 10h
	
	mov cx, 379
	mov dx, 138
	int 10h
	
	mov cx, 380
	mov dx, 138
	int 10h
	
	mov cx, 381
	mov dx, 138
	int 10h
	
	mov cx, 9
	mov dx, 140
	int 10h
	
	mov cx, 9
	mov dx, 141
	int 10h
	
	mov cx, 2
	mov dx, 142
	int 10h
	
	mov cx, 9
	mov dx, 142
	int 10h
	
	mov cx, 58
	mov dx, 142
	int 10h
	
	mov cx, 0
	mov dx, 143
	int 10h
	
	mov cx, 1
	mov dx, 143
	int 10h
	
	mov cx, 2
	mov dx, 143
	int 10h
	
	mov cx, 3
	mov dx, 143
	int 10h
	
	mov cx, 4
	mov dx, 143
	int 10h
	
	mov cx, 5
	mov dx, 143
	int 10h
	
	mov cx, 9
	mov dx, 143
	int 10h
	
	mov cx, 11
	mov dx, 143
	int 10h
	
	mov cx, 12
	mov dx, 143
	int 10h
	
	mov cx, 13
	mov dx, 143
	int 10h
	
	mov cx, 18
	mov dx, 143
	int 10h
	
	mov cx, 19
	mov dx, 143
	int 10h
	
	mov cx, 20
	mov dx, 143
	int 10h
	
	mov cx, 21
	mov dx, 143
	int 10h
	
	mov cx, 26
	mov dx, 143
	int 10h
	
	mov cx, 27
	mov dx, 143
	int 10h
	
	mov cx, 28
	mov dx, 143
	int 10h
	
	mov cx, 29
	mov dx, 143
	int 10h
	
	mov cx, 34
	mov dx, 143
	int 10h
	
	mov cx, 35
	mov dx, 143
	int 10h
	
	mov cx, 36
	mov dx, 143
	int 10h
	
	mov cx, 37
	mov dx, 143
	int 10h
	
	mov cx, 50
	mov dx, 143
	int 10h
	
	mov cx, 51
	mov dx, 143
	int 10h
	
	mov cx, 52
	mov dx, 143
	int 10h
	
	mov cx, 53
	mov dx, 143
	int 10h
	
	mov cx, 56
	mov dx, 143
	int 10h
	
	mov cx, 57
	mov dx, 143
	int 10h
	
	mov cx, 58
	mov dx, 143
	int 10h
	
	mov cx, 59
	mov dx, 143
	int 10h
	
	mov cx, 60
	mov dx, 143
	int 10h
	
	mov cx, 61
	mov dx, 143
	int 10h
	
	mov cx, 66
	mov dx, 143
	int 10h
	
	mov cx, 67
	mov dx, 143
	int 10h
	
	mov cx, 68
	mov dx, 143
	int 10h
	
	mov cx, 69
	mov dx, 143
	int 10h
	
	mov cx, 73
	mov dx, 143
	int 10h
	
	mov cx, 75
	mov dx, 143
	int 10h
	
	mov cx, 76
	mov dx, 143
	int 10h
	
	mov cx, 77
	mov dx, 143
	int 10h
	
	mov cx, 82
	mov dx, 143
	int 10h
	
	mov cx, 83
	mov dx, 143
	int 10h
	
	mov cx, 84
	mov dx, 143
	int 10h
	
	mov cx, 85
	mov dx, 143
	int 10h
	
	mov cx, 91
	mov dx, 143
	int 10h
	
	mov cx, 92
	mov dx, 143
	int 10h
	
	mov cx, 2
	mov dx, 144
	int 10h
	
	mov cx, 9
	mov dx, 144
	int 10h
	
	mov cx, 10
	mov dx, 144
	int 10h
	
	mov cx, 14
	mov dx, 144
	int 10h
	
	mov cx, 18
	mov dx, 144
	int 10h
	
	mov cx, 22
	mov dx, 144
	int 10h
	
	mov cx, 25
	mov dx, 144
	int 10h
	
	mov cx, 34
	mov dx, 144
	int 10h
	
	mov cx, 38
	mov dx, 144
	int 10h
	
	mov cx, 49
	mov dx, 144
	int 10h
	
	mov cx, 58
	mov dx, 144
	int 10h
	
	mov cx, 66
	mov dx, 144
	int 10h
	
	mov cx, 70
	mov dx, 144
	int 10h
	
	mov cx, 73
	mov dx, 144
	int 10h
	
	mov cx, 74
	mov dx, 144
	int 10h
	
	mov cx, 78
	mov dx, 144
	int 10h
	
	mov cx, 81
	mov dx, 144
	int 10h
	
	mov cx, 91
	mov dx, 144
	int 10h
	
	mov cx, 92
	mov dx, 144
	int 10h
	
	mov cx, 2
	mov dx, 145
	int 10h
	
	mov cx, 9
	mov dx, 145
	int 10h
	
	mov cx, 14
	mov dx, 145
	int 10h
	
	mov cx, 17
	mov dx, 145
	int 10h
	
	mov cx, 22
	mov dx, 145
	int 10h
	
	mov cx, 25
	mov dx, 145
	int 10h
	
	mov cx, 26
	mov dx, 145
	int 10h
	
	mov cx, 33
	mov dx, 145
	int 10h

	mov cx, 38
	mov dx, 145
	int 10h
	
	mov cx, 49
	mov dx, 145
	int 10h
	
	mov cx, 50
	mov dx, 145
	int 10h
	
	mov cx, 58
	mov dx, 145
	int 10h
	
	mov cx, 65
	mov dx, 145
	int 10h
	
	mov cx, 70
	mov dx, 145
	int 10h
	
	mov cx, 73
	mov dx, 145
	int 10h
	
	mov cx, 78
	mov dx, 145
	int 10h
	
	mov cx, 81
	mov dx, 145
	int 10h
	
	mov cx, 82
	mov dx, 145
	int 10h
	
	mov cx, 2
	mov dx, 146
	int 10h
	
	mov cx, 9
	mov dx, 146
	int 10h
	
	mov cx, 14
	mov dx, 146
	int 10h
	
	mov cx, 17
	mov dx, 146
	int 10h
	
	mov cx, 18
	mov dx, 146
	int 10h
	
	mov cx, 19
	mov dx, 146
	int 10h
	
	mov cx, 20
	mov dx, 146
	int 10h
	
	mov cx, 21
	mov dx, 146
	int 10h
	
	mov cx, 22
	mov dx, 146
	int 10h
	
	mov cx, 27
	mov dx, 146
	int 10h
	
	mov cx, 28
	mov dx, 146
	int 10h
	
	mov cx, 33
	mov dx, 146
	int 10h
	
	mov cx, 34
	mov dx, 146
	int 10h
	
	mov cx, 35
	mov dx, 146
	int 10h
	
	mov cx, 36
	mov dx, 146
	int 10h
	
	mov cx, 37
	mov dx, 146
	int 10h
	
	mov cx, 38
	mov dx, 146
	int 10h
	
	mov cx, 51
	mov dx, 146
	int 10h
	
	mov cx, 52
	mov dx, 146
	int 10h
	
	mov cx, 58
	mov dx, 146
	int 10h
	
	mov cx, 65
	mov dx, 146
	int 10h
	
	mov cx, 66
	mov dx, 146
	int 10h
	
	mov cx, 67
	mov dx, 146
	int 10h
	
	mov cx, 68
	mov dx, 146
	int 10h
	
	mov cx, 69
	mov dx, 146
	int 10h
	
	mov cx, 70
	mov dx, 146
	int 10h
	
	mov cx, 73
	mov dx, 146
	int 10h
	
	mov cx, 78
	mov dx, 146
	int 10h
	
	mov cx, 83
	mov dx, 146
	int 10h
	
	mov cx, 84
	mov dx, 146
	int 10h
	
	mov cx, 2
	mov dx, 147
	int 10h
	
	mov cx, 9
	mov dx, 147
	int 10h
	
	mov cx, 14
	mov dx, 147
	int 10h
	
	mov cx, 17
	mov dx, 147
	int 10h
	
	mov cx, 29
	mov dx, 147
	int 10h
	
	mov cx, 33
	mov dx, 147
	int 10h
	
	mov cx, 53
	mov dx, 147
	int 10h
	
	mov cx, 58
	mov dx, 147
	int 10h
	
	mov cx, 65
	mov dx, 147
	int 10h
	
	mov cx, 73
	mov dx, 147
	int 10h
	
	mov cx, 78
	mov dx, 147
	int 10h
	
	mov cx, 85
	mov dx, 147
	int 10h
	
	mov cx, 2
	mov dx, 148
	int 10h
	
	mov cx, 9
	mov dx, 148
	int 10h
	
	mov cx, 14
	mov dx, 148
	int 10h
	
	mov cx, 17
	mov dx, 148
	int 10h
	
	mov cx, 29
	mov dx, 148
	int 10h
	
	mov cx, 33
	mov dx, 148
	int 10h
	
	mov cx, 53
	mov dx, 148
	int 10h
	
	mov cx, 58
	mov dx, 148
	int 10h
	
	mov cx, 65
	mov dx, 148
	int 10h
	
	mov cx, 73
	mov dx, 148
	int 10h
	
	mov cx, 74
	mov dx, 148
	int 10h
	
	mov cx, 78
	mov dx, 148
	int 10h
	
	mov cx, 85
	mov dx, 148
	int 10h
	
	mov cx, 91
	mov dx, 148
	int 10h
	
	mov cx, 92
	mov dx, 148
	int 10h
	
	mov cx, 3
	mov dx, 149
	int 10h
	
	mov cx, 4
	mov dx, 149
	int 10h
	
	mov cx, 5
	mov dx, 149
	int 10h
	
	mov cx, 9
	mov dx, 149
	int 10h
	
	mov cx, 14
	mov dx, 149
	int 10h
	
	mov cx, 18
	mov dx, 149
	int 10h
	
	mov cx, 19
	mov dx, 149
	int 10h
	
	mov cx, 20
	mov dx, 149
	int 10h
	
	mov cx, 21
	mov dx, 149
	int 10h
	
	mov cx, 22
	mov dx, 149
	int 10h
	
	mov cx, 25
	mov dx, 149
	int 10h
	
	mov cx, 26
	mov dx, 149
	int 10h
	
	mov cx, 27
	mov dx, 149
	int 10h
	
	mov cx, 28
	mov dx, 149
	int 10h
	
	mov cx, 34
	mov dx, 149
	int 10h
	
	mov cx, 35
	mov dx, 149
	int 10h
	
	mov cx, 36
	mov dx, 149
	int 10h
	
	mov cx, 37
	mov dx, 149
	int 10h
	
	mov cx, 38
	mov dx, 149
	int 10h
	
	mov cx, 49
	mov dx, 149
	int 10h
	
	mov cx, 50
	mov dx, 149
	int 10h
	
	mov cx, 51
	mov dx, 149
	int 10h
	
	mov cx, 52
	mov dx, 149
	int 10h
	
	mov cx, 59
	mov dx, 149
	int 10h
	
	mov cx, 60
	mov dx, 149
	int 10h
	
	mov cx, 61
	mov dx, 149
	int 10h
	
	mov cx, 66
	mov dx, 149
	int 10h
	
	mov cx, 67
	mov dx, 149
	int 10h
	
	mov cx, 68
	mov dx, 149
	int 10h
	
	mov cx, 69
	mov dx, 149
	int 10h
	
	mov cx, 70
	mov dx, 149
	int 10h
	
	mov cx, 73
	mov dx, 149
	int 10h
	
	mov cx, 75
	mov dx, 149
	int 10h
	
	mov cx, 76
	mov dx, 149
	int 10h
	
	mov cx, 77
	mov dx, 149
	int 10h
	
	mov cx, 81
	mov dx, 149
	int 10h
	
	mov cx, 82
	mov dx, 149
	int 10h
	
	mov cx, 83
	mov dx, 149
	int 10h
	
	mov cx, 84
	mov dx, 149
	int 10h
	
	mov cx, 91
	mov dx, 149
	int 10h
	
	mov cx, 92
	mov dx, 149
	int 10h
	
	mov cx, 73
	mov dx, 150
	int 10h
	
	mov cx, 73
	mov dx, 151
	int 10h
	
	mov cx, 73
	mov dx, 152
	int 10h
	
	mov cx, 9
	mov dx, 168
	int 10h
	
	mov cx, 33
	mov dx, 168
	int 10h
	
	mov cx, 89
	mov dx, 168
	int 10h
	
	mov cx, 217
	mov dx, 168
	int 10h
	
	mov cx, 246
	mov dx, 168
	int 10h
	
	mov cx, 331
	mov dx, 168
	int 10h
	
	mov cx, 332
	mov dx, 168
	int 10h
	
	mov cx, 333
	mov dx, 168
	int 10h
	
	mov cx, 334
	mov dx, 168
	int 10h
	
	mov cx, 387
	mov dx, 168
	int 10h
	
	mov cx, 388
	mov dx, 168
	int 10h
	
	mov cx, 457
	mov dx, 168
	int 10h
	
	mov cx, 458
	mov dx, 168
	int 10h
	
	mov cx, 459
	mov dx, 168
	int 10h
	
	mov cx, 460
	mov dx, 168
	int 10h
	
	mov cx, 483
	mov dx, 168
	int 10h
	
	mov cx, 484
	mov dx, 168
	int 10h
	
	mov cx, 521
	mov dx, 168
	int 10h
	
	mov cx, 522
	mov dx, 168
	int 10h
	
	mov cx, 523
	mov dx, 168
	int 10h
	
	mov cx, 524
	mov dx, 168
	int 10h
	
	mov cx, 529
	mov dx, 168
	int 10h
	
	mov cx, 530
	mov dx, 168
	int 10h
	
	mov cx, 531
	mov dx, 168
	int 10h
	
	mov cx, 532
	mov dx, 168
	int 10h
	
	mov cx, 550
	mov dx, 168
	int 10h
	
	mov cx, 9
	mov dx, 169
	int 10h
	
	mov cx, 33
	mov dx, 169
	int 10h
	
	mov cx, 89
	mov dx, 169
	int 10h
	
	mov cx, 217
	mov dx, 169
	int 10h
	
	mov cx, 246
	mov dx, 169
	int 10h
	
	mov cx, 330
	mov dx, 169
	int 10h
	
	mov cx, 387
	mov dx, 169
	int 10h
	
	mov cx, 388
	mov dx, 169
	int 10h
	
	mov cx, 460
	mov dx, 169
	int 10h
	
	mov cx, 483
	mov dx, 169
	int 10h
	
	mov cx, 484
	mov dx, 169
	int 10h
	
	mov cx, 524
	mov dx, 169
	int 10h
	
	mov cx, 532
	mov dx, 169
	int 10h
	
	mov cx, 550
	mov dx, 169
	int 10h
	
	mov cx, 2
	mov dx, 170
	int 10h
	
	mov cx, 3
	mov dx, 170
	int 10h
	
	mov cx, 4
	mov dx, 170
	int 10h
	
	mov cx, 5
	mov dx, 170
	int 10h
	
	mov cx, 6
	mov dx, 170
	int 10h
	
	mov cx, 9
	mov dx, 170
	int 10h
	
	mov cx, 33
	mov dx, 170
	int 10h
	
	mov cx, 50
	mov dx, 170
	int 10h
	
	mov cx, 89
	mov dx, 170
	int 10h
	
	mov cx, 217
	mov dx, 170
	int 10h
	
	mov cx, 246
	mov dx, 170
	int 10h
	
	mov cx, 330
	mov dx, 170
	int 10h
	
	mov cx, 338
	mov dx, 170
	int 10h
	
	mov cx, 460
	mov dx, 170
	int 10h
	
	mov cx, 506
	mov dx, 170
	int 10h
	
	mov cx, 524
	mov dx, 170
	int 10h
	
	mov cx, 532
	mov dx, 170
	int 10h
	
	mov cx, 550
	mov dx, 170
	int 10h
	
	mov cx, 1
	mov dx, 171
	int 10h
	
	mov cx, 9
	mov dx, 171
	int 10h
	
	mov cx, 11
	mov dx, 171
	int 10h
	
	mov cx, 12
	mov dx, 171
	int 10h
	
	mov cx, 13
	mov dx, 171
	int 10h
	
	mov cx, 18
	mov dx, 171
	int 10h
	
	mov cx, 19
	mov dx, 171
	int 10h
	
	mov cx, 20
	mov dx, 171
	int 10h
	
	mov cx, 21
	mov dx, 171
	int 10h
	
	mov cx, 27
	mov dx, 171
	int 10h
	
	mov cx, 28
	mov dx, 171
	int 10h
	
	mov cx, 29
	mov dx, 171
	int 10h
	
	mov cx, 30
	mov dx, 171
	int 10h
	
	mov cx, 33
	mov dx, 171
	int 10h
	
	mov cx, 37
	mov dx, 171
	int 10h
	
	mov cx, 48
	mov dx, 171
	int 10h
	
	mov cx, 49
	mov dx, 171
	int 10h
	
	mov cx, 50
	mov dx, 171
	int 10h
	
	mov cx, 51
	mov dx, 171
	int 10h
	
	mov cx, 52
	mov dx, 171
	int 10h
	
	mov cx, 53
	mov dx, 171
	int 10h
	
	mov cx, 58
	mov dx, 171
	int 10h
	
	mov cx, 59
	mov dx, 171
	int 10h
	
	mov cx, 60
	mov dx, 171
	int 10h
	
	mov cx, 61
	mov dx, 171
	int 10h
	
	mov cx, 72
	mov dx, 171
	int 10h
	
	mov cx, 74
	mov dx, 171
	int 10h
	
	mov cx, 75
	mov dx, 171
	int 10h
	
	mov cx, 77
	mov dx, 171
	int 10h
	
	mov cx, 78
	mov dx, 171
	int 10h
	
	mov cx, 82
	mov dx, 171
	int 10h
	
	mov cx, 83
	mov dx, 171
	int 10h
	
	mov cx, 84
	mov dx, 171
	int 10h
	
	mov cx, 89
	mov dx, 171
	int 10h
	
	mov cx, 93
	mov dx, 171
	int 10h
	
	mov cx, 98
	mov dx, 171
	int 10h
	
	mov cx, 99
	mov dx, 171
	int 10h
	
	mov cx, 100
	mov dx, 171
	int 10h
	
	mov cx, 101
	mov dx, 171
	int 10h
	
	mov cx, 114
	mov dx, 171
	int 10h
	
	mov cx, 115
	mov dx, 171
	int 10h
	
	mov cx, 116
	mov dx, 171
	int 10h
	
	mov cx, 117
	mov dx, 171
	int 10h
	
	mov cx, 121
	mov dx, 171
	int 10h
	
	mov cx, 126
	mov dx, 171
	int 10h
	
	mov cx, 129
	mov dx, 171
	int 10h
	
	mov cx, 131
	mov dx, 171
	int 10h
	
	mov cx, 132
	mov dx, 171
	int 10h
	
	mov cx, 133
	mov dx, 171
	int 10h
	
	mov cx, 138
	mov dx, 171
	int 10h
	
	mov cx, 139
	mov dx, 171
	int 10h
	
	mov cx, 140
	mov dx, 171
	int 10h
	
	mov cx, 141
	mov dx, 171
	int 10h
	
	mov cx, 154
	mov dx, 171
	int 10h
	
	mov cx, 155
	mov dx, 171
	int 10h
	
	mov cx, 156
	mov dx, 171
	int 10h
	
	mov cx, 161
	mov dx, 171
	int 10h
	
	mov cx, 163
	mov dx, 171
	int 10h
	
	mov cx, 164
	mov dx, 171
	int 10h
	
	mov cx, 165
	mov dx, 171
	int 10h
	
	mov cx, 168
	mov dx, 171
	int 10h
	
	mov cx, 175
	mov dx, 171
	int 10h
	
	mov cx, 185
	mov dx, 171
	int 10h
	
	mov cx, 187
	mov dx, 171
	int 10h
	
	mov cx, 188
	mov dx, 171
	int 10h
	
	mov cx, 189
	mov dx, 171
	int 10h
	
	mov cx, 194
	mov dx, 171
	int 10h
	
	mov cx, 195
	mov dx, 171
	int 10h
	
	mov cx, 196
	mov dx, 171
	int 10h
	
	mov cx, 197
	mov dx, 171
	int 10h
	
	mov cx, 200
	mov dx, 171
	int 10h
	
	mov cx, 207
	mov dx, 171
	int 10h
	
	mov cx, 217
	mov dx, 171
	int 10h
	
	mov cx, 219
	mov dx, 171
	int 10h
	
	mov cx, 220
	mov dx, 171
	int 10h
	
	mov cx, 221
	mov dx, 171
	int 10h
	
	mov cx, 226
	mov dx, 171
	int 10h
	
	mov cx, 227
	mov dx, 171
	int 10h
	
	mov cx, 228
	mov dx, 171
	int 10h
	
	mov cx, 233
	mov dx, 171
	int 10h
	
	mov cx, 235
	mov dx, 171
	int 10h
	
	mov cx, 236
	mov dx, 171
	int 10h
	
	mov cx, 237
	mov dx, 171
	int 10h
	
	mov cx, 242
	mov dx, 171
	int 10h
	
	mov cx, 243
	mov dx, 171
	int 10h
	
	mov cx, 244
	mov dx, 171
	int 10h
	
	mov cx, 246
	mov dx, 171
	int 10h
	
	mov cx, 248
	mov dx, 171
	int 10h
	
	mov cx, 255
	mov dx, 171
	int 10h
	
	mov cx, 258
	mov dx, 171
	int 10h
	
	mov cx, 259
	mov dx, 171
	int 10h
	
	mov cx, 260
	mov dx, 171
	int 10h
	
	mov cx, 265
	mov dx, 171
	int 10h
	
	mov cx, 267
	mov dx, 171
	int 10h
	
	mov cx, 268
	mov dx, 171
	int 10h
	
	mov cx, 269
	mov dx, 171
	int 10h
	
	mov cx, 274
	mov dx, 171
	int 10h
	
	mov cx, 275
	mov dx, 171
	int 10h
	
	mov cx, 276
	mov dx, 171
	int 10h
	
	mov cx, 277
	mov dx, 171
	int 10h
	
	mov cx, 290
	mov dx, 171
	int 10h
	
	mov cx, 291
	mov dx, 171
	int 10h
	
	mov cx, 292
	mov dx, 171
	int 10h
	
	mov cx, 293
	mov dx, 171
	int 10h
	
	mov cx, 297
	mov dx, 171
	int 10h
	
	mov cx, 299
	mov dx, 171
	int 10h
	
	mov cx, 300
	mov dx, 171
	int 10h
	
	mov cx, 301
	mov dx, 171
	int 10h
	
	mov cx, 314
	mov dx, 171
	int 10h
	
	mov cx, 315
	mov dx, 171
	int 10h
	
	mov cx, 316
	mov dx, 171
	int 10h
	
	mov cx, 317
	mov dx, 171
	int 10h
	
	mov cx, 322
	mov dx, 171
	int 10h
	
	mov cx, 323
	mov dx, 171
	int 10h
	
	mov cx, 324
	mov dx, 171
	int 10h
	
	mov cx, 325
	mov dx, 171
	int 10h
	
	mov cx, 328
	mov dx, 171
	int 10h
	
	mov cx, 329
	mov dx, 171
	int 10h
	
	mov cx, 330
	mov dx, 171
	int 10h
	
	mov cx, 331
	mov dx, 171
	int 10h
	
	mov cx, 332
	mov dx, 171
	int 10h
	
	mov cx, 333
	mov dx, 171
	int 10h
	
	mov cx, 334
	mov dx, 171
	int 10h
	
	mov cx, 336
	mov dx, 171
	int 10h
	
	mov cx, 337
	mov dx, 171
	int 10h
	
	mov cx, 338
	mov dx, 171
	int 10h
	
	mov cx, 339
	mov dx, 171
	int 10h
	
	mov cx, 340
	mov dx, 171
	int 10h
	
	mov cx, 341
	mov dx, 171
	int 10h
	
	mov cx, 344
	mov dx, 171
	int 10h
	
	mov cx, 351
	mov dx, 171
	int 10h
	
	mov cx, 354
	mov dx, 171
	int 10h
	
	mov cx, 355
	mov dx, 171
	int 10h
	
	mov cx, 356
	mov dx, 171
	int 10h
	
	mov cx, 361
	mov dx, 171
	int 10h
	
	mov cx, 363
	mov dx, 171
	int 10h
	
	mov cx, 364
	mov dx, 171
	int 10h
	
	mov cx, 365
	mov dx, 171
	int 10h
	
	mov cx, 370
	mov dx, 171
	int 10h
	
	mov cx, 371
	mov dx, 171
	int 10h
	
	mov cx, 372
	mov dx, 171
	int 10h
	
	mov cx, 373
	mov dx, 171
	int 10h
	
	mov cx, 385
	mov dx, 171
	int 10h
	
	mov cx, 386
	mov dx, 171
	int 10h
	
	mov cx, 387
	mov dx, 171
	int 10h
	
	mov cx, 388
	mov dx, 171
	int 10h
	
	mov cx, 394
	mov dx, 171
	int 10h
	
	mov cx, 395
	mov dx, 171
	int 10h
	
	mov cx, 396
	mov dx, 171
	int 10h
	
	mov cx, 397
	mov dx, 171
	int 10h
	
	mov cx, 409
	mov dx, 171
	int 10h
	
	mov cx, 411
	mov dx, 171
	int 10h
	
	mov cx, 412
	mov dx, 171
	int 10h
	
	mov cx, 413
	mov dx, 171
	int 10h
	
	mov cx, 417
	mov dx, 171
	int 10h
	
	mov cx, 419
	mov dx, 171
	int 10h
	
	mov cx, 420
	mov dx, 171
	int 10h
	
	mov cx, 421
	mov dx, 171
	int 10h
	
	mov cx, 426
	mov dx, 171
	int 10h
	
	mov cx, 427
	mov dx, 171
	int 10h
	
	mov cx, 428
	mov dx, 171
	int 10h
	
	mov cx, 429
	mov dx, 171
	int 10h
	
	mov cx, 433
	mov dx, 171
	int 10h
	
	mov cx, 435
	mov dx, 171
	int 10h
	
	mov cx, 436
	mov dx, 171
	int 10h
	
	mov cx, 437
	mov dx, 171
	int 10h
	
	mov cx, 442
	mov dx, 171
	int 10h
	
	mov cx, 443
	mov dx, 171
	int 10h
	
	mov cx, 444
	mov dx, 171
	int 10h
	
	mov cx, 445
	mov dx, 171
	int 10h
	
	mov cx, 449
	mov dx, 171
	int 10h
	
	mov cx, 451
	mov dx, 171
	int 10h
	
	mov cx, 452
	mov dx, 171
	int 10h
	
	mov cx, 453
	mov dx, 171
	int 10h
	
	mov cx, 460
	mov dx, 171
	int 10h
	
	mov cx, 464
	mov dx, 171
	int 10h
	
	mov cx, 471
	mov dx, 171
	int 10h
	
	mov cx, 481
	mov dx, 171
	int 10h
	
	mov cx, 482
	mov dx, 171
	int 10h
	
	mov cx, 483
	mov dx, 171
	int 10h
	
	mov cx, 484
	mov dx, 171
	int 10h
	
	mov cx, 489
	mov dx, 171
	int 10h
	
	mov cx, 491
	mov dx, 171
	int 10h
	
	mov cx, 492
	mov dx, 171
	int 10h
	
	mov cx, 493
	mov dx, 171
	int 10h
	
	mov cx, 498
	mov dx, 171
	int 10h
	
	mov cx, 499
	mov dx, 171
	int 10h
	
	mov cx, 500
	mov dx, 171
	int 10h
	
	mov cx, 501
	mov dx, 171
	int 10h
	
	mov cx, 504
	mov dx, 171
	int 10h
	
	mov cx, 505
	mov dx, 171
	int 10h
	
	mov cx, 506
	mov dx, 171
	int 10h
	
	mov cx, 507
	mov dx, 171
	int 10h
	
	mov cx, 508
	mov dx, 171
	int 10h
	
	mov cx, 509
	mov dx, 171
	int 10h
	
	mov cx, 514
	mov dx, 171
	int 10h
	
	mov cx, 515
	mov dx, 171
	int 10h
	
	mov cx, 516
	mov dx, 171
	int 10h
	
	mov cx, 524
	mov dx, 171
	int 10h
	
	mov cx, 532
	mov dx, 171
	int 10h
	
	mov cx, 538
	mov dx, 171
	int 10h
	
	mov cx, 539
	mov dx, 171
	int 10h
	
	mov cx, 540
	mov dx, 171
	int 10h
	
	mov cx, 541
	mov dx, 171
	int 10h
	
	mov cx, 546
	mov dx, 171
	int 10h
	
	mov cx, 547
	mov dx, 171
	int 10h
	
	mov cx, 548
	mov dx, 171
	int 10h
	
	mov cx, 550
	mov dx, 171
	int 10h
	
	mov cx, 0
	mov dx, 172
	int 10h
	
	mov cx, 9
	mov dx, 172
	int 10h
	
	mov cx, 10
	mov dx, 172
	int 10h
	
	mov cx, 14
	mov dx, 172
	int 10h
	
	mov cx, 18
	mov dx, 172
	int 10h
	
	mov cx, 22
	mov dx, 172
	int 10h
	
	mov cx, 26
	mov dx, 172
	int 10h
	
	mov cx, 33
	mov dx, 172
	int 10h
	
	mov cx, 36
	mov dx, 172
	int 10h
	
	mov cx, 50
	mov dx, 172
	int 10h
	
	mov cx, 57
	mov dx, 172
	int 10h
	
	mov cx, 62
	mov dx, 172
	int 10h
	
	mov cx, 72
	mov dx, 172
	int 10h
	
	mov cx, 73
	mov dx, 172
	int 10h
	
	mov cx, 75
	mov dx, 172
	int 10h
	
	mov cx, 76
	mov dx, 172
	int 10h
	
	mov cx, 78
	mov dx, 172
	int 10h
	
	mov cx, 85
	mov dx, 172
	int 10h
	
	mov cx, 89
	mov dx, 172
	int 10h
	
	mov cx, 92
	mov dx, 172
	int 10h
	
	mov cx, 98
	mov dx, 172
	int 10h
	
	mov cx, 102
	mov dx, 172
	int 10h
	
	mov cx, 113
	mov dx, 172
	int 10h
	
	mov cx, 121
	mov dx, 172
	int 10h
	
	mov cx, 126
	mov dx, 172
	int 10h
	
	mov cx, 129
	mov dx, 172
	int 10h
	
	mov cx, 130
	mov dx, 172
	int 10h
	
	mov cx, 133
	mov dx, 172
	int 10h
	
	mov cx, 138
	mov dx, 172
	int 10h
	
	mov cx, 142
	mov dx, 172
	int 10h
	
	mov cx, 157
	mov dx, 172
	int 10h
	
	mov cx, 161
	mov dx, 172
	int 10h
	
	mov cx, 162
	mov dx, 172
	int 10h
	
	mov cx, 166
	mov dx, 172
	int 10h
	
	mov cx, 169
	mov dx, 172
	int 10h
	
	mov cx, 174
	mov dx, 172
	int 10h
	
	mov cx, 185
	mov dx, 172
	int 10h
	
	mov cx, 186
	mov dx, 172
	int 10h
	
	mov cx, 190
	mov dx, 172
	int 10h
	
	mov cx, 194
	mov dx, 172
	int 10h
	
	mov cx, 198
	mov dx, 172
	int 10h
	
	mov cx, 200
	mov dx, 172
	int 10h
	
	mov cx, 203
	mov dx, 172
	int 10h
	
	mov cx, 207
	mov dx, 172
	int 10h
	
	mov cx, 217
	mov dx, 172
	int 10h
	
	mov cx, 218
	mov dx, 172
	int 10h
	
	mov cx, 222
	mov dx, 172
	int 10h
	
	mov cx, 229
	mov dx, 172
	int 10h
	
	mov cx, 233
	mov dx, 172
	int 10h
	
	mov cx, 234
	mov dx, 172
	int 10h
	
	mov cx, 237
	mov dx, 172
	int 10h
	
	mov cx, 241
	mov dx, 172
	int 10h
	
	mov cx, 245
	mov dx, 172
	int 10h
	
	mov cx, 246
	mov dx, 172
	int 10h
	
	mov cx, 248
	mov dx, 172
	int 10h
	
	mov cx, 251
	mov dx, 172
	int 10h
	
	mov cx, 255
	mov dx, 172
	int 10h
	
	mov cx, 261
	mov dx, 172
	int 10h
	
	mov cx, 265
	mov dx, 172
	int 10h
	
	mov cx, 266
	mov dx, 172
	int 10h
	
	mov cx, 269
	mov dx, 172
	int 10h
	
	mov cx, 274
	mov dx, 172
	int 10h
	
	mov cx, 278
	mov dx, 172
	int 10h
	
	mov cx, 289
	mov dx, 172
	int 10h
	
	mov cx, 294
	mov dx, 172
	int 10h
	
	mov cx, 297
	mov dx, 172
	int 10h
	
	mov cx, 298
	mov dx, 172
	int 10h
	
	mov cx, 301
	mov dx, 172
	int 10h
	
	mov cx, 313
	mov dx, 172
	int 10h
	
	mov cx, 321
	mov dx, 172
	int 10h
	
	mov cx, 326
	mov dx, 172
	int 10h
	
	mov cx, 330
	mov dx, 172
	int 10h
	
	mov cx, 338
	mov dx, 172
	int 10h
	
	mov cx, 344
	mov dx, 172
	int 10h
	
	mov cx, 347
	mov dx, 172
	int 10h
	
	mov cx, 351
	mov dx, 172
	int 10h
	
	mov cx, 357
	mov dx, 172
	int 10h
	
	mov cx, 361
	mov dx, 172
	int 10h
	
	mov cx, 362
	mov dx, 172
	int 10h
	
	mov cx, 365
	mov dx, 172
	int 10h
	
	mov cx, 370
	mov dx, 172
	int 10h
	
	mov cx, 374
	mov dx, 172
	int 10h
	
	mov cx, 388
	mov dx, 172
	int 10h
	
	mov cx, 393
	mov dx, 172
	int 10h
	
	mov cx, 409
	mov dx, 172
	int 10h
	
	mov cx, 410
	mov dx, 172
	int 10h
	
	mov cx, 414
	mov dx, 172
	int 10h
	
	mov cx, 417
	mov dx, 172
	int 10h
	
	mov cx, 418
	mov dx, 172
	int 10h
	
	mov cx, 421
	mov dx, 172
	int 10h
	
	mov cx, 425
	mov dx, 172
	int 10h
	
	mov cx, 430
	mov dx, 172
	int 10h
	
	mov cx, 433
	mov dx, 172
	int 10h
	
	mov cx, 434
	mov dx, 172
	int 10h
	
	mov cx, 438
	mov dx, 172
	int 10h
	
	mov cx, 442
	mov dx, 172
	int 10h
	
	mov cx, 446
	mov dx, 172
	int 10h
	
	mov cx, 449
	mov dx, 172
	int 10h
	
	mov cx, 450
	mov dx, 172
	int 10h
	
	mov cx, 453
	mov dx, 172
	int 10h
	
	mov cx, 460
	mov dx, 172
	int 10h
	
	mov cx, 465
	mov dx, 172
	int 10h
	
	mov cx, 470
	mov dx, 172
	int 10h
	
	mov cx, 484
	mov dx, 172
	int 10h
	
	mov cx, 489
	mov dx, 172
	int 10h
	
	mov cx, 490
	mov dx, 172
	int 10h
	
	mov cx, 494
	mov dx, 172
	int 10h
	
	mov cx, 497
	mov dx, 172
	int 10h
	
	mov cx, 506
	mov dx, 172
	int 10h
	
	mov cx, 517
	mov dx, 172
	int 10h
	
	mov cx, 524
	mov dx, 172
	int 10h
	
	mov cx, 532
	mov dx, 172
	int 10h
	
	mov cx, 538
	mov dx, 172
	int 10h
	
	mov cx, 542
	mov dx, 172
	int 10h
	
	mov cx, 545
	mov dx, 172
	int 10h
	
	mov cx, 549
	mov dx, 172
	int 10h
	
	mov cx, 550
	mov dx, 172
	int 10h
	
	mov cx, 0
	mov dx, 173
	int 10h
	
	mov cx, 9
	mov dx, 173
	int 10h
	
	mov cx, 14
	mov dx, 173
	int 10h
	
	mov cx, 17
	mov dx, 173
	int 10h
	
	mov cx, 22
	mov dx, 173
	int 10h
	
	mov cx, 25
	mov dx, 173
	int 10h
	
	mov cx, 33
	mov dx, 173
	int 10h
	
	mov cx, 35
	mov dx, 173
	int 10h
	
	mov cx, 50
	mov dx, 173
	int 10h
	
	mov cx, 57
	mov dx, 173
	int 10h
	
	mov cx, 62
	mov dx, 173
	int 10h
	
	mov cx, 72
	mov dx, 173
	int 10h
	
	mov cx, 75
	mov dx, 173
	int 10h
	
	mov cx, 78
	mov dx, 173
	int 10h
	
	mov cx, 85
	mov dx, 173
	int 10h
	
	mov cx, 89
	mov dx, 173
	int 10h
	
	mov cx, 91
	mov dx, 173
	int 10h
	
	mov cx, 97
	mov dx, 173
	int 10h
	
	mov cx, 102
	mov dx, 173
	int 10h
	
	mov cx, 113
	mov dx, 173
	int 10h
	
	mov cx, 114
	mov dx, 173
	int 10h
	
	mov cx, 121
	mov dx, 173
	int 10h
	
	mov cx, 126
	mov dx, 173
	int 10h
	
	mov cx, 129
	mov dx, 173
	int 10h
	
	mov cx, 137
	mov dx, 173
	int 10h
	
	mov cx, 142
	mov dx, 173
	int 10h
	
	mov cx, 157
	mov dx, 173
	int 10h
	
	mov cx, 161
	mov dx, 173
	int 10h
	
	mov cx, 166
	mov dx, 173
	int 10h
	
	mov cx, 169
	mov dx, 173
	int 10h
	
	mov cx, 174
	mov dx, 173
	int 10h
	
	mov cx, 185
	mov dx, 173
	int 10h
	
	mov cx, 190
	mov dx, 173
	int 10h
	
	mov cx, 193
	mov dx, 173
	int 10h
	
	mov cx, 198
	mov dx, 173
	int 10h
	
	mov cx, 201
	mov dx, 173
	int 10h
	
	mov cx, 203
	mov dx, 173
	int 10h
	
	mov cx, 204
	mov dx, 173
	int 10h
	
	mov cx, 206
	mov dx, 173
	int 10h
	
	mov cx, 217
	mov dx, 173
	int 10h
	
	mov cx, 222
	mov dx, 173
	int 10h
	
	mov cx, 229
	mov dx, 173
	int 10h
	
	mov cx, 233
	mov dx, 173
	int 10h
	
	mov cx, 241
	mov dx, 173
	int 10h
	
	mov cx, 246
	mov dx, 173
	int 10h
	
	mov cx, 249
	mov dx, 173
	int 10h
	
	mov cx, 251
	mov dx, 173
	int 10h
	
	mov cx, 252
	mov dx, 173
	int 10h
	
	mov cx, 254
	mov dx, 173
	int 10h
	
	mov cx, 261
	mov dx, 173
	int 10h
	
	mov cx, 265
	mov dx, 173
	int 10h
	
	mov cx, 273
	mov dx, 173
	int 10h
	
	mov cx, 278
	mov dx, 173
	int 10h
	
	mov cx, 289
	mov dx, 173
	int 10h
	
	mov cx, 294
	mov dx, 173
	int 10h
	
	mov cx, 297
	mov dx, 173
	int 10h
	
	mov cx, 313
	mov dx, 173
	int 10h
	
	mov cx, 314
	mov dx, 173
	int 10h
	
	mov cx, 321
	mov dx, 173
	int 10h
	
	mov cx, 326
	mov dx, 173
	int 10h
	
	mov cx, 330
	mov dx, 173
	int 10h
	
	mov cx, 338
	mov dx, 173
	int 10h
	
	mov cx, 345
	mov dx, 173
	int 10h
	
	mov cx, 347
	mov dx, 173
	int 10h
	
	mov cx, 348
	mov dx, 173
	int 10h
	
	mov cx, 350
	mov dx, 173
	int 10h
	
	mov cx, 357
	mov dx, 173
	int 10h
	
	mov cx, 361
	mov dx, 173
	int 10h
	
	mov cx, 369
	mov dx, 173
	int 10h
	
	mov cx, 374
	mov dx, 173
	int 10h
	
	mov cx, 388
	mov dx, 173
	int 10h
	
	mov cx, 393
	mov dx, 173
	int 10h
	
	mov cx, 394
	mov dx, 173
	int 10h
	
	mov cx, 409
	mov dx, 173
	int 10h
	
	mov cx, 414
	mov dx, 173
	int 10h
	
	mov cx, 417
	mov dx, 173
	int 10h
	
	mov cx, 425
	mov dx, 173
	int 10h
	
	mov cx, 430
	mov dx, 173
	int 10h
	
	mov cx, 433
	mov dx, 173
	int 10h
	
	mov cx, 438
	mov dx, 173
	int 10h
	
	mov cx, 441
	mov dx, 173
	int 10h
	
	mov cx, 446
	mov dx, 173
	int 10h
	
	mov cx, 449
	mov dx, 173
	int 10h
	
	mov cx, 460
	mov dx, 173
	int 10h
	
	mov cx, 465
	mov dx, 173
	int 10h
	
	mov cx, 470
	mov dx, 173
	int 10h
	
	mov cx, 484
	mov dx, 173
	int 10h
	
	mov cx, 489
	mov dx, 173
	int 10h
	
	mov cx, 494
	mov dx, 173
	int 10h
	
	mov cx, 497
	mov dx, 173
	int 10h
	
	mov cx, 498
	mov dx, 173
	int 10h
	
	mov cx, 506
	mov dx, 173
	int 10h
	
	mov cx, 517
	mov dx, 173
	int 10h
	
	mov cx, 524
	mov dx, 173
	int 10h
	
	mov cx, 532
	mov dx, 173
	int 10h
	
	mov cx, 537
	mov dx, 173
	int 10h
	
	mov cx, 542
	mov dx, 173
	int 10h
	
	mov cx, 545
	mov dx, 173
	int 10h
	
	mov cx, 550
	mov dx, 173
	int 10h
	
	mov cx, 0
	mov dx, 174
	int 10h
	
	mov cx, 9
	mov dx, 174
	int 10h
	
	mov cx, 14
	mov dx, 174
	int 10h
	
	mov cx, 17
	mov dx, 174
	int 10h
	
	mov cx, 18
	mov dx, 174
	int 10h
	
	mov cx, 19
	mov dx, 174
	int 10h
	
	mov cx, 20
	mov dx, 174
	int 10h
	
	mov cx, 21
	mov dx, 174
	int 10h
	
	mov cx, 22
	mov dx, 174
	int 10h
	
	mov cx, 25
	mov dx, 174
	int 10h
	
	mov cx, 33
	mov dx, 174
	int 10h
	
	mov cx, 34
	mov dx, 174
	int 10h
	
	mov cx, 50
	mov dx, 174
	int 10h
	
	mov cx, 57
	mov dx, 174
	int 10h
	
	mov cx, 62
	mov dx, 174
	int 10h
	
	mov cx, 72
	mov dx, 174
	int 10h
	
	mov cx, 75
	mov dx, 174
	int 10h
	
	mov cx, 78
	mov dx, 174
	int 10h
	
	mov cx, 82
	mov dx, 174
	int 10h
	
	mov cx, 83
	mov dx, 174
	int 10h
	
	mov cx, 84
	mov dx, 174
	int 10h
	
	mov cx, 85
	mov dx, 174
	int 10h
	
	mov cx, 89
	mov dx, 174
	int 10h
	
	mov cx, 90
	mov dx, 174
	int 10h
	
	mov cx, 97
	mov dx, 174
	int 10h
	
	mov cx, 98
	mov dx, 174
	int 10h
	
	mov cx, 99
	mov dx, 174
	int 10h
	
	mov cx, 100
	mov dx, 174
	int 10h
	
	mov cx, 101
	mov dx, 174
	int 10h
	
	mov cx, 102
	mov dx, 174
	int 10h
	
	mov cx, 115
	mov dx, 174
	int 10h
	
	mov cx, 116
	mov dx, 174
	int 10h
	
	mov cx, 121
	mov dx, 174
	int 10h
	
	mov cx, 126
	mov dx, 174
	int 10h
	
	mov cx, 129
	mov dx, 174
	int 10h
	
	mov cx, 137
	mov dx, 174
	int 10h
	
	mov cx, 138
	mov dx, 174
	int 10h
	
	mov cx, 139
	mov dx, 174
	int 10h
	
	mov cx, 140
	mov dx, 174
	int 10h
	
	mov cx, 141
	mov dx, 174
	int 10h
	
	mov cx, 142
	mov dx, 174
	int 10h
	
	mov cx, 154
	mov dx, 174
	int 10h
	
	mov cx, 155
	mov dx, 174
	int 10h
	
	mov cx, 156
	mov dx, 174
	int 10h
	
	mov cx, 157
	mov dx, 174
	int 10h
	
	mov cx, 161
	mov dx, 174
	int 10h
	
	mov cx, 166
	mov dx, 174
	int 10h
	
	mov cx, 170
	mov dx, 174
	int 10h
	
	mov cx, 173
	mov dx, 174
	int 10h
	
	mov cx, 185
	mov dx, 174
	int 10h
	
	mov cx, 190
	mov dx, 174
	int 10h
	
	mov cx, 193
	mov dx, 174
	int 10h
	
	mov cx, 194
	mov dx, 174
	int 10h
	
	mov cx, 195
	mov dx, 174
	int 10h
	
	mov cx, 196
	mov dx, 174
	int 10h
	
	mov cx, 197
	mov dx, 174
	int 10h
	
	mov cx, 198
	mov dx, 174
	int 10h
	
	mov cx, 201
	mov dx, 174
	int 10h
	
	mov cx, 203
	mov dx, 174
	int 10h
	
	mov cx, 204
	mov dx, 174
	int 10h
	
	mov cx, 206
	mov dx, 174
	int 10h
	
	mov cx, 217
	mov dx, 174
	int 10h
	
	mov cx, 222
	mov dx, 174
	int 10h
	
	mov cx, 226
	mov dx, 174
	int 10h
	
	mov cx, 227
	mov dx, 174
	int 10h
	
	mov cx, 228
	mov dx, 174
	int 10h
	
	mov cx, 229
	mov dx, 174
	int 10h
	
	mov cx, 233
	mov dx, 174
	int 10h
	
	mov cx, 241
	mov dx, 174
	int 10h
	
	mov cx, 246
	mov dx, 174
	int 10h
	
	mov cx, 249
	mov dx, 174
	int 10h
	
	mov cx, 251
	mov dx, 174
	int 10h
	
	mov cx, 252
	mov dx, 174
	int 10h
	
	mov cx, 254
	mov dx, 174
	int 10h
	
	mov cx, 258
	mov dx, 174
	int 10h
	
	mov cx, 259
	mov dx, 174
	int 10h
	
	mov cx, 260
	mov dx, 174
	int 10h
	
	mov cx, 261
	mov dx, 174
	int 10h
	
	mov cx, 265
	mov dx, 174
	int 10h
	
	mov cx, 273
	mov dx, 174
	int 10h
	
	mov cx, 274
	mov dx, 174
	int 10h
	
	mov cx, 275
	mov dx, 174
	int 10h
	
	mov cx, 276
	mov dx, 174
	int 10h
	
	mov cx, 277
	mov dx, 174
	int 10h
	
	mov cx, 278
	mov dx, 174
	int 10h
	
	mov cx, 289
	mov dx, 174
	int 10h
	
	mov cx, 294
	mov dx, 174
	int 10h
	
	mov cx, 297
	mov dx, 174
	int 10h
	
	mov cx, 315
	mov dx, 174
	int 10h
	
	mov cx, 316
	mov dx, 174
	int 10h
	
	mov cx, 321
	mov dx, 174
	int 10h
	
	mov cx, 326
	mov dx, 174
	int 10h
	
	mov cx, 330
	mov dx, 174
	int 10h
	
	mov cx, 338
	mov dx, 174
	int 10h
	
	mov cx, 345
	mov dx, 174
	int 10h
	
	mov cx, 347
	mov dx, 174
	int 10h
	
	mov cx, 348
	mov dx, 174
	int 10h
	
	mov cx, 350
	mov dx, 174
	int 10h
	
	mov cx, 354
	mov dx, 174
	int 10h
	
	mov cx, 355
	mov dx, 174
	int 10h
	
	mov cx, 356
	mov dx, 174
	int 10h
	
	mov cx, 357
	mov dx, 174
	int 10h
	
	mov cx, 361
	mov dx, 174
	int 10h
	
	mov cx, 369
	mov dx, 174
	int 10h
	
	mov cx, 370
	mov dx, 174
	int 10h
	
	mov cx, 371
	mov dx, 174
	int 10h
	
	mov cx, 372
	mov dx, 174
	int 10h
	
	mov cx, 373
	mov dx, 174
	int 10h
	
	mov cx, 374
	mov dx, 174
	int 10h
	
	mov cx, 388
	mov dx, 174
	int 10h
	
	mov cx, 395
	mov dx, 174
	int 10h
	
	mov cx, 396
	mov dx, 174
	int 10h
	
	mov cx, 409
	mov dx, 174
	int 10h
	
	mov cx, 414
	mov dx, 174
	int 10h
	
	mov cx, 417
	mov dx, 174
	int 10h
	
	mov cx, 425
	mov dx, 174
	int 10h
	
	mov cx, 430
	mov dx, 174
	int 10h
	
	mov cx, 433
	mov dx, 174
	int 10h
	
	mov cx, 438
	mov dx, 174
	int 10h
	
	mov cx, 441
	mov dx, 174
	int 10h
	
	mov cx, 442
	mov dx, 174
	int 10h
	
	mov cx, 443
	mov dx, 174
	int 10h
	
	mov cx, 444
	mov dx, 174
	int 10h
	
	mov cx, 445
	mov dx, 174
	int 10h
	
	mov cx, 446
	mov dx, 174
	int 10h
	
	mov cx, 449
	mov dx, 174
	int 10h
	
	mov cx, 460
	mov dx, 174
	int 10h
	
	mov cx, 466
	mov dx, 174
	int 10h
	
	mov cx, 469
	mov dx, 174
	int 10h
	
	mov cx, 484
	mov dx, 174
	int 10h
	
	mov cx, 489
	mov dx, 174
	int 10h
	
	mov cx, 494
	mov dx, 174
	int 10h
	
	mov cx, 499
	mov dx, 174
	int 10h
	
	mov cx, 500
	mov dx, 174
	int 10h
	
	mov cx, 506
	mov dx, 174
	int 10h
	
	mov cx, 514
	mov dx, 174
	int 10h
	
	mov cx, 515
	mov dx, 174
	int 10h
	
	mov cx, 516
	mov dx, 174
	int 10h
	
	mov cx, 517
	mov dx, 174
	int 10h
	
	mov cx, 524
	mov dx, 174
	int 10h
	
	mov cx, 532
	mov dx, 174
	int 10h
	
	mov cx, 537
	mov dx, 174
	int 10h
	
	mov cx, 538
	mov dx, 174
	int 10h
	
	mov cx, 539
	mov dx, 174
	int 10h
	
	mov cx, 540
	mov dx, 174
	int 10h
	
	mov cx, 541
	mov dx, 174
	int 10h
	
	mov cx, 542
	mov dx, 174
	int 10h
	
	mov cx, 545
	mov dx, 174
	int 10h
	
	mov cx, 550
	mov dx, 174
	int 10h
	
	mov cx, 0
	mov dx, 175
	int 10h
	
	mov cx, 9
	mov dx, 175
	int 10h
	
	mov cx, 14
	mov dx, 175
	int 10h
	
	mov cx, 17
	mov dx, 175
	int 10h
	
	mov cx, 25
	mov dx, 175
	int 10h
	
	mov cx, 33
	mov dx, 175
	int 10h
	
	mov cx, 35
	mov dx, 175
	int 10h
	
	mov cx, 50
	mov dx, 175
	int 10h
	
	mov cx, 57
	mov dx, 175
	int 10h
	
	mov cx, 62
	mov dx, 175
	int 10h
	
	mov cx, 72
	mov dx, 175
	int 10h
	
	mov cx, 75
	mov dx, 175
	int 10h
	
	mov cx, 78
	mov dx, 175
	int 10h
	
	mov cx, 81
	mov dx, 175
	int 10h
	
	mov cx, 85
	mov dx, 175
	int 10h
	
	mov cx, 89
	mov dx, 175
	int 10h
	
	mov cx, 91
	mov dx, 175
	int 10h
	
	mov cx, 97
	mov dx, 175
	int 10h
	
	mov cx, 117
	mov dx, 175
	int 10h
	
	mov cx, 121
	mov dx, 175
	int 10h
	
	mov cx, 126
	mov dx, 175
	int 10h
	
	mov cx, 129
	mov dx, 175
	int 10h
	
	mov cx, 137
	mov dx, 175
	int 10h
	
	mov cx, 153
	mov dx, 175
	int 10h
	
	mov cx, 157
	mov dx, 175
	int 10h
	
	mov cx, 161
	mov dx, 175
	int 10h
	
	mov cx, 166
	mov dx, 175
	int 10h
	
	mov cx, 170
	mov dx, 175
	int 10h
	
	mov cx, 173
	mov dx, 175
	int 10h
	
	mov cx, 185
	mov dx, 175
	int 10h
	
	mov cx, 190
	mov dx, 175
	int 10h
	
	mov cx, 193
	mov dx, 175
	int 10h
	
	mov cx, 201
	mov dx, 175
	int 10h
	
	mov cx, 202
	mov dx, 175
	int 10h
	
	mov cx, 204
	mov dx, 175
	int 10h
	
	mov cx, 206
	mov dx, 175
	int 10h
	
	mov cx, 217
	mov dx, 175
	int 10h
	
	mov cx, 222
	mov dx, 175
	int 10h
	
	mov cx, 225
	mov dx, 175
	int 10h
	
	mov cx, 229
	mov dx, 175
	int 10h
	
	mov cx, 233
	mov dx, 175
	int 10h
	
	mov cx, 241
	mov dx, 175
	int 10h
	
	mov cx, 246
	mov dx, 175
	int 10h
	
	mov cx, 249
	mov dx, 175
	int 10h
	
	mov cx, 250
	mov dx, 175
	int 10h
	
	mov cx, 252
	mov dx, 175
	int 10h
	
	mov cx, 254
	mov dx, 175
	int 10h
	
	mov cx, 257
	mov dx, 175
	int 10h
	
	mov cx, 261
	mov dx, 175
	int 10h
	
	mov cx, 265
	mov dx, 175
	int 10h
	
	mov cx, 273
	mov dx, 175
	int 10h
	
	mov cx, 289
	mov dx, 175
	int 10h
	
	mov cx, 294
	mov dx, 175
	int 10h
	
	mov cx, 297
	mov dx, 175
	int 10h
	
	mov cx, 317
	mov dx, 175
	int 10h
	
	mov cx, 321
	mov dx, 175
	int 10h
	
	mov cx, 326
	mov dx, 175
	int 10h
	
	mov cx, 330
	mov dx, 175
	int 10h
	
	mov cx, 338
	mov dx, 175
	int 10h
	
	mov cx, 345
	mov dx, 175
	int 10h
	
	mov cx, 346
	mov dx, 175
	int 10h
	
	mov cx, 348
	mov dx, 175
	int 10h
	
	mov cx, 350
	mov dx, 175
	int 10h
	
	mov cx, 353
	mov dx, 175
	int 10h
	
	mov cx, 357
	mov dx, 175
	int 10h
	
	mov cx, 361
	mov dx, 175
	int 10h
	
	mov cx, 369
	mov dx, 175
	int 10h
	
	mov cx, 388
	mov dx, 175
	int 10h
	
	mov cx, 397
	mov dx, 175
	int 10h
	
	mov cx, 409
	mov dx, 175
	int 10h
	
	mov cx, 414
	mov dx, 175
	int 10h
	
	mov cx, 417
	mov dx, 175
	int 10h
	
	mov cx, 425
	mov dx, 175
	int 10h
	
	mov cx, 430
	mov dx, 175
	int 10h
	
	mov cx, 433
	mov dx, 175
	int 10h
	
	mov cx, 438
	mov dx, 175
	int 10h
	
	mov cx, 441
	mov dx, 175
	int 10h
	
	mov cx, 449
	mov dx, 175
	int 10h
	
	mov cx, 460
	mov dx, 175
	int 10h
	
	mov cx, 466
	mov dx, 175
	int 10h
	
	mov cx, 469
	mov dx, 175
	int 10h
	
	mov cx, 484
	mov dx, 175
	int 10h
	
	mov cx, 489
	mov dx, 175
	int 10h
	
	mov cx, 494
	mov dx, 175
	int 10h
	
	mov cx, 501
	mov dx, 175
	int 10h
	
	mov cx, 506
	mov dx, 175
	int 10h
	
	mov cx, 513
	mov dx, 175
	int 10h
	
	mov cx, 517
	mov dx, 175
	int 10h
	
	mov cx, 524
	mov dx, 175
	int 10h
	
	mov cx, 532
	mov dx, 175
	int 10h
	
	mov cx, 537
	mov dx, 175
	int 10h
	
	mov cx, 545
	mov dx, 175
	int 10h
	
	mov cx, 550
	mov dx, 175
	int 10h
	
	mov cx, 1
	mov dx, 176
	int 10h
	
	mov cx, 9
	mov dx, 176
	int 10h
	
	mov cx, 14
	mov dx, 176
	int 10h
	
	mov cx, 17
	mov dx, 176
	int 10h
	
	mov cx, 26
	mov dx, 176
	int 10h
	
	mov cx, 33
	mov dx, 176
	int 10h
	
	mov cx, 36
	mov dx, 176
	int 10h
	
	mov cx, 50
	mov dx, 176
	int 10h
	
	mov cx, 57
	mov dx, 176
	int 10h
	
	mov cx, 62
	mov dx, 176
	int 10h
	
	mov cx, 72
	mov dx, 176
	int 10h
	
	mov cx, 75
	mov dx, 176
	int 10h
	
	mov cx, 78
	mov dx, 176
	int 10h
	
	mov cx, 81
	mov dx, 176
	int 10h
	
	mov cx, 85
	mov dx, 176
	int 10h
	
	mov cx, 89
	mov dx, 176
	int 10h
	
	mov cx, 92
	mov dx, 176
	int 10h
	
	mov cx, 97
	mov dx, 176
	int 10h
	
	mov cx, 117
	mov dx, 176
	int 10h
	
	mov cx, 121
	mov dx, 176
	int 10h
	
	mov cx, 125
	mov dx, 176
	int 10h
	
	mov cx, 126
	mov dx, 176
	int 10h
	
	mov cx, 129
	mov dx, 176
	int 10h
	
	mov cx, 137
	mov dx, 176
	int 10h
	
	mov cx, 153
	mov dx, 176
	int 10h
	
	mov cx, 157
	mov dx, 176
	int 10h
	
	mov cx, 161
	mov dx, 176
	int 10h
	
	mov cx, 166
	mov dx, 176
	int 10h
	
	mov cx, 171
	mov dx, 176
	int 10h
	
	mov cx, 172
	mov dx, 176
	int 10h
	
	mov cx, 185
	mov dx, 176
	int 10h
	
	mov cx, 190
	mov dx, 176
	int 10h
	
	mov cx, 193
	mov dx, 176
	int 10h
	
	mov cx, 202
	mov dx, 176
	int 10h
	
	mov cx, 205
	mov dx, 176
	int 10h
	
	mov cx, 217
	mov dx, 176
	int 10h
	
	mov cx, 222
	mov dx, 176
	int 10h
	
	mov cx, 225
	mov dx, 176
	int 10h
	
	mov cx, 229
	mov dx, 176
	int 10h
	
	mov cx, 233
	mov dx, 176
	int 10h
	
	mov cx, 241
	mov dx, 176
	int 10h
	
	mov cx, 245
	mov dx, 176
	int 10h
	
	mov cx, 246
	mov dx, 176
	int 10h
	
	mov cx, 250
	mov dx, 176
	int 10h
	
	mov cx, 253
	mov dx, 176
	int 10h
	
	mov cx, 257
	mov dx, 176
	int 10h
	
	mov cx, 261
	mov dx, 176
	int 10h
	
	mov cx, 265
	mov dx, 176
	int 10h
	
	mov cx, 273
	mov dx, 176
	int 10h
	
	mov cx, 289
	mov dx, 176
	int 10h
	
	mov cx, 294
	mov dx, 176
	int 10h
	
	mov cx, 297
	mov dx, 176
	int 10h
	
	mov cx, 317
	mov dx, 176
	int 10h
	
	mov cx, 321
	mov dx, 176
	int 10h
	
	mov cx, 326
	mov dx, 176
	int 10h
	
	mov cx, 330
	mov dx, 176
	int 10h
	
	mov cx, 338
	mov dx, 176
	int 10h
	
	mov cx, 346
	mov dx, 176
	int 10h
	
	mov cx, 349
	mov dx, 176
	int 10h
	
	mov cx, 353
	mov dx, 176
	int 10h
	
	mov cx, 357
	mov dx, 176
	int 10h
	
	mov cx, 361
	mov dx, 176
	int 10h
	
	mov cx, 369
	mov dx, 176
	int 10h
	
	mov cx, 388
	mov dx, 176
	int 10h
	
	mov cx, 397
	mov dx, 176
	int 10h
	
	mov cx, 409
	mov dx, 176
	int 10h
	
	mov cx, 410
	mov dx, 176
	int 10h
	
	mov cx, 414
	mov dx, 176
	int 10h
	
	mov cx, 417
	mov dx, 176
	int 10h
	
	mov cx, 425
	mov dx, 176
	int 10h
	
	mov cx, 430
	mov dx, 176
	int 10h
	
	mov cx, 433
	mov dx, 176
	int 10h
	
	mov cx, 434
	mov dx, 176
	int 10h
	
	mov cx, 438
	mov dx, 176
	int 10h
	
	mov cx, 441
	mov dx, 176
	int 10h
	
	mov cx, 449
	mov dx, 176
	int 10h
	
	mov cx, 460
	mov dx, 176
	int 10h
	
	mov cx, 467
	mov dx, 176
	int 10h
	
	mov cx, 468
	mov dx, 176
	int 10h
	
	mov cx, 484
	mov dx, 176
	int 10h
	
	mov cx, 489
	mov dx, 176
	int 10h
	
	mov cx, 494
	mov dx, 176
	int 10h
	
	mov cx, 501
	mov dx, 176
	int 10h
	
	mov cx, 506
	mov dx, 176
	int 10h
	
	mov cx, 513
	mov dx, 176
	int 10h
	
	mov cx, 517
	mov dx, 176
	int 10h
	
	mov cx, 524
	mov dx, 176
	int 10h
	
	mov cx, 532
	mov dx, 176
	int 10h
	
	mov cx, 537
	mov dx, 176
	int 10h
	
	mov cx, 545
	mov dx, 176
	int 10h
	
	mov cx, 549
	mov dx, 176
	int 10h
	
	mov cx, 550
	mov dx, 176
	int 10h
	
	mov cx, 554
	mov dx, 176
	int 10h
	
	mov cx, 555
	mov dx, 176
	int 10h
	
	mov cx, 2
	mov dx, 177
	int 10h
	
	mov cx, 3
	mov dx, 177
	int 10h
	
	mov cx, 4
	mov dx, 177
	int 10h
	
	mov cx, 5
	mov dx, 177
	int 10h
	
	mov cx, 6
	mov dx, 177
	int 10h
	
	mov cx, 9
	mov dx, 177
	int 10h
	
	mov cx, 14
	mov dx, 177
	int 10h
	
	mov cx, 18
	mov dx, 177
	int 10h
	
	mov cx, 19
	mov dx, 177
	int 10h
	
	mov cx, 20
	mov dx, 177
	int 10h
	
	mov cx, 21
	mov dx, 177
	int 10h
	
	mov cx, 22
	mov dx, 177
	int 10h
	
	mov cx, 27
	mov dx, 177
	int 10h
	
	mov cx, 28
	mov dx, 177
	int 10h
	
	mov cx, 29
	mov dx, 177
	int 10h
	
	mov cx, 30
	mov dx, 177
	int 10h
	
	mov cx, 33
	mov dx, 177
	int 10h
	
	mov cx, 37
	mov dx, 177
	int 10h
	
	mov cx, 51
	mov dx, 177
	int 10h
	
	mov cx, 52
	mov dx, 177
	int 10h
	
	mov cx, 53
	mov dx, 177
	int 10h
	
	mov cx, 58
	mov dx, 177
	int 10h
	
	mov cx, 59
	mov dx, 177
	int 10h
	
	mov cx, 60
	mov dx, 177
	int 10h
	
	mov cx, 61
	mov dx, 177
	int 10h
	
	mov cx, 72
	mov dx, 177
	int 10h
	
	mov cx, 75
	mov dx, 177
	int 10h
	
	mov cx, 78
	mov dx, 177
	int 10h
	
	mov cx, 82
	mov dx, 177
	int 10h
	
	mov cx, 83
	mov dx, 177
	int 10h
	
	mov cx, 84
	mov dx, 177
	int 10h
	
	mov cx, 85
	mov dx, 177
	int 10h
	
	mov cx, 86
	mov dx, 177
	int 10h
	
	mov cx, 89
	mov dx, 177
	int 10h
	
	mov cx, 93
	mov dx, 177
	int 10h
	
	mov cx, 98
	mov dx, 177
	int 10h
	
	mov cx, 99
	mov dx, 177
	int 10h
	
	mov cx, 100
	mov dx, 177
	int 10h
	
	mov cx, 101
	mov dx, 177
	int 10h
	
	mov cx, 102
	mov dx, 177
	int 10h
	
	mov cx, 113
	mov dx, 177
	int 10h
	
	mov cx, 114
	mov dx, 177
	int 10h
	
	mov cx, 115
	mov dx, 177
	int 10h
	
	mov cx, 116
	mov dx, 177
	int 10h
	
	mov cx, 122
	mov dx, 177
	int 10h
	
	mov cx, 123
	mov dx, 177
	int 10h
	
	mov cx, 124
	mov dx, 177
	int 10h
	
	mov cx, 126
	mov dx, 177
	int 10h
	
	mov cx, 129
	mov dx, 177
	int 10h
	
	mov cx, 138
	mov dx, 177
	int 10h
	
	mov cx, 139
	mov dx, 177
	int 10h
	
	mov cx, 140
	mov dx, 177
	int 10h
	
	mov cx, 141
	mov dx, 177
	int 10h
	
	mov cx, 142
	mov dx, 177
	int 10h
	
	mov cx, 154
	mov dx, 177
	int 10h
	
	mov cx, 155
	mov dx, 177
	int 10h
	
	mov cx, 156
	mov dx, 177
	int 10h
	
	mov cx, 157
	mov dx, 177
	int 10h
	
	mov cx, 158
	mov dx, 177
	int 10h
	
	mov cx, 161
	mov dx, 177
	int 10h
	
	mov cx, 166
	mov dx, 177
	int 10h
	
	mov cx, 171
	mov dx, 177
	int 10h
	
	mov cx, 172
	mov dx, 177
	int 10h
	
	mov cx, 185
	mov dx, 177
	int 10h
	
	mov cx, 190
	mov dx, 177
	int 10h
	
	mov cx, 194
	mov dx, 177
	int 10h
	
	mov cx, 195
	mov dx, 177
	int 10h
	
	mov cx, 196
	mov dx, 177
	int 10h
	
	mov cx, 197
	mov dx, 177
	int 10h
	
	mov cx, 198
	mov dx, 177
	int 10h
	
	mov cx, 202
	mov dx, 177
	int 10h
	
	mov cx, 205
	mov dx, 177
	int 10h
	
	mov cx, 217
	mov dx, 177
	int 10h
	
	mov cx, 222
	mov dx, 177
	int 10h
	
	mov cx, 226
	mov dx, 177
	int 10h
	
	mov cx, 227
	mov dx, 177
	int 10h
	
	mov cx, 228
	mov dx, 177
	int 10h
	
	mov cx, 229
	mov dx, 177
	int 10h
	
	mov cx, 230
	mov dx, 177
	int 10h
	
	mov cx, 233
	mov dx, 177
	int 10h
	
	mov cx, 242
	mov dx, 177
	int 10h
	
	mov cx, 243
	mov dx, 177
	int 10h
	
	mov cx, 244
	mov dx, 177
	int 10h
	
	mov cx, 246
	mov dx, 177
	int 10h
	
	mov cx, 250
	mov dx, 177
	int 10h
	
	mov cx, 253
	mov dx, 177
	int 10h
	
	mov cx, 258
	mov dx, 177
	int 10h
	
	mov cx, 259
	mov dx, 177
	int 10h
	
	mov cx, 260
	mov dx, 177
	int 10h
	
	mov cx, 261
	mov dx, 177
	int 10h
	
	mov cx, 262
	mov dx, 177
	int 10h
	
	mov cx, 265
	mov dx, 177
	int 10h
	
	mov cx, 274
	mov dx, 177
	int 10h
	
	mov cx, 275
	mov dx, 177
	int 10h
	
	mov cx, 276
	mov dx, 177
	int 10h
	
	mov cx, 277
	mov dx, 177
	int 10h
	
	mov cx, 278
	mov dx, 177
	int 10h
	
	mov cx, 290
	mov dx, 177
	int 10h
	
	mov cx, 291
	mov dx, 177
	int 10h
	
	mov cx, 292
	mov dx, 177
	int 10h
	
	mov cx, 293
	mov dx, 177
	int 10h
	
	mov cx, 297
	mov dx, 177
	int 10h
	
	mov cx, 313
	mov dx, 177
	int 10h
	
	mov cx, 314
	mov dx, 177
	int 10h
	
	mov cx, 315
	mov dx, 177
	int 10h
	
	mov cx, 316
	mov dx, 177
	int 10h
	
	mov cx, 322
	mov dx, 177
	int 10h
	
	mov cx, 323
	mov dx, 177
	int 10h
	
	mov cx, 324
	mov dx, 177
	int 10h
	
	mov cx, 325
	mov dx, 177
	int 10h
	
	mov cx, 330
	mov dx, 177
	int 10h
	
	mov cx, 339
	mov dx, 177
	int 10h
	
	mov cx, 340
	mov dx, 177
	int 10h
	
	mov cx, 341
	mov dx, 177
	int 10h
	
	mov cx, 346
	mov dx, 177
	int 10h
	
	mov cx, 349
	mov dx, 177
	int 10h
	
	mov cx, 354
	mov dx, 177
	int 10h
	
	mov cx, 355
	mov dx, 177
	int 10h
	
	mov cx, 356
	mov dx, 177
	int 10h
	
	mov cx, 357
	mov dx, 177
	int 10h
	
	mov cx, 358
	mov dx, 177
	int 10h
	
	mov cx, 361
	mov dx, 177
	int 10h
	
	mov cx, 370
	mov dx, 177
	int 10h
	
	mov cx, 371
	mov dx, 177
	int 10h
	
	mov cx, 372
	mov dx, 177
	int 10h
	
	mov cx, 373
	mov dx, 177
	int 10h
	
	mov cx, 374
	mov dx, 177
	int 10h
	
	mov cx, 388
	mov dx, 177
	int 10h
	
	mov cx, 393
	mov dx, 177
	int 10h
	
	mov cx, 394
	mov dx, 177
	int 10h
	
	mov cx, 395
	mov dx, 177
	int 10h
	
	mov cx, 396
	mov dx, 177
	int 10h
	
	mov cx, 409
	mov dx, 177
	int 10h
	
	mov cx, 411
	mov dx, 177
	int 10h
	
	mov cx, 412
	mov dx, 177
	int 10h
	
	mov cx, 413
	mov dx, 177
	int 10h
	
	mov cx, 417
	mov dx, 177
	int 10h
	
	mov cx, 426
	mov dx, 177
	int 10h
	
	mov cx, 427
	mov dx, 177
	int 10h
	
	mov cx, 428
	mov dx, 177
	int 10h
	
	mov cx, 429
	mov dx, 177
	int 10h
	
	mov cx, 433
	mov dx, 177
	int 10h
	
	mov cx, 435
	mov dx, 177
	int 10h
	
	mov cx, 436
	mov dx, 177
	int 10h
	
	mov cx, 437
	mov dx, 177
	int 10h
	
	mov cx, 442
	mov dx, 177
	int 10h
	
	mov cx, 443
	mov dx, 177
	int 10h
	
	mov cx, 444
	mov dx, 177
	int 10h
	
	mov cx, 445
	mov dx, 177
	int 10h
	
	mov cx, 446
	mov dx, 177
	int 10h
	
	mov cx, 449
	mov dx, 177
	int 10h
	
	mov cx, 460
	mov dx, 177
	int 10h
	
	mov cx, 467
	mov dx, 177
	int 10h
	
	mov cx, 468
	mov dx, 177
	int 10h
	
	mov cx, 484
	mov dx, 177
	int 10h
	
	mov cx, 489
	mov dx, 177
	int 10h
	
	mov cx, 494
	mov dx, 177
	int 10h
	
	mov cx, 497
	mov dx, 177
	int 10h
	
	mov cx, 498
	mov dx, 177
	int 10h
	
	mov cx, 499
	mov dx, 177
	int 10h
	
	mov cx, 500
	mov dx, 177
	int 10h
	
	mov cx, 507
	mov dx, 177
	int 10h
	
	mov cx, 508
	mov dx, 177
	int 10h
	
	mov cx, 509
	mov dx, 177
	int 10h
	
	mov cx, 514
	mov dx, 177
	int 10h
	
	mov cx, 515
	mov dx, 177
	int 10h
	
	mov cx, 516
	mov dx, 177
	int 10h
	
	mov cx, 517
	mov dx, 177
	int 10h
	
	mov cx, 518
	mov dx, 177
	int 10h
	
	mov cx, 524
	mov dx, 177
	int 10h
	
	mov cx, 532
	mov dx, 177
	int 10h
	
	mov cx, 538
	mov dx, 177
	int 10h
	
	mov cx, 539
	mov dx, 177
	int 10h
	
	mov cx, 540
	mov dx, 177
	int 10h
	
	mov cx, 541
	mov dx, 177
	int 10h
	
	mov cx, 542
	mov dx, 177
	int 10h
	
	mov cx, 546
	mov dx, 177
	int 10h
	
	mov cx, 547
	mov dx, 177
	int 10h
	
	mov cx, 548
	mov dx, 177
	int 10h
	
	mov cx, 550
	mov dx, 177
	int 10h
	
	mov cx, 554
	mov dx, 177
	int 10h
	
	mov cx, 555
	mov dx, 177
	int 10h
	
	mov cx, 171
	mov dx, 178
	int 10h
	
	mov cx, 409
	mov dx, 178
	int 10h
	
	mov cx, 433
	mov dx, 178
	int 10h
	
	mov cx, 467
	mov dx, 178
	int 10h
	
	mov cx, 170
	mov dx, 179
	int 10h
	
	mov cx, 171
	mov dx, 179
	int 10h
	
	mov cx, 409
	mov dx, 179
	int 10h
	
	mov cx, 433
	mov dx, 179
	int 10h
	
	mov cx, 466
	mov dx, 179
	int 10h
	
	mov cx, 467
	mov dx, 179
	int 10h
	
	mov cx, 168
	mov dx, 180
	int 10h
	
	mov cx, 169
	mov dx, 180
	int 10h
	
	mov cx, 170
	mov dx, 180
	int 10h
	
	mov cx, 409
	mov dx, 180
	int 10h
	
	mov cx, 433
	mov dx, 180
	int 10h
	
	mov cx, 464
	mov dx, 180
	int 10h
	
	mov cx, 465
	mov dx, 180
	int 10h
	
	mov cx, 466
	mov dx, 180
	int 10h
	
	mov cx, 11
	mov dx, 182
	int 10h
	
	mov cx, 12
	mov dx, 182
	int 10h
	
	mov cx, 13
	mov dx, 182
	int 10h
	
	mov cx, 14
	mov dx, 182
	int 10h
	
	mov cx, 33
	mov dx, 182
	int 10h
	
	mov cx, 43
	mov dx, 182
	int 10h
	
	mov cx, 44
	mov dx, 182
	int 10h
	
	mov cx, 67
	mov dx, 182
	int 10h
	
	mov cx, 68
	mov dx, 182
	int 10h
	
	mov cx, 139
	mov dx, 182
	int 10h
	
	mov cx, 140
	mov dx, 182
	int 10h
	
	mov cx, 177
	mov dx, 182
	int 10h
	
	mov cx, 178
	mov dx, 182
	int 10h
	
	mov cx, 179
	mov dx, 182
	int 10h
	
	mov cx, 180
	mov dx, 182
	int 10h
	
	mov cx, 185
	mov dx, 182
	int 10h
	
	mov cx, 186
	mov dx, 182
	int 10h
	
	mov cx, 187
	mov dx, 182
	int 10h
	
	mov cx, 188
	mov dx, 182
	int 10h
	
	mov cx, 211
	mov dx, 182
	int 10h
	
	mov cx, 212
	mov dx, 182
	int 10h
	
	mov cx, 265
	mov dx, 182
	int 10h
	
	mov cx, 321
	mov dx, 182
	int 10h
	
	mov cx, 350
	mov dx, 182
	int 10h
	
	mov cx, 435
	mov dx, 182
	int 10h
	
	mov cx, 436
	mov dx, 182
	int 10h
	
	mov cx, 437
	mov dx, 182
	int 10h
	
	mov cx, 438
	mov dx, 182
	int 10h
	
	mov cx, 523
	mov dx, 182
	int 10h
	
	mov cx, 524
	mov dx, 182
	int 10h
	
	mov cx, 525
	mov dx, 182
	int 10h
	
	mov cx, 526
	mov dx, 182
	int 10h
	
	mov cx, 10
	mov dx, 183
	int 10h
	
	mov cx, 33
	mov dx, 183
	int 10h
	
	mov cx, 43
	mov dx, 183
	int 10h
	
	mov cx, 44
	mov dx, 183
	int 10h
	
	mov cx, 67
	mov dx, 183
	int 10h
	
	mov cx, 68
	mov dx, 183
	int 10h
	
	mov cx, 139
	mov dx, 183
	int 10h
	
	mov cx, 140
	mov dx, 183
	int 10h
	
	mov cx, 180
	mov dx, 183
	int 10h
	
	mov cx, 188
	mov dx, 183
	int 10h
	
	mov cx, 211
	mov dx, 183
	int 10h
	
	mov cx, 212
	mov dx, 183
	int 10h
	
	mov cx, 265
	mov dx, 183
	int 10h
	
	mov cx, 321
	mov dx, 183
	int 10h
	
	mov cx, 350
	mov dx, 183
	int 10h
	
	mov cx, 434
	mov dx, 183
	int 10h
	
	mov cx, 522
	mov dx, 183
	int 10h
	
	mov cx, 1
	mov dx, 184
	int 10h
	
	mov cx, 2
	mov dx, 184
	int 10h
	
	mov cx, 3
	mov dx, 184
	int 10h
	
	mov cx, 4
	mov dx, 184
	int 10h
	
	mov cx, 5
	mov dx, 184
	int 10h
	
	mov cx, 10
	mov dx, 184
	int 10h
	
	mov cx, 26
	mov dx, 184
	int 10h
	
	mov cx, 33
	mov dx, 184
	int 10h
	
	mov cx, 162
	mov dx, 184
	int 10h
	
	mov cx, 180
	mov dx, 184
	int 10h
	
	mov cx, 188
	mov dx, 184
	int 10h
	
	mov cx, 202
	mov dx, 184
	int 10h
	
	mov cx, 265
	mov dx, 184
	int 10h
	
	mov cx, 321
	mov dx, 184
	int 10h
	
	mov cx, 350
	mov dx, 184
	int 10h
	
	mov cx, 434
	mov dx, 184
	int 10h
	
	mov cx, 442
	mov dx, 184
	int 10h
	
	mov cx, 522
	mov dx, 184
	int 10h
	
	mov cx, 546
	mov dx, 184
	int 10h
	
	mov cx, 3
	mov dx, 185
	int 10h
	
	mov cx, 8
	mov dx, 185
	int 10h
	
	mov cx, 9
	mov dx, 185
	int 10h
	
	mov cx, 10
	mov dx, 185
	int 10h
	
	mov cx, 11
	mov dx, 185
	int 10h
	
	mov cx, 12
	mov dx, 185
	int 10h
	
	mov cx, 13
	mov dx, 185
	int 10h
	
	mov cx, 14
	mov dx, 185
	int 10h
	
	mov cx, 24
	mov dx, 185
	int 10h
	
	mov cx, 25
	mov dx, 185
	int 10h
	
	mov cx, 26
	mov dx, 185
	int 10h
	
	mov cx, 27
	mov dx, 185
	int 10h
	
	mov cx, 28
	mov dx, 185
	int 10h
	
	mov cx, 29
	mov dx, 185
	int 10h
	
	mov cx, 33
	mov dx, 185
	int 10h
	
	mov cx, 35
	mov dx, 185
	int 10h
	
	mov cx, 36
	mov dx, 185
	int 10h
	
	mov cx, 37
	mov dx, 185
	int 10h
	
	mov cx, 41
	mov dx, 185
	int 10h
	
	mov cx, 42
	mov dx, 185
	int 10h
	
	mov cx, 43
	mov dx, 185
	int 10h
	
	mov cx, 44
	mov dx, 185
	int 10h
	
	mov cx, 50
	mov dx, 185
	int 10h
	
	mov cx, 51
	mov dx, 185
	int 10h
	
	mov cx, 52
	mov dx, 185
	int 10h
	
	mov cx, 53
	mov dx, 185
	int 10h
	
	mov cx, 65
	mov dx, 185
	int 10h
	
	mov cx, 66
	mov dx, 185
	int 10h
	
	mov cx, 67
	mov dx, 185
	int 10h
	
	mov cx, 68
	mov dx, 185
	int 10h
	
	mov cx, 74
	mov dx, 185
	int 10h
	
	mov cx, 75
	mov dx, 185
	int 10h
	
	mov cx, 76
	mov dx, 185
	int 10h
	
	mov cx, 77
	mov dx, 185
	int 10h
	
	mov cx, 90
	mov dx, 185
	int 10h
	
	mov cx, 91
	mov dx, 185
	int 10h
	
	mov cx, 92
	mov dx, 185
	int 10h
	
	mov cx, 105
	mov dx, 185
	int 10h
	
	mov cx, 107
	mov dx, 185
	int 10h
	
	mov cx, 108
	mov dx, 185
	int 10h
	
	mov cx, 109
	mov dx, 185
	int 10h
	
	mov cx, 114
	mov dx, 185
	int 10h
	
	mov cx, 115
	mov dx, 185
	int 10h
	
	mov cx, 116
	mov dx, 185
	int 10h
	
	mov cx, 117
	mov dx, 185
	int 10h
	
	mov cx, 120
	mov dx, 185
	int 10h
	
	mov cx, 127
	mov dx, 185
	int 10h
	
	mov cx, 137
	mov dx, 185
	int 10h
	
	mov cx, 138
	mov dx, 185
	int 10h
	
	mov cx, 139
	mov dx, 185
	int 10h
	
	mov cx, 140
	mov dx, 185
	int 10h
	
	mov cx, 145
	mov dx, 185
	int 10h
	
	mov cx, 147
	mov dx, 185
	int 10h
	
	mov cx, 148
	mov dx, 185
	int 10h
	
	mov cx, 149
	mov dx, 185
	int 10h
	
	mov cx, 154
	mov dx, 185
	int 10h
	
	mov cx, 155
	mov dx, 185
	int 10h
	
	mov cx, 156
	mov dx, 185
	int 10h
	
	mov cx, 157
	mov dx, 185
	int 10h
	
	mov cx, 160
	mov dx, 185
	int 10h
	
	mov cx, 161
	mov dx, 185
	int 10h
	
	mov cx, 162
	mov dx, 185
	int 10h
	
	mov cx, 163
	mov dx, 185
	int 10h
	
	mov cx, 164
	mov dx, 185
	int 10h
	
	mov cx, 165
	mov dx, 185
	int 10h
	
	mov cx, 170
	mov dx, 185
	int 10h
	
	mov cx, 171
	mov dx, 185
	int 10h
	
	mov cx, 172
	mov dx, 185
	int 10h
	
	mov cx, 180
	mov dx, 185
	int 10h
	
	mov cx, 188
	mov dx, 185
	int 10h
	
	mov cx, 194
	mov dx, 185
	int 10h
	
	mov cx, 195
	mov dx, 185
	int 10h
	
	mov cx, 196
	mov dx, 185
	int 10h
	
	mov cx, 200
	mov dx, 185
	int 10h
	
	mov cx, 201
	mov dx, 185
	int 10h
	
	mov cx, 202
	mov dx, 185
	int 10h
	
	mov cx, 203
	mov dx, 185
	int 10h
	
	mov cx, 204
	mov dx, 185
	int 10h
	
	mov cx, 205
	mov dx, 185
	int 10h
	
	mov cx, 209
	mov dx, 185
	int 10h
	
	mov cx, 210
	mov dx, 185
	int 10h
	
	mov cx, 211
	mov dx, 185
	int 10h
	
	mov cx, 212
	mov dx, 185
	int 10h
	
	mov cx, 218
	mov dx, 185
	int 10h
	
	mov cx, 219
	mov dx, 185
	int 10h
	
	mov cx, 220
	mov dx, 185
	int 10h
	
	mov cx, 221
	mov dx, 185
	int 10h
	
	mov cx, 225
	mov dx, 185
	int 10h
	
	mov cx, 227
	mov dx, 185
	int 10h
	
	mov cx, 228
	mov dx, 185
	int 10h
	
	mov cx, 229
	mov dx, 185
	int 10h
	
	mov cx, 250
	mov dx, 185
	int 10h
	
	mov cx, 251
	mov dx, 185
	int 10h
	
	mov cx, 252
	mov dx, 185
	int 10h
	
	mov cx, 258
	mov dx, 185
	int 10h
	
	mov cx, 259
	mov dx, 185
	int 10h
	
	mov cx, 260
	mov dx, 185
	int 10h
	
	mov cx, 261
	mov dx, 185
	int 10h
	
	mov cx, 265
	mov dx, 185
	int 10h
	
	mov cx, 269
	mov dx, 185
	int 10h
	
	mov cx, 280
	mov dx, 185
	int 10h
	
	mov cx, 287
	mov dx, 185
	int 10h
	
	mov cx, 290
	mov dx, 185
	int 10h
	
	mov cx, 291
	mov dx, 185
	int 10h
	
	mov cx, 292
	mov dx, 185
	int 10h
	
	mov cx, 293
	mov dx, 185
	int 10h
	
	mov cx, 297
	mov dx, 185
	int 10h
	
	mov cx, 302
	mov dx, 185
	int 10h
	
	mov cx, 305
	mov dx, 185
	int 10h
	
	mov cx, 307
	mov dx, 185
	int 10h
	
	mov cx, 308
	mov dx, 185
	int 10h
	
	mov cx, 309
	mov dx, 185
	int 10h
	
	mov cx, 321
	mov dx, 185
	int 10h
	
	mov cx, 323
	mov dx, 185
	int 10h
	
	mov cx, 324
	mov dx, 185
	int 10h
	
	mov cx, 325
	mov dx, 185
	int 10h
	
	mov cx, 330
	mov dx, 185
	int 10h
	
	mov cx, 331
	mov dx, 185
	int 10h
	
	mov cx, 332
	mov dx, 185
	int 10h
	
	mov cx, 337
	mov dx, 185
	int 10h
	
	mov cx, 339
	mov dx, 185
	int 10h
	
	mov cx, 340
	mov dx, 185
	int 10h
	
	mov cx, 341
	mov dx, 185
	int 10h
	
	mov cx, 346
	mov dx, 185
	int 10h
	
	mov cx, 347
	mov dx, 185
	int 10h
	
	mov cx, 348
	mov dx, 185
	int 10h
	
	mov cx, 350
	mov dx, 185
	int 10h
	
	mov cx, 352
	mov dx, 185
	int 10h
	
	mov cx, 359
	mov dx, 185
	int 10h
	
	mov cx, 362
	mov dx, 185
	int 10h
	
	mov cx, 363
	mov dx, 185
	int 10h
	
	mov cx, 364
	mov dx, 185
	int 10h
	
	mov cx, 369
	mov dx, 185
	int 10h
	
	mov cx, 371
	mov dx, 185
	int 10h
	
	mov cx, 372
	mov dx, 185
	int 10h
	
	mov cx, 373
	mov dx, 185
	int 10h
	
	mov cx, 378
	mov dx, 185
	int 10h
	
	mov cx, 379
	mov dx, 185
	int 10h
	
	mov cx, 380
	mov dx, 185
	int 10h
	
	mov cx, 381
	mov dx, 185
	int 10h
	
	mov cx, 394
	mov dx, 185
	int 10h
	
	mov cx, 395
	mov dx, 185
	int 10h
	
	mov cx, 396
	mov dx, 185
	int 10h
	
	mov cx, 397
	mov dx, 185
	int 10h
	
	mov cx, 401
	mov dx, 185
	int 10h
	
	mov cx, 403
	mov dx, 185
	int 10h
	
	mov cx, 404
	mov dx, 185
	int 10h
	
	mov cx, 405
	mov dx, 185
	int 10h
	
	mov cx, 418
	mov dx, 185
	int 10h
	
	mov cx, 419
	mov dx, 185
	int 10h
	
	mov cx, 420
	mov dx, 185
	int 10h
	
	mov cx, 421
	mov dx, 185
	int 10h
	
	mov cx, 426
	mov dx, 185
	int 10h
	
	mov cx, 427
	mov dx, 185
	int 10h
	
	mov cx, 428
	mov dx, 185
	int 10h
	
	mov cx, 429
	mov dx, 185
	int 10h
	
	mov cx, 432
	mov dx, 185
	int 10h
	
	mov cx, 433
	mov dx, 185
	int 10h
	
	mov cx, 434
	mov dx, 185
	int 10h
	
	mov cx, 435
	mov dx, 185
	int 10h
	
	mov cx, 436
	mov dx, 185
	int 10h
	
	mov cx, 437
	mov dx, 185
	int 10h
	
	mov cx, 438
	mov dx, 185
	int 10h
	
	mov cx, 440
	mov dx, 185
	int 10h
	
	mov cx, 441
	mov dx, 185
	int 10h
	
	mov cx, 442
	mov dx, 185
	int 10h
	
	mov cx, 443
	mov dx, 185
	int 10h
	
	mov cx, 444
	mov dx, 185
	int 10h
	
	mov cx, 445
	mov dx, 185
	int 10h
	
	mov cx, 448
	mov dx, 185
	int 10h
	
	mov cx, 455
	mov dx, 185
	int 10h
	
	mov cx, 458
	mov dx, 185
	int 10h
	
	mov cx, 459
	mov dx, 185
	int 10h
	
	mov cx, 460
	mov dx, 185
	int 10h
	
	mov cx, 465
	mov dx, 185
	int 10h
	
	mov cx, 467
	mov dx, 185
	int 10h
	
	mov cx, 468
	mov dx, 185
	int 10h
	
	mov cx, 469
	mov dx, 185
	int 10h
	
	mov cx, 474
	mov dx, 185
	int 10h
	
	mov cx, 475
	mov dx, 185
	int 10h
	
	mov cx, 476
	mov dx, 185
	int 10h
	
	mov cx, 477
	mov dx, 185
	int 10h
	
	mov cx, 488
	mov dx, 185
	int 10h
	
	mov cx, 490
	mov dx, 185
	int 10h
	
	mov cx, 491
	mov dx, 185
	int 10h
	
	mov cx, 493
	mov dx, 185
	int 10h
	
	mov cx, 494
	mov dx, 185
	int 10h
	
	mov cx, 498
	mov dx, 185
	int 10h
	
	mov cx, 499
	mov dx, 185
	int 10h
	
	mov cx, 500
	mov dx, 185
	int 10h
	
	mov cx, 505
	mov dx, 185
	int 10h
	
	mov cx, 507
	mov dx, 185
	int 10h
	
	mov cx, 508
	mov dx, 185
	int 10h
	
	mov cx, 509
	mov dx, 185
	int 10h
	
	mov cx, 513
	mov dx, 185
	int 10h
	
	mov cx, 518
	mov dx, 185
	int 10h
	
	mov cx, 520
	mov dx, 185
	int 10h
	
	mov cx, 521
	mov dx, 185
	int 10h
	
	mov cx, 522
	mov dx, 185
	int 10h
	
	mov cx, 523
	mov dx, 185
	int 10h
	
	mov cx, 524
	mov dx, 185
	int 10h
	
	mov cx, 525
	mov dx, 185
	int 10h
	
	mov cx, 526
	mov dx, 185
	int 10h
	
	mov cx, 530
	mov dx, 185
	int 10h
	
	mov cx, 531
	mov dx, 185
	int 10h
	
	mov cx, 532
	mov dx, 185
	int 10h
	
	mov cx, 539
	mov dx, 185
	int 10h
	
	mov cx, 540
	mov dx, 185
	int 10h
	
	mov cx, 541
	mov dx, 185
	int 10h
	
	mov cx, 542
	mov dx, 185
	int 10h
	
	mov cx, 544
	mov dx, 185
	int 10h
	
	mov cx, 545
	mov dx, 185
	int 10h
	
	mov cx, 546
	mov dx, 185
	int 10h
	
	mov cx, 547
	mov dx, 185
	int 10h
	
	mov cx, 548
	mov dx, 185
	int 10h
	
	mov cx, 549
	mov dx, 185
	int 10h
	
	mov cx, 553
	mov dx, 185
	int 10h
	
	mov cx, 558
	mov dx, 185
	int 10h
	
	mov cx, 561
	mov dx, 185
	int 10h
	
	mov cx, 563
	mov dx, 185
	int 10h
	
	mov cx, 564
	mov dx, 185
	int 10h
	
	mov cx, 565
	mov dx, 185
	int 10h
	
	mov cx, 570
	mov dx, 185
	int 10h
	
	mov cx, 571
	mov dx, 185
	int 10h
	
	mov cx, 572
	mov dx, 185
	int 10h
	
	mov cx, 573
	mov dx, 185
	int 10h
	
	mov cx, 577
	mov dx, 185
	int 10h
	
	mov cx, 579
	mov dx, 185
	int 10h
	
	mov cx, 580
	mov dx, 185
	int 10h
	
	mov cx, 581
	mov dx, 185
	int 10h
	
	mov cx, 3
	mov dx, 186
	int 10h
	
	mov cx, 10
	mov dx, 186
	int 10h
	
	mov cx, 26
	mov dx, 186
	int 10h
	
	mov cx, 33
	mov dx, 186
	int 10h
	
	mov cx, 34
	mov dx, 186
	int 10h
	
	mov cx, 38
	mov dx, 186
	int 10h
	
	mov cx, 44
	mov dx, 186
	int 10h
	
	mov cx, 49
	mov dx, 186
	int 10h
	
	mov cx, 68
	mov dx, 186
	int 10h
	
	mov cx, 73
	mov dx, 186
	int 10h
	
	mov cx, 93
	mov dx, 186
	int 10h
	
	mov cx, 105
	mov dx, 186
	int 10h
	
	mov cx, 106
	mov dx, 186
	int 10h
	
	mov cx, 110
	mov dx, 186
	int 10h
	
	mov cx, 114
	mov dx, 186
	int 10h
	
	mov cx, 118
	mov dx, 186
	int 10h
	
	mov cx, 120
	mov dx, 186
	int 10h
	
	mov cx, 123
	mov dx, 186
	int 10h
	
	mov cx, 127
	mov dx, 186
	int 10h
	
	mov cx, 140
	mov dx, 186
	int 10h
	
	mov cx, 145
	mov dx, 186
	int 10h
	
	mov cx, 146
	mov dx, 186
	int 10h
	
	mov cx, 150
	mov dx, 186
	int 10h
	
	mov cx, 153
	mov dx, 186
	int 10h
	
	mov cx, 162
	mov dx, 186
	int 10h
	
	mov cx, 173
	mov dx, 186
	int 10h
	
	mov cx, 180
	mov dx, 186
	int 10h
	
	mov cx, 188
	mov dx, 186
	int 10h
	
	mov cx, 197
	mov dx, 186
	int 10h
	
	mov cx, 202
	mov dx, 186
	int 10h
	
	mov cx, 212
	mov dx, 186
	int 10h
	
	mov cx, 217
	mov dx, 186
	int 10h
	
	mov cx, 222
	mov dx, 186
	int 10h
	
	mov cx, 225
	mov dx, 186
	int 10h
	
	mov cx, 226
	mov dx, 186
	int 10h
	
	mov cx, 230
	mov dx, 186
	int 10h
	
	mov cx, 253
	mov dx, 186
	int 10h
	
	mov cx, 257
	mov dx, 186
	int 10h
	
	mov cx, 265
	mov dx, 186
	int 10h
	
	mov cx, 268
	mov dx, 186
	int 10h
	
	mov cx, 281
	mov dx, 186
	int 10h
	
	mov cx, 286
	mov dx, 186
	int 10h
	
	mov cx, 289
	mov dx, 186
	int 10h
	
	mov cx, 294
	mov dx, 186
	int 10h
	
	mov cx, 297
	mov dx, 186
	int 10h
	
	mov cx, 302
	mov dx, 186
	int 10h
	
	mov cx, 305
	mov dx, 186
	int 10h
	
	mov cx, 306
	mov dx, 186
	int 10h
	
	mov cx, 309
	mov dx, 186
	int 10h
	
	mov cx, 321
	mov dx, 186
	int 10h
	
	mov cx, 322
	mov dx, 186
	int 10h
	
	mov cx, 326
	mov dx, 186
	int 10h
	
	mov cx, 333
	mov dx, 186
	int 10h
	
	mov cx, 337
	mov dx, 186
	int 10h
	
	mov cx, 338
	mov dx, 186
	int 10h
	
	mov cx, 341
	mov dx, 186
	int 10h
	
	mov cx, 345
	mov dx, 186
	int 10h
	
	mov cx, 349
	mov dx, 186
	int 10h
	
	mov cx, 350
	mov dx, 186
	int 10h
	
	mov cx, 352
	mov dx, 186
	int 10h
	
	mov cx, 355
	mov dx, 186
	int 10h
	
	mov cx, 359
	mov dx, 186
	int 10h
	
	mov cx, 365
	mov dx, 186
	int 10h
	
	mov cx, 369
	mov dx, 186
	int 10h
	
	mov cx, 370
	mov dx, 186
	int 10h
	
	mov cx, 373
	mov dx, 186
	int 10h
	
	mov cx, 378
	mov dx, 186
	int 10h
	
	mov cx, 382
	mov dx, 186
	int 10h
	
	mov cx, 393
	mov dx, 186
	int 10h
	
	mov cx, 398
	mov dx, 186
	int 10h
	
	mov cx, 401
	mov dx, 186
	int 10h
	
	mov cx, 402
	mov dx, 186
	int 10h
	
	mov cx, 405
	mov dx, 186
	int 10h
	
	mov cx, 417
	mov dx, 186
	int 10h
	
	mov cx, 425
	mov dx, 186
	int 10h
	
	mov cx, 430
	mov dx, 186
	int 10h
	
	mov cx, 434
	mov dx, 186
	int 10h
	
	mov cx, 442
	mov dx, 186
	int 10h
	
	mov cx, 448
	mov dx, 186
	int 10h
	
	mov cx, 451
	mov dx, 186
	int 10h
	
	mov cx, 455
	mov dx, 186
	int 10h
	
	mov cx, 461
	mov dx, 186
	int 10h
	
	mov cx, 465
	mov dx, 186
	int 10h
	
	mov cx, 466
	mov dx, 186
	int 10h
	
	mov cx, 469
	mov dx, 186
	int 10h
	
	mov cx, 474
	mov dx, 186
	int 10h
	
	mov cx, 478
	mov dx, 186
	int 10h
	
	mov cx, 488
	mov dx, 186
	int 10h
	
	mov cx, 489
	mov dx, 186
	int 10h
	
	mov cx, 491
	mov dx, 186
	int 10h
	
	mov cx, 492
	mov dx, 186
	int 10h
	
	mov cx, 494
	mov dx, 186
	int 10h
	
	mov cx, 501
	mov dx, 186
	int 10h
	
	mov cx, 505
	mov dx, 186
	int 10h
	
	mov cx, 506
	mov dx, 186
	int 10h
	
	mov cx, 510
	mov dx, 186
	int 10h
	
	mov cx, 513
	mov dx, 186
	int 10h
	
	mov cx, 518
	mov dx, 186
	int 10h
	
	mov cx, 522
	mov dx, 186
	int 10h
	
	mov cx, 533
	mov dx, 186
	int 10h
	
	mov cx, 538
	mov dx, 186
	int 10h
	
	mov cx, 546
	mov dx, 186
	int 10h
	
	mov cx, 553
	mov dx, 186
	int 10h
	
	mov cx, 558
	mov dx, 186
	int 10h
	
	mov cx, 561
	mov dx, 186
	int 10h
	
	mov cx, 562
	mov dx, 186
	int 10h
	
	mov cx, 565
	mov dx, 186
	int 10h
	
	mov cx, 570
	mov dx, 186
	int 10h
	
	mov cx, 574
	mov dx, 186
	int 10h
	
	mov cx, 577
	mov dx, 186
	int 10h
	
	mov cx, 578
	mov dx, 186
	int 10h
	
	mov cx, 581
	mov dx, 186
	int 10h
	
	mov cx, 3
	mov dx, 187
	int 10h
	
	mov cx, 10
	mov dx, 187
	int 10h
	
	mov cx, 26
	mov dx, 187
	int 10h
	
	mov cx, 33
	mov dx, 187
	int 10h
	
	mov cx, 38
	mov dx, 187
	int 10h
	
	mov cx, 44
	mov dx, 187
	int 10h
	
	mov cx, 49
	mov dx, 187
	int 10h
	
	mov cx, 50
	mov dx, 187
	int 10h
	
	mov cx, 68
	mov dx, 187
	int 10h
	
	mov cx, 73
	mov dx, 187
	int 10h
	
	mov cx, 74
	mov dx, 187
	int 10h
	
	mov cx, 93
	mov dx, 187
	int 10h
	
	mov cx, 105
	mov dx, 187
	int 10h
	
	mov cx, 110
	mov dx, 187
	int 10h
	
	mov cx, 113
	mov dx, 187
	int 10h
	
	mov cx, 118
	mov dx, 187
	int 10h
	
	mov cx, 121
	mov dx, 187
	int 10h
	
	mov cx, 123
	mov dx, 187
	int 10h
	
	mov cx, 124
	mov dx, 187
	int 10h
	
	mov cx, 126
	mov dx, 187
	int 10h
	
	mov cx, 140
	mov dx, 187
	int 10h
	
	mov cx, 145
	mov dx, 187
	int 10h
	
	mov cx, 150
	mov dx, 187
	int 10h
	
	mov cx, 153
	mov dx, 187
	int 10h
	
	mov cx, 154
	mov dx, 187
	int 10h
	
	mov cx, 162
	mov dx, 187
	int 10h
	
	mov cx, 173
	mov dx, 187
	int 10h
	
	mov cx, 180
	mov dx, 187
	int 10h
	
	mov cx, 188
	mov dx, 187
	int 10h
	
	mov cx, 197
	mov dx, 187
	int 10h
	
	mov cx, 202
	mov dx, 187
	int 10h
	
	mov cx, 212
	mov dx, 187
	int 10h
	
	mov cx, 217
	mov dx, 187
	int 10h
	
	mov cx, 222
	mov dx, 187
	int 10h
	
	mov cx, 225
	mov dx, 187
	int 10h
	
	mov cx, 230
	mov dx, 187
	int 10h
	
	mov cx, 253
	mov dx, 187
	int 10h
	
	mov cx, 257
	mov dx, 187
	int 10h
	
	mov cx, 258
	mov dx, 187
	int 10h
	
	mov cx, 265
	mov dx, 187
	int 10h
	
	mov cx, 267
	mov dx, 187
	int 10h
	
	mov cx, 281
	mov dx, 187
	int 10h
	
	mov cx, 286
	mov dx, 187
	int 10h
	
	mov cx, 289
	mov dx, 187
	int 10h
	
	mov cx, 294
	mov dx, 187
	int 10h
	
	mov cx, 297
	mov dx, 187
	int 10h
	
	mov cx, 302
	mov dx, 187
	int 10h
	
	mov cx, 305
	mov dx, 187
	int 10h
	
	mov cx, 321
	mov dx, 187
	int 10h
	
	mov cx, 326
	mov dx, 187
	int 10h
	
	mov cx, 333
	mov dx, 187
	int 10h
	
	mov cx, 337
	mov dx, 187
	int 10h
	
	mov cx, 345
	mov dx, 187
	int 10h
	
	mov cx, 350
	mov dx, 187
	int 10h
	
	mov cx, 353
	mov dx, 187
	int 10h
	
	mov cx, 355
	mov dx, 187
	int 10h
	
	mov cx, 356
	mov dx, 187
	int 10h
	
	mov cx, 358
	mov dx, 187
	int 10h
	
	mov cx, 365
	mov dx, 187
	int 10h
	
	mov cx, 369
	mov dx, 187
	int 10h
	
	mov cx, 377
	mov dx, 187
	int 10h
	
	mov cx, 382
	mov dx, 187
	int 10h
	
	mov cx, 393
	mov dx, 187
	int 10h
	
	mov cx, 398
	mov dx, 187
	int 10h
	
	mov cx, 401
	mov dx, 187
	int 10h
	
	mov cx, 417
	mov dx, 187
	int 10h
	
	mov cx, 418
	mov dx, 187
	int 10h
	
	mov cx, 425
	mov dx, 187
	int 10h
	
	mov cx, 430
	mov dx, 187
	int 10h
	
	mov cx, 434
	mov dx, 187
	int 10h
	
	mov cx, 442
	mov dx, 187
	int 10h
	
	mov cx, 449
	mov dx, 187
	int 10h
	
	mov cx, 451
	mov dx, 187
	int 10h
	
	mov cx, 452
	mov dx, 187
	int 10h
	
	mov cx, 454
	mov dx, 187
	int 10h
	
	mov cx, 461
	mov dx, 187
	int 10h
	
	mov cx, 465
	mov dx, 187
	int 10h
	
	mov cx, 473
	mov dx, 187
	int 10h
	
	mov cx, 478
	mov dx, 187
	int 10h
	
	mov cx, 488
	mov dx, 187
	int 10h
	
	mov cx, 491
	mov dx, 187
	int 10h
	
	mov cx, 494
	mov dx, 187
	int 10h
	
	mov cx, 501
	mov dx, 187
	int 10h
	
	mov cx, 505
	mov dx, 187
	int 10h
	
	mov cx, 510
	mov dx, 187
	int 10h
	
	mov cx, 513
	mov dx, 187
	int 10h
	
	mov cx, 518
	mov dx, 187
	int 10h
	
	mov cx, 522
	mov dx, 187
	int 10h
	
	mov cx, 533
	mov dx, 187
	int 10h
	
	mov cx, 537
	mov dx, 187
	int 10h
	
	mov cx, 546
	mov dx, 187
	int 10h
	
	mov cx, 553
	mov dx, 187
	int 10h
	
	mov cx, 558
	mov dx, 187
	int 10h
	
	mov cx, 561
	mov dx, 187
	int 10h
	
	mov cx, 569
	mov dx, 187
	int 10h
	
	mov cx, 574
	mov dx, 187
	int 10h
	
	mov cx, 577
	mov dx, 187
	int 10h
	
	mov cx, 3
	mov dx, 188
	int 10h
	
	mov cx, 10
	mov dx, 188
	int 10h
	
	mov cx, 26
	mov dx, 188
	int 10h
	
	mov cx, 33
	mov dx, 188
	int 10h
	
	mov cx, 38
	mov dx, 188
	int 10h
	
	mov cx, 44
	mov dx, 188
	int 10h
	
	mov cx, 51
	mov dx, 188
	int 10h
	
	mov cx, 52
	mov dx, 188
	int 10h
	
	mov cx, 68
	mov dx, 188
	int 10h
	
	mov cx, 75
	mov dx, 188
	int 10h
	
	mov cx, 76
	mov dx, 188
	int 10h
	
	mov cx, 90
	mov dx, 188
	int 10h
	
	mov cx, 91
	mov dx, 188
	int 10h
	
	mov cx, 92
	mov dx, 188
	int 10h
	
	mov cx, 93
	mov dx, 188
	int 10h
	
	mov cx, 105
	mov dx, 188
	int 10h
	
	mov cx, 110
	mov dx, 188
	int 10h
	
	mov cx, 113
	mov dx, 188
	int 10h
	
	mov cx, 114
	mov dx, 188
	int 10h
	
	mov cx, 115
	mov dx, 188
	int 10h
	
	mov cx, 116
	mov dx, 188
	int 10h
	
	mov cx, 117
	mov dx, 188
	int 10h
	
	mov cx, 118
	mov dx, 188
	int 10h
	
	mov cx, 121
	mov dx, 188
	int 10h
	
	mov cx, 123
	mov dx, 188
	int 10h
	
	mov cx, 124
	mov dx, 188
	int 10h
	
	mov cx, 126
	mov dx, 188
	int 10h
	
	mov cx, 140
	mov dx, 188
	int 10h
	
	mov cx, 145
	mov dx, 188
	int 10h
	
	mov cx, 150
	mov dx, 188
	int 10h
	
	mov cx, 155
	mov dx, 188
	int 10h
	
	mov cx, 156
	mov dx, 188
	int 10h
	
	mov cx, 162
	mov dx, 188
	int 10h
	
	mov cx, 170
	mov dx, 188
	int 10h
	
	mov cx, 171
	mov dx, 188
	int 10h
	
	mov cx, 172
	mov dx, 188
	int 10h
	
	mov cx, 173
	mov dx, 188
	int 10h
	
	mov cx, 180
	mov dx, 188
	int 10h
	
	mov cx, 188
	mov dx, 188
	int 10h
	
	mov cx, 194
	mov dx, 188
	int 10h
	
	mov cx, 195
	mov dx, 188
	int 10h
	
	mov cx, 196
	mov dx, 188
	int 10h
	
	mov cx, 197
	mov dx, 188
	int 10h
	
	mov cx, 202
	mov dx, 188
	int 10h
	
	mov cx, 212
	mov dx, 188
	int 10h
	
	mov cx, 217
	mov dx, 188
	int 10h
	
	mov cx, 222
	mov dx, 188
	int 10h
	
	mov cx, 225
	mov dx, 188
	int 10h
	
	mov cx, 230
	mov dx, 188
	int 10h
	
	mov cx, 250
	mov dx, 188
	int 10h
	
	mov cx, 251
	mov dx, 188
	int 10h
	
	mov cx, 252
	mov dx, 188
	int 10h
	
	mov cx, 253
	mov dx, 188
	int 10h
	
	mov cx, 259
	mov dx, 188
	int 10h
	
	mov cx, 260
	mov dx, 188
	int 10h
	
	mov cx, 265
	mov dx, 188
	int 10h
	
	mov cx, 266
	mov dx, 188
	int 10h
	
	mov cx, 282
	mov dx, 188
	int 10h
	
	mov cx, 285
	mov dx, 188
	int 10h
	
	mov cx, 289
	mov dx, 188
	int 10h
	
	mov cx, 294
	mov dx, 188
	int 10h
	
	mov cx, 297
	mov dx, 188
	int 10h
	
	mov cx, 302
	mov dx, 188
	int 10h
	
	mov cx, 305
	mov dx, 188
	int 10h
	
	mov cx, 321
	mov dx, 188
	int 10h
	
	mov cx, 326
	mov dx, 188
	int 10h
	
	mov cx, 330
	mov dx, 188
	int 10h
	
	mov cx, 331
	mov dx, 188
	int 10h
	
	mov cx, 332
	mov dx, 188
	int 10h
	
	mov cx, 333
	mov dx, 188
	int 10h
	
	mov cx, 337
	mov dx, 188
	int 10h
	
	mov cx, 345
	mov dx, 188
	int 10h
	
	mov cx, 350
	mov dx, 188
	int 10h
	
	mov cx, 353
	mov dx, 188
	int 10h
	
	mov cx, 355
	mov dx, 188
	int 10h
	
	mov cx, 356
	mov dx, 188
	int 10h
	
	mov cx, 358
	mov dx, 188
	int 10h
	
	mov cx, 362
	mov dx, 188
	int 10h
	
	mov cx, 363
	mov dx, 188
	int 10h
	
	mov cx, 364
	mov dx, 188
	int 10h
	
	mov cx, 365
	mov dx, 188
	int 10h
	
	mov cx, 369
	mov dx, 188
	int 10h
	
	mov cx, 377
	mov dx, 188
	int 10h
	
	mov cx, 378
	mov dx, 188
	int 10h
	
	mov cx, 379
	mov dx, 188
	int 10h
	
	mov cx, 380
	mov dx, 188
	int 10h
	
	mov cx, 381
	mov dx, 188
	int 10h
	
	mov cx, 382
	mov dx, 188
	int 10h
	
	mov cx, 393
	mov dx, 188
	int 10h
	
	mov cx, 398
	mov dx, 188
	int 10h
	
	mov cx, 401
	mov dx, 188
	int 10h
	
	mov cx, 419
	mov dx, 188
	int 10h
	
	mov cx, 420
	mov dx, 188
	int 10h
	
	mov cx, 425
	mov dx, 188
	int 10h
	
	mov cx, 430
	mov dx, 188
	int 10h
	
	mov cx, 434
	mov dx, 188
	int 10h
	
	mov cx, 442
	mov dx, 188
	int 10h
	
	mov cx, 449
	mov dx, 188
	int 10h
	
	mov cx, 451
	mov dx, 188
	int 10h
	
	mov cx, 452
	mov dx, 188
	int 10h
	
	mov cx, 454
	mov dx, 188
	int 10h
	
	mov cx, 458
	mov dx, 188
	int 10h
	
	mov cx, 459
	mov dx, 188
	int 10h
	
	mov cx, 460
	mov dx, 188
	int 10h
	
	mov cx, 461
	mov dx, 188
	int 10h
	
	mov cx, 465
	mov dx, 188
	int 10h
	
	mov cx, 473
	mov dx, 188
	int 10h
	
	mov cx, 474
	mov dx, 188
	int 10h
	
	mov cx, 475
	mov dx, 188
	int 10h
	
	mov cx, 476
	mov dx, 188
	int 10h
	
	mov cx, 477
	mov dx, 188
	int 10h
	
	mov cx, 478
	mov dx, 188
	int 10h
	
	mov cx, 488
	mov dx, 188
	int 10h
	
	mov cx, 491
	mov dx, 188
	int 10h
	
	mov cx, 494
	mov dx, 188
	int 10h
	
	mov cx, 498
	mov dx, 188
	int 10h
	
	mov cx, 499
	mov dx, 188
	int 10h
	
	mov cx, 500
	mov dx, 188
	int 10h
	
	mov cx, 501
	mov dx, 188
	int 10h
	
	mov cx, 505
	mov dx, 188
	int 10h
	
	mov cx, 510
	mov dx, 188
	int 10h
	
	mov cx, 513
	mov dx, 188
	int 10h
	
	mov cx, 518
	mov dx, 188
	int 10h
	
	mov cx, 522
	mov dx, 188
	int 10h
	
	mov cx, 530
	mov dx, 188
	int 10h
	
	mov cx, 531
	mov dx, 188
	int 10h
	
	mov cx, 532
	mov dx, 188
	int 10h
	
	mov cx, 533
	mov dx, 188
	int 10h
	
	mov cx, 537
	mov dx, 188
	int 10h
	
	mov cx, 546
	mov dx, 188
	int 10h
	
	mov cx, 553
	mov dx, 188
	int 10h
	
	mov cx, 558
	mov dx, 188
	int 10h
	
	mov cx, 561
	mov dx, 188
	int 10h
	
	mov cx, 569
	mov dx, 188
	int 10h
	
	mov cx, 570
	mov dx, 188
	int 10h
	
	mov cx, 571
	mov dx, 188
	int 10h
	
	mov cx, 572
	mov dx, 188
	int 10h
	
	mov cx, 573
	mov dx, 188
	int 10h
	
	mov cx, 574
	mov dx, 188
	int 10h
	
	mov cx, 577
	mov dx, 188
	int 10h
	
	mov cx, 3
	mov dx, 189
	int 10h
	
	mov cx, 10
	mov dx, 189
	int 10h
	
	mov cx, 26
	mov dx, 189
	int 10h
	
	mov cx, 33
	mov dx, 189
	int 10h
	
	mov cx, 38
	mov dx, 189
	int 10h
	
	mov cx, 44
	mov dx, 189
	int 10h
	
	mov cx, 53
	mov dx, 189
	int 10h
	
	mov cx, 68
	mov dx, 189
	int 10h
	
	mov cx, 77
	mov dx, 189
	int 10h
	
	mov cx, 89
	mov dx, 189
	int 10h
	
	mov cx, 93
	mov dx, 189
	int 10h
	
	mov cx, 105
	mov dx, 189
	int 10h
	
	mov cx, 110
	mov dx, 189
	int 10h
	
	mov cx, 113
	mov dx, 189
	int 10h
	
	mov cx, 121
	mov dx, 189
	int 10h
	
	mov cx, 122
	mov dx, 189
	int 10h
	
	mov cx, 124
	mov dx, 189
	int 10h
	
	mov cx, 126
	mov dx, 189
	int 10h
	
	mov cx, 140
	mov dx, 189
	int 10h
	
	mov cx, 145
	mov dx, 189
	int 10h
	
	mov cx, 150
	mov dx, 189
	int 10h
	
	mov cx, 157
	mov dx, 189
	int 10h
	
	mov cx, 162
	mov dx, 189
	int 10h
	
	mov cx, 169
	mov dx, 189
	int 10h
	
	mov cx, 173
	mov dx, 189
	int 10h
	
	mov cx, 180
	mov dx, 189
	int 10h
	
	mov cx, 188
	mov dx, 189
	int 10h
	
	mov cx, 193
	mov dx, 189
	int 10h
	
	mov cx, 197
	mov dx, 189
	int 10h
	
	mov cx, 202
	mov dx, 189
	int 10h
	
	mov cx, 212
	mov dx, 189
	int 10h
	
	mov cx, 217
	mov dx, 189
	int 10h
	
	mov cx, 222
	mov dx, 189
	int 10h
	
	mov cx, 225
	mov dx, 189
	int 10h
	
	mov cx, 230
	mov dx, 189
	int 10h
	
	mov cx, 249
	mov dx, 189
	int 10h
	
	mov cx, 253
	mov dx, 189
	int 10h
	
	mov cx, 261
	mov dx, 189
	int 10h
	
	mov cx, 265
	mov dx, 189
	int 10h
	
	mov cx, 267
	mov dx, 189
	int 10h
	
	mov cx, 282
	mov dx, 189
	int 10h
	
	mov cx, 285
	mov dx, 189
	int 10h
	
	mov cx, 289
	mov dx, 189
	int 10h
	
	mov cx, 294
	mov dx, 189
	int 10h
	
	mov cx, 297
	mov dx, 189
	int 10h
	
	mov cx, 302
	mov dx, 189
	int 10h
	
	mov cx, 305
	mov dx, 189
	int 10h
	
	mov cx, 321
	mov dx, 189
	int 10h
	
	mov cx, 326
	mov dx, 189
	int 10h
	
	mov cx, 329
	mov dx, 189
	int 10h
	
	mov cx, 333
	mov dx, 189
	int 10h
	
	mov cx, 337
	mov dx, 189
	int 10h
	
	mov cx, 345
	mov dx, 189
	int 10h
	
	mov cx, 350
	mov dx, 189
	int 10h
	
	mov cx, 353
	mov dx, 189
	int 10h
	
	mov cx, 354
	mov dx, 189
	int 10h
	
	mov cx, 356
	mov dx, 189
	int 10h
	
	mov cx, 358
	mov dx, 189
	int 10h
	
	mov cx, 361
	mov dx, 189
	int 10h
	
	mov cx, 365
	mov dx, 189
	int 10h
	
	mov cx, 369
	mov dx, 189
	int 10h
	
	mov cx, 377
	mov dx, 189
	int 10h
	
	mov cx, 393
	mov dx, 189
	int 10h
	
	mov cx, 398
	mov dx, 189
	int 10h
	
	mov cx, 401
	mov dx, 189
	int 10h
	
	mov cx, 421
	mov dx, 189
	int 10h
	
	mov cx, 425
	mov dx, 189
	int 10h
	
	mov cx, 430
	mov dx, 189
	int 10h
	
	mov cx, 434
	mov dx, 189
	int 10h
	
	mov cx, 442
	mov dx, 189
	int 10h
	
	mov cx, 449
	mov dx, 189
	int 10h
	
	mov cx, 450
	mov dx, 189
	int 10h
	
	mov cx, 452
	mov dx, 189
	int 10h
	
	mov cx, 454
	mov dx, 189
	int 10h
	
	mov cx, 457
	mov dx, 189
	int 10h
	
	mov cx, 461
	mov dx, 189
	int 10h
	
	mov cx, 465
	mov dx, 189
	int 10h
	
	mov cx, 473
	mov dx, 189
	int 10h
	
	mov cx, 488
	mov dx, 189
	int 10h
	
	mov cx, 491
	mov dx, 189
	int 10h
	
	mov cx, 494
	mov dx, 189
	int 10h
	
	mov cx, 497
	mov dx, 189
	int 10h
	
	mov cx, 501
	mov dx, 189
	int 10h
	
	mov cx, 505
	mov dx, 189
	int 10h
	
	mov cx, 510
	mov dx, 189
	int 10h
	
	mov cx, 513
	mov dx, 189
	int 10h
	
	mov cx, 518
	mov dx, 189
	int 10h
	
	mov cx, 522
	mov dx, 189
	int 10h
	
	mov cx, 529
	mov dx, 189
	int 10h
	
	mov cx, 533
	mov dx, 189
	int 10h
	
	mov cx, 537
	mov dx, 189
	int 10h
	
	mov cx, 546
	mov dx, 189
	int 10h
	
	mov cx, 553
	mov dx, 189
	int 10h
	
	mov cx, 558
	mov dx, 189
	int 10h
	
	mov cx, 561
	mov dx, 189
	int 10h
	
	mov cx, 569
	mov dx, 189
	int 10h
	
	mov cx, 577
	mov dx, 189
	int 10h
	
	mov cx, 3
	mov dx, 190
	int 10h
	
	mov cx, 10
	mov dx, 190
	int 10h
	
	mov cx, 26
	mov dx, 190
	int 10h
	
	mov cx, 33
	mov dx, 190
	int 10h
	
	mov cx, 38
	mov dx, 190
	int 10h
	
	mov cx, 44
	mov dx, 190
	int 10h
	
	mov cx, 53
	mov dx, 190
	int 10h
	
	mov cx, 68
	mov dx, 190
	int 10h
	
	mov cx, 77
	mov dx, 190
	int 10h
	
	mov cx, 89
	mov dx, 190
	int 10h
	
	mov cx, 93
	mov dx, 190
	int 10h
	
	mov cx, 105
	mov dx, 190
	int 10h
	
	mov cx, 110
	mov dx, 190
	int 10h
	
	mov cx, 113
	mov dx, 190
	int 10h
	
	mov cx, 122
	mov dx, 190
	int 10h
	
	mov cx, 125
	mov dx, 190
	int 10h
	
	mov cx, 140
	mov dx, 190
	int 10h
	
	mov cx, 145
	mov dx, 190
	int 10h
	
	mov cx, 150
	mov dx, 190
	int 10h
	
	mov cx, 157
	mov dx, 190
	int 10h
	
	mov cx, 162
	mov dx, 190
	int 10h
	
	mov cx, 169
	mov dx, 190
	int 10h
	
	mov cx, 173
	mov dx, 190
	int 10h
	
	mov cx, 180
	mov dx, 190
	int 10h
	
	mov cx, 188
	mov dx, 190
	int 10h
	
	mov cx, 193
	mov dx, 190
	int 10h
	
	mov cx, 197
	mov dx, 190
	int 10h
	
	mov cx, 202
	mov dx, 190
	int 10h
	
	mov cx, 212
	mov dx, 190
	int 10h
	
	mov cx, 217
	mov dx, 190
	int 10h
	
	mov cx, 222
	mov dx, 190
	int 10h
	
	mov cx, 225
	mov dx, 190
	int 10h
	
	mov cx, 230
	mov dx, 190
	int 10h
	
	mov cx, 234
	mov dx, 190
	int 10h
	
	mov cx, 235
	mov dx, 190
	int 10h
	
	mov cx, 249
	mov dx, 190
	int 10h
	
	mov cx, 253
	mov dx, 190
	int 10h
	
	mov cx, 261
	mov dx, 190
	int 10h
	
	mov cx, 265
	mov dx, 190
	int 10h
	
	mov cx, 268
	mov dx, 190
	int 10h
	
	mov cx, 283
	mov dx, 190
	int 10h
	
	mov cx, 284
	mov dx, 190
	int 10h
	
	mov cx, 289
	mov dx, 190
	int 10h
	
	mov cx, 294
	mov dx, 190
	int 10h
	
	mov cx, 297
	mov dx, 190
	int 10h
	
	mov cx, 301
	mov dx, 190
	int 10h
	
	mov cx, 302
	mov dx, 190
	int 10h
	
	mov cx, 305
	mov dx, 190
	int 10h
	
	mov cx, 321
	mov dx, 190
	int 10h
	
	mov cx, 326
	mov dx, 190
	int 10h
	
	mov cx, 329
	mov dx, 190
	int 10h
	
	mov cx, 333
	mov dx, 190
	int 10h
	
	mov cx, 337
	mov dx, 190
	int 10h
	
	mov cx, 345
	mov dx, 190
	int 10h
	
	mov cx, 349
	mov dx, 190
	int 10h
	
	mov cx, 350
	mov dx, 190
	int 10h
	
	mov cx, 354
	mov dx, 190
	int 10h
	
	mov cx, 357
	mov dx, 190
	int 10h
	
	mov cx, 361
	mov dx, 190
	int 10h
	
	mov cx, 365
	mov dx, 190
	int 10h
	
	mov cx, 369
	mov dx, 190
	int 10h
	
	mov cx, 377
	mov dx, 190
	int 10h
	
	mov cx, 393
	mov dx, 190
	int 10h
	
	mov cx, 398
	mov dx, 190
	int 10h
	
	mov cx, 401
	mov dx, 190
	int 10h
	
	mov cx, 421
	mov dx, 190
	int 10h
	
	mov cx, 425
	mov dx, 190
	int 10h
	
	mov cx, 430
	mov dx, 190
	int 10h
	
	mov cx, 434
	mov dx, 190
	int 10h
	
	mov cx, 442
	mov dx, 190
	int 10h
	
	mov cx, 450
	mov dx, 190
	int 10h
	
	mov cx, 453
	mov dx, 190
	int 10h
	
	mov cx, 457
	mov dx, 190
	int 10h
	
	mov cx, 461
	mov dx, 190
	int 10h
	
	mov cx, 465
	mov dx, 190
	int 10h
	
	mov cx, 473
	mov dx, 190
	int 10h
	
	mov cx, 488
	mov dx, 190
	int 10h
	
	mov cx, 491
	mov dx, 190
	int 10h
	
	mov cx, 494
	mov dx, 190
	int 10h
	
	mov cx, 497
	mov dx, 190
	int 10h
	
	mov cx, 501
	mov dx, 190
	int 10h
	
	mov cx, 505
	mov dx, 190
	int 10h
	
	mov cx, 510
	mov dx, 190
	int 10h
	
	mov cx, 513
	mov dx, 190
	int 10h
	
	mov cx, 517
	mov dx, 190
	int 10h
	
	mov cx, 518
	mov dx, 190
	int 10h
	
	mov cx, 522
	mov dx, 190
	int 10h
	
	mov cx, 529
	mov dx, 190
	int 10h
	
	mov cx, 533
	mov dx, 190
	int 10h
	
	mov cx, 538
	mov dx, 190
	int 10h
	
	mov cx, 546
	mov dx, 190
	int 10h
	
	mov cx, 553
	mov dx, 190
	int 10h
	
	mov cx, 557
	mov dx, 190
	int 10h
	
	mov cx, 558
	mov dx, 190
	int 10h
	
	mov cx, 561
	mov dx, 190
	int 10h
	
	mov cx, 569
	mov dx, 190
	int 10h
	
	mov cx, 577
	mov dx, 190
	int 10h
	
	mov cx, 1
	mov dx, 191
	int 10h
	
	mov cx, 2
	mov dx, 191
	int 10h
	
	mov cx, 3
	mov dx, 191
	int 10h
	
	mov cx, 4
	mov dx, 191
	int 10h
	
	mov cx, 5
	mov dx, 191
	int 10h
	
	mov cx, 10
	mov dx, 191
	int 10h
	
	mov cx, 27
	mov dx, 191
	int 10h
	
	mov cx, 28
	mov dx, 191
	int 10h
	
	mov cx, 29
	mov dx, 191
	int 10h
	
	mov cx, 33
	mov dx, 191
	int 10h
	
	mov cx, 38
	mov dx, 191
	int 10h
	
	mov cx, 44
	mov dx, 191
	int 10h
	
	mov cx, 49
	mov dx, 191
	int 10h
	
	mov cx, 50
	mov dx, 191
	int 10h
	
	mov cx, 51
	mov dx, 191
	int 10h
	
	mov cx, 52
	mov dx, 191
	int 10h
	
	mov cx, 68
	mov dx, 191
	int 10h
	
	mov cx, 73
	mov dx, 191
	int 10h
	
	mov cx, 74
	mov dx, 191
	int 10h
	
	mov cx, 75
	mov dx, 191
	int 10h
	
	mov cx, 76
	mov dx, 191
	int 10h
	
	mov cx, 90
	mov dx, 191
	int 10h
	
	mov cx, 91
	mov dx, 191
	int 10h
	
	mov cx, 92
	mov dx, 191
	int 10h
	
	mov cx, 93
	mov dx, 191
	int 10h
	
	mov cx, 94
	mov dx, 191
	int 10h
	
	mov cx, 105
	mov dx, 191
	int 10h
	
	mov cx, 110
	mov dx, 191
	int 10h
	
	mov cx, 114
	mov dx, 191
	int 10h
	
	mov cx, 115
	mov dx, 191
	int 10h
	
	mov cx, 116
	mov dx, 191
	int 10h
	
	mov cx, 117
	mov dx, 191
	int 10h
	
	mov cx, 118
	mov dx, 191
	int 10h
	
	mov cx, 122
	mov dx, 191
	int 10h
	
	mov cx, 125
	mov dx, 191
	int 10h
	
	mov cx, 140
	mov dx, 191
	int 10h
	
	mov cx, 145
	mov dx, 191
	int 10h
	
	mov cx, 150
	mov dx, 191
	int 10h
	
	mov cx, 153
	mov dx, 191
	int 10h
	
	mov cx, 154
	mov dx, 191
	int 10h
	
	mov cx, 155
	mov dx, 191
	int 10h
	
	mov cx, 156
	mov dx, 191
	int 10h
	
	mov cx, 163
	mov dx, 191
	int 10h
	
	mov cx, 164
	mov dx, 191
	int 10h
	
	mov cx, 165
	mov dx, 191
	int 10h
	
	mov cx, 170
	mov dx, 191
	int 10h
	
	mov cx, 171
	mov dx, 191
	int 10h
	
	mov cx, 172
	mov dx, 191
	int 10h
	
	mov cx, 173
	mov dx, 191
	int 10h
	
	mov cx, 174
	mov dx, 191
	int 10h
	
	mov cx, 180
	mov dx, 191
	int 10h
	
	mov cx, 188
	mov dx, 191
	int 10h
	
	mov cx, 194
	mov dx, 191
	int 10h
	
	mov cx, 195
	mov dx, 191
	int 10h
	
	mov cx, 196
	mov dx, 191
	int 10h
	
	mov cx, 197
	mov dx, 191
	int 10h
	
	mov cx, 198
	mov dx, 191
	int 10h
	
	mov cx, 203
	mov dx, 191
	int 10h
	
	mov cx, 204
	mov dx, 191
	int 10h
	
	mov cx, 205
	mov dx, 191
	int 10h
	
	mov cx, 212
	mov dx, 191
	int 10h
	
	mov cx, 218
	mov dx, 191
	int 10h
	
	mov cx, 219
	mov dx, 191
	int 10h
	
	mov cx, 220
	mov dx, 191
	int 10h
	
	mov cx, 221
	mov dx, 191
	int 10h
	
	mov cx, 225
	mov dx, 191
	int 10h
	
	mov cx, 230
	mov dx, 191
	int 10h
	
	mov cx, 234
	mov dx, 191
	int 10h
	
	mov cx, 235
	mov dx, 191
	int 10h
	
	mov cx, 250
	mov dx, 191
	int 10h
	
	mov cx, 251
	mov dx, 191
	int 10h
	
	mov cx, 252
	mov dx, 191
	int 10h
	
	mov cx, 253
	mov dx, 191
	int 10h
	
	mov cx, 254
	mov dx, 191
	int 10h
	
	mov cx, 257
	mov dx, 191
	int 10h
	
	mov cx, 258
	mov dx, 191
	int 10h
	
	mov cx, 259
	mov dx, 191
	int 10h
	
	mov cx, 260
	mov dx, 191
	int 10h
	
	mov cx, 265
	mov dx, 191
	int 10h
	
	mov cx, 269
	mov dx, 191
	int 10h
	
	mov cx, 283
	mov dx, 191
	int 10h
	
	mov cx, 284
	mov dx, 191
	int 10h
	
	mov cx, 290
	mov dx, 191
	int 10h
	
	mov cx, 291
	mov dx, 191
	int 10h
	
	mov cx, 292
	mov dx, 191
	int 10h
	
	mov cx, 293
	mov dx, 191
	int 10h
	
	mov cx, 298
	mov dx, 191
	int 10h
	
	mov cx, 299
	mov dx, 191
	int 10h
	
	mov cx, 300
	mov dx, 191
	int 10h
	
	mov cx, 302
	mov dx, 191
	int 10h
	
	mov cx, 305
	mov dx, 191
	int 10h
	
	mov cx, 321
	mov dx, 191
	int 10h
	
	mov cx, 326
	mov dx, 191
	int 10h
	
	mov cx, 330
	mov dx, 191
	int 10h
	
	mov cx, 331
	mov dx, 191
	int 10h
	
	mov cx, 332
	mov dx, 191
	int 10h
	
	mov cx, 333
	mov dx, 191
	int 10h
	
	mov cx, 334
	mov dx, 191
	int 10h
	
	mov cx, 337
	mov dx, 191
	int 10h
	
	mov cx, 346
	mov dx, 191
	int 10h
	
	mov cx, 347
	mov dx, 191
	int 10h
	
	mov cx, 348
	mov dx, 191
	int 10h
	
	mov cx, 350
	mov dx, 191
	int 10h
	
	mov cx, 354
	mov dx, 191
	int 10h
	
	mov cx, 357
	mov dx, 191
	int 10h
	
	mov cx, 362
	mov dx, 191
	int 10h
	
	mov cx, 363
	mov dx, 191
	int 10h
	
	mov cx, 364
	mov dx, 191
	int 10h
	
	mov cx, 365
	mov dx, 191
	int 10h
	
	mov cx, 366
	mov dx, 191
	int 10h
	
	mov cx, 369
	mov dx, 191
	int 10h
	
	mov cx, 378
	mov dx, 191
	int 10h
	
	mov cx, 379
	mov dx, 191
	int 10h
	
	mov cx, 380
	mov dx, 191
	int 10h
	
	mov cx, 381
	mov dx, 191
	int 10h
	
	mov cx, 382
	mov dx, 191
	int 10h
	
	mov cx, 394
	mov dx, 191
	int 10h
	
	mov cx, 395
	mov dx, 191
	int 10h
	
	mov cx, 396
	mov dx, 191
	int 10h
	
	mov cx, 397
	mov dx, 191
	int 10h
	
	mov cx, 401
	mov dx, 191
	int 10h
	
	mov cx, 417
	mov dx, 191
	int 10h
	
	mov cx, 418
	mov dx, 191
	int 10h
	
	mov cx, 419
	mov dx, 191
	int 10h
	
	mov cx, 420
	mov dx, 191
	int 10h
	
	mov cx, 426
	mov dx, 191
	int 10h
	
	mov cx, 427
	mov dx, 191
	int 10h
	
	mov cx, 428
	mov dx, 191
	int 10h
	
	mov cx, 429
	mov dx, 191
	int 10h
	
	mov cx, 434
	mov dx, 191
	int 10h
	
	mov cx, 443
	mov dx, 191
	int 10h
	
	mov cx, 444
	mov dx, 191
	int 10h
	
	mov cx, 445
	mov dx, 191
	int 10h
	
	mov cx, 450
	mov dx, 191
	int 10h
	
	mov cx, 453
	mov dx, 191
	int 10h
	
	mov cx, 458
	mov dx, 191
	int 10h
	
	mov cx, 459
	mov dx, 191
	int 10h
	
	mov cx, 460
	mov dx, 191
	int 10h
	
	mov cx, 461
	mov dx, 191
	int 10h
	
	mov cx, 462
	mov dx, 191
	int 10h
	
	mov cx, 465
	mov dx, 191
	int 10h
	
	mov cx, 474
	mov dx, 191
	int 10h
	
	mov cx, 475
	mov dx, 191
	int 10h
	
	mov cx, 476
	mov dx, 191
	int 10h
	
	mov cx, 477
	mov dx, 191
	int 10h
	
	mov cx, 478
	mov dx, 191
	int 10h
	
	mov cx, 488
	mov dx, 191
	int 10h
	
	mov cx, 491
	mov dx, 191
	int 10h
	
	mov cx, 494
	mov dx, 191
	int 10h
	
	mov cx, 498
	mov dx, 191
	int 10h
	
	mov cx, 499
	mov dx, 191
	int 10h
	
	mov cx, 500
	mov dx, 191
	int 10h
	
	mov cx, 501
	mov dx, 191
	int 10h
	
	mov cx, 502
	mov dx, 191
	int 10h
	
	mov cx, 505
	mov dx, 191
	int 10h
	
	mov cx, 510
	mov dx, 191
	int 10h
	
	mov cx, 514
	mov dx, 191
	int 10h
	
	mov cx, 515
	mov dx, 191
	int 10h
	
	mov cx, 516
	mov dx, 191
	int 10h
	
	mov cx, 518
	mov dx, 191
	int 10h
	
	mov cx, 522
	mov dx, 191
	int 10h
	
	mov cx, 530
	mov dx, 191
	int 10h
	
	mov cx, 531
	mov dx, 191
	int 10h
	
	mov cx, 532
	mov dx, 191
	int 10h
	
	mov cx, 533
	mov dx, 191
	int 10h
	
	mov cx, 534
	mov dx, 191
	int 10h
	
	mov cx, 539
	mov dx, 191
	int 10h
	
	mov cx, 540
	mov dx, 191
	int 10h
	
	mov cx, 541
	mov dx, 191
	int 10h
	
	mov cx, 542
	mov dx, 191
	int 10h
	
	mov cx, 547
	mov dx, 191
	int 10h
	
	mov cx, 548
	mov dx, 191
	int 10h
	
	mov cx, 549
	mov dx, 191
	int 10h
	
	mov cx, 554
	mov dx, 191
	int 10h
	
	mov cx, 555
	mov dx, 191
	int 10h
	
	mov cx, 556
	mov dx, 191
	int 10h
	
	mov cx, 558
	mov dx, 191
	int 10h
	
	mov cx, 561
	mov dx, 191
	int 10h
	
	mov cx, 570
	mov dx, 191
	int 10h
	
	mov cx, 571
	mov dx, 191
	int 10h
	
	mov cx, 572
	mov dx, 191
	int 10h
	
	mov cx, 573
	mov dx, 191
	int 10h
	
	mov cx, 574
	mov dx, 191
	int 10h
	
	mov cx, 577
	mov dx, 191
	int 10h
	
	mov cx, 235
	mov dx, 192
	int 10h
	
	mov cx, 283
	mov dx, 192
	int 10h
	
	mov cx, 234
	mov dx, 193
	int 10h
	
	mov cx, 282
	mov dx, 193
	int 10h
	
	mov cx, 283
	mov dx, 193
	int 10h
	
	mov cx, 280
	mov dx, 194
	int 10h
	
	mov cx, 281
	mov dx, 194
	int 10h
	
	mov cx, 282
	mov dx, 194
	int 10h
	
	mov cx, 3
	mov dx, 196
	int 10h
	
	mov cx, 4
	mov dx, 196
	int 10h
	
	mov cx, 5
	mov dx, 196
	int 10h
	
	mov cx, 6
	mov dx, 196
	int 10h
	
	mov cx, 75
	mov dx, 196
	int 10h
	
	mov cx, 76
	mov dx, 196
	int 10h
	
	mov cx, 94
	mov dx, 196
	int 10h
	
	mov cx, 150
	mov dx, 196
	int 10h
	
	mov cx, 235
	mov dx, 196
	int 10h
	
	mov cx, 236
	mov dx, 196
	int 10h
	
	mov cx, 249
	mov dx, 196
	int 10h
	
	mov cx, 302
	mov dx, 196
	int 10h
	
	mov cx, 2
	mov dx, 197
	int 10h
	
	mov cx, 75
	mov dx, 197
	int 10h
	
	mov cx, 76
	mov dx, 197
	int 10h
	
	mov cx, 94
	mov dx, 197
	int 10h
	
	mov cx, 150
	mov dx, 197
	int 10h
	
	mov cx, 235
	mov dx, 197
	int 10h
	
	mov cx, 236
	mov dx, 197
	int 10h
	
	mov cx, 249
	mov dx, 197
	int 10h
	
	mov cx, 302
	mov dx, 197
	int 10h
	
	mov cx, 2
	mov dx, 198
	int 10h
	
	mov cx, 64
	mov dx, 198
	int 10h
	
	mov cx, 71
	mov dx, 198
	int 10h
	
	mov cx, 94
	mov dx, 198
	int 10h
	
	mov cx, 150
	mov dx, 198
	int 10h
	
	mov cx, 162
	mov dx, 198
	int 10h
	
	mov cx, 249
	mov dx, 198
	int 10h
	
	mov cx, 258
	mov dx, 198
	int 10h
	
	mov cx, 302
	mov dx, 198
	int 10h
	
	mov cx, 0
	mov dx, 199
	int 10h
	
	mov cx, 1
	mov dx, 199
	int 10h
	
	mov cx, 2
	mov dx, 199
	int 10h
	
	mov cx, 3
	mov dx, 199
	int 10h
	
	mov cx, 4
	mov dx, 199
	int 10h
	
	mov cx, 5
	mov dx, 199
	int 10h
	
	mov cx, 6
	mov dx, 199
	int 10h
	
	mov cx, 10
	mov dx, 199
	int 10h
	
	mov cx, 11
	mov dx, 199
	int 10h
	
	mov cx, 12
	mov dx, 199
	int 10h
	
	mov cx, 13
	mov dx, 199
	int 10h
	
	mov cx, 17
	mov dx, 199
	int 10h
	
	mov cx, 19
	mov dx, 199
	int 10h
	
	mov cx, 20
	mov dx, 199
	int 10h
	
	mov cx, 21
	mov dx, 199
	int 10h
	
	mov cx, 34
	mov dx, 199
	int 10h
	
	mov cx, 35
	mov dx, 199
	int 10h
	
	mov cx, 36
	mov dx, 199
	int 10h
	
	mov cx, 41
	mov dx, 199
	int 10h
	
	mov cx, 43
	mov dx, 199
	int 10h
	
	mov cx, 44
	mov dx, 199
	int 10h
	
	mov cx, 45
	mov dx, 199
	int 10h
	
	mov cx, 48
	mov dx, 199
	int 10h
	
	mov cx, 55
	mov dx, 199
	int 10h
	
	mov cx, 64
	mov dx, 199
	int 10h
	
	mov cx, 71
	mov dx, 199
	int 10h
	
	mov cx, 73
	mov dx, 199
	int 10h
	
	mov cx, 74
	mov dx, 199
	int 10h
	
	mov cx, 75
	mov dx, 199
	int 10h
	
	mov cx, 76
	mov dx, 199
	int 10h
	
	mov cx, 81
	mov dx, 199
	int 10h
	
	mov cx, 83
	mov dx, 199
	int 10h
	
	mov cx, 84
	mov dx, 199
	int 10h
	
	mov cx, 85
	mov dx, 199
	int 10h
	
	mov cx, 90
	mov dx, 199
	int 10h
	
	mov cx, 91
	mov dx, 199
	int 10h
	
	mov cx, 92
	mov dx, 199
	int 10h
	
	mov cx, 94
	mov dx, 199
	int 10h
	
	mov cx, 98
	mov dx, 199
	int 10h
	
	mov cx, 99
	mov dx, 199
	int 10h
	
	mov cx, 100
	mov dx, 199
	int 10h
	
	mov cx, 101
	mov dx, 199
	int 10h
	
	mov cx, 104
	mov dx, 199
	int 10h
	
	mov cx, 111
	mov dx, 199
	int 10h
	
	mov cx, 114
	mov dx, 199
	int 10h
	
	mov cx, 115
	mov dx, 199
	int 10h
	
	mov cx, 116
	mov dx, 199
	int 10h
	
	mov cx, 117
	mov dx, 199
	int 10h
	
	mov cx, 129
	mov dx, 199
	int 10h
	
	mov cx, 134
	mov dx, 199
	int 10h
	
	mov cx, 137
	mov dx, 199
	int 10h
	
	mov cx, 139
	mov dx, 199
	int 10h
	
	mov cx, 140
	mov dx, 199
	int 10h
	
	mov cx, 141
	mov dx, 199
	int 10h
	
	mov cx, 146
	mov dx, 199
	int 10h
	
	mov cx, 147
	mov dx, 199
	int 10h
	
	mov cx, 148
	mov dx, 199
	int 10h
	
	mov cx, 150
	mov dx, 199
	int 10h
	
	mov cx, 154
	mov dx, 199
	int 10h
	
	mov cx, 155
	mov dx, 199
	int 10h
	
	mov cx, 156
	mov dx, 199
	int 10h
	
	mov cx, 160
	mov dx, 199
	int 10h
	
	mov cx, 161
	mov dx, 199
	int 10h
	
	mov cx, 162
	mov dx, 199
	int 10h
	
	mov cx, 163
	mov dx, 199
	int 10h
	
	mov cx, 164
	mov dx, 199
	int 10h
	
	mov cx, 165
	mov dx, 199
	int 10h
	
	mov cx, 170
	mov dx, 199
	int 10h
	
	mov cx, 171
	mov dx, 199
	int 10h
	
	mov cx, 172
	mov dx, 199
	int 10h
	
	mov cx, 173
	mov dx, 199
	int 10h
	
	mov cx, 178
	mov dx, 199
	int 10h
	
	mov cx, 179
	mov dx, 199
	int 10h
	
	mov cx, 180
	mov dx, 199
	int 10h
	
	mov cx, 181
	mov dx, 199
	int 10h
	
	mov cx, 192
	mov dx, 199
	int 10h
	
	mov cx, 199
	mov dx, 199
	int 10h
	
	mov cx, 202
	mov dx, 199
	int 10h
	
	mov cx, 203
	mov dx, 199
	int 10h
	
	mov cx, 204
	mov dx, 199
	int 10h
	
	mov cx, 205
	mov dx, 199
	int 10h
	
	mov cx, 209
	mov dx, 199
	int 10h
	
	mov cx, 214
	mov dx, 199
	int 10h
	
	mov cx, 224
	mov dx, 199
	int 10h
	
	mov cx, 226
	mov dx, 199
	int 10h
	
	mov cx, 227
	mov dx, 199
	int 10h
	
	mov cx, 229
	mov dx, 199
	int 10h
	
	mov cx, 230
	mov dx, 199
	int 10h
	
	mov cx, 233
	mov dx, 199
	int 10h
	
	mov cx, 234
	mov dx, 199
	int 10h
	
	mov cx, 235
	mov dx, 199
	int 10h
	
	mov cx, 236
	mov dx, 199
	int 10h
	
	mov cx, 242
	mov dx, 199
	int 10h
	
	mov cx, 243
	mov dx, 199
	int 10h
	
	mov cx, 244
	mov dx, 199
	int 10h
	
	mov cx, 246
	mov dx, 199
	int 10h
	
	mov cx, 249
	mov dx, 199
	int 10h
	
	mov cx, 251
	mov dx, 199
	int 10h
	
	mov cx, 252
	mov dx, 199
	int 10h
	
	mov cx, 253
	mov dx, 199
	int 10h
	
	mov cx, 256
	mov dx, 199
	int 10h
	
	mov cx, 257
	mov dx, 199
	int 10h
	
	mov cx, 258
	mov dx, 199
	int 10h
	
	mov cx, 259
	mov dx, 199
	int 10h
	
	mov cx, 260
	mov dx, 199
	int 10h
	
	mov cx, 261
	mov dx, 199
	int 10h
	
	mov cx, 273
	mov dx, 199
	int 10h
	
	mov cx, 275
	mov dx, 199
	int 10h
	
	mov cx, 276
	mov dx, 199
	int 10h
	
	mov cx, 277
	mov dx, 199
	int 10h
	
	mov cx, 282
	mov dx, 199
	int 10h
	
	mov cx, 283
	mov dx, 199
	int 10h
	
	mov cx, 284
	mov dx, 199
	int 10h
	
	mov cx, 285
	mov dx, 199
	int 10h
	
	mov cx, 290
	mov dx, 199
	int 10h
	
	mov cx, 291
	mov dx, 199
	int 10h
	
	mov cx, 292
	mov dx, 199
	int 10h
	
	mov cx, 293
	mov dx, 199
	int 10h
	
	mov cx, 298
	mov dx, 199
	int 10h
	
	mov cx, 299
	mov dx, 199
	int 10h
	
	mov cx, 300
	mov dx, 199
	int 10h
	
	mov cx, 302
	mov dx, 199
	int 10h
	
	mov cx, 2
	mov dx, 200
	int 10h
	
	mov cx, 9
	mov dx, 200
	int 10h
	
	mov cx, 14
	mov dx, 200
	int 10h
	
	mov cx, 17
	mov dx, 200
	int 10h
	
	mov cx, 18
	mov dx, 200
	int 10h
	
	mov cx, 21
	mov dx, 200
	int 10h
	
	mov cx, 37
	mov dx, 200
	int 10h
	
	mov cx, 41
	mov dx, 200
	int 10h
	
	mov cx, 42
	mov dx, 200
	int 10h
	
	mov cx, 46
	mov dx, 200
	int 10h
	
	mov cx, 49
	mov dx, 200
	int 10h
	
	mov cx, 54
	mov dx, 200
	int 10h
	
	mov cx, 64
	mov dx, 200
	int 10h
	
	mov cx, 67
	mov dx, 200
	int 10h
	
	mov cx, 70
	mov dx, 200
	int 10h
	
	mov cx, 76
	mov dx, 200
	int 10h
	
	mov cx, 81
	mov dx, 200
	int 10h
	
	mov cx, 82
	mov dx, 200
	int 10h
	
	mov cx, 86
	mov dx, 200
	int 10h
	
	mov cx, 89
	mov dx, 200
	int 10h
	
	mov cx, 93
	mov dx, 200
	int 10h
	
	mov cx, 94
	mov dx, 200
	int 10h
	
	mov cx, 97
	mov dx, 200
	int 10h
	
	mov cx, 102
	mov dx, 200
	int 10h
	
	mov cx, 104
	mov dx, 200
	int 10h
	
	mov cx, 107
	mov dx, 200
	int 10h
	
	mov cx, 111
	mov dx, 200
	int 10h
	
	mov cx, 113
	mov dx, 200
	int 10h
	
	mov cx, 129
	mov dx, 200
	int 10h
	
	mov cx, 134
	mov dx, 200
	int 10h
	
	mov cx, 137
	mov dx, 200
	int 10h
	
	mov cx, 138
	mov dx, 200
	int 10h
	
	mov cx, 142
	mov dx, 200
	int 10h
	
	mov cx, 145
	mov dx, 200
	int 10h
	
	mov cx, 149
	mov dx, 200
	int 10h
	
	mov cx, 150
	mov dx, 200
	int 10h
	
	mov cx, 157
	mov dx, 200
	int 10h
	
	mov cx, 162
	mov dx, 200
	int 10h
	
	mov cx, 170
	mov dx, 200
	int 10h
	
	mov cx, 174
	mov dx, 200
	int 10h
	
	mov cx, 177
	mov dx, 200
	int 10h
	
	mov cx, 193
	mov dx, 200
	int 10h
	
	mov cx, 198
	mov dx, 200
	int 10h
	
	mov cx, 201
	mov dx, 200
	int 10h
	
	mov cx, 206
	mov dx, 200
	int 10h
	
	mov cx, 209
	mov dx, 200
	int 10h
	
	mov cx, 214
	mov dx, 200
	int 10h
	
	mov cx, 224
	mov dx, 200
	int 10h
	
	mov cx, 225
	mov dx, 200
	int 10h
	
	mov cx, 227
	mov dx, 200
	int 10h
	
	mov cx, 228
	mov dx, 200
	int 10h
	
	mov cx, 230
	mov dx, 200
	int 10h
	
	mov cx, 236
	mov dx, 200
	int 10h
	
	mov cx, 241
	mov dx, 200
	int 10h
	
	mov cx, 245
	mov dx, 200
	int 10h
	
	mov cx, 246
	mov dx, 200
	int 10h
	
	mov cx, 249
	mov dx, 200
	int 10h
	
	mov cx, 250
	mov dx, 200
	int 10h
	
	mov cx, 254
	mov dx, 200
	int 10h
	
	mov cx, 258
	mov dx, 200
	int 10h
	
	mov cx, 273
	mov dx, 200
	int 10h
	
	mov cx, 274
	mov dx, 200
	int 10h
	
	mov cx, 278
	mov dx, 200
	int 10h
	
	mov cx, 282
	mov dx, 200
	int 10h
	
	mov cx, 286
	mov dx, 200
	int 10h
	
	mov cx, 290
	mov dx, 200
	int 10h
	
	mov cx, 294
	mov dx, 200
	int 10h
	
	mov cx, 297
	mov dx, 200
	int 10h
	
	mov cx, 301
	mov dx, 200
	int 10h
	
	mov cx, 302
	mov dx, 200
	int 10h
	
	mov cx, 2
	mov dx, 201
	int 10h
	
	mov cx, 9
	mov dx, 201
	int 10h
	
	mov cx, 14
	mov dx, 201
	int 10h
	
	mov cx, 17
	mov dx, 201
	int 10h
	
	mov cx, 37
	mov dx, 201
	int 10h
	
	mov cx, 41
	mov dx, 201
	int 10h
	
	mov cx, 46
	mov dx, 201
	int 10h
	
	mov cx, 49
	mov dx, 201
	int 10h
	
	mov cx, 54
	mov dx, 201
	int 10h
	
	mov cx, 65
	mov dx, 201
	int 10h
	
	mov cx, 67
	mov dx, 201
	int 10h
	
	mov cx, 68
	mov dx, 201
	int 10h
	
	mov cx, 70
	mov dx, 201
	int 10h
	
	mov cx, 76
	mov dx, 201
	int 10h
	
	mov cx, 81
	mov dx, 201
	int 10h
	
	mov cx, 86
	mov dx, 201
	int 10h
	
	mov cx, 89
	mov dx, 201
	int 10h
	
	mov cx, 94
	mov dx, 201
	int 10h
	
	mov cx, 97
	mov dx, 201
	int 10h
	
	mov cx, 102
	mov dx, 201
	int 10h
	
	mov cx, 105
	mov dx, 201
	int 10h
	
	mov cx, 107
	mov dx, 201
	int 10h
	
	mov cx, 108
	mov dx, 201
	int 10h
	
	mov cx, 110
	mov dx, 201
	int 10h
	
	mov cx, 113
	mov dx, 201
	int 10h
	
	mov cx, 114
	mov dx, 201
	int 10h
	
	mov cx, 129
	mov dx, 201
	int 10h
	
	mov cx, 134
	mov dx, 201
	int 10h
	
	mov cx, 137
	mov dx, 201
	int 10h
	
	mov cx, 142
	mov dx, 201
	int 10h
	
	mov cx, 145
	mov dx, 201
	int 10h
	
	mov cx, 150
	mov dx, 201
	int 10h
	
	mov cx, 157
	mov dx, 201
	int 10h
	
	mov cx, 162
	mov dx, 201
	int 10h
	
	mov cx, 169
	mov dx, 201
	int 10h
	
	mov cx, 174
	mov dx, 201
	int 10h
	
	mov cx, 177
	mov dx, 201
	int 10h
	
	mov cx, 178
	mov dx, 201
	int 10h
	
	mov cx, 193
	mov dx, 201
	int 10h
	
	mov cx, 198
	mov dx, 201
	int 10h
	
	mov cx, 201
	mov dx, 201
	int 10h
	
	mov cx, 206
	mov dx, 201
	int 10h
	
	mov cx, 209
	mov dx, 201
	int 10h
	
	mov cx, 214
	mov dx, 201
	int 10h
	
	mov cx, 224
	mov dx, 201
	int 10h
	
	mov cx, 227
	mov dx, 201
	int 10h
	
	mov cx, 230
	mov dx, 201
	int 10h
	
	mov cx, 236
	mov dx, 201
	int 10h
	
	mov cx, 241
	mov dx, 201
	int 10h
	
	mov cx, 246
	mov dx, 201
	int 10h
	
	mov cx, 249
	mov dx, 201
	int 10h
	
	mov cx, 254
	mov dx, 201
	int 10h
	
	mov cx, 258
	mov dx, 201
	int 10h
	
	mov cx, 273
	mov dx, 201
	int 10h
	
	mov cx, 278
	mov dx, 201
	int 10h
	
	mov cx, 281
	mov dx, 201
	int 10h
	
	mov cx, 286
	mov dx, 201
	int 10h
	
	mov cx, 289
	mov dx, 201
	int 10h
	
	mov cx, 294
	mov dx, 201
	int 10h
	
	mov cx, 297
	mov dx, 201
	int 10h
	
	mov cx, 302
	mov dx, 201
	int 10h
	
	mov cx, 2
	mov dx, 202
	int 10h
	
	mov cx, 9
	mov dx, 202
	int 10h
	
	mov cx, 14
	mov dx, 202
	int 10h
	
	mov cx, 17
	mov dx, 202
	int 10h
	
	mov cx, 34
	mov dx, 202
	int 10h
	
	mov cx, 35
	mov dx, 202
	int 10h
	
	mov cx, 36
	mov dx, 202
	int 10h
	
	mov cx, 37
	mov dx, 202
	int 10h
	
	mov cx, 41
	mov dx, 202
	int 10h
	
	mov cx, 46
	mov dx, 202
	int 10h
	
	mov cx, 50
	mov dx, 202
	int 10h
	
	mov cx, 53
	mov dx, 202
	int 10h
	
	mov cx, 65
	mov dx, 202
	int 10h
	
	mov cx, 67
	mov dx, 202
	int 10h
	
	mov cx, 68
	mov dx, 202
	int 10h
	
	mov cx, 70
	mov dx, 202
	int 10h
	
	mov cx, 76
	mov dx, 202
	int 10h
	
	mov cx, 81
	mov dx, 202
	int 10h
	
	mov cx, 86
	mov dx, 202
	int 10h
	
	mov cx, 89
	mov dx, 202
	int 10h
	
	mov cx, 94
	mov dx, 202
	int 10h
	
	mov cx, 97
	mov dx, 202
	int 10h
	
	mov cx, 102
	mov dx, 202
	int 10h
	
	mov cx, 105
	mov dx, 202
	int 10h
	
	mov cx, 107
	mov dx, 202
	int 10h
	
	mov cx, 108
	mov dx, 202
	int 10h
	
	mov cx, 110
	mov dx, 202
	int 10h
	
	mov cx, 115
	mov dx, 202
	int 10h
	
	mov cx, 116
	mov dx, 202
	int 10h
	
	mov cx, 129
	mov dx, 202
	int 10h
	
	mov cx, 134
	mov dx, 202
	int 10h
	
	mov cx, 137
	mov dx, 202
	int 10h
	
	mov cx, 142
	mov dx, 202
	int 10h
	
	mov cx, 145
	mov dx, 202
	int 10h
	
	mov cx, 150
	mov dx, 202
	int 10h
	
	mov cx, 154
	mov dx, 202
	int 10h
	
	mov cx, 155
	mov dx, 202
	int 10h
	
	mov cx, 156
	mov dx, 202
	int 10h
	
	mov cx, 157
	mov dx, 202
	int 10h
	
	mov cx, 162
	mov dx, 202
	int 10h
	
	mov cx, 169
	mov dx, 202
	int 10h
	
	mov cx, 170
	mov dx, 202
	int 10h
	
	mov cx, 171
	mov dx, 202
	int 10h
	
	mov cx, 172
	mov dx, 202
	int 10h
	
	mov cx, 173
	mov dx, 202
	int 10h
	
	mov cx, 174
	mov dx, 202
	int 10h
	
	mov cx, 179
	mov dx, 202
	int 10h
	
	mov cx, 180
	mov dx, 202
	int 10h
	
	mov cx, 194
	mov dx, 202
	int 10h
	
	mov cx, 197
	mov dx, 202
	int 10h
	
	mov cx, 201
	mov dx, 202
	int 10h
	
	mov cx, 206
	mov dx, 202
	int 10h
	
	mov cx, 209
	mov dx, 202
	int 10h
	
	mov cx, 214
	mov dx, 202
	int 10h
	
	mov cx, 224
	mov dx, 202
	int 10h
	
	mov cx, 227
	mov dx, 202
	int 10h
	
	mov cx, 230
	mov dx, 202
	int 10h
	
	mov cx, 236
	mov dx, 202
	int 10h
	
	mov cx, 241
	mov dx, 202
	int 10h
	
	mov cx, 246
	mov dx, 202
	int 10h
	
	mov cx, 249
	mov dx, 202
	int 10h
	
	mov cx, 254
	mov dx, 202
	int 10h
	
	mov cx, 258
	mov dx, 202
	int 10h
	
	mov cx, 273
	mov dx, 202
	int 10h
	
	mov cx, 278
	mov dx, 202
	int 10h
	
	mov cx, 281
	mov dx, 202
	int 10h
	
	mov cx, 282
	mov dx, 202
	int 10h
	
	mov cx, 283
	mov dx, 202
	int 10h
	
	mov cx, 284
	mov dx, 202
	int 10h
	
	mov cx, 285
	mov dx, 202
	int 10h
	
	mov cx, 286
	mov dx, 202
	int 10h
	
	mov cx, 289
	mov dx, 202
	int 10h
	
	mov cx, 290
	mov dx, 202
	int 10h
	
	mov cx, 291
	mov dx, 202
	int 10h
	
	mov cx, 292
	mov dx, 202
	int 10h
	
	mov cx, 293
	mov dx, 202
	int 10h
	
	mov cx, 294
	mov dx, 202
	int 10h
	
	mov cx, 297
	mov dx, 202
	int 10h
	
	mov cx, 302
	mov dx, 202
	int 10h
	
	mov cx, 2
	mov dx, 203
	int 10h
	
	mov cx, 9
	mov dx, 203
	int 10h
	
	mov cx, 14
	mov dx, 203
	int 10h
	
	mov cx, 17
	mov dx, 203
	int 10h
	
	mov cx, 33
	mov dx, 203
	int 10h
	
	mov cx, 37
	mov dx, 203
	int 10h
	
	mov cx, 41
	mov dx, 203
	int 10h
	
	mov cx, 46
	mov dx, 203
	int 10h
	
	mov cx, 50
	mov dx, 203
	int 10h
	
	mov cx, 53
	mov dx, 203
	int 10h
	
	mov cx, 65
	mov dx, 203
	int 10h
	
	mov cx, 66
	mov dx, 203
	int 10h
	
	mov cx, 68
	mov dx, 203
	int 10h
	
	mov cx, 70
	mov dx, 203
	int 10h
	
	mov cx, 76
	mov dx, 203
	int 10h
	
	mov cx, 81
	mov dx, 203
	int 10h
	
	mov cx, 86
	mov dx, 203
	int 10h
	
	mov cx, 89
	mov dx, 203
	int 10h
	
	mov cx, 94
	mov dx, 203
	int 10h
	
	mov cx, 97
	mov dx, 203
	int 10h
	
	mov cx, 102
	mov dx, 203
	int 10h
	
	mov cx, 105
	mov dx, 203
	int 10h
	
	mov cx, 106
	mov dx, 203
	int 10h
	
	mov cx, 108
	mov dx, 203
	int 10h
	
	mov cx, 110
	mov dx, 203
	int 10h
	
	mov cx, 117
	mov dx, 203
	int 10h
	
	mov cx, 129
	mov dx, 203
	int 10h
	
	mov cx, 134
	mov dx, 203
	int 10h
	
	mov cx, 137
	mov dx, 203
	int 10h
	
	mov cx, 142
	mov dx, 203
	int 10h
	
	mov cx, 145
	mov dx, 203
	int 10h
	
	mov cx, 150
	mov dx, 203
	int 10h
	
	mov cx, 153
	mov dx, 203
	int 10h
	
	mov cx, 157
	mov dx, 203
	int 10h
	
	mov cx, 162
	mov dx, 203
	int 10h
	
	mov cx, 169
	mov dx, 203
	int 10h
	
	mov cx, 181
	mov dx, 203
	int 10h
	
	mov cx, 194
	mov dx, 203
	int 10h
	
	mov cx, 197
	mov dx, 203
	int 10h
	
	mov cx, 201
	mov dx, 203
	int 10h
	
	mov cx, 206
	mov dx, 203
	int 10h
	
	mov cx, 209
	mov dx, 203
	int 10h
	
	mov cx, 214
	mov dx, 203
	int 10h
	
	mov cx, 224
	mov dx, 203
	int 10h
	
	mov cx, 227
	mov dx, 203
	int 10h
	
	mov cx, 230
	mov dx, 203
	int 10h
	
	mov cx, 236
	mov dx, 203
	int 10h
	
	mov cx, 241
	mov dx, 203
	int 10h
	
	mov cx, 246
	mov dx, 203
	int 10h
	
	mov cx, 249
	mov dx, 203
	int 10h
	
	mov cx, 254
	mov dx, 203
	int 10h
	
	mov cx, 258
	mov dx, 203
	int 10h
	
	mov cx, 273
	mov dx, 203
	int 10h
	
	mov cx, 278
	mov dx, 203
	int 10h
	
	mov cx, 281
	mov dx, 203
	int 10h
	
	mov cx, 289
	mov dx, 203
	int 10h
	
	mov cx, 297
	mov dx, 203
	int 10h
	
	mov cx, 302
	mov dx, 203
	int 10h
	
	mov cx, 2
	mov dx, 204
	int 10h
	
	mov cx, 9
	mov dx, 204
	int 10h
	
	mov cx, 14
	mov dx, 204
	int 10h
	
	mov cx, 17
	mov dx, 204
	int 10h
	
	mov cx, 33
	mov dx, 204
	int 10h
	
	mov cx, 37
	mov dx, 204
	int 10h
	
	mov cx, 41
	mov dx, 204
	int 10h
	
	mov cx, 46
	mov dx, 204
	int 10h
	
	mov cx, 51
	mov dx, 204
	int 10h
	
	mov cx, 52
	mov dx, 204
	int 10h
	
	mov cx, 65
	mov dx, 204
	int 10h
	
	mov cx, 66
	mov dx, 204
	int 10h
	
	mov cx, 69
	mov dx, 204
	int 10h
	
	mov cx, 70
	mov dx, 204
	int 10h
	
	mov cx, 76
	mov dx, 204
	int 10h
	
	mov cx, 81
	mov dx, 204
	int 10h
	
	mov cx, 86
	mov dx, 204
	int 10h
	
	mov cx, 89
	mov dx, 204
	int 10h
	
	mov cx, 93
	mov dx, 204
	int 10h
	
	mov cx, 94
	mov dx, 204
	int 10h
	
	mov cx, 97
	mov dx, 204
	int 10h
	
	mov cx, 102
	mov dx, 204
	int 10h
	
	mov cx, 106
	mov dx, 204
	int 10h
	
	mov cx, 109
	mov dx, 204
	int 10h
	
	mov cx, 117
	mov dx, 204
	int 10h
	
	mov cx, 129
	mov dx, 204
	int 10h
	
	mov cx, 133
	mov dx, 204
	int 10h
	
	mov cx, 134
	mov dx, 204
	int 10h
	
	mov cx, 137
	mov dx, 204
	int 10h
	
	mov cx, 138
	mov dx, 204
	int 10h
	
	mov cx, 142
	mov dx, 204
	int 10h
	
	mov cx, 145
	mov dx, 204
	int 10h
	
	mov cx, 149
	mov dx, 204
	int 10h
	
	mov cx, 150
	mov dx, 204
	int 10h
	
	mov cx, 153
	mov dx, 204
	int 10h
	
	mov cx, 157
	mov dx, 204
	int 10h
	
	mov cx, 162
	mov dx, 204
	int 10h
	
	mov cx, 169
	mov dx, 204
	int 10h
	
	mov cx, 181
	mov dx, 204
	int 10h
	
	mov cx, 195
	mov dx, 204
	int 10h
	
	mov cx, 196
	mov dx, 204
	int 10h
	
	mov cx, 201
	mov dx, 204
	int 10h
	
	mov cx, 206
	mov dx, 204
	int 10h
	
	mov cx, 209
	mov dx, 204
	int 10h
	
	mov cx, 213
	mov dx, 204
	int 10h
	
	mov cx, 214
	mov dx, 204
	int 10h
	
	mov cx, 224
	mov dx, 204
	int 10h
	
	mov cx, 227
	mov dx, 204
	int 10h
	
	mov cx, 230
	mov dx, 204
	int 10h
	
	mov cx, 236
	mov dx, 204
	int 10h
	
	mov cx, 241
	mov dx, 204
	int 10h
	
	mov cx, 245
	mov dx, 204
	int 10h
	
	mov cx, 246
	mov dx, 204
	int 10h
	
	mov cx, 249
	mov dx, 204
	int 10h
	
	mov cx, 254
	mov dx, 204
	int 10h
	
	mov cx, 258
	mov dx, 204
	int 10h
	
	mov cx, 273
	mov dx, 204
	int 10h
	
	mov cx, 278
	mov dx, 204
	int 10h
	
	mov cx, 281
	mov dx, 204
	int 10h
	
	mov cx, 289
	mov dx, 204
	int 10h
	
	mov cx, 297
	mov dx, 204
	int 10h
	
	mov cx, 301
	mov dx, 204
	int 10h
	
	mov cx, 302
	mov dx, 204
	int 10h
	
	mov cx, 306
	mov dx, 204
	int 10h
	
	mov cx, 307
	mov dx, 204
	int 10h
	
	mov cx, 2
	mov dx, 205
	int 10h
	
	mov cx, 10
	mov dx, 205
	int 10h
	
	mov cx, 11
	mov dx, 205
	int 10h
	
	mov cx, 12
	mov dx, 205
	int 10h
	
	mov cx, 13
	mov dx, 205
	int 10h
	
	mov cx, 17
	mov dx, 205
	int 10h
	
	mov cx, 34
	mov dx, 205
	int 10h
	
	mov cx, 35
	mov dx, 205
	int 10h
	
	mov cx, 36
	mov dx, 205
	int 10h
	
	mov cx, 37
	mov dx, 205
	int 10h
	
	mov cx, 38
	mov dx, 205
	int 10h
	
	mov cx, 41
	mov dx, 205
	int 10h
	
	mov cx, 46
	mov dx, 205
	int 10h
	
	mov cx, 51
	mov dx, 205
	int 10h
	
	mov cx, 52
	mov dx, 205
	int 10h
	
	mov cx, 66
	mov dx, 205
	int 10h
	
	mov cx, 69
	mov dx, 205
	int 10h
	
	mov cx, 76
	mov dx, 205
	int 10h
	
	mov cx, 81
	mov dx, 205
	int 10h
	
	mov cx, 86
	mov dx, 205
	int 10h
	
	mov cx, 90
	mov dx, 205
	int 10h
	
	mov cx, 91
	mov dx, 205
	int 10h
	
	mov cx, 92
	mov dx, 205
	int 10h
	
	mov cx, 94
	mov dx, 205
	int 10h
	
	mov cx, 98
	mov dx, 205
	int 10h
	
	mov cx, 99
	mov dx, 205
	int 10h
	
	mov cx, 100
	mov dx, 205
	int 10h
	
	mov cx, 101
	mov dx, 205
	int 10h
	
	mov cx, 106
	mov dx, 205
	int 10h
	
	mov cx, 109
	mov dx, 205
	int 10h
	
	mov cx, 113
	mov dx, 205
	int 10h
	
	mov cx, 114
	mov dx, 205
	int 10h
	
	mov cx, 115
	mov dx, 205
	int 10h
	
	mov cx, 116
	mov dx, 205
	int 10h
	
	mov cx, 130
	mov dx, 205
	int 10h
	
	mov cx, 131
	mov dx, 205
	int 10h
	
	mov cx, 132
	mov dx, 205
	int 10h
	
	mov cx, 134
	mov dx, 205
	int 10h
	
	mov cx, 137
	mov dx, 205
	int 10h
	
	mov cx, 139
	mov dx, 205
	int 10h
	
	mov cx, 140
	mov dx, 205
	int 10h
	
	mov cx, 141
	mov dx, 205
	int 10h
	
	mov cx, 146
	mov dx, 205
	int 10h
	
	mov cx, 147
	mov dx, 205
	int 10h
	
	mov cx, 148
	mov dx, 205
	int 10h
	
	mov cx, 150
	mov dx, 205
	int 10h
	
	mov cx, 154
	mov dx, 205
	int 10h
	
	mov cx, 155
	mov dx, 205
	int 10h
	
	mov cx, 156
	mov dx, 205
	int 10h
	
	mov cx, 157
	mov dx, 205
	int 10h
	
	mov cx, 158
	mov dx, 205
	int 10h
	
	mov cx, 163
	mov dx, 205
	int 10h
	
	mov cx, 164
	mov dx, 205
	int 10h
	
	mov cx, 165
	mov dx, 205
	int 10h
	
	mov cx, 170
	mov dx, 205
	int 10h
	
	mov cx, 171
	mov dx, 205
	int 10h
	
	mov cx, 172
	mov dx, 205
	int 10h
	
	mov cx, 173
	mov dx, 205
	int 10h
	
	mov cx, 174
	mov dx, 205
	int 10h
	
	mov cx, 177
	mov dx, 205
	int 10h
	
	mov cx, 178
	mov dx, 205
	int 10h
	
	mov cx, 179
	mov dx, 205
	int 10h
	
	mov cx, 180
	mov dx, 205
	int 10h
	
	mov cx, 195
	mov dx, 205
	int 10h
	
	mov cx, 196
	mov dx, 205
	int 10h
	
	mov cx, 202
	mov dx, 205
	int 10h
	
	mov cx, 203
	mov dx, 205
	int 10h
	
	mov cx, 204
	mov dx, 205
	int 10h
	
	mov cx, 205
	mov dx, 205
	int 10h
	
	mov cx, 210
	mov dx, 205
	int 10h
	
	mov cx, 211
	mov dx, 205
	int 10h
	
	mov cx, 212
	mov dx, 205
	int 10h
	
	mov cx, 214
	mov dx, 205
	int 10h
	
	mov cx, 224
	mov dx, 205
	int 10h
	
	mov cx, 227
	mov dx, 205
	int 10h
	
	mov cx, 230
	mov dx, 205
	int 10h
	
	mov cx, 236
	mov dx, 205
	int 10h
	
	mov cx, 242
	mov dx, 205
	int 10h
	
	mov cx, 243
	mov dx, 205
	int 10h
	
	mov cx, 244
	mov dx, 205
	int 10h
	
	mov cx, 246
	mov dx, 205
	int 10h
	
	mov cx, 249
	mov dx, 205
	int 10h
	
	mov cx, 254
	mov dx, 205
	int 10h
	
	mov cx, 259
	mov dx, 205
	int 10h
	
	mov cx, 260
	mov dx, 205
	int 10h
	
	mov cx, 261
	mov dx, 205
	int 10h
	
	mov cx, 273
	mov dx, 205
	int 10h
	
	mov cx, 278
	mov dx, 205
	int 10h
	
	mov cx, 282
	mov dx, 205
	int 10h
	
	mov cx, 283
	mov dx, 205
	int 10h
	
	mov cx, 284
	mov dx, 205
	int 10h
	
	mov cx, 285
	mov dx, 205
	int 10h
	
	mov cx, 286
	mov dx, 205
	int 10h
	
	mov cx, 290
	mov dx, 205
	int 10h
	
	mov cx, 291
	mov dx, 205
	int 10h
	
	mov cx, 292
	mov dx, 205
	int 10h
	
	mov cx, 293
	mov dx, 205
	int 10h
	
	mov cx, 294
	mov dx, 205
	int 10h
	
	mov cx, 298
	mov dx, 205
	int 10h
	
	mov cx, 299
	mov dx, 205
	int 10h
	
	mov cx, 300
	mov dx, 205
	int 10h
	
	mov cx, 302
	mov dx, 205
	int 10h
	
	mov cx, 306
	mov dx, 205
	int 10h
	
	mov cx, 307
	mov dx, 205
	int 10h
	
	mov cx, 51
	mov dx, 206
	int 10h
	
	mov cx, 137
	mov dx, 206
	int 10h
	
	mov cx, 195
	mov dx, 206
	int 10h
	
	mov cx, 246
	mov dx, 206
	int 10h
	
	mov cx, 50
	mov dx, 207
	int 10h
	
	mov cx, 51
	mov dx, 207
	int 10h
	
	mov cx, 137
	mov dx, 207
	int 10h
	
	mov cx, 194
	mov dx, 207
	int 10h
	
	mov cx, 195
	mov dx, 207
	int 10h
	
	mov cx, 246
	mov dx, 207
	int 10h
	
	mov cx, 48
	mov dx, 208
	int 10h
	
	mov cx, 49
	mov dx, 208
	int 10h
	
	mov cx, 50
	mov dx, 208
	int 10h
	
	mov cx, 137
	mov dx, 208
	int 10h
	
	mov cx, 192
	mov dx, 208
	int 10h
	
	mov cx, 193
	mov dx, 208
	int 10h
	
	mov cx, 194
	mov dx, 208
	int 10h
	
	mov cx, 242
	mov dx, 208
	int 10h
	
	mov cx, 243
	mov dx, 208
	int 10h
	
	mov cx, 244
	mov dx, 208
	int 10h
	
	mov cx, 245
	mov dx, 208
	int 10h
	
	mov cx, 11
	mov dx, 224
	int 10h
	
	mov cx, 12
	mov dx, 224
	int 10h
	
	mov cx, 13
	mov dx, 224
	int 10h
	
	mov cx, 14
	mov dx, 224
	int 10h
	
	mov cx, 49
	mov dx, 224
	int 10h
	
	mov cx, 57
	mov dx, 224
	int 10h
	
	mov cx, 58
	mov dx, 224
	int 10h
	
	mov cx, 59
	mov dx, 224
	int 10h
	
	mov cx, 60
	mov dx, 224
	int 10h
	
	mov cx, 131
	mov dx, 224
	int 10h
	
	mov cx, 132
	mov dx, 224
	int 10h
	
	mov cx, 182
	mov dx, 224
	int 10h
	
	mov cx, 187
	mov dx, 224
	int 10h
	
	mov cx, 188
	mov dx, 224
	int 10h
	
	mov cx, 209
	mov dx, 224
	int 10h
	
	mov cx, 217
	mov dx, 224
	int 10h
	
	mov cx, 218
	mov dx, 224
	int 10h
	
	mov cx, 219
	mov dx, 224
	int 10h
	
	mov cx, 220
	mov dx, 224
	int 10h
	
	mov cx, 377
	mov dx, 224
	int 10h
	
	mov cx, 378
	mov dx, 224
	int 10h
	
	mov cx, 379
	mov dx, 224
	int 10h
	
	mov cx, 380
	mov dx, 224
	int 10h
	
	mov cx, 403
	mov dx, 224
	int 10h
	
	mov cx, 404
	mov dx, 224
	int 10h
	
	mov cx, 441
	mov dx, 224
	int 10h
	
	mov cx, 442
	mov dx, 224
	int 10h
	
	mov cx, 443
	mov dx, 224
	int 10h
	
	mov cx, 444
	mov dx, 224
	int 10h
	
	mov cx, 449
	mov dx, 224
	int 10h
	
	mov cx, 450
	mov dx, 224
	int 10h
	
	mov cx, 451
	mov dx, 224
	int 10h
	
	mov cx, 452
	mov dx, 224
	int 10h
	
	mov cx, 470
	mov dx, 224
	int 10h
	
	mov cx, 481
	mov dx, 224
	int 10h
	
	mov cx, 510
	mov dx, 224
	int 10h
	
	mov cx, 10
	mov dx, 225
	int 10h
	
	mov cx, 49
	mov dx, 225
	int 10h
	
	mov cx, 60
	mov dx, 225
	int 10h
	
	mov cx, 131
	mov dx, 225
	int 10h
	
	mov cx, 132
	mov dx, 225
	int 10h
	
	mov cx, 182
	mov dx, 225
	int 10h
	
	mov cx, 187
	mov dx, 225
	int 10h
	
	mov cx, 188
	mov dx, 225
	int 10h
	
	mov cx, 209
	mov dx, 225
	int 10h
	
	mov cx, 220
	mov dx, 225
	int 10h
	
	mov cx, 380
	mov dx, 225
	int 10h
	
	mov cx, 403
	mov dx, 225
	int 10h
	
	mov cx, 404
	mov dx, 225
	int 10h
	
	mov cx, 444
	mov dx, 225
	int 10h
	
	mov cx, 452
	mov dx, 225
	int 10h
	
	mov cx, 470
	mov dx, 225
	int 10h
	
	mov cx, 481
	mov dx, 225
	int 10h
	
	mov cx, 510
	mov dx, 225
	int 10h
	
	mov cx, 1
	mov dx, 226
	int 10h
	
	mov cx, 2
	mov dx, 226
	int 10h
	
	mov cx, 3
	mov dx, 226
	int 10h
	
	mov cx, 4
	mov dx, 226
	int 10h
	
	mov cx, 5
	mov dx, 226
	int 10h
	
	mov cx, 10
	mov dx, 226
	int 10h
	
	mov cx, 49
	mov dx, 226
	int 10h
	
	mov cx, 60
	mov dx, 226
	int 10h
	
	mov cx, 122
	mov dx, 226
	int 10h
	
	mov cx, 182
	mov dx, 226
	int 10h
	
	mov cx, 209
	mov dx, 226
	int 10h
	
	mov cx, 220
	mov dx, 226
	int 10h
	
	mov cx, 380
	mov dx, 226
	int 10h
	
	mov cx, 426
	mov dx, 226
	int 10h
	
	mov cx, 444
	mov dx, 226
	int 10h
	
	mov cx, 452
	mov dx, 226
	int 10h
	
	mov cx, 470
	mov dx, 226
	int 10h
	
	mov cx, 481
	mov dx, 226
	int 10h
	
	mov cx, 510
	mov dx, 226
	int 10h
	
	mov cx, 3
	mov dx, 227
	int 10h
	
	mov cx, 8
	mov dx, 227
	int 10h
	
	mov cx, 9
	mov dx, 227
	int 10h
	
	mov cx, 10
	mov dx, 227
	int 10h
	
	mov cx, 11
	mov dx, 227
	int 10h
	
	mov cx, 12
	mov dx, 227
	int 10h
	
	mov cx, 13
	mov dx, 227
	int 10h
	
	mov cx, 14
	mov dx, 227
	int 10h
	
	mov cx, 25
	mov dx, 227
	int 10h
	
	mov cx, 27
	mov dx, 227
	int 10h
	
	mov cx, 28
	mov dx, 227
	int 10h
	
	mov cx, 29
	mov dx, 227
	int 10h
	
	mov cx, 33
	mov dx, 227
	int 10h
	
	mov cx, 35
	mov dx, 227
	int 10h
	
	mov cx, 36
	mov dx, 227
	int 10h
	
	mov cx, 37
	mov dx, 227
	int 10h
	
	mov cx, 42
	mov dx, 227
	int 10h
	
	mov cx, 43
	mov dx, 227
	int 10h
	
	mov cx, 44
	mov dx, 227
	int 10h
	
	mov cx, 45
	mov dx, 227
	int 10h
	
	mov cx, 49
	mov dx, 227
	int 10h
	
	mov cx, 51
	mov dx, 227
	int 10h
	
	mov cx, 52
	mov dx, 227
	int 10h
	
	mov cx, 53
	mov dx, 227
	int 10h
	
	mov cx, 60
	mov dx, 227
	int 10h
	
	mov cx, 66
	mov dx, 227
	int 10h
	
	mov cx, 67
	mov dx, 227
	int 10h
	
	mov cx, 68
	mov dx, 227
	int 10h
	
	mov cx, 69
	mov dx, 227
	int 10h
	
	mov cx, 72
	mov dx, 227
	int 10h
	
	mov cx, 74
	mov dx, 227
	int 10h
	
	mov cx, 75
	mov dx, 227
	int 10h
	
	mov cx, 77
	mov dx, 227
	int 10h
	
	mov cx, 78
	mov dx, 227
	int 10h
	
	mov cx, 82
	mov dx, 227
	int 10h
	
	mov cx, 83
	mov dx, 227
	int 10h
	
	mov cx, 84
	mov dx, 227
	int 10h
	
	mov cx, 85
	mov dx, 227
	int 10h
	
	mov cx, 99
	mov dx, 227
	int 10h
	
	mov cx, 100
	mov dx, 227
	int 10h
	
	mov cx, 101
	mov dx, 227
	int 10h
	
	mov cx, 102
	mov dx, 227
	int 10h
	
	mov cx, 106
	mov dx, 227
	int 10h
	
	mov cx, 107
	mov dx, 227
	int 10h
	
	mov cx, 108
	mov dx, 227
	int 10h
	
	mov cx, 109
	mov dx, 227
	int 10h
	
	mov cx, 113
	mov dx, 227
	int 10h
	
	mov cx, 115
	mov dx, 227
	int 10h
	
	mov cx, 116
	mov dx, 227
	int 10h
	
	mov cx, 117
	mov dx, 227
	int 10h
	
	mov cx, 120
	mov dx, 227
	int 10h
	
	mov cx, 121
	mov dx, 227
	int 10h
	
	mov cx, 122
	mov dx, 227
	int 10h
	
	mov cx, 123
	mov dx, 227
	int 10h
	
	mov cx, 124
	mov dx, 227
	int 10h
	
	mov cx, 125
	mov dx, 227
	int 10h
	
	mov cx, 129
	mov dx, 227
	int 10h
	
	mov cx, 130
	mov dx, 227
	int 10h
	
	mov cx, 131
	mov dx, 227
	int 10h
	
	mov cx, 132
	mov dx, 227
	int 10h
	
	mov cx, 137
	mov dx, 227
	int 10h
	
	mov cx, 139
	mov dx, 227
	int 10h
	
	mov cx, 140
	mov dx, 227
	int 10h
	
	mov cx, 141
	mov dx, 227
	int 10h
	
	mov cx, 145
	mov dx, 227
	int 10h
	
	mov cx, 150
	mov dx, 227
	int 10h
	
	mov cx, 154
	mov dx, 227
	int 10h
	
	mov cx, 155
	mov dx, 227
	int 10h
	
	mov cx, 156
	mov dx, 227
	int 10h
	
	mov cx, 157
	mov dx, 227
	int 10h
	
	mov cx, 178
	mov dx, 227
	int 10h
	
	mov cx, 179
	mov dx, 227
	int 10h
	
	mov cx, 180
	mov dx, 227
	int 10h
	
	mov cx, 182
	mov dx, 227
	int 10h
	
	mov cx, 185
	mov dx, 227
	int 10h
	
	mov cx, 186
	mov dx, 227
	int 10h
	
	mov cx, 187
	mov dx, 227
	int 10h
	
	mov cx, 188
	mov dx, 227
	int 10h
	
	mov cx, 194
	mov dx, 227
	int 10h
	
	mov cx, 195
	mov dx, 227
	int 10h
	
	mov cx, 196
	mov dx, 227
	int 10h
	
	mov cx, 197
	mov dx, 227
	int 10h
	
	mov cx, 202
	mov dx, 227
	int 10h
	
	mov cx, 203
	mov dx, 227
	int 10h
	
	mov cx, 204
	mov dx, 227
	int 10h
	
	mov cx, 209
	mov dx, 227
	int 10h
	
	mov cx, 211
	mov dx, 227
	int 10h
	
	mov cx, 212
	mov dx, 227
	int 10h
	
	mov cx, 213
	mov dx, 227
	int 10h
	
	mov cx, 220
	mov dx, 227
	int 10h
	
	mov cx, 226
	mov dx, 227
	int 10h
	
	mov cx, 227
	mov dx, 227
	int 10h
	
	mov cx, 228
	mov dx, 227
	int 10h

	mov cx, 229
	mov dx, 227
	int 10h
	
	mov cx, 242
	mov dx, 227
	int 10h
	
	mov cx, 243
	mov dx, 227
	int 10h
	
	mov cx, 244
	mov dx, 227
	int 10h
	
	mov cx, 245
	mov dx, 227
	int 10h
	
	mov cx, 249
	mov dx, 227
	int 10h
	
	mov cx, 251
	mov dx, 227
	int 10h
	
	mov cx, 252
	mov dx, 227
	int 10h
	
	mov cx, 253
	mov dx, 227
	int 10h
	
	mov cx, 265
	mov dx, 227
	int 10h
	
	mov cx, 267
	mov dx, 227
	int 10h
	
	mov cx, 268
	mov dx, 227
	int 10h
	
	mov cx, 269
	mov dx, 227
	int 10h
	
	mov cx, 274
	mov dx, 227
	int 10h
	
	mov cx, 275
	mov dx, 227
	int 10h
	
	mov cx, 276
	mov dx, 227
	int 10h
	
	mov cx, 277
	mov dx, 227
	int 10h
	
	mov cx, 280
	mov dx, 227
	int 10h
	
	mov cx, 282
	mov dx, 227
	int 10h
	
	mov cx, 283
	mov dx, 227
	int 10h
	
	mov cx, 285
	mov dx, 227
	int 10h
	
	mov cx, 286
	mov dx, 227
	int 10h
	
	mov cx, 290
	mov dx, 227
	int 10h
	
	mov cx, 291
	mov dx, 227
	int 10h
	
	mov cx, 292
	mov dx, 227
	int 10h
	
	mov cx, 293
	mov dx, 227
	int 10h
	
	mov cx, 296
	mov dx, 227
	int 10h
	
	mov cx, 302
	mov dx, 227
	int 10h
	
	mov cx, 306
	mov dx, 227
	int 10h
	
	mov cx, 307
	mov dx, 227
	int 10h
	
	mov cx, 308
	mov dx, 227
	int 10h
	
	mov cx, 309
	mov dx, 227
	int 10h
	
	mov cx, 322
	mov dx, 227
	int 10h
	
	mov cx, 323
	mov dx, 227
	int 10h
	
	mov cx, 324
	mov dx, 227
	int 10h
	
	mov cx, 329
	mov dx, 227
	int 10h
	
	mov cx, 331
	mov dx, 227
	int 10h
	
	mov cx, 332
	mov dx, 227
	int 10h
	
	mov cx, 333
	mov dx, 227
	int 10h
	
	mov cx, 336
	mov dx, 227
	int 10h
	
	mov cx, 343
	mov dx, 227
	int 10h
	
	mov cx, 353
	mov dx, 227
	int 10h
	
	mov cx, 355
	mov dx, 227
	int 10h
	
	mov cx, 356
	mov dx, 227
	int 10h
	
	mov cx, 357
	mov dx, 227
	int 10h
	
	mov cx, 362
	mov dx, 227
	int 10h
	
	mov cx, 363
	mov dx, 227
	int 10h
	
	mov cx, 364
	mov dx, 227
	int 10h
	
	mov cx, 365
	mov dx, 227
	int 10h
	
	mov cx, 368
	mov dx, 227
	int 10h
	
	mov cx, 375
	mov dx, 227
	int 10h
	
	mov cx, 380
	mov dx, 227
	int 10h
	
	mov cx, 384
	mov dx, 227
	int 10h
	
	mov cx, 391
	mov dx, 227
	int 10h
	
	mov cx, 401
	mov dx, 227
	int 10h
	
	mov cx, 402
	mov dx, 227
	int 10h
	
	mov cx, 403
	mov dx, 227
	int 10h
	
	mov cx, 404
	mov dx, 227
	int 10h
	
	mov cx, 409
	mov dx, 227
	int 10h
	
	mov cx, 411
	mov dx, 227
	int 10h
	
	mov cx, 412
	mov dx, 227
	int 10h
	
	mov cx, 413
	mov dx, 227
	int 10h
	
	mov cx, 418
	mov dx, 227
	int 10h
	
	mov cx, 419
	mov dx, 227
	int 10h
	
	mov cx, 420
	mov dx, 227
	int 10h
	
	mov cx, 421
	mov dx, 227
	int 10h
	
	mov cx, 424
	mov dx, 227
	int 10h
	
	mov cx, 425
	mov dx, 227
	int 10h
	
	mov cx, 426
	mov dx, 227
	int 10h
	
	mov cx, 427
	mov dx, 227
	int 10h
	
	mov cx, 428
	mov dx, 227
	int 10h
	
	mov cx, 429
	mov dx, 227
	int 10h
	
	mov cx, 434
	mov dx, 227
	int 10h
	
	mov cx, 435
	mov dx, 227
	int 10h
	
	mov cx, 436
	mov dx, 227
	int 10h
	
	mov cx, 444
	mov dx, 227
	int 10h
	
	mov cx, 452
	mov dx, 227
	int 10h
	
	mov cx, 458
	mov dx, 227
	int 10h
	
	mov cx, 459
	mov dx, 227
	int 10h
	
	mov cx, 460
	mov dx, 227
	int 10h
	
	mov cx, 461
	mov dx, 227
	int 10h
	
	mov cx, 466
	mov dx, 227
	int 10h
	
	mov cx, 467
	mov dx, 227
	int 10h
	
	mov cx, 468
	mov dx, 227
	int 10h
	
	mov cx, 470
	mov dx, 227
	int 10h
	
	mov cx, 481
	mov dx, 227
	int 10h
	
	mov cx, 483
	mov dx, 227
	int 10h
	
	mov cx, 484
	mov dx, 227
	int 10h
	
	mov cx, 485
	mov dx, 227
	int 10h
	
	mov cx, 490
	mov dx, 227
	int 10h
	
	mov cx, 491
	mov dx, 227
	int 10h
	
	mov cx, 492
	mov dx, 227
	int 10h
	
	mov cx, 497
	mov dx, 227
	int 10h
	
	mov cx, 499
	mov dx, 227
	int 10h
	
	mov cx, 500
	mov dx, 227
	int 10h
	
	mov cx, 501
	mov dx, 227
	int 10h
	
	mov cx, 506
	mov dx, 227
	int 10h
	
	mov cx, 507
	mov dx, 227
	int 10h
	
	mov cx, 508
	mov dx, 227
	int 10h
	
	mov cx, 510
	mov dx, 227
	int 10h
	
	mov cx, 512
	mov dx, 227
	int 10h
	
	mov cx, 519
	mov dx, 227
	int 10h
	
	mov cx, 522
	mov dx, 227
	int 10h
	
	mov cx, 523
	mov dx, 227
	int 10h
	
	mov cx, 524
	mov dx, 227
	int 10h
	
	mov cx, 529
	mov dx, 227
	int 10h
	
	mov cx, 531
	mov dx, 227
	int 10h
	
	mov cx, 532
	mov dx, 227
	int 10h
	
	mov cx, 533
	mov dx, 227
	int 10h
	
	mov cx, 538
	mov dx, 227
	int 10h
	
	mov cx, 539
	mov dx, 227
	int 10h
	
	mov cx, 540
	mov dx, 227
	int 10h
	
	mov cx, 541
	mov dx, 227
	int 10h
	
	mov cx, 3
	mov dx, 228
	int 10h
	
	mov cx, 10
	mov dx, 228
	int 10h
	
	mov cx, 25
	mov dx, 228
	int 10h
	
	mov cx, 26
	mov dx, 228
	int 10h
	
	mov cx, 30
	mov dx, 228
	int 10h
	
	mov cx, 33
	mov dx, 228
	int 10h
	
	mov cx, 34
	mov dx, 228
	int 10h
	
	mov cx, 37
	mov dx, 228
	int 10h
	
	mov cx, 41
	mov dx, 228
	int 10h
	
	mov cx, 46
	mov dx, 228
	int 10h
	
	mov cx, 49
	mov dx, 228
	int 10h
	
	mov cx, 50
	mov dx, 228
	int 10h
	
	mov cx, 54
	mov dx, 228
	int 10h
	
	mov cx, 60
	mov dx, 228
	int 10h
	
	mov cx, 66
	mov dx, 228
	int 10h
	
	mov cx, 70
	mov dx, 228
	int 10h
	
	mov cx, 72
	mov dx, 228
	int 10h
	
	mov cx, 73
	mov dx, 228
	int 10h
	
	mov cx, 75
	mov dx, 228
	int 10h
	
	mov cx, 76
	mov dx, 228
	int 10h
	
	mov cx, 78
	mov dx, 228
	int 10h
	
	mov cx, 81
	mov dx, 228
	int 10h
	
	mov cx, 98
	mov dx, 228
	int 10h
	
	mov cx, 105
	mov dx, 228
	int 10h
	
	mov cx, 110
	mov dx, 228
	int 10h
	
	mov cx, 113
	mov dx, 228
	int 10h
	
	mov cx, 114
	mov dx, 228
	int 10h
	
	mov cx, 118
	mov dx, 228
	int 10h
	
	mov cx, 122
	mov dx, 228
	int 10h
	
	mov cx, 132
	mov dx, 228
	int 10h
	
	mov cx, 137
	mov dx, 228
	int 10h
	
	mov cx, 138
	mov dx, 228
	int 10h
	
	mov cx, 142
	mov dx, 228
	int 10h
	
	mov cx, 145
	mov dx, 228
	int 10h
	
	mov cx, 150
	mov dx, 228
	int 10h
	
	mov cx, 154
	mov dx, 228
	int 10h
	
	mov cx, 158
	mov dx, 228
	int 10h
	
	mov cx, 177
	mov dx, 228
	int 10h
	
	mov cx, 181
	mov dx, 228
	int 10h
	
	mov cx, 182
	mov dx, 228
	int 10h
	
	mov cx, 188
	mov dx, 228
	int 10h
	
	mov cx, 193
	mov dx, 228
	int 10h
	
	mov cx, 205
	mov dx, 228
	int 10h
	
	mov cx, 209
	mov dx, 228
	int 10h
	
	mov cx, 210
	mov dx, 228
	int 10h
	
	mov cx, 214
	mov dx, 228
	int 10h
	
	mov cx, 220
	mov dx, 228
	int 10h
	
	mov cx, 226
	mov dx, 228
	int 10h
	
	mov cx, 230
	mov dx, 228
	int 10h
	
	mov cx, 241
	mov dx, 228
	int 10h
	
	mov cx, 246
	mov dx, 228
	int 10h
	
	mov cx, 249
	mov dx, 228
	int 10h
	
	mov cx, 250
	mov dx, 228
	int 10h
	
	mov cx, 253
	mov dx, 228
	int 10h
	
	mov cx, 265
	mov dx, 228
	int 10h
	
	mov cx, 266
	mov dx, 228
	int 10h
	
	mov cx, 269
	mov dx, 228
	int 10h
	
	mov cx, 274
	mov dx, 228
	int 10h
	
	mov cx, 278
	mov dx, 228
	int 10h
	
	mov cx, 280
	mov dx, 228
	int 10h
	
	mov cx, 281
	mov dx, 228
	int 10h
	
	mov cx, 283
	mov dx, 228
	int 10h
	
	mov cx, 284
	mov dx, 228
	int 10h
	
	mov cx, 286
	mov dx, 228
	int 10h
	
	mov cx, 289
	mov dx, 228
	int 10h
	
	mov cx, 294
	mov dx, 228
	int 10h
	
	mov cx, 297
	mov dx, 228
	int 10h
	
	mov cx, 301
	mov dx, 228
	int 10h
	
	mov cx, 306
	mov dx, 228
	int 10h
	
	mov cx, 310
	mov dx, 228
	int 10h
	
	mov cx, 325
	mov dx, 228
	int 10h
	
	mov cx, 329
	mov dx, 228
	int 10h
	
	mov cx, 330
	mov dx, 228
	int 10h
	
	mov cx, 334
	mov dx, 228
	int 10h
	
	mov cx, 337
	mov dx, 228
	int 10h
	
	mov cx, 342
	mov dx, 228
	int 10h
	
	mov cx, 353
	mov dx, 228
	int 10h
	
	mov cx, 354
	mov dx, 228
	int 10h
	
	mov cx, 358
	mov dx, 228
	int 10h
	
	mov cx, 362
	mov dx, 228
	int 10h
	
	mov cx, 366
	mov dx, 228
	int 10h
	
	mov cx, 368
	mov dx, 228
	int 10h
	
	mov cx, 371
	mov dx, 228
	int 10h
	
	mov cx, 375
	mov dx, 228
	int 10h
	
	mov cx, 380
	mov dx, 228
	int 10h
	
	mov cx, 385
	mov dx, 228
	int 10h
	
	mov cx, 390
	mov dx, 228
	int 10h
	
	mov cx, 404
	mov dx, 228
	int 10h
	
	mov cx, 409
	mov dx, 228
	int 10h
	
	mov cx, 410
	mov dx, 228
	int 10h
	
	mov cx, 414
	mov dx, 228
	int 10h
	
	mov cx, 417
	mov dx, 228
	int 10h
	
	mov cx, 426
	mov dx, 228
	int 10h
	
	mov cx, 437
	mov dx, 228
	int 10h
	
	mov cx, 444
	mov dx, 228
	int 10h
	
	mov cx, 452
	mov dx, 228
	int 10h
	
	mov cx, 458
	mov dx, 228
	int 10h
	
	mov cx, 462
	mov dx, 228
	int 10h
	
	mov cx, 465
	mov dx, 228
	int 10h
	
	mov cx, 469
	mov dx, 228
	int 10h
	
	mov cx, 470
	mov dx, 228
	int 10h
	
	mov cx, 481
	mov dx, 228
	int 10h
	
	mov cx, 482
	mov dx, 228
	int 10h
	
	mov cx, 486
	mov dx, 228
	int 10h
	
	mov cx, 493
	mov dx, 228
	int 10h
	
	mov cx, 497
	mov dx, 228
	int 10h
	
	mov cx, 498
	mov dx, 228
	int 10h
	
	mov cx, 501
	mov dx, 228
	int 10h
	
	mov cx, 505
	mov dx, 228
	int 10h
	
	mov cx, 509
	mov dx, 228
	int 10h
	
	mov cx, 510
	mov dx, 228
	int 10h
	
	mov cx, 512
	mov dx, 228
	int 10h
	
	mov cx, 515
	mov dx, 228
	int 10h
	
	mov cx, 519
	mov dx, 228
	int 10h
	
	mov cx, 525
	mov dx, 228
	int 10h
	
	mov cx, 529
	mov dx, 228
	int 10h
	
	mov cx, 530
	mov dx, 228
	int 10h
	
	mov cx, 533
	mov dx, 228
	int 10h
	
	mov cx, 538
	mov dx, 228
	int 10h
	
	mov cx, 542
	mov dx, 228
	int 10h
	
	mov cx, 3
	mov dx, 229
	int 10h
	
	mov cx, 10
	mov dx, 229
	int 10h
	
	mov cx, 25
	mov dx, 229
	int 10h
	
	mov cx, 30
	mov dx, 229
	int 10h
	
	mov cx, 33
	mov dx, 229
	int 10h
	
	mov cx, 41
	mov dx, 229
	int 10h
	
	mov cx, 46
	mov dx, 229
	int 10h
	
	mov cx, 49
	mov dx, 229
	int 10h
	
	mov cx, 54
	mov dx, 229
	int 10h
	
	mov cx, 60
	mov dx, 229
	int 10h
	
	mov cx, 65
	mov dx, 229
	int 10h
	
	mov cx, 70
	mov dx, 229
	int 10h
	
	mov cx, 72
	mov dx, 229
	int 10h
	
	mov cx, 75
	mov dx, 229
	int 10h
	
	mov cx, 78
	mov dx, 229
	int 10h
	
	mov cx, 81
	mov dx, 229
	int 10h
	
	mov cx, 82
	mov dx, 229
	int 10h
	
	mov cx, 97
	mov dx, 229
	int 10h
	
	mov cx, 105
	mov dx, 229
	int 10h
	
	mov cx, 110
	mov dx, 229
	int 10h
	
	mov cx, 113
	mov dx, 229
	int 10h
	
	mov cx, 118
	mov dx, 229
	int 10h
	
	mov cx, 122
	mov dx, 229
	int 10h
	
	mov cx, 132
	mov dx, 229
	int 10h
	
	mov cx, 137
	mov dx, 229
	int 10h
	
	mov cx, 142
	mov dx, 229
	int 10h
	
	mov cx, 145
	mov dx, 229
	int 10h
	
	mov cx, 150
	mov dx, 229
	int 10h
	
	mov cx, 153
	mov dx, 229
	int 10h
	
	mov cx, 158
	mov dx, 229
	int 10h
	
	mov cx, 177
	mov dx, 229
	int 10h
	
	mov cx, 182
	mov dx, 229
	int 10h
	
	mov cx, 188
	mov dx, 229
	int 10h
	
	mov cx, 193
	mov dx, 229
	int 10h
	
	mov cx, 194
	mov dx, 229
	int 10h
	
	mov cx, 205
	mov dx, 229
	int 10h
	
	mov cx, 209
	mov dx, 229
	int 10h
	
	mov cx, 214
	mov dx, 229
	int 10h
	
	mov cx, 220
	mov dx, 229
	int 10h
	
	mov cx, 225
	mov dx, 229
	int 10h
	
	mov cx, 230
	mov dx, 229
	int 10h
	
	mov cx, 241
	mov dx, 229
	int 10h
	
	mov cx, 246
	mov dx, 229
	int 10h
	
	mov cx, 249
	mov dx, 229
	int 10h
	
	mov cx, 265
	mov dx, 229
	int 10h
	
	mov cx, 273
	mov dx, 229
	int 10h
	
	mov cx, 278
	mov dx, 229
	int 10h
	
	mov cx, 280
	mov dx, 229
	int 10h
	
	mov cx, 283
	mov dx, 229
	int 10h
	
	mov cx, 286
	mov dx, 229
	int 10h
	
	mov cx, 289
	mov dx, 229
	int 10h
	
	mov cx, 294
	mov dx, 229
	int 10h
	
	mov cx, 297
	mov dx, 229
	int 10h
	
	mov cx, 301
	mov dx, 229
	int 10h
	
	mov cx, 305
	mov dx, 229
	int 10h
	
	mov cx, 310
	mov dx, 229
	int 10h
	
	mov cx, 325
	mov dx, 229
	int 10h
	
	mov cx, 329
	mov dx, 229
	int 10h
	
	mov cx, 334
	mov dx, 229
	int 10h
	
	mov cx, 337
	mov dx, 229
	int 10h
	
	mov cx, 342
	mov dx, 229
	int 10h
	
	mov cx, 353
	mov dx, 229
	int 10h
	
	mov cx, 358
	mov dx, 229
	int 10h
	
	mov cx, 361
	mov dx, 229
	int 10h
	
	mov cx, 366
	mov dx, 229
	int 10h
	
	mov cx, 369
	mov dx, 229
	int 10h
	
	mov cx, 371
	mov dx, 229
	int 10h
	
	mov cx, 372
	mov dx, 229
	int 10h
	
	mov cx, 374
	mov dx, 229
	int 10h
	
	mov cx, 380
	mov dx, 229
	int 10h
	
	mov cx, 385
	mov dx, 229
	int 10h
	
	mov cx, 390
	mov dx, 229
	int 10h
	
	mov cx, 404
	mov dx, 229
	int 10h
	
	mov cx, 409
	mov dx, 229
	int 10h
	
	mov cx, 414
	mov dx, 229
	int 10h
	
	mov cx, 417
	mov dx, 229
	int 10h
	
	mov cx, 418
	mov dx, 229
	int 10h
	
	mov cx, 426
	mov dx, 229
	int 10h
	
	mov cx, 437
	mov dx, 229
	int 10h
	
	mov cx, 444
	mov dx, 229
	int 10h
	
	mov cx, 452
	mov dx, 229
	int 10h
	
	mov cx, 457
	mov dx, 229
	int 10h
	
	mov cx, 462
	mov dx, 229
	int 10h
	
	mov cx, 465
	mov dx, 229
	int 10h
	
	mov cx, 470
	mov dx, 229
	int 10h
	
	mov cx, 481
	mov dx, 229
	int 10h
	
	mov cx, 486
	mov dx, 229
	int 10h
	
	mov cx, 493
	mov dx, 229
	int 10h
	
	mov cx, 497
	mov dx, 229
	int 10h
	
	mov cx, 505
	mov dx, 229
	int 10h
	
	mov cx, 510
	mov dx, 229
	int 10h
	
	mov cx, 513
	mov dx, 229
	int 10h
	
	mov cx, 515
	mov dx, 229
	int 10h
	
	mov cx, 516
	mov dx, 229
	int 10h
	
	mov cx, 518
	mov dx, 229
	int 10h
	
	mov cx, 525
	mov dx, 229
	int 10h
	
	mov cx, 529
	mov dx, 229
	int 10h
	
	mov cx, 537
	mov dx, 229
	int 10h
	
	mov cx, 542
	mov dx, 229
	int 10h
	
	mov cx, 3
	mov dx, 230
	int 10h
	
	mov cx, 10
	mov dx, 230
	int 10h
	
	mov cx, 25
	mov dx, 230
	int 10h
	
	mov cx, 30
	mov dx, 230
	int 10h
	
	mov cx, 33
	mov dx, 230
	int 10h
	
	mov cx, 41
	mov dx, 230
	int 10h
	
	mov cx, 46
	mov dx, 230
	int 10h
	
	mov cx, 49
	mov dx, 230
	int 10h
	
	mov cx, 54
	mov dx, 230
	int 10h
	
	mov cx, 60
	mov dx, 230
	int 10h
	
	mov cx, 65
	mov dx, 230
	int 10h
	
	mov cx, 66
	mov dx, 230
	int 10h
	
	mov cx, 67
	mov dx, 230
	int 10h
	
	mov cx, 68
	mov dx, 230
	int 10h
	
	mov cx, 69
	mov dx, 230
	int 10h
	
	mov cx, 70
	mov dx, 230
	int 10h
	
	mov cx, 72
	mov dx, 230
	int 10h
	
	mov cx, 75
	mov dx, 230
	int 10h
	
	mov cx, 78
	mov dx, 230
	int 10h
	
	mov cx, 83
	mov dx, 230
	int 10h
	
	mov cx, 84
	mov dx, 230
	int 10h
	
	mov cx, 97
	mov dx, 230
	int 10h
	
	mov cx, 105
	mov dx, 230
	int 10h
	
	mov cx, 110
	mov dx, 230
	int 10h
	
	mov cx, 113
	mov dx, 230
	int 10h
	
	mov cx, 118
	mov dx, 230
	int 10h
	
	mov cx, 122
	mov dx, 230
	int 10h
	
	mov cx, 132
	mov dx, 230
	int 10h
	
	mov cx, 137
	mov dx, 230
	int 10h
	
	mov cx, 142
	mov dx, 230
	int 10h
	
	mov cx, 145
	mov dx, 230
	int 10h
	
	mov cx, 150
	mov dx, 230
	int 10h
	
	mov cx, 153
	mov dx, 230
	int 10h
	
	mov cx, 154
	mov dx, 230
	int 10h
	
	mov cx, 155
	mov dx, 230
	int 10h
	
	mov cx, 156
	mov dx, 230
	int 10h
	
	mov cx, 157
	mov dx, 230
	int 10h
	
	mov cx, 158
	mov dx, 230
	int 10h
	
	mov cx, 177
	mov dx, 230
	int 10h
	
	mov cx, 182
	mov dx, 230
	int 10h
	
	mov cx, 188
	mov dx, 230
	int 10h
	
	mov cx, 195
	mov dx, 230
	int 10h
	
	mov cx, 196
	mov dx, 230
	int 10h
	
	mov cx, 202
	mov dx, 230
	int 10h
	
	mov cx, 203
	mov dx, 230
	int 10h
	
	mov cx, 204
	mov dx, 230
	int 10h
	
	mov cx, 205
	mov dx, 230
	int 10h
	
	mov cx, 209
	mov dx, 230
	int 10h
	
	mov cx, 214
	mov dx, 230
	int 10h
	
	mov cx, 220
	mov dx, 230
	int 10h
	
	mov cx, 225
	mov dx, 230
	int 10h
	
	mov cx, 226
	mov dx, 230
	int 10h
	
	mov cx, 227
	mov dx, 230
	int 10h
	
	mov cx, 228
	mov dx, 230
	int 10h
	
	mov cx, 229
	mov dx, 230
	int 10h
	
	mov cx, 230
	mov dx, 230
	int 10h
	
	mov cx, 241
	mov dx, 230
	int 10h
	
	mov cx, 246
	mov dx, 230
	int 10h
	
	mov cx, 249
	mov dx, 230
	int 10h
	
	mov cx, 265
	mov dx, 230
	int 10h
	
	mov cx, 273
	mov dx, 230
	int 10h
	
	mov cx, 274
	mov dx, 230
	int 10h
	
	mov cx, 275
	mov dx, 230
	int 10h
	
	mov cx, 276
	mov dx, 230
	int 10h
	
	mov cx, 277
	mov dx, 230
	int 10h
	
	mov cx, 278
	mov dx, 230
	int 10h
	
	mov cx, 280
	mov dx, 230
	int 10h
	
	mov cx, 283
	mov dx, 230
	int 10h
	
	mov cx, 286
	mov dx, 230
	int 10h
	
	mov cx, 289
	mov dx, 230
	int 10h
	
	mov cx, 294
	mov dx, 230
	int 10h
	
	mov cx, 297
	mov dx, 230
	int 10h
	
	mov cx, 301
	mov dx, 230
	int 10h
	
	mov cx, 305
	mov dx, 230
	int 10h
	
	mov cx, 306
	mov dx, 230
	int 10h
	
	mov cx, 307
	mov dx, 230
	int 10h
	
	mov cx, 308
	mov dx, 230
	int 10h
	
	mov cx, 309
	mov dx, 230
	int 10h
	
	mov cx, 310
	mov dx, 230
	int 10h
	
	mov cx, 322
	mov dx, 230
	int 10h
	
	mov cx, 323
	mov dx, 230
	int 10h
	
	mov cx, 324
	mov dx, 230
	int 10h
	
	mov cx, 325
	mov dx, 230
	int 10h
	
	mov cx, 329
	mov dx, 230
	int 10h
	
	mov cx, 334
	mov dx, 230
	int 10h
	
	mov cx, 338
	mov dx, 230
	int 10h
	
	mov cx, 341
	mov dx, 230
	int 10h
	
	mov cx, 353
	mov dx, 230
	int 10h
	
	mov cx, 358
	mov dx, 230
	int 10h
	
	mov cx, 361
	mov dx, 230
	int 10h
	
	mov cx, 362
	mov dx, 230
	int 10h
	
	mov cx, 363
	mov dx, 230
	int 10h
	
	mov cx, 364
	mov dx, 230
	int 10h
	
	mov cx, 365
	mov dx, 230
	int 10h
	
	mov cx, 366
	mov dx, 230
	int 10h
	
	mov cx, 369
	mov dx, 230
	int 10h
	
	mov cx, 371
	mov dx, 230
	int 10h
	
	mov cx, 372
	mov dx, 230
	int 10h
	
	mov cx, 374
	mov dx, 230
	int 10h
	
	mov cx, 380
	mov dx, 230
	int 10h
	
	mov cx, 386
	mov dx, 230
	int 10h
	
	mov cx, 389
	mov dx, 230
	int 10h
	
	mov cx, 404
	mov dx, 230
	int 10h
	
	mov cx, 409
	mov dx, 230
	int 10h
	
	mov cx, 414
	mov dx, 230
	int 10h
	
	mov cx, 419
	mov dx, 230
	int 10h
	
	mov cx, 420
	mov dx, 230
	int 10h
	
	mov cx, 426
	mov dx, 230
	int 10h
	
	mov cx, 434
	mov dx, 230
	int 10h
	
	mov cx, 435
	mov dx, 230
	int 10h
	
	mov cx, 436
	mov dx, 230
	int 10h
	
	mov cx, 437
	mov dx, 230
	int 10h
	
	mov cx, 444
	mov dx, 230
	int 10h
	
	mov cx, 452
	mov dx, 230
	int 10h
	
	mov cx, 457
	mov dx, 230
	int 10h
	
	mov cx, 458
	mov dx, 230
	int 10h
	
	mov cx, 459
	mov dx, 230
	int 10h
	
	mov cx, 460
	mov dx, 230
	int 10h
	
	mov cx, 461
	mov dx, 230
	int 10h
	
	mov cx, 462
	mov dx, 230
	int 10h
	
	mov cx, 465
	mov dx, 230
	int 10h
	
	mov cx, 470
	mov dx, 230
	int 10h
	
	mov cx, 481
	mov dx, 230
	int 10h
	
	mov cx, 486
	mov dx, 230
	int 10h
	
	mov cx, 490
	mov dx, 230
	int 10h
	
	mov cx, 491
	mov dx, 230
	int 10h
	
	mov cx, 492
	mov dx, 230
	int 10h
	
	mov cx, 493
	mov dx, 230
	int 10h
	
	mov cx, 497
	mov dx, 230
	int 10h
	
	mov cx, 505
	mov dx, 230
	int 10h
	
	mov cx, 510
	mov dx, 230
	int 10h
	
	mov cx, 513
	mov dx, 230
	int 10h
	
	mov cx, 515
	mov dx, 230
	int 10h
	
	mov cx, 516
	mov dx, 230
	int 10h
	
	mov cx, 518
	mov dx, 230
	int 10h
	
	mov cx, 522
	mov dx, 230
	int 10h
	
	mov cx, 523
	mov dx, 230
	int 10h
	
	mov cx, 524
	mov dx, 230
	int 10h
	
	mov cx, 525
	mov dx, 230
	int 10h
	
	mov cx, 529
	mov dx, 230
	int 10h
	
	mov cx, 537
	mov dx, 230
	int 10h
	
	mov cx, 538
	mov dx, 230
	int 10h
	
	mov cx, 539
	mov dx, 230
	int 10h
	
	mov cx, 540
	mov dx, 230
	int 10h
	
	mov cx, 541
	mov dx, 230
	int 10h
	
	mov cx, 542
	mov dx, 230
	int 10h
	
	mov cx, 3
	mov dx, 231
	int 10h
	
	mov cx, 10
	mov dx, 231
	int 10h
	
	mov cx, 25
	mov dx, 231
	int 10h
	
	mov cx, 30
	mov dx, 231
	int 10h
	
	mov cx, 33
	mov dx, 231
	int 10h
	
	mov cx, 41
	mov dx, 231
	int 10h
	
	mov cx, 46
	mov dx, 231
	int 10h
	
	mov cx, 49
	mov dx, 231
	int 10h
	
	mov cx, 54
	mov dx, 231
	int 10h
	
	mov cx, 60
	mov dx, 231
	int 10h
	
	mov cx, 65
	mov dx, 231
	int 10h
	
	mov cx, 72
	mov dx, 231
	int 10h
	
	mov cx, 75
	mov dx, 231
	int 10h
	
	mov cx, 78
	mov dx, 231
	int 10h
	
	mov cx, 85
	mov dx, 231
	int 10h
	
	mov cx, 97
	mov dx, 231
	int 10h
	
	mov cx, 105
	mov dx, 231
	int 10h
	
	mov cx, 110
	mov dx, 231
	int 10h
	
	mov cx, 113
	mov dx, 231
	int 10h
	
	mov cx, 118
	mov dx, 231
	int 10h
	
	mov cx, 122
	mov dx, 231
	int 10h
	
	mov cx, 132
	mov dx, 231
	int 10h
	
	mov cx, 137
	mov dx, 231
	int 10h
	
	mov cx, 142
	mov dx, 231
	int 10h
	
	mov cx, 145
	mov dx, 231
	int 10h
	
	mov cx, 150
	mov dx, 231
	int 10h
	
	mov cx, 153
	mov dx, 231
	int 10h
	
	mov cx, 177
	mov dx, 231
	int 10h
	
	mov cx, 182
	mov dx, 231
	int 10h
	
	mov cx, 188
	mov dx, 231
	int 10h
	
	mov cx, 197
	mov dx, 231
	int 10h
	
	mov cx, 201
	mov dx, 231
	int 10h
	
	mov cx, 205
	mov dx, 231
	int 10h
	
	mov cx, 209
	mov dx, 231
	int 10h
	
	mov cx, 214
	mov dx, 231
	int 10h
	
	mov cx, 220
	mov dx, 231
	int 10h
	
	mov cx, 225
	mov dx, 231
	int 10h
	
	mov cx, 241
	mov dx, 231
	int 10h
	
	mov cx, 246
	mov dx, 231
	int 10h
	
	mov cx, 249
	mov dx, 231
	int 10h
	
	mov cx, 265
	mov dx, 231
	int 10h
	
	mov cx, 273
	mov dx, 231
	int 10h
	
	mov cx, 280
	mov dx, 231
	int 10h
	
	mov cx, 283
	mov dx, 231
	int 10h
	
	mov cx, 286
	mov dx, 231
	int 10h
	
	mov cx, 289
	mov dx, 231
	int 10h
	
	mov cx, 294
	mov dx, 231
	int 10h
	
	mov cx, 298
	mov dx, 231
	int 10h
	
	mov cx, 300
	mov dx, 231
	int 10h
	
	mov cx, 305
	mov dx, 231
	int 10h
	
	mov cx, 321
	mov dx, 231
	int 10h
	
	mov cx, 325
	mov dx, 231
	int 10h
	
	mov cx, 329
	mov dx, 231
	int 10h
	
	mov cx, 334
	mov dx, 231
	int 10h
	
	mov cx, 338
	mov dx, 231
	int 10h
	
	mov cx, 341
	mov dx, 231
	int 10h
	
	mov cx, 353
	mov dx, 231
	int 10h
	
	mov cx, 358
	mov dx, 231
	int 10h
	
	mov cx, 361
	mov dx, 231
	int 10h
	
	mov cx, 369
	mov dx, 231
	int 10h
	
	mov cx, 370
	mov dx, 231
	int 10h
	
	mov cx, 372
	mov dx, 231
	int 10h
	
	mov cx, 374
	mov dx, 231
	int 10h
	
	mov cx, 380
	mov dx, 231
	int 10h
	
	mov cx, 386
	mov dx, 231
	int 10h
	
	mov cx, 389
	mov dx, 231
	int 10h
	
	mov cx, 404
	mov dx, 231
	int 10h
	
	mov cx, 409
	mov dx, 231
	int 10h
	
	mov cx, 414
	mov dx, 231
	int 10h
	
		mov cx, 421
	mov dx, 231
	int 10h
	
	mov cx, 426
	mov dx, 231
	int 10h
	
	mov cx, 433
	mov dx, 231
	int 10h
	
	mov cx, 437
	mov dx, 231
	int 10h
	
	mov cx, 444
	mov dx, 231
	int 10h
	
	mov cx, 452
	mov dx, 231
	int 10h
	
	mov cx, 457
	mov dx, 231
	int 10h
	
	mov cx, 465
	mov dx, 231
	int 10h
	
	mov cx, 470
	mov dx, 231
	int 10h
	
	mov cx, 481
	mov dx, 231
	int 10h
	
	mov cx, 486
	mov dx, 231
	int 10h
	
	mov cx, 489
	mov dx, 231
	int 10h
	
	mov cx, 493
	mov dx, 231
	int 10h
	
	mov cx, 497
	mov dx, 231
	int 10h
	
	mov cx, 505
	mov dx, 231
	int 10h
	
	mov cx, 510
	mov dx, 231
	int 10h
	
	mov cx, 513
	mov dx, 231
	int 10h
	
	mov cx, 514
	mov dx, 231
	int 10h
	
	mov cx, 516
	mov dx, 231
	int 10h
	
	mov cx, 518
	mov dx, 231
	int 10h

	mov cx, 521
	mov dx, 231
	int 10h
	
	mov cx, 525
	mov dx, 231
	int 10h
	
	mov cx, 529
	mov dx, 231
	int 10h
	
	mov cx, 537
	mov dx, 231
	int 10h
	
	mov cx, 3
	mov dx, 232
	int 10h
	
	mov cx, 10
	mov dx, 232
	int 10h
	
	mov cx, 25
	mov dx, 232
	int 10h
	
	mov cx, 26
	mov dx, 232
	int 10h
	
	mov cx, 30
	mov dx, 232
	int 10h
	
	mov cx, 33
	mov dx, 232
	int 10h
	
	mov cx, 41
	mov dx, 232
	int 10h
	
	mov cx, 46
	mov dx, 232
	int 10h
	
	mov cx, 49
	mov dx, 232
	int 10h
	
	mov cx, 50
	mov dx, 232
	int 10h
	
	mov cx, 54
	mov dx, 232
	int 10h
	
	mov cx, 60
	mov dx, 232
	int 10h
	
	mov cx, 65
	mov dx, 232
	int 10h
	
	mov cx, 72
	mov dx, 232
	int 10h
	
	mov cx, 75
	mov dx, 232
	int 10h
	
	mov cx, 78
	mov dx, 232
	int 10h
	
	mov cx, 85
	mov dx, 232
	int 10h
	
	mov cx, 98
	mov dx, 232
	int 10h
	
	mov cx, 105
	mov dx, 232
	int 10h
	
	mov cx, 110
	mov dx, 232
	int 10h
	
	mov cx, 113
	mov dx, 232
	int 10h
	
	mov cx, 118
	mov dx, 232
	int 10h
	
	mov cx, 122
	mov dx, 232
	int 10h
	
	mov cx, 132
	mov dx, 232
	int 10h
	
	mov cx, 137
	mov dx, 232
	int 10h
	
	mov cx, 142
	mov dx, 232
	int 10h
	
	mov cx, 145
	mov dx, 232
	int 10h
	
	mov cx, 149
	mov dx, 232
	int 10h
	
	mov cx, 150
	mov dx, 232
	int 10h
	
	mov cx, 153
	mov dx, 232
	int 10h
	
	mov cx, 162
	mov dx, 232
	int 10h
	
	mov cx, 163
	mov dx, 232
	int 10h
	
	mov cx, 177
	mov dx, 232
	int 10h
	
	mov cx, 181
	mov dx, 232
	int 10h
	
	mov cx, 182
	mov dx, 232
	int 10h
	
	mov cx, 188
	mov dx, 232
	int 10h
	
	mov cx, 197
	mov dx, 232
	int 10h
	
	mov cx, 201
	mov dx, 232
	int 10h
	
	mov cx, 205
	mov dx, 232
	int 10h
	
	mov cx, 209
	mov dx, 232
	int 10h
	
	mov cx, 210
	mov dx, 232
	int 10h
	
	mov cx, 214
	mov dx, 232
	int 10h
	
	mov cx, 220
	mov dx, 232
	int 10h
	
	mov cx, 225
	mov dx, 232
	int 10h
	
	mov cx, 241
	mov dx, 232
	int 10h
	
	mov cx, 246
	mov dx, 232
	int 10h
	
	mov cx, 249
	mov dx, 232
	int 10h
	
	mov cx, 265
	mov dx, 232
	int 10h
	
	mov cx, 273
	mov dx, 232
	int 10h
	
	mov cx, 280
	mov dx, 232
	int 10h
	
	mov cx, 283
	mov dx, 232
	int 10h
	
	mov cx, 286
	mov dx, 232
	int 10h
	
	mov cx, 289
	mov dx, 232
	int 10h
	
	mov cx, 294
	mov dx, 232
	int 10h
	
	mov cx, 298
	mov dx, 232
	int 10h
	
	mov cx, 300
	mov dx, 232
	int 10h
	
	mov cx, 305
	mov dx, 232
	int 10h
	
	mov cx, 321
	mov dx, 232
	int 10h
	
	mov cx, 325
	mov dx, 232
	int 10h
	
	mov cx, 329
	mov dx, 232
	int 10h
	
	mov cx, 334
	mov dx, 232
	int 10h
	
	mov cx, 339
	mov dx, 232
	int 10h
	
	mov cx, 340
	mov dx, 232
	int 10h
	
	mov cx, 353
	mov dx, 232
	int 10h
	
	mov cx, 358
	mov dx, 232
	int 10h
	
	mov cx, 361
	mov dx, 232
	int 10h
	
	mov cx, 370
	mov dx, 232
	int 10h
	
	mov cx, 373
	mov dx, 232
	int 10h
	
	mov cx, 380
	mov dx, 232
	int 10h
	
	mov cx, 387
	mov dx, 232
	int 10h
	
	mov cx, 388
	mov dx, 232
	int 10h
	
	mov cx, 404
	mov dx, 232
	int 10h
	
	mov cx, 409
	mov dx, 232
	int 10h
	
	mov cx, 414
	mov dx, 232
	int 10h
	
	mov cx, 421
	mov dx, 232
	int 10h
	
	mov cx, 426
	mov dx, 232
	int 10h
	
	mov cx, 433
	mov dx, 232
	int 10h
	
	mov cx, 437
	mov dx, 232
	int 10h
	
	mov cx, 444
	mov dx, 232
	int 10h
	
	mov cx, 452
	mov dx, 232
	int 10h
	
	mov cx, 457
	mov dx, 232
	int 10h
	
	mov cx, 465
	mov dx, 232
	int 10h
	
	mov cx, 469
	mov dx, 232
	int 10h
	
	mov cx, 470
	mov dx, 232
	int 10h
	
	mov cx, 481
	mov dx, 232
	int 10h
	
	mov cx, 486
	mov dx, 232
	int 10h
	
	mov cx, 489
	mov dx, 232
	int 10h
	
	mov cx, 493
	mov dx, 232
	int 10h
	
	mov cx, 497
	mov dx, 232
	int 10h
	
	mov cx, 505
	mov dx, 232
	int 10h
	
	mov cx, 509
	mov dx, 232
	int 10h
	
	mov cx, 510
	mov dx, 232
	int 10h
	
	mov cx, 514
	mov dx, 232
	int 10h
	
	mov cx, 517
	mov dx, 232
	int 10h
	
	mov cx, 521
	mov dx, 232
	int 10h
	
	mov cx, 525
	mov dx, 232
	int 10h
	
	mov cx, 529
	mov dx, 232
	int 10h
	
	mov cx, 537
	mov dx, 232
	int 10h
	
	mov cx, 1
	mov dx, 233
	int 10h
	
	mov cx, 2
	mov dx, 233
	int 10h
	
	mov cx, 3
	mov dx, 233
	int 10h
	
	mov cx, 4
	mov dx, 233
	int 10h
	
	mov cx, 5
	mov dx, 233
	int 10h
	
	mov cx, 10
	mov dx, 233
	int 10h
	
	mov cx, 25
	mov dx, 233
	int 10h
	
	mov cx, 27
	mov dx, 233
	int 10h
	
	mov cx, 28
	mov dx, 233
	int 10h
	
	mov cx, 29
	mov dx, 233
	int 10h
	
	mov cx, 33
	mov dx, 233
	int 10h
	
	mov cx, 42
	mov dx, 233
	int 10h
	
	mov cx, 43
	mov dx, 233
	int 10h
	
	mov cx, 44
	mov dx, 233
	int 10h
	
	mov cx, 45
	mov dx, 233
	int 10h
	
	mov cx, 49
	mov dx, 233
	int 10h
	
	mov cx, 51
	mov dx, 233
	int 10h
	
	mov cx, 52
	mov dx, 233
	int 10h
	
	mov cx, 53
	mov dx, 233
	int 10h
	
	mov cx, 60
	mov dx, 233
	int 10h
	
	mov cx, 66
	mov dx, 233
	int 10h
	
	mov cx, 67
	mov dx, 233
	int 10h
	
	mov cx, 68
	mov dx, 233
	int 10h
	
	mov cx, 69
	mov dx, 233
	int 10h
	
	mov cx, 70
	mov dx, 233
	int 10h
	
	mov cx, 72
	mov dx, 233
	int 10h
	
	mov cx, 75
	mov dx, 233
	int 10h
	
	mov cx, 78
	mov dx, 233
	int 10h
	
	mov cx, 81
	mov dx, 233
	int 10h
	
	mov cx, 82
	mov dx, 233
	int 10h
	
	mov cx, 83
	mov dx, 233
	int 10h
	
	mov cx, 84
	mov dx, 233
	int 10h
	
	mov cx, 99
	mov dx, 233
	int 10h
	
	mov cx, 100
	mov dx, 233
	int 10h
	
	mov cx, 101
	mov dx, 233
	int 10h
	
	mov cx, 102
	mov dx, 233
	int 10h
	
	mov cx, 106
	mov dx, 233
	int 10h
	
	mov cx, 107
	mov dx, 233
	int 10h
	
	mov cx, 108
	mov dx, 233
	int 10h
	
	mov cx, 109
	mov dx, 233
	int 10h
	
	mov cx, 113
	mov dx, 233
	int 10h
	
	mov cx, 118
	mov dx, 233
	int 10h
	
	mov cx, 123
	mov dx, 233
	int 10h
	
	mov cx, 124
	mov dx, 233
	int 10h
	
	mov cx, 125
	mov dx, 233
	int 10h
	
	mov cx, 132
	mov dx, 233
	int 10h
	
	mov cx, 137
	mov dx, 233
	int 10h
	
	mov cx, 142
	mov dx, 233
	int 10h
	
	mov cx, 146
	mov dx, 233
	int 10h
	
	mov cx, 147
	mov dx, 233
	int 10h
	
	mov cx, 148
	mov dx, 233
	int 10h
	
	mov cx, 150
	mov dx, 233
	int 10h
	
	mov cx, 154
	mov dx, 233
	int 10h
	
	mov cx, 155
	mov dx, 233
	int 10h
	
	mov cx, 156
	mov dx, 233
	int 10h
	
	mov cx, 157
	mov dx, 233
	int 10h
	
	mov cx, 158
	mov dx, 233
	int 10h
	
	mov cx, 162
	mov dx, 233
	int 10h
	
	mov cx, 163
	mov dx, 233
	int 10h
	
	mov cx, 178
	mov dx, 233
	int 10h
	
	mov cx, 179
	mov dx, 233
	int 10h
	
	mov cx, 180
	mov dx, 233
	int 10h
	
	mov cx, 182
	mov dx, 233
	int 10h
	
	mov cx, 188
	mov dx, 233
	int 10h
	
	mov cx, 193
	mov dx, 233
	int 10h
	
	mov cx, 194
	mov dx, 233
	int 10h
	
	mov cx, 195
	mov dx, 233
	int 10h
	
	mov cx, 196
	mov dx, 233
	int 10h
	
	mov cx, 202
	mov dx, 233
	int 10h
	
	mov cx, 203
	mov dx, 233
	int 10h
	
	mov cx, 204
	mov dx, 233
	int 10h
	
	mov cx, 205
	mov dx, 233
	int 10h
	
	mov cx, 206
	mov dx, 233
	int 10h
	
	mov cx, 209
	mov dx, 233
	int 10h
	
	mov cx, 211
	mov dx, 233
	int 10h
	
	mov cx, 212
	mov dx, 233
	int 10h
	
	mov cx, 213
	mov dx, 233
	int 10h
	
	mov cx, 220
	mov dx, 233
	int 10h
	
	mov cx, 226
	mov dx, 233
	int 10h
	
	mov cx, 227
	mov dx, 233
	int 10h
	
	mov cx, 228
	mov dx, 233
	int 10h
	
	mov cx, 229
	mov dx, 233
	int 10h
	
	mov cx, 230
	mov dx, 233
	int 10h
	
	mov cx, 242
	mov dx, 233
	int 10h
	
	mov cx, 243
	mov dx, 233
	int 10h
	
	mov cx, 244
	mov dx, 233
	int 10h
	
	mov cx, 245
	mov dx, 233
	int 10h
	
	mov cx, 249
	mov dx, 233
	int 10h
	
	mov cx, 265
	mov dx, 233
	int 10h
	
	mov cx, 274
	mov dx, 233
	int 10h
	
	mov cx, 275
	mov dx, 233
	int 10h
	
	mov cx, 276
	mov dx, 233
	int 10h
	
	mov cx, 277
	mov dx, 233
	int 10h
	
	mov cx, 278
	mov dx, 233
	int 10h
	
	mov cx, 280
	mov dx, 233
	int 10h
	
	mov cx, 283
	mov dx, 233
	int 10h
	
	mov cx, 286
	mov dx, 233
	int 10h
	
	mov cx, 290
	mov dx, 233
	int 10h
	
	mov cx, 291
	mov dx, 233
	int 10h
	
	mov cx, 292
	mov dx, 233
	int 10h
	
	mov cx, 293
	mov dx, 233
	int 10h
	
	mov cx, 299
	mov dx, 233
	int 10h
	
	mov cx, 306
	mov dx, 233
	int 10h
	
	mov cx, 307
	mov dx, 233
	int 10h
	
	mov cx, 308
	mov dx, 233
	int 10h
	
	mov cx, 309
	mov dx, 233
	int 10h
	
	mov cx, 310
	mov dx, 233
	int 10h
	
	mov cx, 322
	mov dx, 233
	int 10h
	
	mov cx, 323
	mov dx, 233
	int 10h
	
	mov cx, 324
	mov dx, 233
	int 10h
	
	mov cx, 325
	mov dx, 233
	int 10h
	
	mov cx, 326
	mov dx, 233
	int 10h
	
	mov cx, 329
	mov dx, 233
	int 10h
	
	mov cx, 334
	mov dx, 233
	int 10h
	
	mov cx, 339
	mov dx, 233
	int 10h
	
	mov cx, 340
	mov dx, 233
	int 10h
	
	mov cx, 353
	mov dx, 233
	int 10h
	
	mov cx, 358
	mov dx, 233
	int 10h
	
	mov cx, 362
	mov dx, 233
	int 10h
	
	mov cx, 363
	mov dx, 233
	int 10h
	
	mov cx, 364
	mov dx, 233
	int 10h
	
	mov cx, 365
	mov dx, 233
	int 10h
	
	mov cx, 366
	mov dx, 233
	int 10h
	
	mov cx, 370
	mov dx, 233
	int 10h
	
	mov cx, 373
	mov dx, 233
	int 10h
	
	mov cx, 380
	mov dx, 233
	int 10h
	
	mov cx, 387
	mov dx, 233
	int 10h
	
	mov cx, 388
	mov dx, 233
	int 10h
	
	mov cx, 404
	mov dx, 233
	int 10h
	
	mov cx, 409
	mov dx, 233
	int 10h
	
	mov cx, 414
	mov dx, 233
	int 10h
	
	mov cx, 417
	mov dx, 233
	int 10h
	
	mov cx, 418
	mov dx, 233
	int 10h
	
	mov cx, 419
	mov dx, 233
	int 10h
	
	mov cx, 420
	mov dx, 233
	int 10h
	
	mov cx, 427
	mov dx, 233
	int 10h
	
	mov cx, 428
	mov dx, 233
	int 10h
	
	mov cx, 429
	mov dx, 233
	int 10h
	
	mov cx, 434
	mov dx, 233
	int 10h
	
	mov cx, 435
	mov dx, 233
	int 10h
	
	mov cx, 436
	mov dx, 233
	int 10h
	
	mov cx, 437
	mov dx, 233
	int 10h
	
	mov cx, 438
	mov dx, 233
	int 10h
	
	mov cx, 444
	mov dx, 233
	int 10h
	
	mov cx, 452
	mov dx, 233
	int 10h
	
	mov cx, 458
	mov dx, 233
	int 10h
	
	mov cx, 459
	mov dx, 233
	int 10h
	
	mov cx, 460
	mov dx, 233
	int 10h
	
	mov cx, 461
	mov dx, 233
	int 10h
	
	mov cx, 462
	mov dx, 233
	int 10h
	
	mov cx, 466
	mov dx, 233
	int 10h
	
	mov cx, 467
	mov dx, 233
	int 10h
	
	mov cx, 468
	mov dx, 233
	int 10h
	
	mov cx, 470
	mov dx, 233
	int 10h
	
	mov cx, 481
	mov dx, 233
	int 10h
	
	mov cx, 486
	mov dx, 233
	int 10h
	
	mov cx, 490
	mov dx, 233
	int 10h
	
	mov cx, 491
	mov dx, 233
	int 10h
	
	mov cx, 492
	mov dx, 233
	int 10h
	
	mov cx, 493
	mov dx, 233
	int 10h
	
	mov cx, 494
	mov dx, 233
	int 10h
	
	mov cx, 497
	mov dx, 233
	int 10h
	
	mov cx, 506
	mov dx, 233
	int 10h
	
	mov cx, 507
	mov dx, 233
	int 10h
	
	mov cx, 508
	mov dx, 233
	int 10h
	
	mov cx, 510
	mov dx, 233
	int 10h
	
	mov cx, 514
	mov dx, 233
	int 10h
	
	mov cx, 517
	mov dx, 233
	int 10h
	
	mov cx, 522
	mov dx, 233
	int 10h
	
	mov cx, 523
	mov dx, 233
	int 10h
	
	mov cx, 524
	mov dx, 233
	int 10h
	
	mov cx, 525
	mov dx, 233
	int 10h
	
	mov cx, 526
	mov dx, 233
	int 10h
	
	mov cx, 529
	mov dx, 233
	int 10h
	
	mov cx, 538
	mov dx, 233
	int 10h
	
	mov cx, 539
	mov dx, 233
	int 10h
	
	mov cx, 540
	mov dx, 233
	int 10h
	
	mov cx, 541
	mov dx, 233
	int 10h
	
	mov cx, 542
	mov dx, 233
	int 10h
	
	mov cx, 25
	mov dx, 234
	int 10h
	
	mov cx, 163
	mov dx, 234
	int 10h
	
	mov cx, 339
	mov dx, 234
	int 10h
	
	mov cx, 387
	mov dx, 234
	int 10h
	
	mov cx, 25
	mov dx, 235
	int 10h
	
	mov cx, 162
	mov dx, 235
	int 10h
	
	mov cx, 338
	mov dx, 235
	int 10h
	
	mov cx, 339
	mov dx, 235
	int 10h
	
	mov cx, 386
	mov dx, 235
	int 10h
	
	mov cx, 387
	mov dx, 235
	int 10h
	
	mov cx, 25
	mov dx, 236
	int 10h
	
	mov cx, 336
	mov dx, 236
	int 10h
	
	mov cx, 337
	mov dx, 236
	int 10h
	
	mov cx, 338
	mov dx, 236
	int 10h
	
	mov cx, 384
	mov dx, 236
	int 10h
	
	mov cx, 385
	mov dx, 236
	int 10h
	
	mov cx, 386
	mov dx, 236
	int 10h
	
	mov cx, 43
	mov dx, 238
	int 10h
	
	mov cx, 44
	mov dx, 238
	int 10h
	
	mov cx, 45
	mov dx, 238
	int 10h
	
	mov cx, 46
	mov dx, 238
	int 10h
	
	mov cx, 115
	mov dx, 238
	int 10h
	
	mov cx, 116
	mov dx, 238
	int 10h
	
	mov cx, 137
	mov dx, 238
	int 10h
	
	mov cx, 145
	mov dx, 238
	int 10h
	
	mov cx, 146
	mov dx, 238
	int 10h
	
	mov cx, 147
	mov dx, 238
	int 10h
	
	mov cx, 148
	mov dx, 238
	int 10h
	
	mov cx, 291
	mov dx, 238
	int 10h
	
	mov cx, 292
	mov dx, 238
	int 10h
	
	mov cx, 353
	mov dx, 238
	int 10h
	
	mov cx, 417
	mov dx, 238
	int 10h
	
	mov cx, 427
	mov dx, 238
	int 10h
	
	mov cx, 428
	mov dx, 238
	int 10h
	
	mov cx, 489
	mov dx, 238
	int 10h
	
	mov cx, 510
	mov dx, 238
	int 10h
	
	mov cx, 531
	mov dx, 238
	int 10h
	
	mov cx, 532
	mov dx, 238
	int 10h
	
	mov cx, 42
	mov dx, 239
	int 10h
	
	mov cx, 115
	mov dx, 239
	int 10h
	
	mov cx, 116
	mov dx, 239
	int 10h
	
	mov cx, 137
	mov dx, 239
	int 10h
	
	mov cx, 148
	mov dx, 239
	int 10h
	
	mov cx, 291
	mov dx, 239
	int 10h
	
	mov cx, 292
	mov dx, 239
	int 10h
	
	mov cx, 353
	mov dx, 239
	int 10h
	
	mov cx, 417
	mov dx, 239
	int 10h
	
	mov cx, 427
	mov dx, 239
	int 10h
	
	mov cx, 428
	mov dx, 239
	int 10h
	
	mov cx, 489
	mov dx, 239
	int 10h
	
	mov cx, 510
	mov dx, 239
	int 10h
	
	mov cx, 531
	mov dx, 239
	int 10h
	
	mov cx, 532
	mov dx, 239
	int 10h
	
	mov cx, 42
	mov dx, 240
	int 10h
	
	mov cx, 50
	mov dx, 240
	int 10h
	
	mov cx, 105
	mov dx, 240
	int 10h
	
	mov cx, 106
	mov dx, 240
	int 10h
	
	mov cx, 107
	mov dx, 240
	int 10h
	
	mov cx, 108
	mov dx, 240
	int 10h
	
	mov cx, 137
	mov dx, 240
	int 10h
	
	mov cx, 148
	mov dx, 240
	int 10h
	
	mov cx, 169
	mov dx, 240
	int 10h
	
	mov cx, 170
	mov dx, 240
	int 10h
	
	mov cx, 171
	mov dx, 240
	int 10h
	
	mov cx, 172
	mov dx, 240
	int 10h
	
	mov cx, 173
	mov dx, 240
	int 10h
	
	mov cx, 177
	mov dx, 240
	int 10h
	
	mov cx, 178
	mov dx, 240
	int 10h
	
	mov cx, 179
	mov dx, 240
	int 10h
	
	mov cx, 180
	mov dx, 240
	int 10h
	
	mov cx, 181
	mov dx, 240
	int 10h
	
	mov cx, 186
	mov dx, 240
	int 10h
	
	mov cx, 187
	mov dx, 240
	int 10h
	
	mov cx, 188
	mov dx, 240
	int 10h
	
	mov cx, 194
	mov dx, 240
	int 10h
	
	mov cx, 195
	mov dx, 240
	int 10h
	
	mov cx, 196
	mov dx, 240
	int 10h
	
	mov cx, 197
	mov dx, 240
	int 10h
	
	mov cx, 198
	mov dx, 240
	int 10h
	
	mov cx, 282
	mov dx, 240
	int 10h
	
	mov cx, 353
	mov dx, 240
	int 10h
	
	mov cx, 417
	mov dx, 240
	int 10h
	
	mov cx, 489
	mov dx, 240
	int 10h
	
	mov cx, 510
	mov dx, 240
	int 10h
	
	mov cx, 2
	mov dx, 241
	int 10h
	
	mov cx, 3
	mov dx, 241
	int 10h
	
	mov cx, 4
	mov dx, 241
	int 10h
	
	mov cx, 5
	mov dx, 241
	int 10h
	
	mov cx, 9
	mov dx, 241
	int 10h
	
	mov cx, 11
	mov dx, 241
	int 10h
	
	mov cx, 12
	mov dx, 241
	int 10h
	
	mov cx, 13
	mov dx, 241
	int 10h
	
	mov cx, 26
	mov dx, 241
	int 10h
	
	mov cx, 27
	mov dx, 241
	int 10h
	
	mov cx, 28
	mov dx, 241
	int 10h
	
	mov cx, 29
	mov dx, 241
	int 10h
	
	mov cx, 34
	mov dx, 241
	int 10h
	
	mov cx, 35
	mov dx, 241
	int 10h
	
	mov cx, 36
	mov dx, 241
	int 10h
	
	mov cx, 37
	mov dx, 241
	int 10h
	
	mov cx, 40
	mov dx, 241
	int 10h
	
	mov cx, 41
	mov dx, 241
	int 10h
	
	mov cx, 42
	mov dx, 241
	int 10h
	
	mov cx, 43
	mov dx, 241
	int 10h
	
	mov cx, 44
	mov dx, 241
	int 10h
	
	mov cx, 45
	mov dx, 241
	int 10h
	
	mov cx, 46
	mov dx, 241
	int 10h
	
	mov cx, 48
	mov dx, 241
	int 10h
	
	mov cx, 49
	mov dx, 241
	int 10h
	
	mov cx, 50
	mov dx, 241
	int 10h
	
	mov cx, 51
	mov dx, 241
	int 10h
	
	mov cx, 52
	mov dx, 241
	int 10h
	
	mov cx, 53
	mov dx, 241
	int 10h
	
	mov cx, 56
	mov dx, 241
	int 10h
	
	mov cx, 63
	mov dx, 241
	int 10h
	
	mov cx, 66
	mov dx, 241
	int 10h
	
	mov cx, 67
	mov dx, 241
	int 10h
	
	mov cx, 68
	mov dx, 241
	int 10h
	
	mov cx, 73
	mov dx, 241
	int 10h
	
	mov cx, 75
	mov dx, 241
	int 10h
	
	mov cx, 76
	mov dx, 241
	int 10h
	
	mov cx, 77
	mov dx, 241
	int 10h
	
	mov cx, 82
	mov dx, 241
	int 10h
	
	mov cx, 83
	mov dx, 241
	int 10h
	
	mov cx, 84
	mov dx, 241
	int 10h
	
	mov cx, 85
	mov dx, 241
	int 10h
	
	mov cx, 105
	mov dx, 241
	int 10h
	
	mov cx, 109
	mov dx, 241
	int 10h
	
	mov cx, 113
	mov dx, 241
	int 10h
	
	mov cx, 114
	mov dx, 241
	int 10h
	
	mov cx, 115
	mov dx, 241
	int 10h
	
	mov cx, 116
	mov dx, 241
	int 10h
	
	mov cx, 122
	mov dx, 241
	int 10h
	
	mov cx, 123
	mov dx, 241
	int 10h
	
	mov cx, 124
	mov dx, 241
	int 10h
	
	mov cx, 125
	mov dx, 241
	int 10h
	
	mov cx, 130
	mov dx, 241
	int 10h
	
	mov cx, 131
	mov dx, 241
	int 10h
	
	mov cx, 132
	mov dx, 241
	int 10h
	
	mov cx, 137
	mov dx, 241
	int 10h
	
	mov cx, 139
	mov dx, 241
	int 10h
	
	mov cx, 140
	mov dx, 241
	int 10h
	
	mov cx, 141
	mov dx, 241
	int 10h
	
	mov cx, 148
	mov dx, 241
	int 10h
	
	mov cx, 154
	mov dx, 241
	int 10h
	
	mov cx, 155
	mov dx, 241
	int 10h
	
	mov cx, 156
	mov dx, 241
	int 10h
	
	mov cx, 157
	mov dx, 241
	int 10h
	
	mov cx, 169
	mov dx, 241
	int 10h
	
	mov cx, 174
	mov dx, 241
	int 10h
	
	mov cx, 179
	mov dx, 241
	int 10h
	
	mov cx, 185
	mov dx, 241
	int 10h
	
	mov cx, 189
	mov dx, 241
	int 10h
	
	mov cx, 193
	mov dx, 241
	int 10h
	
	mov cx, 208
	mov dx, 241
	int 10h
	
	mov cx, 210
	mov dx, 241
	int 10h
	
	mov cx, 211
	mov dx, 241
	int 10h
	
	mov cx, 213
	mov dx, 241
	int 10h
	
	mov cx, 214
	mov dx, 241
	int 10h
	
	mov cx, 218
	mov dx, 241
	int 10h
	
	mov cx, 219
	mov dx, 241
	int 10h
	
	mov cx, 220
	mov dx, 241
	int 10h
	
	mov cx, 221
	mov dx, 241
	int 10h
	
	mov cx, 224
	mov dx, 241
	int 10h
	
	mov cx, 226
	mov dx, 241
	int 10h
	
	mov cx, 227
	mov dx, 241
	int 10h
	
	mov cx, 229
	mov dx, 241
	int 10h
	
	mov cx, 230
	mov dx, 241
	int 10h
	
	mov cx, 234
	mov dx, 241
	int 10h
	
	mov cx, 235
	mov dx, 241
	int 10h
	
	mov cx, 236
	mov dx, 241
	int 10h
	
	mov cx, 237
	mov dx, 241
	int 10h
	
	mov cx, 241
	mov dx, 241
	int 10h
	
	mov cx, 243
	mov dx, 241
	int 10h
	
	mov cx, 244
	mov dx, 241
	int 10h
	
	mov cx, 245
	mov dx, 241
	int 10h
	
	mov cx, 248
	mov dx, 241
	int 10h
	
	mov cx, 255
	mov dx, 241
	int 10h
	
	mov cx, 266
	mov dx, 241
	int 10h
	
	mov cx, 267
	mov dx, 241
	int 10h
	
	mov cx, 268
	mov dx, 241
	int 10h
	
	mov cx, 269
	mov dx, 241
	int 10h
	
	mov cx, 273
	mov dx, 241
	int 10h
	
	mov cx, 275
	mov dx, 241
	int 10h
	
	mov cx, 276
	mov dx, 241
	int 10h
	
	mov cx, 277
	mov dx, 241
	int 10h
	
	mov cx, 280
	mov dx, 241
	int 10h
	
	mov cx, 281
	mov dx, 241
	int 10h
	
	mov cx, 282
	mov dx, 241
	int 10h
	
	mov cx, 283
	mov dx, 241
	int 10h
	
	mov cx, 284
	mov dx, 241
	int 10h
	
	mov cx, 285
	mov dx, 241
	int 10h
	
	mov cx, 289
	mov dx, 241
	int 10h
	
	mov cx, 290
	mov dx, 241
	int 10h
	
	mov cx, 291
	mov dx, 241
	int 10h
	
	mov cx, 292
	mov dx, 241
	int 10h
	
	mov cx, 298
	mov dx, 241
	int 10h
	
	mov cx, 299
	mov dx, 241
	int 10h
	
	mov cx, 300
	mov dx, 241
	int 10h
	
	mov cx, 301
	mov dx, 241
	int 10h
	
	mov cx, 305
	mov dx, 241
	int 10h
	
	mov cx, 307
	mov dx, 241
	int 10h
	
	mov cx, 308
	mov dx, 241
	int 10h
	
	mov cx, 309
	mov dx, 241
	int 10h
	
	mov cx, 314
	mov dx, 241
	int 10h
	
	mov cx, 315
	mov dx, 241
	int 10h
	
	mov cx, 316
	mov dx, 241
	int 10h
	
	mov cx, 317
	mov dx, 241
	int 10h
	
	mov cx, 330
	mov dx, 241
	int 10h
	
	mov cx, 331
	mov dx, 241
	int 10h
	
	mov cx, 332
	mov dx, 241
	int 10h
	
	mov cx, 333
	mov dx, 241
	int 10h
	
	mov cx, 337
	mov dx, 241
	int 10h
	
	mov cx, 342
	mov dx, 241
	int 10h
	
	mov cx, 347
	mov dx, 241
	int 10h
	
	mov cx, 348
	mov dx, 241
	int 10h
	
	mov cx, 349
	mov dx, 241
	int 10h
	
	mov cx, 350
	mov dx, 241
	int 10h
	
	mov cx, 353
	mov dx, 241
	int 10h
	
	mov cx, 355
	mov dx, 241
	int 10h
	
	mov cx, 356
	mov dx, 241
	int 10h
	
	mov cx, 357
	mov dx, 241
	int 10h
	
	mov cx, 370
	mov dx, 241
	int 10h
	
	mov cx, 371
	mov dx, 241
	int 10h
	
	mov cx, 372
	mov dx, 241
	int 10h
	
	mov cx, 378
	mov dx, 241
	int 10h
	
	mov cx, 379
	mov dx, 241
	int 10h
	
	mov cx, 380
	mov dx, 241
	int 10h
	
	mov cx, 381
	mov dx, 241
	int 10h
	
	mov cx, 395
	mov dx, 241
	int 10h
	
	mov cx, 396
	mov dx, 241
	int 10h
	
	mov cx, 397
	mov dx, 241
	int 10h
	
	mov cx, 398
	mov dx, 241
	int 10h
	
	mov cx, 402
	mov dx, 241
	int 10h
	
	mov cx, 403
	mov dx, 241
	int 10h
	
	mov cx, 404
	mov dx, 241
	int 10h
	
	mov cx, 411
	mov dx, 241
	int 10h
	
	mov cx, 412
	mov dx, 241
	int 10h
	
	mov cx, 413
	mov dx, 241
	int 10h
	
	mov cx, 414
	mov dx, 241
	int 10h
	
	mov cx, 417
	mov dx, 241
	int 10h
	
	mov cx, 419
	mov dx, 241
	int 10h
	
	mov cx, 420
	mov dx, 241
	int 10h
	
	mov cx, 421
	mov dx, 241
	int 10h
	
	mov cx, 425
	mov dx, 241
	int 10h
	
	mov cx, 426
	mov dx, 241
	int 10h
	
	mov cx, 427
	mov dx, 241
	int 10h
	
	mov cx, 428
	mov dx, 241
	int 10h
	
	mov cx, 433
	mov dx, 241
	int 10h
	
	mov cx, 435
	mov dx, 241
	int 10h
	
	mov cx, 436
	mov dx, 241
	int 10h
	
	mov cx, 437
	mov dx, 241
	int 10h
	
	mov cx, 442
	mov dx, 241
	int 10h
	
	mov cx, 443
	mov dx, 241
	int 10h
	
	mov cx, 444
	mov dx, 241
	int 10h
	
	mov cx, 446
	mov dx, 241
	int 10h
	
	mov cx, 458
	mov dx, 241
	int 10h
	
	mov cx, 459
	mov dx, 241
	int 10h
	
	mov cx, 460
	mov dx, 241
	int 10h
	
	mov cx, 461
	mov dx, 241
	int 10h
	
	mov cx, 465
	mov dx, 241
	int 10h
	
	mov cx, 467
	mov dx, 241
	int 10h
	
	mov cx, 468
	mov dx, 241
	int 10h
	
	mov cx, 469
	mov dx, 241
	int 10h
	
	mov cx, 482
	mov dx, 241
	int 10h
	
	mov cx, 483
	mov dx, 241
	int 10h
	
	mov cx, 484
	mov dx, 241
	int 10h
	
	mov cx, 485
	mov dx, 241
	int 10h
	
	mov cx, 489
	mov dx, 241
	int 10h
	
	mov cx, 491
	mov dx, 241
	int 10h
	
	mov cx, 492
	mov dx, 241
	int 10h
	
	mov cx, 493
	mov dx, 241
	int 10h
	
	mov cx, 498
	mov dx, 241
	int 10h
	
	mov cx, 499
	mov dx, 241
	int 10h
	
	mov cx, 500
	mov dx, 241
	int 10h
	
	mov cx, 506
	mov dx, 241
	int 10h
	
	mov cx, 507
	mov dx, 241
	int 10h
	
	mov cx, 508
	mov dx, 241
	int 10h
	
	mov cx, 510
	mov dx, 241
	int 10h
	
	mov cx, 514
	mov dx, 241
	int 10h
	
	mov cx, 515
	mov dx, 241
	int 10h
	
	mov cx, 516
	mov dx, 241
	int 10h
	
	mov cx, 517
	mov dx, 241
	int 10h
	
	mov cx, 520
	mov dx, 241
	int 10h
	
	mov cx, 527
	mov dx, 241
	int 10h
	
	mov cx, 529
	mov dx, 241
	int 10h
	
	mov cx, 530
	mov dx, 241
	int 10h
	
	mov cx, 531
	mov dx, 241
	int 10h
	
	mov cx, 532
	mov dx, 241
	int 10h
	
	mov cx, 537
	mov dx, 241
	int 10h
	
	mov cx, 539
	mov dx, 241
	int 10h
	
	mov cx, 540
	mov dx, 241
	int 10h
	
	mov cx, 541
	mov dx, 241
	int 10h
	
	mov cx, 546
	mov dx, 241
	int 10h
	
	mov cx, 547
	mov dx, 241
	int 10h
	
	mov cx, 548
	mov dx, 241
	int 10h
	
	mov cx, 550
	mov dx, 241
	int 10h
	
	mov cx, 1
	mov dx, 242
	int 10h
	
	mov cx, 6
	mov dx, 242
	int 10h
	
	mov cx, 9
	mov dx, 242
	int 10h
	
	mov cx, 10
	mov dx, 242
	int 10h
	
	mov cx, 13
	mov dx, 242
	int 10h
	
	mov cx, 25
	mov dx, 242
	int 10h
	
	mov cx, 33
	mov dx, 242
	int 10h
	
	mov cx, 38
	mov dx, 242
	int 10h
	
	mov cx, 42
	mov dx, 242
	int 10h
	
	mov cx, 50
	mov dx, 242
	int 10h
	
	mov cx, 56
	mov dx, 242
	int 10h
	
	mov cx, 59
	mov dx, 242
	int 10h
	
	mov cx, 63
	mov dx, 242
	int 10h
	
	mov cx, 69
	mov dx, 242
	int 10h
	
	mov cx, 73
	mov dx, 242
	int 10h
	
	mov cx, 74
	mov dx, 242
	int 10h
	
	mov cx, 77
	mov dx, 242
	int 10h
	
	mov cx, 82
	mov dx, 242
	int 10h
	
	mov cx, 86
	mov dx, 242
	int 10h
	
	mov cx, 105
	mov dx, 242
	int 10h
	
	mov cx, 110
	mov dx, 242
	int 10h
	
	mov cx, 116
	mov dx, 242
	int 10h
	
	mov cx, 121
	mov dx, 242
	int 10h
	
	mov cx, 133
	mov dx, 242
	int 10h
	
	mov cx, 137
	mov dx, 242
	int 10h
	
	mov cx, 138
	mov dx, 242
	int 10h
	
	mov cx, 142
	mov dx, 242
	int 10h
	
	mov cx, 148
	mov dx, 242
	int 10h
	
	mov cx, 154
	mov dx, 242
	int 10h
	
	mov cx, 158
	mov dx, 242
	int 10h
	
	mov cx, 169
	mov dx, 242
	int 10h
	
	mov cx, 174
	mov dx, 242
	int 10h
	
	mov cx, 179
	mov dx, 242
	int 10h
	
	mov cx, 184
	mov dx, 242
	int 10h
	
	mov cx, 190
	mov dx, 242
	int 10h
	
	mov cx, 193
	mov dx, 242
	int 10h
	
	mov cx, 208
	mov dx, 242
	int 10h
	
	mov cx, 209
	mov dx, 242
	int 10h
	
	mov cx, 211
	mov dx, 242
	int 10h
	
	mov cx, 212
	mov dx, 242
	int 10h
	
	mov cx, 214
	mov dx, 242
	int 10h
	
	mov cx, 218
	mov dx, 242
	int 10h
	
	mov cx, 222
	mov dx, 242
	int 10h
	
	mov cx, 224
	mov dx, 242
	int 10h
	
	mov cx, 225
	mov dx, 242
	int 10h
	
	mov cx, 227
	mov dx, 242
	int 10h
	
	mov cx, 228
	mov dx, 242
	int 10h
	
	mov cx, 230
	mov dx, 242
	int 10h
	
	mov cx, 233
	mov dx, 242
	int 10h
	
	mov cx, 238
	mov dx, 242
	int 10h
	
	mov cx, 241
	mov dx, 242
	int 10h
	
	mov cx, 242
	mov dx, 242
	int 10h
	
	mov cx, 245
	mov dx, 242
	int 10h
	
	mov cx, 249
	mov dx, 242
	int 10h
	
	mov cx, 254
	mov dx, 242
	int 10h
	
	mov cx, 265
	mov dx, 242
	int 10h
	
	mov cx, 270
	mov dx, 242
	int 10h
	
	mov cx, 273
	mov dx, 242
	int 10h
	
	mov cx, 274
	mov dx, 242
	int 10h
	
	mov cx, 278
	mov dx, 242
	int 10h
	
	mov cx, 282
	mov dx, 242
	int 10h
	
	mov cx, 292
	mov dx, 242
	int 10h
	
	mov cx, 297
	mov dx, 242
	int 10h
	
	mov cx, 302
	mov dx, 242
	int 10h
	
	mov cx, 305
	mov dx, 242
	int 10h
	
	mov cx, 306
	mov dx, 242
	int 10h
	
	mov cx, 310
	mov dx, 242
	int 10h
	
	mov cx, 313
	mov dx, 242
	int 10h
	
	mov cx, 329
	mov dx, 242
	int 10h
	
	mov cx, 337
	mov dx, 242
	int 10h
	
	mov cx, 342
	mov dx, 242
	int 10h
	
	mov cx, 346
	mov dx, 242
	int 10h
	
	mov cx, 353
	mov dx, 242
	int 10h
	
	mov cx, 354
	mov dx, 242
	int 10h
	
	mov cx, 358
	mov dx, 242
	int 10h
	
	mov cx, 373
	mov dx, 242
	int 10h
	
	mov cx, 377
	mov dx, 242
	int 10h
	
	mov cx, 394
	mov dx, 242
	int 10h
	
	mov cx, 405
	mov dx, 242
	int 10h
	
	mov cx, 410
	mov dx, 242
	int 10h
	
	mov cx, 417
	mov dx, 242
	int 10h
	
	mov cx, 418
	mov dx, 242
	int 10h
	
	mov cx, 422
	mov dx, 242
	int 10h
	
	mov cx, 428
	mov dx, 242
	int 10h
	
	mov cx, 433
	mov dx, 242
	int 10h
	
	mov cx, 434
	mov dx, 242
	int 10h
	
	mov cx, 438
	mov dx, 242
	int 10h
	
	mov cx, 441
	mov dx, 242
	int 10h
	
	mov cx, 445
	mov dx, 242
	int 10h
	
	mov cx, 446
	mov dx, 242
	int 10h
	
	mov cx, 457
	mov dx, 242
	int 10h
	
	mov cx, 462
	mov dx, 242
	int 10h
	
	mov cx, 465
	mov dx, 242
	int 10h
	
	mov cx, 466
	mov dx, 242
	int 10h
	
	mov cx, 469
	mov dx, 242
	int 10h
	
	mov cx, 481
	mov dx, 242
	int 10h
	
	mov cx, 489
	mov dx, 242
	int 10h
	
	mov cx, 490
	mov dx, 242
	int 10h
	
	mov cx, 494
	mov dx, 242
	int 10h
	
	mov cx, 501
	mov dx, 242
	int 10h
	
	mov cx, 505
	mov dx, 242
	int 10h
	
	mov cx, 509
	mov dx, 242
	int 10h
	
	mov cx, 510
	mov dx, 242
	int 10h
	
	mov cx, 513
	mov dx, 242
	int 10h
	
	mov cx, 518
	mov dx, 242
	int 10h
	
	mov cx, 520
	mov dx, 242
	int 10h
	
	mov cx, 523
	mov dx, 242
	int 10h
	
	mov cx, 527
	mov dx, 242
	int 10h
	
	mov cx, 532
	mov dx, 242
	int 10h
	
	mov cx, 537
	mov dx, 242
	int 10h
	
	mov cx, 538
	mov dx, 242
	int 10h
	
	mov cx, 542
	mov dx, 242
	int 10h
	
	mov cx, 545
	mov dx, 242
	int 10h
	
	mov cx, 549
	mov dx, 242
	int 10h
	
	mov cx, 550
	mov dx, 242
	int 10h
	
	mov cx, 1
	mov dx, 243
	int 10h
	
	mov cx, 6
	mov dx, 243
	int 10h
	
	mov cx, 9
	mov dx, 243
	int 10h
	
	mov cx, 25
	mov dx, 243
	int 10h
	
	mov cx, 26
	mov dx, 243
	int 10h
	
	mov cx, 33
	mov dx, 243
	int 10h
	
	mov cx, 38
	mov dx, 243
	int 10h
	
	mov cx, 42
	mov dx, 243
	int 10h
	
	mov cx, 50
	mov dx, 243
	int 10h
	
	mov cx, 57
	mov dx, 243
	int 10h
	
	mov cx, 59
	mov dx, 243
	int 10h
	
	mov cx, 60
	mov dx, 243
	int 10h
	
	mov cx, 62
	mov dx, 243
	int 10h
	
	mov cx, 69
	mov dx, 243
	int 10h
	
	mov cx, 73
	mov dx, 243
	int 10h
	
	mov cx, 81
	mov dx, 243
	int 10h
	
	mov cx, 86
	mov dx, 243
	int 10h
	
	mov cx, 105
	mov dx, 243
	int 10h
	
	mov cx, 110
	mov dx, 243
	int 10h
	
	mov cx, 116
	mov dx, 243
	int 10h
	
	mov cx, 121
	mov dx, 243
	int 10h
	
	mov cx, 122
	mov dx, 243
	int 10h
	
	mov cx, 133
	mov dx, 243
	int 10h
	
	mov cx, 137
	mov dx, 243
	int 10h
	
	mov cx, 142
	mov dx, 243
	int 10h
	
	mov cx, 148
	mov dx, 243
	int 10h
	
	mov cx, 153
	mov dx, 243
	int 10h
	
	mov cx, 158
	mov dx, 243
	int 10h
	
	mov cx, 169
	mov dx, 243
	int 10h
	
	mov cx, 170
	mov dx, 243
	int 10h
	
	mov cx, 171
	mov dx, 243
	int 10h
	
	mov cx, 172
	mov dx, 243
	int 10h
	
	mov cx, 173
	mov dx, 243
	int 10h
	
	mov cx, 179
	mov dx, 243
	int 10h
	
	mov cx, 184
	mov dx, 243
	int 10h
	
	mov cx, 190
	mov dx, 243
	int 10h
	
	mov cx, 194
	mov dx, 243
	int 10h
	
	mov cx, 195
	mov dx, 243
	int 10h
	
	mov cx, 196
	mov dx, 243
	int 10h
	
	mov cx, 208
	mov dx, 243
	int 10h
	
	mov cx, 211
	mov dx, 243
	int 10h
	
	mov cx, 214
	mov dx, 243
	int 10h
	
	mov cx, 217
	mov dx, 243
	int 10h
	
	mov cx, 222
	mov dx, 243
	int 10h
	
	mov cx, 224
	mov dx, 243
	int 10h
	
	mov cx, 227
	mov dx, 243
	int 10h
	
	mov cx, 230
	mov dx, 243
	int 10h
	
	mov cx, 233
	mov dx, 243
	int 10h
	
	mov cx, 238
	mov dx, 243
	int 10h
	
	mov cx, 241
	mov dx, 243
	int 10h
	
	mov cx, 249
	mov dx, 243
	int 10h
	
	mov cx, 254
	mov dx, 243
	int 10h
	
	mov cx, 265
	mov dx, 243
	int 10h
	
	mov cx, 270
	mov dx, 243
	int 10h
	
	mov cx, 273
	mov dx, 243
	int 10h
	
	mov cx, 278
	mov dx, 243
	int 10h
	
	mov cx, 282
	mov dx, 243
	int 10h
	
	mov cx, 292
	mov dx, 243
	int 10h
	
	mov cx, 297
	mov dx, 243
	int 10h
	
	mov cx, 302
	mov dx, 243
	int 10h
	
	mov cx, 305
	mov dx, 243
	int 10h
	
	mov cx, 310
	mov dx, 243
	int 10h
	
	mov cx, 313
	mov dx, 243
	int 10h
	
	mov cx, 314
	mov dx, 243
	int 10h
	
	mov cx, 329
	mov dx, 243
	int 10h
	
	mov cx, 330
	mov dx, 243
	int 10h
	
	mov cx, 337
	mov dx, 243
	int 10h
	
	mov cx, 342
	mov dx, 243
	int 10h
	
	mov cx, 345
	mov dx, 243
	int 10h
	
	mov cx, 353
	mov dx, 243
	int 10h
	
	mov cx, 358
	mov dx, 243
	int 10h
	
	mov cx, 373
	mov dx, 243
	int 10h
	
	mov cx, 377
	mov dx, 243
	int 10h
	
	mov cx, 378
	mov dx, 243
	int 10h
	
	mov cx, 393
	mov dx, 243
	int 10h
	
	mov cx, 405
	mov dx, 243
	int 10h
	
	mov cx, 409
	mov dx, 243
	int 10h
	
	mov cx, 417
	mov dx, 243
	int 10h
	
	mov cx, 422
	mov dx, 243
	int 10h
	
	mov cx, 428
	mov dx, 243
	int 10h
	
	mov cx, 433
	mov dx, 243
	int 10h
	
	mov cx, 438
	mov dx, 243
	int 10h
	
	mov cx, 441
	mov dx, 243
	int 10h
	
	mov cx, 446
	mov dx, 243
	int 10h
	
	mov cx, 457
	mov dx, 243
	int 10h
	
	mov cx, 462
	mov dx, 243
	int 10h
	
	mov cx, 465
	mov dx, 243
	int 10h
	
	mov cx, 481
	mov dx, 243
	int 10h
	
	mov cx, 482
	mov dx, 243
	int 10h
	
	mov cx, 489
	mov dx, 243
	int 10h
	
	mov cx, 494
	mov dx, 243
	int 10h
	
	mov cx, 501
	mov dx, 243
	int 10h
	
	mov cx, 505
	mov dx, 243
	int 10h
	
	mov cx, 510
	mov dx, 243
	int 10h
	
	mov cx, 513
	mov dx, 243
	int 10h
	
	mov cx, 518
	mov dx, 243
	int 10h
	
	mov cx, 521
	mov dx, 243
	int 10h
	
	mov cx, 523
	mov dx, 243
	int 10h
	
	mov cx, 524
	mov dx, 243
	int 10h
	
	mov cx, 526
	mov dx, 243
	int 10h
	
	mov cx, 532
	mov dx, 243
	int 10h
	
	mov cx, 537
	mov dx, 243
	int 10h
	
	mov cx, 542
	mov dx, 243
	int 10h
	
	mov cx, 545
	mov dx, 243
	int 10h
	
	mov cx, 550
	mov dx, 243
	int 10h
	
	mov cx, 1
	mov dx, 244
	int 10h
	
	mov cx, 6
	mov dx, 244
	int 10h
	
	mov cx, 9
	mov dx, 244
	int 10h
	
	mov cx, 27
	mov dx, 244
	int 10h
	
	mov cx, 28
	mov dx, 244
	int 10h
	
	mov cx, 33
	mov dx, 244
	int 10h
	
	mov cx, 38
	mov dx, 244
	int 10h
	
	mov cx, 42
	mov dx, 244
	int 10h
	
	mov cx, 50
	mov dx, 244
	int 10h
	
	mov cx, 57
	mov dx, 244
	int 10h
	
	mov cx, 59
	mov dx, 244
	int 10h
	
	mov cx, 60
	mov dx, 244
	int 10h
	
	mov cx, 62
	mov dx, 244
	int 10h
	
	mov cx, 66
	mov dx, 244
	int 10h
	
	mov cx, 67
	mov dx, 244
	int 10h
	
	mov cx, 68
	mov dx, 244
	int 10h
	
	mov cx, 69
	mov dx, 244
	int 10h
	
	mov cx, 73
	mov dx, 244
	int 10h
	
	mov cx, 81
	mov dx, 244
	int 10h
	
	mov cx, 82
	mov dx, 244
	int 10h
	
	mov cx, 83
	mov dx, 244
	int 10h
	
	mov cx, 84
	mov dx, 244
	int 10h
	
	mov cx, 85
	mov dx, 244
	int 10h
	
	mov cx, 86
	mov dx, 244
	int 10h
	
	mov cx, 105
	mov dx, 244
	int 10h
	
	mov cx, 110
	mov dx, 244
	int 10h
	
	mov cx, 116
	mov dx, 244
	int 10h
	
	mov cx, 123
	mov dx, 244
	int 10h
	
	mov cx, 124
	mov dx, 244
	int 10h
	
	mov cx, 130
	mov dx, 244
	int 10h
	
	mov cx, 131
	mov dx, 244
	int 10h
	
	mov cx, 132
	mov dx, 244
	int 10h
	
	mov cx, 133
	mov dx, 244
	int 10h
	
	mov cx, 137
	mov dx, 244
	int 10h
	
	mov cx, 142
	mov dx, 244
	int 10h
	
	mov cx, 148
	mov dx, 244
	int 10h
	
	mov cx, 153
	mov dx, 244
	int 10h
	
	mov cx, 154
	mov dx, 244
	int 10h
	
	mov cx, 155
	mov dx, 244
	int 10h
	
	mov cx, 156
	mov dx, 244
	int 10h
	
	mov cx, 157
	mov dx, 244
	int 10h
	
	mov cx, 158
	mov dx, 244
	int 10h
	
	mov cx, 169
	mov dx, 244
	int 10h
	
	mov cx, 174
	mov dx, 244
	int 10h
	
	mov cx, 179
	mov dx, 244
	int 10h
	
	mov cx, 184
	mov dx, 244
	int 10h
	
	mov cx, 190
	mov dx, 244
	int 10h
	
	mov cx, 197
	mov dx, 244
	int 10h
	
	mov cx, 208
	mov dx, 244
	int 10h
	
	mov cx, 211
	mov dx, 244
	int 10h
	
	mov cx, 214
	mov dx, 244
	int 10h
	
	mov cx, 217
	mov dx, 244
	int 10h
	
	mov cx, 218
	mov dx, 244
	int 10h
	
	mov cx, 219
	mov dx, 244
	int 10h
	
	mov cx, 220
	mov dx, 244
	int 10h
	
	mov cx, 221
	mov dx, 244
	int 10h
	
	mov cx, 222
	mov dx, 244
	int 10h
	
	mov cx, 224
	mov dx, 244
	int 10h
	
	mov cx, 227
	mov dx, 244
	int 10h
	
	mov cx, 230
	mov dx, 244
	int 10h
	
	mov cx, 233
	mov dx, 244
	int 10h
	
	mov cx, 238
	mov dx, 244
	int 10h
	
	mov cx, 241
	mov dx, 244
	int 10h
	
	mov cx, 250
	mov dx, 244
	int 10h
	
	mov cx, 253
	mov dx, 244
	int 10h
	
	mov cx, 265
	mov dx, 244
	int 10h
	
	mov cx, 270
	mov dx, 244
	int 10h
	
	mov cx, 273
	mov dx, 244
	int 10h
	
	mov cx, 278
	mov dx, 244
	int 10h
	
	mov cx, 282
	mov dx, 244
	int 10h
	
	mov cx, 292
	mov dx, 244
	int 10h
	
	mov cx, 297
	mov dx, 244
	int 10h
	
	mov cx, 302
	mov dx, 244
	int 10h
	
	mov cx, 305
	mov dx, 244
	int 10h
	
	mov cx, 310
	mov dx, 244
	int 10h
	
	mov cx, 315
	mov dx, 244
	int 10h
	
	mov cx, 316
	mov dx, 244
	int 10h
	
	mov cx, 331
	mov dx, 244
	int 10h
	
	mov cx, 332
	mov dx, 244
	int 10h
	
	mov cx, 337
	mov dx, 244
	int 10h
	
	mov cx, 342
	mov dx, 244
	int 10h
	
	mov cx, 345
	mov dx, 244
	int 10h
	
	mov cx, 353
	mov dx, 244
	int 10h
	
	mov cx, 358
	mov dx, 244
	int 10h
	
	mov cx, 370
	mov dx, 244
	int 10h
	
	mov cx, 371
	mov dx, 244
	int 10h
	
	mov cx, 372
	mov dx, 244
	int 10h
	
	mov cx, 373
	mov dx, 244
	int 10h
	
	mov cx, 379
	mov dx, 244
	int 10h
	
	mov cx, 380
	mov dx, 244
	int 10h
	
	mov cx, 393
	mov dx, 244
	int 10h
	
	mov cx, 402
	mov dx, 244
	int 10h
	
	mov cx, 403
	mov dx, 244
	int 10h
	
	mov cx, 404
	mov dx, 244
	int 10h
	
	mov cx, 405
	mov dx, 244
	int 10h
	
	mov cx, 409
	mov dx, 244
	int 10h
	
	mov cx, 417
	mov dx, 244
	int 10h
	
	mov cx, 422
	mov dx, 244
	int 10h
	
	mov cx, 428
	mov dx, 244
	int 10h
	
	mov cx, 433
	mov dx, 244
	int 10h
	
	mov cx, 438
	mov dx, 244
	int 10h
	
	mov cx, 441
	mov dx, 244
	int 10h
	
	mov cx, 446
	mov dx, 244
	int 10h
	
	mov cx, 457
	mov dx, 244
	int 10h
	
	mov cx, 462
	mov dx, 244
	int 10h
	
	mov cx, 465
	mov dx, 244
	int 10h
	
	mov cx, 483
	mov dx, 244
	int 10h
	
	mov cx, 484
	mov dx, 244
	int 10h
	
	mov cx, 489
	mov dx, 244
	int 10h
	
	mov cx, 494
	mov dx, 244
	int 10h
	
	mov cx, 498
	mov dx, 244
	int 10h
	
	mov cx, 499
	mov dx, 244
	int 10h
	
	mov cx, 500
	mov dx, 244
	int 10h
	
	mov cx, 501
	mov dx, 244
	int 10h
	
	mov cx, 505
	mov dx, 244
	int 10h
	
	mov cx, 510
	mov dx, 244
	int 10h
	
	mov cx, 513
	mov dx, 244
	int 10h
	
	mov cx, 518
	mov dx, 244
	int 10h
	
	mov cx, 521
	mov dx, 244
	int 10h
	
	mov cx, 523
	mov dx, 244
	int 10h
	
	mov cx, 524
	mov dx, 244
	int 10h
	
	mov cx, 526
	mov dx, 244
	int 10h
	
	mov cx, 532
	mov dx, 244
	int 10h
	
	mov cx, 537
	mov dx, 244
	int 10h
	
	mov cx, 542
	mov dx, 244
	int 10h
	
	mov cx, 545
	mov dx, 244
	int 10h
	
	mov cx, 550
	mov dx, 244
	int 10h
	
	mov cx, 1
	mov dx, 245
	int 10h
	
	mov cx, 6
	mov dx, 245
	int 10h
	
	mov cx, 9
	mov dx, 245
	int 10h
	
	mov cx, 29
	mov dx, 245
	int 10h
	
	mov cx, 33
	mov dx, 245
	int 10h
	
	mov cx, 38
	mov dx, 245
	int 10h
	
	mov cx, 42
	mov dx, 245
	int 10h
	
	mov cx, 50
	mov dx, 245
	int 10h
	
	mov cx, 57
	mov dx, 245
	int 10h
	
	mov cx, 58
	mov dx, 245
	int 10h
	
	mov cx, 60
	mov dx, 245
	int 10h
	
	mov cx, 62
	mov dx, 245
	int 10h
	
	mov cx, 65
	mov dx, 245
	int 10h
	
	mov cx, 69
	mov dx, 245
	int 10h
	
	mov cx, 73
	mov dx, 245
	int 10h
	
	mov cx, 81
	mov dx, 245
	int 10h
	
	mov cx, 105
	mov dx, 245
	int 10h
	
	mov cx, 110
	mov dx, 245
	int 10h
	
	mov cx, 116
	mov dx, 245
	int 10h
	
	mov cx, 125
	mov dx, 245
	int 10h
	
	mov cx, 129
	mov dx, 245
	int 10h
	
	mov cx, 133
	mov dx, 245
	int 10h
	
	mov cx, 137
	mov dx, 245
	int 10h
	
	mov cx, 142
	mov dx, 245
	int 10h
	
	mov cx, 148
	mov dx, 245
	int 10h
	
	mov cx, 153
	mov dx, 245
	int 10h
	
	mov cx, 169
	mov dx, 245
	int 10h
	
	mov cx, 174
	mov dx, 245
	int 10h
	
	mov cx, 179
	mov dx, 245
	int 10h
	
	mov cx, 184
	mov dx, 245
	int 10h
	
	mov cx, 190
	mov dx, 245
	int 10h
	
	mov cx, 198
	mov dx, 245
	int 10h
	
	mov cx, 208
	mov dx, 245
	int 10h
	
	mov cx, 211
	mov dx, 245
	int 10h
	
	mov cx, 214
	mov dx, 245
	int 10h
	
	mov cx, 217
	mov dx, 245
	int 10h
	
	mov cx, 224
	mov dx, 245
	int 10h
	
	mov cx, 227
	mov dx, 245
	int 10h
	
	mov cx, 230
	mov dx, 245
	int 10h
	
	mov cx, 233
	mov dx, 245
	int 10h
	
	mov cx, 238
	mov dx, 245
	int 10h
	
	mov cx, 241
	mov dx, 245
	int 10h
	
	mov cx, 250
	mov dx, 245
	int 10h
	
	mov cx, 253
	mov dx, 245
	int 10h
	
	mov cx, 265
	mov dx, 245
	int 10h
	
	mov cx, 270
	mov dx, 245
	int 10h
	
	mov cx, 273
	mov dx, 245
	int 10h
	
	mov cx, 278
	mov dx, 245
	int 10h
	
	mov cx, 282
	mov dx, 245
	int 10h
	
	mov cx, 292
	mov dx, 245
	int 10h
	
	mov cx, 297
	mov dx, 245
	int 10h
	
	mov cx, 302
	mov dx, 245
	int 10h
	
	mov cx, 305
	mov dx, 245
	int 10h
	
	mov cx, 310
	mov dx, 245
	int 10h
	
	mov cx, 317
	mov dx, 245
	int 10h
	
	mov cx, 333
	mov dx, 245
	int 10h
	
	mov cx, 337
	mov dx, 245
	int 10h
	
	mov cx, 342
	mov dx, 245
	int 10h
	
	mov cx, 345
	mov dx, 245
	int 10h
	
	mov cx, 353
	mov dx, 245
	int 10h
	
	mov cx, 358
	mov dx, 245
	int 10h
	
	mov cx, 369
	mov dx, 245
	int 10h
	
	mov cx, 373
	mov dx, 245
	int 10h
	
	mov cx, 381
	mov dx, 245
	int 10h
	
	mov cx, 393
	mov dx, 245
	int 10h
	
	mov cx, 401
	mov dx, 245
	int 10h
	
	mov cx, 405
	mov dx, 245
	int 10h
	
	mov cx, 409
	mov dx, 245
	int 10h
	
	mov cx, 417
	mov dx, 245
	int 10h
	
	mov cx, 422
	mov dx, 245
	int 10h
	
	mov cx, 428
	mov dx, 245
	int 10h
	
	mov cx, 433
	mov dx, 245
	int 10h
	
	mov cx, 438
	mov dx, 245
	int 10h
	
	mov cx, 441
	mov dx, 245
	int 10h
	
	mov cx, 446
	mov dx, 245
	int 10h
	
	mov cx, 457
	mov dx, 245
	int 10h
	
	mov cx, 462
	mov dx, 245
	int 10h
	
	mov cx, 465
	mov dx, 245
	int 10h
	
	mov cx, 485
	mov dx, 245
	int 10h
	
	mov cx, 489
	mov dx, 245
	int 10h
	
	mov cx, 494
	mov dx, 245
	int 10h
	
	mov cx, 497
	mov dx, 245
	int 10h
	
	mov cx, 501
	mov dx, 245
	int 10h
	
	mov cx, 505
	mov dx, 245
	int 10h
	
	mov cx, 510
	mov dx, 245
	int 10h
	
	mov cx, 513
	mov dx, 245
	int 10h
	
	mov cx, 518
	mov dx, 245
	int 10h
	
	mov cx, 521
	mov dx, 245
	int 10h
	
	mov cx, 522
	mov dx, 245
	int 10h
	
	mov cx, 524
	mov dx, 245
	int 10h
	
	mov cx, 526
	mov dx, 245
	int 10h
	
	mov cx, 532
	mov dx, 245
	int 10h
	
	mov cx, 537
	mov dx, 245
	int 10h
	
	mov cx, 542
	mov dx, 245
	int 10h
	
	mov cx, 545
	mov dx, 245
	int 10h
	
	mov cx, 550
	mov dx, 245
	int 10h
	
	mov cx, 1
	mov dx, 246
	int 10h
	
	mov cx, 6
	mov dx, 246
	int 10h
	
	mov cx, 9
	mov dx, 246
	int 10h
	
	mov cx, 29
	mov dx, 246
	int 10h
	
	mov cx, 33
	mov dx, 246
	int 10h
	
	mov cx, 38
	mov dx, 246
	int 10h
	
	mov cx, 42
	mov dx, 246
	int 10h
	
	mov cx, 50
	mov dx, 246
	int 10h
	
	mov cx, 58
	mov dx, 246
	int 10h
	
	mov cx, 61
	mov dx, 246
	int 10h
	
	mov cx, 65
	mov dx, 246
	int 10h
	
	mov cx, 69
	mov dx, 246
	int 10h
	
	mov cx, 73
	mov dx, 246
	int 10h
	
	mov cx, 81
	mov dx, 246
	int 10h
	
	mov cx, 90
	mov dx, 246
	int 10h
	
	mov cx, 91
	mov dx, 246
	int 10h
	
	mov cx, 105
	mov dx, 246
	int 10h
	
	mov cx, 109
	mov dx, 246
	int 10h
	
	mov cx, 116
	mov dx, 246
	int 10h
	
	mov cx, 125
	mov dx, 246
	int 10h
	
	mov cx, 129
	mov dx, 246
	int 10h
	
	mov cx, 133
	mov dx, 246
	int 10h
	
	mov cx, 137
	mov dx, 246
	int 10h
	
	mov cx, 138
	mov dx, 246
	int 10h
	
	mov cx, 142
	mov dx, 246
	int 10h
	
	mov cx, 148
	mov dx, 246
	int 10h
	
	mov cx, 153
	mov dx, 246
	int 10h
	
	mov cx, 169
	mov dx, 246
	int 10h
	
	mov cx, 174
	mov dx, 246
	int 10h
	
	mov cx, 179
	mov dx, 246
	int 10h
	
	mov cx, 185
	mov dx, 246
	int 10h
	
	mov cx, 189
	mov dx, 246
	int 10h
	
	mov cx, 198
	mov dx, 246
	int 10h
	
	mov cx, 208
	mov dx, 246
	int 10h
	
	mov cx, 211
	mov dx, 246
	int 10h
	
	mov cx, 214
	mov dx, 246
	int 10h
	
	mov cx, 217
	mov dx, 246
	int 10h
	
	mov cx, 224
	mov dx, 246
	int 10h
	
	mov cx, 227
	mov dx, 246
	int 10h
	
	mov cx, 230
	mov dx, 246
	int 10h
	
	mov cx, 233
	mov dx, 246
	int 10h
	
	mov cx, 238
	mov dx, 246
	int 10h
	
	mov cx, 241
	mov dx, 246
	int 10h
	
	mov cx, 251
	mov dx, 246
	int 10h
	
	mov cx, 252
	mov dx, 246
	int 10h
	
	mov cx, 265
	mov dx, 246
	int 10h
	
	mov cx, 270
	mov dx, 246
	int 10h
	
	mov cx, 273
	mov dx, 246
	int 10h
	
	mov cx, 274
	mov dx, 246
	int 10h
	
	mov cx, 278
	mov dx, 246
	int 10h
	
	mov cx, 282
	mov dx, 246
	int 10h
	
	mov cx, 292
	mov dx, 246
	int 10h
	
	mov cx, 297
	mov dx, 246
	int 10h
	
	mov cx, 302
	mov dx, 246
	int 10h
	
	mov cx, 305
	mov dx, 246
	int 10h
	
	mov cx, 310
	mov dx, 246
	int 10h
	
	mov cx, 317
	mov dx, 246
	int 10h
	
	mov cx, 333
	mov dx, 246
	int 10h
	
	mov cx, 337
	mov dx, 246
	int 10h
	
	mov cx, 341
	mov dx, 246
	int 10h
	
	mov cx, 342
	mov dx, 246
	int 10h
	
	mov cx, 346
	mov dx, 246
	int 10h
	
	mov cx, 353
	mov dx, 246
	int 10h
	
	mov cx, 358
	mov dx, 246
	int 10h
	
	mov cx, 369
	mov dx, 246
	int 10h
	
	mov cx, 373
	mov dx, 246
	int 10h
	
	mov cx, 381
	mov dx, 246
	int 10h
	
	mov cx, 394
	mov dx, 246
	int 10h
	
	mov cx, 401
	mov dx, 246
	int 10h
	
	mov cx, 405
	mov dx, 246
	int 10h
	
	mov cx, 410
	mov dx, 246
	int 10h
	
	mov cx, 417
	mov dx, 246
	int 10h
	
	mov cx, 422
	mov dx, 246
	int 10h
	
	mov cx, 428
	mov dx, 246
	int 10h
	
	mov cx, 433
	mov dx, 246
	int 10h
	
	mov cx, 438
	mov dx, 246
	int 10h
	
	mov cx, 441
	mov dx, 246
	int 10h
	
	mov cx, 445
	mov dx, 246
	int 10h
	
	mov cx, 446
	mov dx, 246
	int 10h
	
	mov cx, 457
	mov dx, 246
	int 10h
	
	mov cx, 462
	mov dx, 246
	int 10h
	
	mov cx, 465
	mov dx, 246
	int 10h
	
	mov cx, 485
	mov dx, 246
	int 10h
	
	mov cx, 489
	mov dx, 246
	int 10h
	
	mov cx, 494
	mov dx, 246
	int 10h
	
	mov cx, 497
	mov dx, 246
	int 10h
	
	mov cx, 501
	mov dx, 246
	int 10h
	
	mov cx, 505
	mov dx, 246
	int 10h
	
	mov cx, 509
	mov dx, 246
	int 10h
	
	mov cx, 510
	mov dx, 246
	int 10h
	
	mov cx, 513
	mov dx, 246
	int 10h
	
	mov cx, 518
	mov dx, 246
	int 10h
	
	mov cx, 522
	mov dx, 246
	int 10h
	
	mov cx, 525
	mov dx, 246
	int 10h
	
	mov cx, 532
	mov dx, 246
	int 10h
	
	mov cx, 537
	mov dx, 246
	int 10h
	
	mov cx, 542
	mov dx, 246
	int 10h
	
	mov cx, 545
	mov dx, 246
	int 10h
	
	mov cx, 549
	mov dx, 246
	int 10h
	
	mov cx, 550
	mov dx, 246
	int 10h
	
	mov cx, 554
	mov dx, 246
	int 10h
	
	mov cx, 555
	mov dx, 246
	int 10h
	
	mov cx, 2
	mov dx, 247
	int 10h
	
	mov cx, 3
	mov dx, 247
	int 10h
	
	mov cx, 4
	mov dx, 247
	int 10h
	
	mov cx, 5
	mov dx, 247
	int 10h
	
	mov cx, 9
	mov dx, 247
	int 10h
	
	mov cx, 25
	mov dx, 247
	int 10h
	
	mov cx, 26
	mov dx, 247
	int 10h
	
	mov cx, 27
	mov dx, 247
	int 10h
	
	mov cx, 28
	mov dx, 247
	int 10h
	
	mov cx, 34
	mov dx, 247
	int 10h
	
	mov cx, 35
	mov dx, 247
	int 10h
	
	mov cx, 36
	mov dx, 247
	int 10h
	
	mov cx, 37
	mov dx, 247
	int 10h
	
	mov cx, 42
	mov dx, 247
	int 10h
	
	mov cx, 51
	mov dx, 247
	int 10h
	
	mov cx, 52
	mov dx, 247
	int 10h
	
	mov cx, 53
	mov dx, 247
	int 10h
	
	mov cx, 58
	mov dx, 247
	int 10h
	
	mov cx, 61
	mov dx, 247
	int 10h
	
	mov cx, 66
	mov dx, 247
	int 10h
	
	mov cx, 67
	mov dx, 247
	int 10h
	
	mov cx, 68
	mov dx, 247
	int 10h
	
	mov cx, 69
	mov dx, 247
	int 10h
	
	mov cx, 70
	mov dx, 247
	int 10h
	
	mov cx, 73
	mov dx, 247
	int 10h
	
	mov cx, 82
	mov dx, 247
	int 10h
	
	mov cx, 83
	mov dx, 247
	int 10h
	
	mov cx, 84
	mov dx, 247
	int 10h
	
	mov cx, 85
	mov dx, 247
	int 10h
	
	mov cx, 86
	mov dx, 247
	int 10h
	
	mov cx, 90
	mov dx, 247
	int 10h
	
	mov cx, 91
	mov dx, 247
	int 10h
	
	mov cx, 105
	mov dx, 247
	int 10h
	
	mov cx, 106
	mov dx, 247
	int 10h
	
	mov cx, 107
	mov dx, 247
	int 10h
	
	mov cx, 108
	mov dx, 247
	int 10h
	
	mov cx, 116
	mov dx, 247
	int 10h
	
	mov cx, 121
	mov dx, 247
	int 10h
	
	mov cx, 122
	mov dx, 247
	int 10h
	
	mov cx, 123
	mov dx, 247
	int 10h
	
	mov cx, 124
	mov dx, 247
	int 10h
	
	mov cx, 130
	mov dx, 247
	int 10h
	
	mov cx, 131
	mov dx, 247
	int 10h
	
	mov cx, 132
	mov dx, 247
	int 10h
	
	mov cx, 133
	mov dx, 247
	int 10h
	
	mov cx, 134
	mov dx, 247
	int 10h
	
	mov cx, 137
	mov dx, 247
	int 10h
	
	mov cx, 139
	mov dx, 247
	int 10h
	
	mov cx, 140
	mov dx, 247
	int 10h
	
	mov cx, 141
	mov dx, 247
	int 10h
	
	mov cx, 148
	mov dx, 247
	int 10h
	
	mov cx, 154
	mov dx, 247
	int 10h
	
	mov cx, 155
	mov dx, 247
	int 10h
	
	mov cx, 156
	mov dx, 247
	int 10h
	
	mov cx, 157
	mov dx, 247
	int 10h
	
	mov cx, 158
	mov dx, 247
	int 10h
	
	mov cx, 169
	mov dx, 247
	int 10h
	
	mov cx, 170
	mov dx, 247
	int 10h
	
	mov cx, 171
	mov dx, 247
	int 10h
	
	mov cx, 172
	mov dx, 247
	int 10h
	
	mov cx, 173
	mov dx, 247
	int 10h
	
	mov cx, 177
	mov dx, 247
	int 10h
	
	mov cx, 178
	mov dx, 247
	int 10h
	
	mov cx, 179
	mov dx, 247
	int 10h
	
	mov cx, 180
	mov dx, 247
	int 10h
	
	mov cx, 181
	mov dx, 247
	int 10h
	
	mov cx, 186
	mov dx, 247
	int 10h
	
	mov cx, 187
	mov dx, 247
	int 10h
	
	mov cx, 188
	mov dx, 247
	int 10h
	
	mov cx, 193
	mov dx, 247
	int 10h
	
	mov cx, 194
	mov dx, 247
	int 10h
	
	mov cx, 195
	mov dx, 247
	int 10h
	
	mov cx, 196
	mov dx, 247
	int 10h
	
	mov cx, 197
	mov dx, 247
	int 10h
	
	mov cx, 208
	mov dx, 247
	int 10h
	
	mov cx, 211
	mov dx, 247
	int 10h
	
	mov cx, 214
	mov dx, 247
	int 10h
	
	mov cx, 218
	mov dx, 247
	int 10h
	
	mov cx, 219
	mov dx, 247
	int 10h
	
	mov cx, 220
	mov dx, 247
	int 10h
	
	mov cx, 221
	mov dx, 247
	int 10h
	
	mov cx, 222
	mov dx, 247
	int 10h
	
	mov cx, 224
	mov dx, 247
	int 10h
	
	mov cx, 227
	mov dx, 247
	int 10h
	
	mov cx, 230
	mov dx, 247
	int 10h
	
	mov cx, 234
	mov dx, 247
	int 10h
	
	mov cx, 235
	mov dx, 247
	int 10h
	
	mov cx, 236
	mov dx, 247
	int 10h
	
	mov cx, 237
	mov dx, 247
	int 10h
	
	mov cx, 241
	mov dx, 247
	int 10h
	
	mov cx, 251
	mov dx, 247
	int 10h
	
	mov cx, 252
	mov dx, 247
	int 10h
	
	mov cx, 266
	mov dx, 247
	int 10h
	
	mov cx, 267
	mov dx, 247
	int 10h
	
	mov cx, 268
	mov dx, 247
	int 10h
	
	mov cx, 269
	mov dx, 247
	int 10h
	
	mov cx, 273
	mov dx, 247
	int 10h
	
	mov cx, 275
	mov dx, 247
	int 10h
	
	mov cx, 276
	mov dx, 247
	int 10h
	
	mov cx, 277
	mov dx, 247
	int 10h
	
	mov cx, 283
	mov dx, 247
	int 10h
	
	mov cx, 284
	mov dx, 247
	int 10h
	
	mov cx, 285
	mov dx, 247
	int 10h
	
	mov cx, 292
	mov dx, 247
	int 10h
	
	mov cx, 298
	mov dx, 247
	int 10h
	
	mov cx, 299
	mov dx, 247
	int 10h
	
	mov cx, 300
	mov dx, 247
	int 10h
	
	mov cx, 301
	mov dx, 247
	int 10h
	
	mov cx, 305
	mov dx, 247
	int 10h
	
	mov cx, 310
	mov dx, 247
	int 10h
	
	mov cx, 313
	mov dx, 247
	int 10h
	
	mov cx, 314
	mov dx, 247
	int 10h
	
	mov cx, 315
	mov dx, 247
	int 10h
	
	mov cx, 316
	mov dx, 247
	int 10h
	
	mov cx, 329
	mov dx, 247
	int 10h
	
	mov cx, 330
	mov dx, 247
	int 10h
	
	mov cx, 331
	mov dx, 247
	int 10h
	
	mov cx, 332
	mov dx, 247
	int 10h
	
	mov cx, 338
	mov dx, 247
	int 10h
	
	mov cx, 339
	mov dx, 247
	int 10h
	
	mov cx, 340
	mov dx, 247
	int 10h
	
	mov cx, 342
	mov dx, 247
	int 10h
	
	mov cx, 347
	mov dx, 247
	int 10h
	
	mov cx, 348
	mov dx, 247
	int 10h
	
	mov cx, 349
	mov dx, 247
	int 10h
	
	mov cx, 350
	mov dx, 247
	int 10h
	
	mov cx, 353
	mov dx, 247
	int 10h
	
	mov cx, 358
	mov dx, 247
	int 10h
	
	mov cx, 370
	mov dx, 247
	int 10h
	
	mov cx, 371
	mov dx, 247
	int 10h
	
	mov cx, 372
	mov dx, 247
	int 10h
	
	mov cx, 373
	mov dx, 247
	int 10h
	
	mov cx, 374
	mov dx, 247
	int 10h
	
	mov cx, 377
	mov dx, 247
	int 10h
	
	mov cx, 378
	mov dx, 247
	int 10h
	
	mov cx, 379
	mov dx, 247
	int 10h
	
	mov cx, 380
	mov dx, 247
	int 10h
	
	mov cx, 395
	mov dx, 247
	int 10h
	
	mov cx, 396
	mov dx, 247
	int 10h
	
	mov cx, 397
	mov dx, 247
	int 10h
	
	mov cx, 398
	mov dx, 247
	int 10h
	
	mov cx, 402
	mov dx, 247
	int 10h
	
	mov cx, 403
	mov dx, 247
	int 10h
	
	mov cx, 404
	mov dx, 247
	int 10h
	
	mov cx, 405
	mov dx, 247
	int 10h
	
	mov cx, 406
	mov dx, 247
	int 10h
	
	mov cx, 411
	mov dx, 247
	int 10h
	
	mov cx, 412
	mov dx, 247
	int 10h
	
	mov cx, 413
	mov dx, 247
	int 10h
	
	mov cx, 414
	mov dx, 247
	int 10h
	
	mov cx, 417
	mov dx, 247
	int 10h
	
	mov cx, 422
	mov dx, 247
	int 10h
	
	mov cx, 428
	mov dx, 247
	int 10h
	
	mov cx, 433
	mov dx, 247
	int 10h
	
	mov cx, 438
	mov dx, 247
	int 10h
	
	mov cx, 442
	mov dx, 247
	int 10h
	
	mov cx, 443
	mov dx, 247
	int 10h
	
	mov cx, 444
	mov dx, 247
	int 10h
	
	mov cx, 446
	mov dx, 247
	int 10h
	
	mov cx, 458
	mov dx, 247
	int 10h
	
	mov cx, 459
	mov dx, 247
	int 10h
	
	mov cx, 460
	mov dx, 247
	int 10h
	
	mov cx, 461
	mov dx, 247
	int 10h
	
	mov cx, 465
	mov dx, 247
	int 10h
	
	mov cx, 481
	mov dx, 247
	int 10h
	
	mov cx, 482
	mov dx, 247
	int 10h
	
	mov cx, 483
	mov dx, 247
	int 10h
	
	mov cx, 484
	mov dx, 247
	int 10h
	
	mov cx, 489
	mov dx, 247
	int 10h
	
	mov cx, 494
	mov dx, 247
	int 10h
	
	mov cx, 498
	mov dx, 247
	int 10h
	
	mov cx, 499
	mov dx, 247
	int 10h
	
	mov cx, 500
	mov dx, 247
	int 10h
	
	mov cx, 501
	mov dx, 247
	int 10h
	
	mov cx, 502
	mov dx, 247
	int 10h
	
	mov cx, 506
	mov dx, 247
	int 10h
	
	mov cx, 507
	mov dx, 247
	int 10h
	
	mov cx, 508
	mov dx, 247
	int 10h
	
	mov cx, 510
	mov dx, 247
	int 10h
	
	mov cx, 514
	mov dx, 247
	int 10h
	
	mov cx, 515
	mov dx, 247
	int 10h
	
	mov cx, 516
	mov dx, 247
	int 10h
	
	mov cx, 517
	mov dx, 247
	int 10h
	
	mov cx, 522
	mov dx, 247
	int 10h
	
	mov cx, 525
	mov dx, 247
	int 10h
	
	mov cx, 532
	mov dx, 247
	int 10h
	
	mov cx, 537
	mov dx, 247
	int 10h
	
	mov cx, 542
	mov dx, 247
	int 10h
	
	mov cx, 546
	mov dx, 247
	int 10h
	
	mov cx, 547
	mov dx, 247
	int 10h
	
	mov cx, 548
	mov dx, 247
	int 10h
	
	mov cx, 550
	mov dx, 247
	int 10h
	
	mov cx, 554
	mov dx, 247
	int 10h
	
	mov cx, 555
	mov dx, 247
	int 10h
	
	mov cx, 251
	mov dx, 248
	int 10h
	
	mov cx, 273
	mov dx, 248
	int 10h
	
	mov cx, 446
	mov dx, 248
	int 10h
	
	mov cx, 550
	mov dx, 248
	int 10h
	
	mov cx, 250
	mov dx, 249
	int 10h
	
	mov cx, 251
	mov dx, 249
	int 10h
	
	mov cx, 273
	mov dx, 249
	int 10h
	
	mov cx, 446
	mov dx, 249
	int 10h
	
	mov cx, 550
	mov dx, 249
	int 10h
	
	mov cx, 248
	mov dx, 250
	int 10h
	
	mov cx, 249
	mov dx, 250
	int 10h
	
	mov cx, 250
	mov dx, 250
	int 10h
	
	mov cx, 273
	mov dx, 250
	int 10h
	
	mov cx, 442
	mov dx, 250
	int 10h
	
	mov cx, 443
	mov dx, 250
	int 10h
	
	mov cx, 444
	mov dx, 250
	int 10h
	
	mov cx, 445
	mov dx, 250
	int 10h
	
	mov cx, 546
	mov dx, 250
	int 10h
	
	mov cx, 547
	mov dx, 250
	int 10h
	
	mov cx, 548
	mov dx, 250
	int 10h
	
	mov cx, 549
	mov dx, 250
	int 10h
	
	mov cx, 11
	mov dx, 252
	int 10h
	
	mov cx, 12
	mov dx, 252
	int 10h
	
	mov cx, 13
	mov dx, 252
	int 10h
	
	mov cx, 14
	mov dx, 252
	int 10h
	
	mov cx, 86
	mov dx, 252
	int 10h
	
	mov cx, 171
	mov dx, 252
	int 10h
	
	mov cx, 172
	mov dx, 252
	int 10h
	
	mov cx, 173
	mov dx, 252
	int 10h
	
	mov cx, 174
	mov dx, 252
	int 10h
	
	mov cx, 214
	mov dx, 252
	int 10h
	
	mov cx, 342
	mov dx, 252
	int 10h
	
	mov cx, 347
	mov dx, 252
	int 10h
	
	mov cx, 348
	mov dx, 252
	int 10h
	
	mov cx, 369
	mov dx, 252
	int 10h
	
	mov cx, 377
	mov dx, 252
	int 10h
	
	mov cx, 378
	mov dx, 252
	int 10h
	
	mov cx, 379
	mov dx, 252
	int 10h
	
	mov cx, 380
	mov dx, 252
	int 10h
	
	mov cx, 10
	mov dx, 253
	int 10h
	
	mov cx, 86
	mov dx, 253
	int 10h
	
	mov cx, 170
	mov dx, 253
	int 10h
	
	mov cx, 214
	mov dx, 253
	int 10h
	
	mov cx, 342
	mov dx, 253
	int 10h
	
	mov cx, 347
	mov dx, 253
	int 10h
	
	mov cx, 348
	mov dx, 253
	int 10h
	
	mov cx, 369
	mov dx, 253
	int 10h
	
	mov cx, 380
	mov dx, 253
	int 10h
	
	mov cx, 1
	mov dx, 254
	int 10h
	
	mov cx, 2
	mov dx, 254
	int 10h
	
	mov cx, 3
	mov dx, 254
	int 10h
	
	mov cx, 4
	mov dx, 254
	int 10h
	
	mov cx, 5
	mov dx, 254
	int 10h
	
	mov cx, 10
	mov dx, 254
	int 10h
	
	mov cx, 86
	mov dx, 254
	int 10h
	
	mov cx, 98
	mov dx, 254
	int 10h
	
	mov cx, 154
	mov dx, 254
	int 10h
	
	mov cx, 155
	mov dx, 254
	int 10h
	
	mov cx, 156
	mov dx, 254
	int 10h
	
	mov cx, 157
	mov dx, 254
	int 10h
	
	mov cx, 158
	mov dx, 254
	int 10h
	
	mov cx, 170
	mov dx, 254
	int 10h
	
	mov cx, 192
	mov dx, 254
	int 10h
	
	mov cx, 193
	mov dx, 254
	int 10h
	
	mov cx, 197
	mov dx, 254
	int 10h
	
	mov cx, 198
	mov dx, 254
	int 10h
	
	mov cx, 214
	mov dx, 254
	int 10h
	
	mov cx, 234
	mov dx, 254
	int 10h
	
	mov cx, 342
	mov dx, 254
	int 10h
	
	mov cx, 369
	mov dx, 254
	int 10h
	
	mov cx, 380
	mov dx, 254
	int 10h
	
	mov cx, 466
	mov dx, 254
	int 10h
	
	mov cx, 522
	mov dx, 254
	int 10h
	
	mov cx, 546
	mov dx, 254
	int 10h
	
	mov cx, 3
	mov dx, 255
	int 10h
	
	mov cx, 8
	mov dx, 255
	int 10h
	
	mov cx, 9
	mov dx, 255
	int 10h
	
	mov cx, 10
	mov dx, 255
	int 10h
	
	mov cx, 11
	mov dx, 255
	int 10h
	
	mov cx, 12
	mov dx, 255
	int 10h
	
	mov cx, 13
	mov dx, 255
	int 10h
	
	mov cx, 14
	mov dx, 255
	int 10h
	
	mov cx, 24
	mov dx, 255
	int 10h
	
	mov cx, 31
	mov dx, 255
	int 10h
	
	mov cx, 34
	mov dx, 255
	int 10h
	
	mov cx, 35
	mov dx, 255
	int 10h
	
	mov cx, 36
	mov dx, 255
	int 10h
	
	mov cx, 37
	mov dx, 255
	int 10h
	
	mov cx, 41
	mov dx, 255
	int 10h
	
	mov cx, 46
	mov dx, 255
	int 10h
	
	mov cx, 57
	mov dx, 255
	int 10h
	
	mov cx, 59
	mov dx, 255
	int 10h
	
	mov cx, 60
	mov dx, 255
	int 10h
	
	mov cx, 61
	mov dx, 255
	int 10h
	
	mov cx, 66
	mov dx, 255
	int 10h
	
	mov cx, 67
	mov dx, 255
	int 10h
	
	mov cx, 68
	mov dx, 255
	int 10h
	
	mov cx, 69
	mov dx, 255
	int 10h
	
	mov cx, 74
	mov dx, 255
	int 10h
	
	mov cx, 75
	mov dx, 255
	int 10h
	
	mov cx, 76
	mov dx, 255
	int 10h
	
	mov cx, 77
	mov dx, 255
	int 10h
	
	mov cx, 82
	mov dx, 255
	int 10h
	
	mov cx, 83
	mov dx, 255
	int 10h
	
	mov cx, 84
	mov dx, 255
	int 10h
	
	mov cx, 86
	mov dx, 255
	int 10h
	
	mov cx, 96
	mov dx, 255
	int 10h
	
	mov cx, 97
	mov dx, 255
	int 10h
	
	mov cx, 98
	mov dx, 255
	int 10h
	
	mov cx, 99
	mov dx, 255
	int 10h
	
	mov cx, 100
	mov dx, 255
	int 10h
	
	mov cx, 101
	mov dx, 255
	int 10h
	
	mov cx, 106
	mov dx, 255
	int 10h
	
	mov cx, 107
	mov dx, 255
	int 10h
	
	mov cx, 108
	mov dx, 255
	int 10h
	
	mov cx, 109
	mov dx, 255
	int 10h
	
	mov cx, 121
	mov dx, 255
	int 10h
	
	mov cx, 126
	mov dx, 255
	int 10h
	
	mov cx, 130
	mov dx, 255
	int 10h
	
	mov cx, 131
	mov dx, 255
	int 10h
	
	mov cx, 132
	mov dx, 255
	int 10h
	
	mov cx, 133
	mov dx, 255
	int 10h
	
	mov cx, 138
	mov dx, 255
	int 10h
	
	mov cx, 139
	mov dx, 255
	int 10h
	
	mov cx, 140
	mov dx, 255
	int 10h
	
	mov cx, 141
	mov dx, 255
	int 10h
	
	mov cx, 153
	mov dx, 255
	int 10h
	
	mov cx, 162
	mov dx, 255
	int 10h
	
	mov cx, 163
	mov dx, 255
	int 10h
	
	mov cx, 164
	mov dx, 255
	int 10h
	
	mov cx, 168
	mov dx, 255
	int 10h
	
	mov cx, 169
	mov dx, 255
	int 10h
	
	mov cx, 170
	mov dx, 255
	int 10h
	
	mov cx, 171
	mov dx, 255
	int 10h
	
	mov cx, 172
	mov dx, 255
	int 10h
	
	mov cx, 173
	mov dx, 255
	int 10h
	
	mov cx, 174
	mov dx, 255
	int 10h
	
	mov cx, 178
	mov dx, 255
	int 10h
	
	mov cx, 179
	mov dx, 255
	int 10h
	
	mov cx, 180
	mov dx, 255
	int 10h
	
	mov cx, 181
	mov dx, 255
	int 10h
	
	mov cx, 192
	mov dx, 255
	int 10h
	
	mov cx, 193
	mov dx, 255
	int 10h
	
	mov cx, 197
	mov dx, 255
	int 10h
	
	mov cx, 198
	mov dx, 255
	int 10h
	
	mov cx, 202
	mov dx, 255
	int 10h
	
	mov cx, 203
	mov dx, 255
	int 10h
	
	mov cx, 204
	mov dx, 255
	int 10h
	
	mov cx, 205
	mov dx, 255
	int 10h
	
	mov cx, 210
	mov dx, 255
	int 10h
	
	mov cx, 211
	mov dx, 255
	int 10h
	
	mov cx, 212
	mov dx, 255
	int 10h
	
	mov cx, 214
	mov dx, 255
	int 10h
	
	mov cx, 218
	mov dx, 255
	int 10h
	
	mov cx, 219
	mov dx, 255
	int 10h
	
	mov cx, 220
	mov dx, 255
	int 10h
	
	mov cx, 221
	mov dx, 255
	int 10h
	
	mov cx, 232
	mov dx, 255
	int 10h
	
	mov cx, 233
	mov dx, 255
	int 10h
	
	mov cx, 234
	mov dx, 255
	int 10h
	
	mov cx, 235
	mov dx, 255
	int 10h
	
	mov cx, 236
	mov dx, 255
	int 10h
	
	mov cx, 237
	mov dx, 255
	int 10h
	
	mov cx, 242
	mov dx, 255
	int 10h
	
	mov cx, 243
	mov dx, 255
	int 10h
	
	mov cx, 244
	mov dx, 255
	int 10h
	
	mov cx, 245
	mov dx, 255
	int 10h
	
	mov cx, 257
	mov dx, 255
	int 10h
	
	mov cx, 259
	mov dx, 255
	int 10h
	
	mov cx, 260
	mov dx, 255
	int 10h
	
	mov cx, 261
	mov dx, 255
	int 10h
	
	mov cx, 266
	mov dx, 255
	int 10h
	
	mov cx, 267
	mov dx, 255
	int 10h
	
	mov cx, 268
	mov dx, 255
	int 10h
	
	mov cx, 269
	mov dx, 255
	int 10h
	
	mov cx, 272
	mov dx, 255
	int 10h
	
	mov cx, 274
	mov dx, 255
	int 10h
	
	mov cx, 275
	mov dx, 255
	int 10h
	
	mov cx, 277
	mov dx, 255
	int 10h
	
	mov cx, 278
	mov dx, 255
	int 10h
	
	mov cx, 282
	mov dx, 255
	int 10h
	
	mov cx, 283
	mov dx, 255
	int 10h
	
	mov cx, 284
	mov dx, 255
	int 10h
	
	mov cx, 285
	mov dx, 255
	int 10h
	
	mov cx, 288
	mov dx, 255
	int 10h
	
	mov cx, 294
	mov dx, 255
	int 10h
	
	mov cx, 298
	mov dx, 255
	int 10h
	
	mov cx, 299
	mov dx, 255
	int 10h
	
	mov cx, 300
	mov dx, 255
	int 10h
	
	mov cx, 301
	mov dx, 255
	int 10h
	
	mov cx, 314
	mov dx, 255
	int 10h
	
	mov cx, 315
	mov dx, 255
	int 10h
	
	mov cx, 316
	mov dx, 255
	int 10h
	
	mov cx, 317
	mov dx, 255
	int 10h
	
	mov cx, 321
	mov dx, 255
	int 10h
	
	mov cx, 323
	mov dx, 255
	int 10h
	
	mov cx, 324
	mov dx, 255
	int 10h
	
	mov cx, 325
	mov dx, 255
	int 10h
	
	mov cx, 338
	mov dx, 255
	int 10h
	
	mov cx, 339
	mov dx, 255
	int 10h
	
	mov cx, 340
	mov dx, 255
	int 10h
	
	mov cx, 342
	mov dx, 255
	int 10h
	
	mov cx, 345
	mov dx, 255
	int 10h
	
	mov cx, 346
	mov dx, 255
	int 10h
	
	mov cx, 347
	mov dx, 255
	int 10h
	
	mov cx, 348
	mov dx, 255
	int 10h
	
	mov cx, 354
	mov dx, 255
	int 10h
	
	mov cx, 355
	mov dx, 255
	int 10h
	
	mov cx, 356
	mov dx, 255
	int 10h
	
	mov cx, 357
	mov dx, 255
	int 10h
	
	mov cx, 362
	mov dx, 255
	int 10h
	
	mov cx, 363
	mov dx, 255
	int 10h
	
	mov cx, 364
	mov dx, 255
	int 10h
	
	mov cx, 369
	mov dx, 255
	int 10h
	
	mov cx, 371
	mov dx, 255
	int 10h
	
	mov cx, 372
	mov dx, 255
	int 10h
	
	mov cx, 373
	mov dx, 255
	int 10h
	
	mov cx, 380
	mov dx, 255
	int 10h
	
	mov cx, 386
	mov dx, 255
	int 10h
	
	mov cx, 387
	mov dx, 255
	int 10h
	
	mov cx, 388
	mov dx, 255
	int 10h
	
	mov cx, 389
	mov dx, 255
	int 10h
	
	mov cx, 403
	mov dx, 255
	int 10h
	
	mov cx, 404
	mov dx, 255
	int 10h
	
	mov cx, 405
	mov dx, 255
	int 10h
	
	mov cx, 406
	mov dx, 255
	int 10h
	
	mov cx, 410
	mov dx, 255
	int 10h
	
	mov cx, 411
	mov dx, 255
	int 10h
	
	mov cx, 412
	mov dx, 255
	int 10h
	
	mov cx, 413
	mov dx, 255
	int 10h
	
	mov cx, 416
	mov dx, 255
	int 10h
	
	mov cx, 418
	mov dx, 255
	int 10h
	
	mov cx, 419
	mov dx, 255
	int 10h
	
	mov cx, 421
	mov dx, 255
	int 10h
	
	mov cx, 422
	mov dx, 255
	int 10h
	
	mov cx, 425
	mov dx, 255
	int 10h
	
	mov cx, 427
	mov dx, 255
	int 10h
	
	mov cx, 428
	mov dx, 255
	int 10h
	
	mov cx, 429
	mov dx, 255
	int 10h
	
	mov cx, 434
	mov dx, 255
	int 10h
	
	mov cx, 435
	mov dx, 255
	int 10h
	
	mov cx, 436
	mov dx, 255
	int 10h
	
	mov cx, 437
	mov dx, 255
	int 10h
	
	mov cx, 441
	mov dx, 255
	int 10h
	
	mov cx, 443
	mov dx, 255
	int 10h
	
	mov cx, 444
	mov dx, 255
	int 10h
	
	mov cx, 445
	mov dx, 255
	int 10h
	
	mov cx, 450
	mov dx, 255
	int 10h
	
	mov cx, 451
	mov dx, 255
	int 10h
	
	mov cx, 452
	mov dx, 255
	int 10h
	
	mov cx, 453
	mov dx, 255
	int 10h
	
	mov cx, 457
	mov dx, 255
	int 10h
	
	mov cx, 459
	mov dx, 255
	int 10h
	
	mov cx, 460
	mov dx, 255
	int 10h
	
	mov cx, 461
	mov dx, 255
	int 10h
	
	mov cx, 464
	mov dx, 255
	int 10h
	
	mov cx, 465
	mov dx, 255
	int 10h
	
	mov cx, 466
	mov dx, 255
	int 10h
	
	mov cx, 467
	mov dx, 255
	int 10h
	
	mov cx, 468
	mov dx, 255
	int 10h
	
	mov cx, 469
	mov dx, 255
	int 10h
	
	mov cx, 474
	mov dx, 255
	int 10h
	
	mov cx, 475
	mov dx, 255
	int 10h
	
	mov cx, 476
	mov dx, 255
	int 10h
	
	mov cx, 477
	mov dx, 255
	int 10h
	
	mov cx, 497
	mov dx, 255
	int 10h
	
	mov cx, 499
	mov dx, 255
	int 10h
	
	mov cx, 500
	mov dx, 255
	int 10h
	
	mov cx, 501
	mov dx, 255
	int 10h
	
	mov cx, 506
	mov dx, 255
	int 10h
	
	mov cx, 507
	mov dx, 255
	int 10h
	
	mov cx, 508
	mov dx, 255
	int 10h
	
	mov cx, 509
	mov dx, 255
	int 10h
	
	mov cx, 514
	mov dx, 255
	int 10h
	
	mov cx, 515
	mov dx, 255
	int 10h
	
	mov cx, 516
	mov dx, 255
	int 10h
	
	mov cx, 517
	mov dx, 255
	int 10h
	
	mov cx, 520
	mov dx, 255
	int 10h
	
	mov cx, 521
	mov dx, 255
	int 10h
	
	mov cx, 522
	mov dx, 255
	int 10h
	
	mov cx, 523
	mov dx, 255
	int 10h
	
	mov cx, 524
	mov dx, 255
	int 10h
	
	mov cx, 525
	mov dx, 255
	int 10h
	
	mov cx, 530
	mov dx, 255
	int 10h
	
	mov cx, 531
	mov dx, 255
	int 10h
	
	mov cx, 532
	mov dx, 255
	int 10h
	
	mov cx, 537
	mov dx, 255
	int 10h
	
	mov cx, 539
	mov dx, 255
	int 10h
	
	mov cx, 540
	mov dx, 255
	int 10h
	
	mov cx, 541
	mov dx, 255
	int 10h
	
	mov cx, 544
	mov dx, 255
	int 10h
	
	mov cx, 545
	mov dx, 255
	int 10h
	
	mov cx, 546
	mov dx, 255
	int 10h
	
	mov cx, 547
	mov dx, 255
	int 10h
	
	mov cx, 548
	mov dx, 255
	int 10h
	
	mov cx, 549
	mov dx, 255
	int 10h
	
	mov cx, 3
	mov dx, 256
	int 10h
	
	mov cx, 10
	mov dx, 256
	int 10h
	
	mov cx, 25
	mov dx, 256
	int 10h
	
	mov cx, 30
	mov dx, 256
	int 10h
	
	mov cx, 33
	mov dx, 256
	int 10h
	
	mov cx, 38
	mov dx, 256
	int 10h
	
	mov cx, 41
	mov dx, 256
	int 10h
	
	mov cx, 46
	mov dx, 256
	int 10h
	
	mov cx, 57
	mov dx, 256
	int 10h
	
	mov cx, 58
	mov dx, 256
	int 10h
	
	mov cx, 62
	mov dx, 256
	int 10h
	
	mov cx, 66
	mov dx, 256
	int 10h
	
	mov cx, 70
	mov dx, 256
	int 10h
	
	mov cx, 74
	mov dx, 256
	int 10h
	
	mov cx, 78
	mov dx, 256
	int 10h
	
	mov cx, 81
	mov dx, 256
	int 10h
	
	mov cx, 85
	mov dx, 256
	int 10h
	
	mov cx, 86
	mov dx, 256
	int 10h
	
	mov cx, 98
	mov dx, 256
	int 10h
	
	mov cx, 105
	mov dx, 256
	int 10h
	
	mov cx, 110
	mov dx, 256
	int 10h
	
	mov cx, 121
	mov dx, 256
	int 10h
	
	mov cx, 126
	mov dx, 256
	int 10h
	
	mov cx, 129
	mov dx, 256
	int 10h
	
	mov cx, 138
	mov dx, 256
	int 10h
	
	mov cx, 142
	mov dx, 256
	int 10h
	
	mov cx, 153
	mov dx, 256
	int 10h
	
	mov cx, 165
	mov dx, 256
	int 10h
	
	mov cx, 170
	mov dx, 256
	int 10h
	
	mov cx, 178
	mov dx, 256
	int 10h
	
	mov cx, 182
	mov dx, 256
	int 10h
	
	mov cx, 192
	mov dx, 256
	int 10h
	
	mov cx, 194
	mov dx, 256
	int 10h
	
	mov cx, 196
	mov dx, 256
	int 10h
	
	mov cx, 198
	mov dx, 256
	int 10h
	
	mov cx, 201
	mov dx, 256
	int 10h
	
	mov cx, 206
	mov dx, 256
	int 10h
	
	mov cx, 209
	mov dx, 256
	int 10h
	
	mov cx, 213
	mov dx, 256
	int 10h
	
	mov cx, 214
	mov dx, 256
	int 10h
	
	mov cx, 218
	mov dx, 256
	int 10h
	
	mov cx, 222
	mov dx, 256
	int 10h
	
	mov cx, 234
	mov dx, 256
	int 10h
	
	mov cx, 241
	mov dx, 256
	int 10h
	
	mov cx, 246
	mov dx, 256
	int 10h
	
	mov cx, 257
	mov dx, 256
	int 10h
	
	mov cx, 258
	mov dx, 256
	int 10h
	
	mov cx, 261
	mov dx, 256
	int 10h
	
	mov cx, 266
	mov dx, 256
	int 10h
	
	mov cx, 270
	mov dx, 256
	int 10h
	
	mov cx, 272
	mov dx, 256
	int 10h
	
	mov cx, 273
	mov dx, 256
	int 10h
	
	mov cx, 275
	mov dx, 256
	int 10h
	
	mov cx, 276
	mov dx, 256
	int 10h
	
	mov cx, 278
	mov dx, 256
	int 10h
	
	mov cx, 281
	mov dx, 256
	int 10h
	
	mov cx, 286
	mov dx, 256
	int 10h
	
	mov cx, 289
	mov dx, 256
	int 10h
	
	mov cx, 293
	mov dx, 256
	int 10h
	
	mov cx, 298
	mov dx, 256
	int 10h
	
	mov cx, 302
	mov dx, 256
	int 10h
	
	mov cx, 313
	mov dx, 256
	int 10h
	
	mov cx, 318
	mov dx, 256
	int 10h
	
	mov cx, 321
	mov dx, 256
	int 10h
	
	mov cx, 322
	mov dx, 256
	int 10h
	
	mov cx, 325
	mov dx, 256
	int 10h
	
	mov cx, 337
	mov dx, 256
	int 10h
	
	mov cx, 341
	mov dx, 256
	int 10h
	
	mov cx, 342
	mov dx, 256
	int 10h
	
	mov cx, 348
	mov dx, 256
	int 10h
	
	mov cx, 353
	mov dx, 256
	int 10h
	
	mov cx, 365
	mov dx, 256
	int 10h
	
	mov cx, 369
	mov dx, 256
	int 10h
	
	mov cx, 370
	mov dx, 256
	int 10h
	
	mov cx, 374
	mov dx, 256
	int 10h
	
	mov cx, 380
	mov dx, 256
	int 10h
	
	mov cx, 386
	mov dx, 256
	int 10h
	
	mov cx, 390
	mov dx, 256
	int 10h
	
	mov cx, 402
	mov dx, 256
	int 10h
	
	mov cx, 409
	mov dx, 256
	int 10h
	
	mov cx, 414
	mov dx, 256
	int 10h
	
	mov cx, 416
	mov dx, 256
	int 10h
	
	mov cx, 417
	mov dx, 256
	int 10h
	
	mov cx, 419
	mov dx, 256
	int 10h
	
	mov cx, 420
	mov dx, 256
	int 10h
	
	mov cx, 422
	mov dx, 256
	int 10h
	
	mov cx, 425
	mov dx, 256
	int 10h
	
	mov cx, 426
	mov dx, 256
	int 10h
	
	mov cx, 430
	mov dx, 256
	int 10h
	
	mov cx, 433
	mov dx, 256
	int 10h
	
	mov cx, 438
	mov dx, 256
	int 10h
	
	mov cx, 441
	mov dx, 256
	int 10h
	
	mov cx, 442
	mov dx, 256
	int 10h
	
	mov cx, 446
	mov dx, 256
	int 10h
	
	mov cx, 450
	mov dx, 256
	int 10h
	
	mov cx, 454
	mov dx, 256
	int 10h
	
	mov cx, 457
	mov dx, 256
	int 10h
	
	mov cx, 458
	mov dx, 256
	int 10h
	
	mov cx, 462
	mov dx, 256
	int 10h
	
	mov cx, 466
	mov dx, 256
	int 10h
	
	mov cx, 473
	mov dx, 256
	int 10h
	
	mov cx, 497
	mov dx, 256
	int 10h
	
	mov cx, 498
	mov dx, 256
	int 10h
	
	mov cx, 501
	mov dx, 256
	int 10h
	
	mov cx, 506
	mov dx, 256
	int 10h
	
	mov cx, 510
	mov dx, 256
	int 10h
	
	mov cx, 513
	mov dx, 256
	int 10h
	
	mov cx, 522
	mov dx, 256
	int 10h
	
	mov cx, 533
	mov dx, 256
	int 10h
	
	mov cx, 537
	mov dx, 256
	int 10h
	
	mov cx, 538
	mov dx, 256
	int 10h
	
	mov cx, 541
	mov dx, 256
	int 10h
	
	mov cx, 546
	mov dx, 256
	int 10h
	
	mov cx, 3
	mov dx, 257
	int 10h
	
	mov cx, 10
	mov dx, 257
	int 10h
	
	mov cx, 25
	mov dx, 257
	int 10h
	
	mov cx, 30
	mov dx, 257
	int 10h
	
	mov cx, 33
	mov dx, 257
	int 10h
	
	mov cx, 38
	mov dx, 257
	int 10h
	
	mov cx, 41
	mov dx, 257
	int 10h
	
	mov cx, 46
	mov dx, 257
	int 10h
	
	mov cx, 57
	mov dx, 257
	int 10h
	
	mov cx, 62
	mov dx, 257
	int 10h
	
	mov cx, 65
	mov dx, 257
	int 10h
	
	mov cx, 70
	mov dx, 257
	int 10h
	
	mov cx, 73
	mov dx, 257
	int 10h
	
	mov cx, 78
	mov dx, 257
	int 10h
	
	mov cx, 81
	mov dx, 257
	int 10h
	
	mov cx, 86
	mov dx, 257
	int 10h
	
	mov cx, 98
	mov dx, 257
	int 10h
	
	mov cx, 105
	mov dx, 257
	int 10h
	
	mov cx, 110
	mov dx, 257
	int 10h
	
	mov cx, 121
	mov dx, 257
	int 10h
	
	mov cx, 126
	mov dx, 257
	int 10h
	
	mov cx, 129
	mov dx, 257
	int 10h
	
	mov cx, 130
	mov dx, 257
	int 10h
	
	mov cx, 137
	mov dx, 257
	int 10h
	
	mov cx, 142
	mov dx, 257
	int 10h
	
	mov cx, 154
	mov dx, 257
	int 10h
	
	mov cx, 155
	mov dx, 257
	int 10h
	
	mov cx, 156
	mov dx, 257
	int 10h
	
	mov cx, 165
	mov dx, 257
	int 10h
	
	mov cx, 170
	mov dx, 257
	int 10h
	
	mov cx, 177
	mov dx, 257
	int 10h
	
	mov cx, 182
	mov dx, 257
	int 10h
	
	mov cx, 192
	mov dx, 257
	int 10h
	
	mov cx, 194
	mov dx, 257
	int 10h
	
	mov cx, 196
	mov dx, 257
	int 10h
	
	mov cx, 198
	mov dx, 257
	int 10h
	
	mov cx, 201
	mov dx, 257
	int 10h
	
	mov cx, 206
	mov dx, 257
	int 10h
	
	mov cx, 209
	mov dx, 257
	int 10h
	
	mov cx, 214
	mov dx, 257
	int 10h
	
	mov cx, 217
	mov dx, 257
	int 10h
	
	mov cx, 222
	mov dx, 257
	int 10h
	
	mov cx, 234
	mov dx, 257
	int 10h
	
	mov cx, 241
	mov dx, 257
	int 10h
	
	mov cx, 246
	mov dx, 257
	int 10h
	
	mov cx, 257
	mov dx, 257
	int 10h
	
	mov cx, 265
	mov dx, 257
	int 10h
	
	mov cx, 270
	mov dx, 257
	int 10h
	
	mov cx, 272
	mov dx, 257
	int 10h
	
	mov cx, 275
	mov dx, 257
	int 10h
	
	mov cx, 278
	mov dx, 257
	int 10h
	
	mov cx, 281
	mov dx, 257
	int 10h
	
	mov cx, 286
	mov dx, 257
	int 10h
	
	mov cx, 289
	mov dx, 257
	int 10h
	
	mov cx, 293
	mov dx, 257
	int 10h
	
	mov cx, 297
	mov dx, 257
	int 10h
	
	mov cx, 302
	mov dx, 257
	int 10h
	
	mov cx, 313
	mov dx, 257
	int 10h
	
	mov cx, 318
	mov dx, 257
	int 10h
	
	mov cx, 321
	mov dx, 257
	int 10h
	
	mov cx, 337
	mov dx, 257
	int 10h
	
	mov cx, 342
	mov dx, 257
	int 10h
	
	mov cx, 348
	mov dx, 257
	int 10h
	
	mov cx, 353
	mov dx, 257
	int 10h
	
	mov cx, 354
	mov dx, 257
	int 10h
	
	mov cx, 365
	mov dx, 257
	int 10h
	
	mov cx, 369
	mov dx, 257
	int 10h
	
	mov cx, 374
	mov dx, 257
	int 10h
	
	mov cx, 380
	mov dx, 257
	int 10h
	
	mov cx, 385
	mov dx, 257
	int 10h
	
	mov cx, 390
	mov dx, 257
	int 10h
	
	mov cx, 401
	mov dx, 257
	int 10h
	
	mov cx, 409
	mov dx, 257
	int 10h
	
	mov cx, 414
	mov dx, 257
	int 10h
	
	mov cx, 416
	mov dx, 257
	int 10h
	
	mov cx, 419
	mov dx, 257
	int 10h
	
	mov cx, 422
	mov dx, 257
	int 10h
	
	mov cx, 425
	mov dx, 257
	int 10h
	
	mov cx, 430
	mov dx, 257
	int 10h
	
	mov cx, 433
	mov dx, 257
	int 10h
	
	mov cx, 438
	mov dx, 257
	int 10h
	
	mov cx, 441
	mov dx, 257
	int 10h
	
	mov cx, 446
	mov dx, 257
	int 10h
	
	mov cx, 449
	mov dx, 257
	int 10h
	
	mov cx, 454
	mov dx, 257
	int 10h
	
	mov cx, 457
	mov dx, 257
	int 10h
	
	mov cx, 462
	mov dx, 257
	int 10h
	
	mov cx, 466
	mov dx, 257
	int 10h
	
	mov cx, 473
	mov dx, 257
	int 10h
	
	mov cx, 474
	mov dx, 257
	int 10h
	
	mov cx, 497
	mov dx, 257
	int 10h
	
	mov cx, 505
	mov dx, 257
	int 10h
	
	mov cx, 510
	mov dx, 257
	int 10h
	
	mov cx, 513
	mov dx, 257
	int 10h
	
	mov cx, 514
	mov dx, 257
	int 10h
	
	mov cx, 522
	mov dx, 257
	int 10h
	
	mov cx, 533
	mov dx, 257
	int 10h
	
	mov cx, 537
	mov dx, 257
	int 10h
	
	mov cx, 546
	mov dx, 257
	int 10h
	
	mov cx, 3
	mov dx, 258
	int 10h
	
	mov cx, 10
	mov dx, 258
	int 10h
	
	mov cx, 26
	mov dx, 258
	int 10h
	
	mov cx, 29
	mov dx, 258
	int 10h
	
	mov cx, 33
	mov dx, 258
	int 10h
	
	mov cx, 38
	mov dx, 258
	int 10h
	
	mov cx, 41
	mov dx, 258
	int 10h
	
	mov cx, 46
	mov dx, 258
	int 10h
	
	mov cx, 57
	mov dx, 258
	int 10h
	
	mov cx, 62
	mov dx, 258
	int 10h
	
	mov cx, 65
	mov dx, 258
	int 10h
	
	mov cx, 66
	mov dx, 258
	int 10h
	
	mov cx, 67
	mov dx, 258
	int 10h
	
	mov cx, 68
	mov dx, 258
	int 10h
	
	mov cx, 69
	mov dx, 258
	int 10h
	
	mov cx, 70
	mov dx, 258
	int 10h
	
	mov cx, 73
	mov dx, 258
	int 10h
	
	mov cx, 74
	mov dx, 258
	int 10h
	
	mov cx, 75
	mov dx, 258
	int 10h
	
	mov cx, 76
	mov dx, 258
	int 10h
	
	mov cx, 77
	mov dx, 258
	int 10h
	
	mov cx, 78
	mov dx, 258
	int 10h
	
	mov cx, 81
	mov dx, 258
	int 10h
	
	mov cx, 86
	mov dx, 258
	int 10h
	
	mov cx, 98
	mov dx, 258
	int 10h
	
	mov cx, 105
	mov dx, 258
	int 10h
	
	mov cx, 110
	mov dx, 258
	int 10h
	
	mov cx, 121
	mov dx, 258
	int 10h
	
	mov cx, 126
	mov dx, 258
	int 10h
	
	mov cx, 131
	mov dx, 258
	int 10h
	
	mov cx, 132
	mov dx, 258
	int 10h
	
	mov cx, 137
	mov dx, 258
	int 10h
	
	mov cx, 138
	mov dx, 258
	int 10h
	
	mov cx, 139
	mov dx, 258
	int 10h
	
	mov cx, 140
	mov dx, 258
	int 10h
	
	mov cx, 141
	mov dx, 258
	int 10h
	
	mov cx, 142
	mov dx, 258
	int 10h
	
	mov cx, 157
	mov dx, 258
	int 10h
	
	mov cx, 162
	mov dx, 258
	int 10h
	
	mov cx, 163
	mov dx, 258
	int 10h
	
	mov cx, 164
	mov dx, 258
	int 10h
	
	mov cx, 165
	mov dx, 258
	int 10h
	
	mov cx, 170
	mov dx, 258
	int 10h
	
	mov cx, 177
	mov dx, 258
	int 10h
	
	mov cx, 178
	mov dx, 258
	int 10h
	
	mov cx, 179
	mov dx, 258
	int 10h
	
	mov cx, 180
	mov dx, 258
	int 10h
	
	mov cx, 181
	mov dx, 258
	int 10h
	
	mov cx, 182
	mov dx, 258
	int 10h
	
	mov cx, 192
	mov dx, 258
	int 10h
	
	mov cx, 194
	mov dx, 258
	int 10h
	
	mov cx, 196
	mov dx, 258
	int 10h
	
	mov cx, 198
	mov dx, 258
	int 10h
	
	mov cx, 201
	mov dx, 258
	int 10h
	
	mov cx, 206
	mov dx, 258
	int 10h
	
	mov cx, 209
	mov dx, 258
	int 10h
	
	mov cx, 214
	mov dx, 258
	int 10h
	
	mov cx, 217
	mov dx, 258
	int 10h
	
	mov cx, 218
	mov dx, 258
	int 10h
	
	mov cx, 219
	mov dx, 258
	int 10h
	
	mov cx, 220
	mov dx, 258
	int 10h
	
	mov cx, 221
	mov dx, 258
	int 10h
	
	mov cx, 222
	mov dx, 258
	int 10h
	
	mov cx, 234
	mov dx, 258
	int 10h
	
	mov cx, 241
	mov dx, 258
	int 10h
	
	mov cx, 246
	mov dx, 258
	int 10h
	
	mov cx, 257
	mov dx, 258
	int 10h
	
	mov cx, 265
	mov dx, 258
	int 10h
	
	mov cx, 266
	mov dx, 258
	int 10h
	
	mov cx, 267
	mov dx, 258
	int 10h
	
	mov cx, 268
	mov dx, 258
	int 10h
	
	mov cx, 269
	mov dx, 258
	int 10h
	
	mov cx, 270
	mov dx, 258
	int 10h
	
	mov cx, 272
	mov dx, 258
	int 10h
	
	mov cx, 275
	mov dx, 258
	int 10h
	
	mov cx, 278
	mov dx, 258
	int 10h
	
	mov cx, 281
	mov dx, 258
	int 10h
	
	mov cx, 286
	mov dx, 258
	int 10h
	
	mov cx, 289
	mov dx, 258
	int 10h
	
	mov cx, 293
	mov dx, 258
	int 10h
	
	mov cx, 297
	mov dx, 258
	int 10h
	
	mov cx, 298
	mov dx, 258
	int 10h
	
	mov cx, 299
	mov dx, 258
	int 10h
	
	mov cx, 300
	mov dx, 258
	int 10h
	
	mov cx, 301
	mov dx, 258
	int 10h
	
	mov cx, 302
	mov dx, 258
	int 10h
	
	mov cx, 313
	mov dx, 258
	int 10h
	
	mov cx, 318
	mov dx, 258
	int 10h
	
	mov cx, 321
	mov dx, 258
	int 10h
	
	mov cx, 337
	mov dx, 258
	int 10h
	
	mov cx, 342
	mov dx, 258
	int 10h
	
	mov cx, 348
	mov dx, 258
	int 10h
	
	mov cx, 355
	mov dx, 258
	int 10h
	
	mov cx, 356
	mov dx, 258
	int 10h
	
	mov cx, 362
	mov dx, 258
	int 10h
	
	mov cx, 363
	mov dx, 258
	int 10h
	
	mov cx, 364
	mov dx, 258
	int 10h
	
	mov cx, 365
	mov dx, 258
	int 10h
	
	mov cx, 369
	mov dx, 258
	int 10h
	
	mov cx, 374
	mov dx, 258
	int 10h
	
	mov cx, 380
	mov dx, 258
	int 10h
	
	mov cx, 385
	mov dx, 258
	int 10h
	
	mov cx, 386
	mov dx, 258
	int 10h
	
	mov cx, 387
	mov dx, 258
	int 10h
	
	mov cx, 388
	mov dx, 258
	int 10h
	
	mov cx, 389
	mov dx, 258
	int 10h
	
	mov cx, 390
	mov dx, 258
	int 10h
	
	mov cx, 401
	mov dx, 258
	int 10h
	
	mov cx, 409
	mov dx, 258
	int 10h
	
	mov cx, 414
	mov dx, 258
	int 10h
	
	mov cx, 416
	mov dx, 258
	int 10h
	
	mov cx, 419
	mov dx, 258
	int 10h
	
	mov cx, 422
	mov dx, 258
	int 10h
	
	mov cx, 425
	mov dx, 258
	int 10h
	
	mov cx, 430
	mov dx, 258
	int 10h
	
	mov cx, 433
	mov dx, 258
	int 10h
	
	mov cx, 438
	mov dx, 258
	int 10h
	
	mov cx, 441
	mov dx, 258
	int 10h
	
	mov cx, 446
	mov dx, 258
	int 10h
	
	mov cx, 449
	mov dx, 258
	int 10h
	
	mov cx, 450
	mov dx, 258
	int 10h
	
	mov cx, 451
	mov dx, 258
	int 10h
	
	mov cx, 452
	mov dx, 258
	int 10h
	
	mov cx, 453
	mov dx, 258
	int 10h
	
	mov cx, 454
	mov dx, 258
	int 10h
	
	mov cx, 457
	mov dx, 258
	int 10h
	
	mov cx, 462
	mov dx, 258
	int 10h
	
	mov cx, 466
	mov dx, 258
	int 10h
	
	mov cx, 475
	mov dx, 258
	int 10h
	
	mov cx, 476
	mov dx, 258
	int 10h
	
	mov cx, 497
	mov dx, 258
	int 10h
	
	mov cx, 505
	mov dx, 258
	int 10h
	
	mov cx, 506
	mov dx, 258
	int 10h
	
	mov cx, 507
	mov dx, 258
	int 10h
	
	mov cx, 508
	mov dx, 258
	int 10h
	
	mov cx, 509
	mov dx, 258
	int 10h
	
	mov cx, 510
	mov dx, 258
	int 10h
	
	mov cx, 515
	mov dx, 258
	int 10h
	
	mov cx, 516
	mov dx, 258
	int 10h
	
	mov cx, 522
	mov dx, 258
	int 10h
	
	mov cx, 530
	mov dx, 258
	int 10h
	
	mov cx, 531
	mov dx, 258
	int 10h
	
	mov cx, 532
	mov dx, 258
	int 10h
	
	mov cx, 533
	mov dx, 258
	int 10h
	
	mov cx, 537
	mov dx, 258
	int 10h
	
	mov cx, 546
	mov dx, 258
	int 10h
	
	mov cx, 3
	mov dx, 259
	int 10h
	
	mov cx, 10
	mov dx, 259
	int 10h
	
	mov cx, 26
	mov dx, 259
	int 10h
	
	mov cx, 29
	mov dx, 259
	int 10h
	
	mov cx, 33
	mov dx, 259
	int 10h
	
	mov cx, 38
	mov dx, 259
	int 10h
	
	mov cx, 41
	mov dx, 259
	int 10h
	
	mov cx, 46
	mov dx, 259
	int 10h
	
	mov cx, 57
	mov dx, 259
	int 10h
	
	mov cx, 62
	mov dx, 259
	int 10h
	
	mov cx, 65
	mov dx, 259
	int 10h
	
	mov cx, 73
	mov dx, 259
	int 10h
	
	mov cx, 81
	mov dx, 259
	int 10h
	
	mov cx, 86
	mov dx, 259
	int 10h
	
	mov cx, 98
	mov dx, 259
	int 10h
	
	mov cx, 105
	mov dx, 259
	int 10h
	
	mov cx, 110
	mov dx, 259
	int 10h
	
	mov cx, 121
	mov dx, 259
	int 10h
	
	mov cx, 126
	mov dx, 259
	int 10h
	
	mov cx, 133
	mov dx, 259
	int 10h
	
	mov cx, 137
	mov dx, 259
	int 10h
	
	mov cx, 158
	mov dx, 259
	int 10h
	
	mov cx, 161
	mov dx, 259
	int 10h
	
	mov cx, 165
	mov dx, 259
	int 10h
	
	mov cx, 170
	mov dx, 259
	int 10h
	
	mov cx, 177
	mov dx, 259
	int 10h
	
	mov cx, 192
	mov dx, 259
	int 10h
	
	mov cx, 195
	mov dx, 259
	int 10h
	
	mov cx, 198
	mov dx, 259
	int 10h
	
	mov cx, 201
	mov dx, 259
	int 10h
	
	mov cx, 206
	mov dx, 259
	int 10h
	
	mov cx, 209
	mov dx, 259
	int 10h
	
	mov cx, 214
	mov dx, 259
	int 10h
	
	mov cx, 217
	mov dx, 259
	int 10h
	
	mov cx, 234
	mov dx, 259
	int 10h
	
	mov cx, 241
	mov dx, 259
	int 10h
	
	mov cx, 246
	mov dx, 259
	int 10h
	
	mov cx, 257
	mov dx, 259
	int 10h
	
	mov cx, 265
	mov dx, 259
	int 10h
	
	mov cx, 272
	mov dx, 259
	int 10h
	
	mov cx, 275
	mov dx, 259
	int 10h
	
	mov cx, 278
	mov dx, 259
	int 10h
	
	mov cx, 281
	mov dx, 259
	int 10h
	
	mov cx, 286
	mov dx, 259
	int 10h
	
	mov cx, 290
	mov dx, 259
	int 10h
	
	mov cx, 292
	mov dx, 259
	int 10h
	
	mov cx, 297
	mov dx, 259
	int 10h
	
	mov cx, 313
	mov dx, 259
	int 10h
	
	mov cx, 318
	mov dx, 259
	int 10h
	
	mov cx, 321
	mov dx, 259
	int 10h
	
	mov cx, 337
	mov dx, 259
	int 10h
	
	mov cx, 342
	mov dx, 259
	int 10h
	
	mov cx, 348
	mov dx, 259
	int 10h
	
	mov cx, 357
	mov dx, 259
	int 10h
	
	mov cx, 361
	mov dx, 259
	int 10h
	
	mov cx, 365
	mov dx, 259
	int 10h
	
	mov cx, 369
	mov dx, 259
	int 10h
	
	mov cx, 374
	mov dx, 259
	int 10h
	
	mov cx, 380
	mov dx, 259
	int 10h
	
	mov cx, 385
	mov dx, 259
	int 10h
	
	mov cx, 401
	mov dx, 259
	int 10h
	
	mov cx, 409
	mov dx, 259
	int 10h
	
	mov cx, 414
	mov dx, 259
	int 10h
	
	mov cx, 416
	mov dx, 259
	int 10h
	
	mov cx, 419
	mov dx, 259
	int 10h
	
	mov cx, 422
	mov dx, 259
	int 10h
	
	mov cx, 425
	mov dx, 259
	int 10h
	
	mov cx, 430
	mov dx, 259
	int 10h
	
	mov cx, 433
	mov dx, 259
	int 10h
	
	mov cx, 438
	mov dx, 259
	int 10h
	
	mov cx, 441
	mov dx, 259
	int 10h
	
	mov cx, 446
	mov dx, 259
	int 10h
	
	mov cx, 449
	mov dx, 259
	int 10h
	
	mov cx, 457
	mov dx, 259
	int 10h
	
	mov cx, 462
	mov dx, 259
	int 10h
	
	mov cx, 466
	mov dx, 259
	int 10h
	
	mov cx, 477
	mov dx, 259
	int 10h
	
	mov cx, 497
	mov dx, 259
	int 10h
	
	mov cx, 505
	mov dx, 259
	int 10h
	
	mov cx, 517
	mov dx, 259
	int 10h
	
	mov cx, 522
	mov dx, 259
	int 10h
	
	mov cx, 529
	mov dx, 259
	int 10h
	
	mov cx, 533
	mov dx, 259
	int 10h
	
	mov cx, 537
	mov dx, 259
	int 10h
	
	mov cx, 546
	mov dx, 259
	int 10h
	
	mov cx, 3
	mov dx, 260
	int 10h
	
	mov cx, 10
	mov dx, 260
	int 10h
	
	mov cx, 27
	mov dx, 260
	int 10h
	
	mov cx, 28
	mov dx, 260
	int 10h
	
	mov cx, 33
	mov dx, 260
	int 10h
	
	mov cx, 38
	mov dx, 260
	int 10h
	
	mov cx, 41
	mov dx, 260
	int 10h
	
	mov cx, 45
	mov dx, 260
	int 10h
	
	mov cx, 46
	mov dx, 260
	int 10h
	
	mov cx, 57
	mov dx, 260
	int 10h
	
	mov cx, 62
	mov dx, 260
	int 10h
	
	mov cx, 65
	mov dx, 260
	int 10h
	
	mov cx, 73
	mov dx, 260
	int 10h
	
	mov cx, 81
	mov dx, 260
	int 10h
	
	mov cx, 85
	mov dx, 260
	int 10h
	
	mov cx, 86
	mov dx, 260
	int 10h
	
	mov cx, 98
	mov dx, 260
	int 10h
	
	mov cx, 105
	mov dx, 260
	int 10h
	
	mov cx, 110
	mov dx, 260
	int 10h
	
	mov cx, 121
	mov dx, 260
	int 10h
	
	mov cx, 125
	mov dx, 260
	int 10h
	
	mov cx, 126
	mov dx, 260
	int 10h
	
	mov cx, 133
	mov dx, 260
	int 10h
	
	mov cx, 137
	mov dx, 260
	int 10h
	
	mov cx, 158
	mov dx, 260
	int 10h
	
	mov cx, 161
	mov dx, 260
	int 10h
	
	mov cx, 165
	mov dx, 260
	int 10h
	
	mov cx, 170
	mov dx, 260
	int 10h
	
	mov cx, 177
	mov dx, 260
	int 10h
	
	mov cx, 192
	mov dx, 260
	int 10h
	
	mov cx, 198
	mov dx, 260
	int 10h
	
	mov cx, 201
	mov dx, 260
	int 10h
	
	mov cx, 206
	mov dx, 260
	int 10h
	
	mov cx, 209
	mov dx, 260
	int 10h
	
	mov cx, 213
	mov dx, 260
	int 10h
	
	mov cx, 214
	mov dx, 260
	int 10h
	
	mov cx, 217
	mov dx, 260
	int 10h
	
	mov cx, 234
	mov dx, 260
	int 10h
	
	mov cx, 241
	mov dx, 260
	int 10h
	
	mov cx, 246
	mov dx, 260
	int 10h
	
	mov cx, 257
	mov dx, 260
	int 10h
	
	mov cx, 265
	mov dx, 260
	int 10h
	
	mov cx, 272
	mov dx, 260
	int 10h
	
	mov cx, 275
	mov dx, 260
	int 10h
	
	mov cx, 278
	mov dx, 260
	int 10h
	
	mov cx, 281
	mov dx, 260
	int 10h
	
	mov cx, 286
	mov dx, 260
	int 10h
	
	mov cx, 290
	mov dx, 260
	int 10h
	
	mov cx, 292
	mov dx, 260
	int 10h
	
	mov cx, 297
	mov dx, 260
	int 10h
	
	mov cx, 313
	mov dx, 260
	int 10h
	
	mov cx, 318
	mov dx, 260
	int 10h
	
	mov cx, 321
	mov dx, 260
	int 10h
	
	mov cx, 337
	mov dx, 260
	int 10h
	
	mov cx, 341
	mov dx, 260
	int 10h
	
	mov cx, 342
	mov dx, 260
	int 10h
	
	mov cx, 348
	mov dx, 260
	int 10h
	
	mov cx, 357
	mov dx, 260
	int 10h
	
	mov cx, 361
	mov dx, 260
	int 10h
	
	mov cx, 365
	mov dx, 260
	int 10h
	
	mov cx, 369
	mov dx, 260
	int 10h
	
	mov cx, 370
	mov dx, 260
	int 10h
	
	mov cx, 374
	mov dx, 260
	int 10h
	
	mov cx, 380
	mov dx, 260
	int 10h
	
	mov cx, 385
	mov dx, 260
	int 10h
	
	mov cx, 402
	mov dx, 260
	int 10h
	
	mov cx, 409
	mov dx, 260
	int 10h
	
	mov cx, 414
	mov dx, 260
	int 10h
	
	mov cx, 416
	mov dx, 260
	int 10h
	
	mov cx, 419
	mov dx, 260
	int 10h
	
	mov cx, 422
	mov dx, 260
	int 10h
	
	mov cx, 425
	mov dx, 260
	int 10h
	
	mov cx, 426
	mov dx, 260
	int 10h
	
	mov cx, 430
	mov dx, 260
	int 10h
	
	mov cx, 433
	mov dx, 260
	int 10h
	
	mov cx, 438
	mov dx, 260
	int 10h
	
	mov cx, 441
	mov dx, 260
	int 10h
	
	mov cx, 446
	mov dx, 260
	int 10h
	
	mov cx, 449
	mov dx, 260
	int 10h
	
	mov cx, 457
	mov dx, 260
	int 10h
	
	mov cx, 462
	mov dx, 260
	int 10h
	
	mov cx, 466
	mov dx, 260
	int 10h
	
	mov cx, 477
	mov dx, 260
	int 10h
	
	mov cx, 482
	mov dx, 260
	int 10h
	
	mov cx, 483
	mov dx, 260
	int 10h
	
	mov cx, 497
	mov dx, 260
	int 10h
	
	mov cx, 505
	mov dx, 260
	int 10h
	
	mov cx, 517
	mov dx, 260
	int 10h
	
	mov cx, 522
	mov dx, 260
	int 10h
	
	mov cx, 529
	mov dx, 260
	int 10h
	
	mov cx, 533
	mov dx, 260
	int 10h
	
	mov cx, 537
	mov dx, 260
	int 10h
	
	mov cx, 546
	mov dx, 260
	int 10h
	
	mov cx, 1
	mov dx, 261
	int 10h
	
	mov cx, 2
	mov dx, 261
	int 10h
	
	mov cx, 3
	mov dx, 261
	int 10h
	
	mov cx, 4
	mov dx, 261
	int 10h
	
	mov cx, 5
	mov dx, 261
	int 10h
	
	mov cx, 10
	mov dx, 261
	int 10h
	
	mov cx, 27
	mov dx, 261
	int 10h
	
	mov cx, 28
	mov dx, 261
	int 10h
	
	mov cx, 34
	mov dx, 261
	int 10h
	
	mov cx, 35
	mov dx, 261
	int 10h
	
	mov cx, 36
	mov dx, 261
	int 10h
	
	mov cx, 37
	mov dx, 261
	int 10h
	
	mov cx, 42
	mov dx, 261
	int 10h
	
	mov cx, 43
	mov dx, 261
	int 10h
	
	mov cx, 44
	mov dx, 261
	int 10h
	
	mov cx, 46
	mov dx, 261
	int 10h
	
	mov cx, 57
	mov dx, 261
	int 10h
	
	mov cx, 62
	mov dx, 261
	int 10h
	
	mov cx, 66
	mov dx, 261
	int 10h
	
	mov cx, 67
	mov dx, 261
	int 10h
	
	mov cx, 68
	mov dx, 261
	int 10h
	
	mov cx, 69
	mov dx, 261
	int 10h
	
	mov cx, 70
	mov dx, 261
	int 10h
	
	mov cx, 74
	mov dx, 261
	int 10h
	
	mov cx, 75
	mov dx, 261
	int 10h
	
	mov cx, 76
	mov dx, 261
	int 10h
	
	mov cx, 77
	mov dx, 261
	int 10h
	
	mov cx, 78
	mov dx, 261
	int 10h
	
	mov cx, 82
	mov dx, 261
	int 10h
	
	mov cx, 83
	mov dx, 261
	int 10h
	
	mov cx, 84
	mov dx, 261
	int 10h
	
	mov cx, 86
	mov dx, 261
	int 10h
	
	mov cx, 99
	mov dx, 261
	int 10h
	
	mov cx, 100
	mov dx, 261
	int 10h
	
	mov cx, 101
	mov dx, 261
	int 10h
	
	mov cx, 106
	mov dx, 261
	int 10h
	
	mov cx, 107
	mov dx, 261
	int 10h
	
	mov cx, 108
	mov dx, 261
	int 10h
	
	mov cx, 109
	mov dx, 261
	int 10h
	
	mov cx, 122
	mov dx, 261
	int 10h
	
	mov cx, 123
	mov dx, 261
	int 10h
	
	mov cx, 124
	mov dx, 261
	int 10h
	
	mov cx, 126
	mov dx, 261
	int 10h
	
	mov cx, 129
	mov dx, 261
	int 10h
	
	mov cx, 130
	mov dx, 261
	int 10h
	
	mov cx, 131
	mov dx, 261
	int 10h
	
	mov cx, 132
	mov dx, 261
	int 10h
	
	mov cx, 138
	mov dx, 261
	int 10h
	
	mov cx, 139
	mov dx, 261
	int 10h
	
	mov cx, 140
	mov dx, 261
	int 10h
	
	mov cx, 141
	mov dx, 261
	int 10h
	
	mov cx, 142
	mov dx, 261
	int 10h
	
	mov cx, 153
	mov dx, 261
	int 10h
	
	mov cx, 154
	mov dx, 261
	int 10h
	
	mov cx, 155
	mov dx, 261
	int 10h
	
	mov cx, 156
	mov dx, 261
	int 10h
	
	mov cx, 157
	mov dx, 261
	int 10h
	
	mov cx, 162
	mov dx, 261
	int 10h
	
	mov cx, 163
	mov dx, 261
	int 10h
	
	mov cx, 164
	mov dx, 261
	int 10h
	
	mov cx, 165
	mov dx, 261
	int 10h
	
	mov cx, 166
	mov dx, 261
	int 10h
	
	mov cx, 170
	mov dx, 261
	int 10h
	
	mov cx, 178
	mov dx, 261
	int 10h
	
	mov cx, 179
	mov dx, 261
	int 10h
	
	mov cx, 180
	mov dx, 261
	int 10h
	
	mov cx, 181
	mov dx, 261
	int 10h
	
	mov cx, 182
	mov dx, 261
	int 10h
	
	mov cx, 192
	mov dx, 261
	int 10h
	
	mov cx, 198
	mov dx, 261
	int 10h
	
	mov cx, 202
	mov dx, 261
	int 10h
	
	mov cx, 203
	mov dx, 261
	int 10h
	
	mov cx, 204
	mov dx, 261
	int 10h
	
	mov cx, 205
	mov dx, 261
	int 10h
	
	mov cx, 210
	mov dx, 261
	int 10h
	
	mov cx, 211
	mov dx, 261
	int 10h
	
	mov cx, 212
	mov dx, 261
	int 10h
	
	mov cx, 214
	mov dx, 261
	int 10h
	
	mov cx, 218
	mov dx, 261
	int 10h
	
	mov cx, 219
	mov dx, 261
	int 10h
	
	mov cx, 220
	mov dx, 261
	int 10h
	
	mov cx, 221
	mov dx, 261
	int 10h
	
	mov cx, 222
	mov dx, 261
	int 10h
	
	mov cx, 235
	mov dx, 261
	int 10h
	
	mov cx, 236
	mov dx, 261
	int 10h
	
	mov cx, 237
	mov dx, 261
	int 10h
	
	mov cx, 242
	mov dx, 261
	int 10h
	
	mov cx, 243
	mov dx, 261
	int 10h
	
	mov cx, 244
	mov dx, 261
	int 10h
	
	mov cx, 245
	mov dx, 261
	int 10h
	
	mov cx, 257
	mov dx, 261
	int 10h
	
	mov cx, 266
	mov dx, 261
	int 10h
	
	mov cx, 267
	mov dx, 261
	int 10h
	
	mov cx, 268
	mov dx, 261
	int 10h
	
	mov cx, 269
	mov dx, 261
	int 10h
	
	mov cx, 270
	mov dx, 261
	int 10h
	
	mov cx, 272
	mov dx, 261
	int 10h
	
	mov cx, 275
	mov dx, 261
	int 10h
	
	mov cx, 278
	mov dx, 261
	int 10h
	
	mov cx, 282
	mov dx, 261
	int 10h
	
	mov cx, 283
	mov dx, 261
	int 10h
	
	mov cx, 284
	mov dx, 261
	int 10h
	
	mov cx, 285
	mov dx, 261
	int 10h
	
	mov cx, 291
	mov dx, 261
	int 10h
	
	mov cx, 298
	mov dx, 261
	int 10h
	
	mov cx, 299
	mov dx, 261
	int 10h
	
	mov cx, 300
	mov dx, 261
	int 10h
	
	mov cx, 301
	mov dx, 261
	int 10h
	
	mov cx, 302
	mov dx, 261
	int 10h
	
	mov cx, 314
	mov dx, 261
	int 10h
	
	mov cx, 315
	mov dx, 261
	int 10h
	
	mov cx, 316
	mov dx, 261
	int 10h
	
	mov cx, 317
	mov dx, 261
	int 10h
	
	mov cx, 321
	mov dx, 261
	int 10h
	
	mov cx, 338
	mov dx, 261
	int 10h
	
	mov cx, 339
	mov dx, 261
	int 10h
	
	mov cx, 340
	mov dx, 261
	int 10h
	
	mov cx, 342
	mov dx, 261
	int 10h
	
	mov cx, 348
	mov dx, 261
	int 10h
	
	mov cx, 353
	mov dx, 261
	int 10h
	
	mov cx, 354
	mov dx, 261
	int 10h
	
	mov cx, 355
	mov dx, 261
	int 10h
	
	mov cx, 356
	mov dx, 261
	int 10h
	
	mov cx, 362
	mov dx, 261
	int 10h
	
	mov cx, 363
	mov dx, 261
	int 10h
	
	mov cx, 364
	mov dx, 261
	int 10h
	
	mov cx, 365
	mov dx, 261
	int 10h
	
	mov cx, 366
	mov dx, 261
	int 10h
	
	mov cx, 369
	mov dx, 261
	int 10h
	
	mov cx, 371
	mov dx, 261
	int 10h
	
	mov cx, 372
	mov dx, 261
	int 10h
	
	mov cx, 373
	mov dx, 261
	int 10h
	
	mov cx, 380
	mov dx, 261
	int 10h
	
	mov cx, 386
	mov dx, 261
	int 10h
	
	mov cx, 387
	mov dx, 261
	int 10h
	
	mov cx, 388
	mov dx, 261
	int 10h
	
	mov cx, 389
	mov dx, 261
	int 10h
	
	mov cx, 390
	mov dx, 261
	int 10h
	
	mov cx, 403
	mov dx, 261
	int 10h
	
	mov cx, 404
	mov dx, 261
	int 10h
	
	mov cx, 405
	mov dx, 261
	int 10h
	
	mov cx, 406
	mov dx, 261
	int 10h
	
	mov cx, 410
	mov dx, 261
	int 10h
	
	mov cx, 411
	mov dx, 261
	int 10h
	
	mov cx, 412
	mov dx, 261
	int 10h
	
	mov cx, 413
	mov dx, 261
	int 10h
	
	mov cx, 416
	mov dx, 261
	int 10h
	
	mov cx, 419
	mov dx, 261
	int 10h
	
	mov cx, 422
	mov dx, 261
	int 10h
	
	mov cx, 425
	mov dx, 261
	int 10h
	
	mov cx, 427
	mov dx, 261
	int 10h
	
	mov cx, 428
	mov dx, 261
	int 10h
	
	mov cx, 429
	mov dx, 261
	int 10h
	
	mov cx, 434
	mov dx, 261
	int 10h
	
	mov cx, 435
	mov dx, 261
	int 10h
	
	mov cx, 436
	mov dx, 261
	int 10h
	
	mov cx, 437
	mov dx, 261
	int 10h
	
	mov cx, 441
	mov dx, 261
	int 10h
	
	mov cx, 446
	mov dx, 261
	int 10h
	
	mov cx, 450
	mov dx, 261
	int 10h
	
	mov cx, 451
	mov dx, 261
	int 10h
	
	mov cx, 452
	mov dx, 261
	int 10h
	
	mov cx, 453
	mov dx, 261
	int 10h
	
	mov cx, 454
	mov dx, 261
	int 10h
	
	mov cx, 457
	mov dx, 261
	int 10h
	
	mov cx, 462
	mov dx, 261
	int 10h
	
	mov cx, 467
	mov dx, 261
	int 10h
	
	mov cx, 468
	mov dx, 261
	int 10h
	
	mov cx, 469
	mov dx, 261
	int 10h
	
	mov cx, 473
	mov dx, 261
	int 10h
	
	mov cx, 474
	mov dx, 261
	int 10h
	
	mov cx, 475
	mov dx, 261
	int 10h
	
	mov cx, 476
	mov dx, 261
	int 10h
	
	mov cx, 482
	mov dx, 261
	int 10h
	
	mov cx, 483
	mov dx, 261
	int 10h
	
	mov cx, 497
	mov dx, 261
	int 10h
	
	mov cx, 506
	mov dx, 261
	int 10h
	
	mov cx, 507
	mov dx, 261
	int 10h
	
	mov cx, 508
	mov dx, 261
	int 10h
	
	mov cx, 509
	mov dx, 261
	int 10h
	
	mov cx, 510
	mov dx, 261
	int 10h
	
	mov cx, 513
	mov dx, 261
	int 10h
	
	mov cx, 514
	mov dx, 261
	int 10h
	
	mov cx, 515
	mov dx, 261
	int 10h
	
	mov cx, 516
	mov dx, 261
	int 10h
	
	mov cx, 523
	mov dx, 261
	int 10h
	
	mov cx, 524
	mov dx, 261
	int 10h
	
	mov cx, 525
	mov dx, 261
	int 10h
	
	mov cx, 530
	mov dx, 261
	int 10h
	
	mov cx, 531
	mov dx, 261
	int 10h
	
	mov cx, 532
	mov dx, 261
	int 10h
	
	mov cx, 533
	mov dx, 261
	int 10h
	
	mov cx, 534
	mov dx, 261
	int 10h
	
	mov cx, 537
	mov dx, 261
	int 10h
	
	mov cx, 547
	mov dx, 261
	int 10h
	
	mov cx, 548
	mov dx, 261
	int 10h
	
	mov cx, 549
	mov dx, 261
	int 10h
	
	mov cx, 27
	mov dx, 262
	int 10h
	
	mov cx, 425
	mov dx, 262
	int 10h
	
	mov cx, 483
	mov dx, 262
	int 10h
	
	mov cx, 26
	mov dx, 263
	int 10h
	
	mov cx, 27
	mov dx, 263
	int 10h
	
	mov cx, 425
	mov dx, 263
	int 10h
	
	mov cx, 482
	mov dx, 263
	int 10h
	
	mov cx, 24
	mov dx, 264
	int 10h
	
	mov cx, 25
	mov dx, 264
	int 10h
	
	mov cx, 26
	mov dx, 264
	int 10h
	
	mov cx, 425
	mov dx, 264
	int 10h
	
	mov cx, 233
	mov dx, 266
	int 10h
	
	mov cx, 234
	mov dx, 266
	int 10h
	
	mov cx, 235
	mov dx, 266
	int 10h
	
	mov cx, 236
	mov dx, 266
	int 10h
	
	mov cx, 286
	mov dx, 266
	int 10h
	
	mov cx, 334
	mov dx, 266
	int 10h
	
	mov cx, 435
	mov dx, 266
	int 10h
	
	mov cx, 436
	mov dx, 266
	int 10h
	
	mov cx, 502
	mov dx, 266
	int 10h
	
	mov cx, 521
	mov dx, 266
	int 10h
	
	mov cx, 178
	mov dx, 267
	int 10h
	
	mov cx, 179
	mov dx, 267
	int 10h
	
	mov cx, 180
	mov dx, 267
	int 10h
	
	mov cx, 181
	mov dx, 267
	int 10h
	
	mov cx, 236
	mov dx, 267
	int 10h
	
	mov cx, 286
	mov dx, 267
	int 10h
	
	mov cx, 334
	mov dx, 267
	int 10h
	
	mov cx, 435
	mov dx, 267
	int 10h
	
	mov cx, 436
	mov dx, 267
	int 10h
	
	mov cx, 502
	mov dx, 267
	int 10h
	
	mov cx, 521
	mov dx, 267
	int 10h
	
	mov cx, 82
	mov dx, 268
	int 10h
	
	mov cx, 169
	mov dx, 268
	int 10h
	
	mov cx, 170
	mov dx, 268
	int 10h
	
	mov cx, 171
	mov dx, 268
	int 10h
	
	mov cx, 172
	mov dx, 268
	int 10h
	
	mov cx, 173
	mov dx, 268
	int 10h
	
	mov cx, 174
	mov dx, 268
	int 10h
	
	mov cx, 177
	mov dx, 268
	int 10h
	
	mov cx, 182
	mov dx, 268
	int 10h
	
	mov cx, 194
	mov dx, 268
	int 10h
	
	mov cx, 236
	mov dx, 268
	int 10h
	
	mov cx, 258
	mov dx, 268
	int 10h
	
	mov cx, 275
	mov dx, 268
	int 10h
	
	mov cx, 276
	mov dx, 268
	int 10h
	
	mov cx, 286
	mov dx, 268
	int 10h
	
	mov cx, 334
	mov dx, 268
	int 10h
	
	mov cx, 346
	mov dx, 268
	int 10h
	
	mov cx, 347
	mov dx, 268
	int 10h
	
	mov cx, 348
	mov dx, 268
	int 10h
	
	mov cx, 349
	mov dx, 268
	int 10h
	
	mov cx, 350
	mov dx, 268
	int 10h
	
	mov cx, 354
	mov dx, 268
	int 10h
	
	mov cx, 378
	mov dx, 268
	int 10h
	
	mov cx, 410
	mov dx, 268
	int 10h
	
	mov cx, 411
	mov dx, 268
	int 10h
	
	mov cx, 412
	mov dx, 268
	int 10h
	
	mov cx, 426
	mov dx, 268
	int 10h
	
	mov cx, 502
	mov dx, 268
	int 10h
	
	mov cx, 514
	mov dx, 268
	int 10h
	
	mov cx, 521
	mov dx, 268
	int 10h
	
	mov cx, 0
	mov dx, 269
	int 10h
	
	mov cx, 7
	mov dx, 269
	int 10h
	
	mov cx, 10
	mov dx, 269
	int 10h
	
	mov cx, 11
	mov dx, 269
	int 10h
	
	mov cx, 12
	mov dx, 269
	int 10h
	
	mov cx, 13
	mov dx, 269
	int 10h
	
	mov cx, 17
	mov dx, 269
	int 10h
	
	mov cx, 22
	mov dx, 269
	int 10h
	
	mov cx, 25
	mov dx, 269
	int 10h
	
	mov cx, 27
	mov dx, 269
	int 10h
	
	mov cx, 28
	mov dx, 269
	int 10h
	
	mov cx, 29
	mov dx, 269
	int 10h
	
	mov cx, 43
	mov dx, 269
	int 10h
	
	mov cx, 44
	mov dx, 269
	int 10h
	
	mov cx, 45
	mov dx, 269
	int 10h
	
	mov cx, 46
	mov dx, 269
	int 10h
	
	mov cx, 50
	mov dx, 269
	int 10h
	
	mov cx, 51
	mov dx, 269
	int 10h
	
	mov cx, 52
	mov dx, 269
	int 10h
	
	mov cx, 53
	mov dx, 269
	int 10h
	
	mov cx, 56
	mov dx, 269
	int 10h
	
	mov cx, 58
	mov dx, 269
	int 10h
	
	mov cx, 59
	mov dx, 269
	int 10h
	
	mov cx, 61
	mov dx, 269
	int 10h
	
	mov cx, 62
	mov dx, 269
	int 10h
	
	mov cx, 65
	mov dx, 269
	int 10h
	
	mov cx, 67
	mov dx, 269
	int 10h
	
	mov cx, 68
	mov dx, 269
	int 10h
	
	mov cx, 69
	mov dx, 269
	int 10h
	
	mov cx, 73
	mov dx, 269
	int 10h
	
	mov cx, 78
	mov dx, 269
	int 10h
	
	mov cx, 80
	mov dx, 269
	int 10h
	
	mov cx, 81
	mov dx, 269
	int 10h
	
	mov cx, 82
	mov dx, 269
	int 10h
	
	mov cx, 83
	mov dx, 269
	int 10h
	
	mov cx, 84
	mov dx, 269
	int 10h
	
	mov cx, 85
	mov dx, 269
	int 10h
	
	mov cx, 90
	mov dx, 269
	int 10h
	
	mov cx, 91
	mov dx, 269
	int 10h
	
	mov cx, 92
	mov dx, 269
	int 10h
	
	mov cx, 93
	mov dx, 269
	int 10h
	
	mov cx, 97
	mov dx, 269
	int 10h
	
	mov cx, 99
	mov dx, 269
	int 10h
	
	mov cx, 100
	mov dx, 269
	int 10h
	
	mov cx, 101
	mov dx, 269
	int 10h
	
	mov cx, 121
	mov dx, 269
	int 10h
	
	mov cx, 123
	mov dx, 269
	int 10h
	
	mov cx, 124
	mov dx, 269
	int 10h
	
	mov cx, 125
	mov dx, 269
	int 10h
	
	mov cx, 129
	mov dx, 269
	int 10h
	
	mov cx, 131
	mov dx, 269
	int 10h
	
	mov cx, 132
	mov dx, 269
	int 10h
	
	mov cx, 133
	mov dx, 269
	int 10h
	
	mov cx, 138
	mov dx, 269
	int 10h
	
	mov cx, 139
	mov dx, 269
	int 10h
	
	mov cx, 140
	mov dx, 269
	int 10h
	
	mov cx, 141
	mov dx, 269
	int 10h
	
	mov cx, 146
	mov dx, 269
	int 10h
	
	mov cx, 147
	mov dx, 269
	int 10h
	
	mov cx, 148
	mov dx, 269
	int 10h
	
	mov cx, 149
	mov dx, 269
	int 10h
	
	mov cx, 154
	mov dx, 269
	int 10h
	
	mov cx, 155
	mov dx, 269
	int 10h
	
	mov cx, 156
	mov dx, 269
	int 10h
	
	mov cx, 157
	mov dx, 269
	int 10h
	
	mov cx, 169
	mov dx, 269
	int 10h
	
	mov cx, 177
	mov dx, 269
	int 10h
	
	mov cx, 182
	mov dx, 269
	int 10h
	
	mov cx, 192
	mov dx, 269
	int 10h
	
	mov cx, 193
	mov dx, 269
	int 10h
	
	mov cx, 194
	mov dx, 269
	int 10h
	
	mov cx, 195
	mov dx, 269
	int 10h
	
	mov cx, 196
	mov dx, 269
	int 10h
	
	mov cx, 197
	mov dx, 269
	int 10h
	
	mov cx, 202
	mov dx, 269
	int 10h
	
	mov cx, 203
	mov dx, 269
	int 10h
	
	mov cx, 204
	mov dx, 269
	int 10h
	
	mov cx, 205
	mov dx, 269
	int 10h
	
	mov cx, 218
	mov dx, 269
	int 10h
	
	mov cx, 219
	mov dx, 269
	int 10h
	
	mov cx, 220
	mov dx, 269
	int 10h
	
	mov cx, 221
	mov dx, 269
	int 10h
	
	mov cx, 226
	mov dx, 269
	int 10h
	
	mov cx, 227
	mov dx, 269
	int 10h
	
	mov cx, 228
	mov dx, 269
	int 10h
	
	mov cx, 229
	mov dx, 269
	int 10h
	
	mov cx, 236
	mov dx, 269
	int 10h
	
	mov cx, 242
	mov dx, 269
	int 10h
	
	mov cx, 243
	mov dx, 269
	int 10h
	
	mov cx, 244
	mov dx, 269
	int 10h
	
	mov cx, 245
	mov dx, 269
	int 10h
	
	mov cx, 251
	mov dx, 269
	int 10h
	
	mov cx, 252
	mov dx, 269
	int 10h
	
	mov cx, 253
	mov dx, 269
	int 10h
	
	mov cx, 254
	mov dx, 269
	int 10h
	
	mov cx, 256
	mov dx, 269
	int 10h
	
	mov cx, 257
	mov dx, 269
	int 10h
	
	mov cx, 258
	mov dx, 269
	int 10h
	
	mov cx, 259
	mov dx, 269
	int 10h
	
	mov cx, 260
	mov dx, 269
	int 10h
	
	mov cx, 261
	mov dx, 269
	int 10h
	
	mov cx, 275
	mov dx, 269
	int 10h
	
	mov cx, 276
	mov dx, 269
	int 10h
	
	mov cx, 282
	mov dx, 269
	int 10h
	
	mov cx, 283
	mov dx, 269
	int 10h
	
	mov cx, 284
	mov dx, 269
	int 10h
	
	mov cx, 286
	mov dx, 269
	int 10h
	
	mov cx, 288
	mov dx, 269
	int 10h
	
	mov cx, 294
	mov dx, 269
	int 10h
	
	mov cx, 298
	mov dx, 269
	int 10h
	
	mov cx, 299
	mov dx, 269
	int 10h
	
	mov cx, 300
	mov dx, 269
	int 10h
	
	mov cx, 305
	mov dx, 269
	int 10h
	
	mov cx, 307
	mov dx, 269
	int 10h
	
	mov cx, 308
	mov dx, 269
	int 10h
	
	mov cx, 309
	mov dx, 269
	int 10h
	
	mov cx, 315
	mov dx, 269
	int 10h
	
	mov cx, 316
	mov dx, 269
	int 10h
	
	mov cx, 317
	mov dx, 269
	int 10h
	
	mov cx, 318
	mov dx, 269
	int 10h
	
	mov cx, 322
	mov dx, 269
	int 10h
	
	mov cx, 323
	mov dx, 269
	int 10h
	
	mov cx, 324
	mov dx, 269
	int 10h
	
	mov cx, 325
	mov dx, 269
	int 10h
	
	mov cx, 330
	mov dx, 269
	int 10h
	
	mov cx, 331
	mov dx, 269
	int 10h
	
	mov cx, 332
	mov dx, 269
	int 10h
	
	mov cx, 334
	mov dx, 269
	int 10h
	
	mov cx, 345
	mov dx, 269
	int 10h
	
	mov cx, 352
	mov dx, 269
	int 10h
	
	mov cx, 353
	mov dx, 269
	int 10h
	
	mov cx, 354
	mov dx, 269
	int 10h
	
	mov cx, 355
	mov dx, 269
	int 10h
	
	mov cx, 356
	mov dx, 269
	int 10h
	
	mov cx, 357
	mov dx, 269
	int 10h
	
	mov cx, 362
	mov dx, 269
	int 10h
	
	mov cx, 363
	mov dx, 269
	int 10h
	
	mov cx, 364
	mov dx, 269
	int 10h
	
	mov cx, 369
	mov dx, 269
	int 10h
	
	mov cx, 371
	mov dx, 269
	int 10h
	
	mov cx, 372
	mov dx, 269
	int 10h
	
	mov cx, 373
	mov dx, 269
	int 10h
	
	mov cx, 376
	mov dx, 269
	int 10h
	
	mov cx, 377
	mov dx, 269
	int 10h
	
	mov cx, 378
	mov dx, 269
	int 10h
	
	mov cx, 379
	mov dx, 269
	int 10h
	
	mov cx, 380
	mov dx, 269
	int 10h
	
	mov cx, 381
	mov dx, 269
	int 10h
	
	mov cx, 385
	mov dx, 269
	int 10h
	
	mov cx, 390
	mov dx, 269
	int 10h
	
	mov cx, 393
	mov dx, 269
	int 10h
	
	mov cx, 395
	mov dx, 269
	int 10h
	
	mov cx, 396
	mov dx, 269
	int 10h
	
	mov cx, 397
	mov dx, 269
	int 10h
	
	mov cx, 409
	mov dx, 269
	int 10h
	
	mov cx, 413
	mov dx, 269
	int 10h
	
	mov cx, 417
	mov dx, 269
	int 10h
	
	mov cx, 419
	mov dx, 269
	int 10h
	
	mov cx, 420
	mov dx, 269
	int 10h
	
	mov cx, 421
	mov dx, 269
	int 10h
	
	mov cx, 424
	mov dx, 269
	int 10h
	
	mov cx, 425
	mov dx, 269
	int 10h
	
	mov cx, 426
	mov dx, 269
	int 10h
	
	mov cx, 427
	mov dx, 269
	int 10h
	
	mov cx, 428
	mov dx, 269
	int 10h
	
	mov cx, 429
	mov dx, 269
	int 10h
	
	mov cx, 433
	mov dx, 269
	int 10h
	
	mov cx, 434
	mov dx, 269
	int 10h
	
	mov cx, 435
	mov dx, 269
	int 10h
	
	mov cx, 436
	mov dx, 269
	int 10h
	
	mov cx, 442
	mov dx, 269
	int 10h
	
	mov cx, 443
	mov dx, 269
	int 10h
	
	mov cx, 444
	mov dx, 269
	int 10h
	
	mov cx, 445
	mov dx, 269
	int 10h
	
	mov cx, 449
	mov dx, 269
	int 10h
	
	mov cx, 451
	mov dx, 269
	int 10h
	
	mov cx, 452
	mov dx, 269
	int 10h
	
	mov cx, 453
	mov dx, 269
	int 10h
	
	mov cx, 458
	mov dx, 269
	int 10h
	
	mov cx, 459
	mov dx, 269
	int 10h
	
	mov cx, 460
	mov dx, 269
	int 10h
	
	mov cx, 461
	mov dx, 269
	int 10h
	
	mov cx, 482
	mov dx, 269
	int 10h
	
	mov cx, 483
	mov dx, 269
	int 10h
	
	mov cx, 484
	mov dx, 269
	int 10h
	
	mov cx, 489
	mov dx, 269
	int 10h
	
	mov cx, 491
	mov dx, 269
	int 10h
	
	mov cx, 492
	mov dx, 269
	int 10h
	
	mov cx, 493
	mov dx, 269
	int 10h
	
	mov cx, 498
	mov dx, 269
	int 10h
	
	mov cx, 499
	mov dx, 269
	int 10h
	
	mov cx, 500
	mov dx, 269
	int 10h
	
	mov cx, 502
	mov dx, 269
	int 10h
	
	mov cx, 512
	mov dx, 269
	int 10h
	
	mov cx, 513
	mov dx, 269
	int 10h
	
	mov cx, 514
	mov dx, 269
	int 10h
	
	mov cx, 515
	mov dx, 269
	int 10h
	
	mov cx, 516
	mov dx, 269
	int 10h
	
	mov cx, 517
	mov dx, 269
	int 10h
	
	mov cx, 521
	mov dx, 269
	int 10h
	
	mov cx, 523
	mov dx, 269
	int 10h
	
	mov cx, 524
	mov dx, 269
	int 10h
	
	mov cx, 525
	mov dx, 269
	int 10h
	
	mov cx, 530
	mov dx, 269
	int 10h
	
	mov cx, 531
	mov dx, 269
	int 10h
	
	mov cx, 532
	mov dx, 269
	int 10h
	
	mov cx, 533
	mov dx, 269
	int 10h
	
	mov cx, 537
	mov dx, 269
	int 10h
	
	mov cx, 539
	mov dx, 269
	int 10h
	
	mov cx, 540
	mov dx, 269
	int 10h
	
	mov cx, 541
	mov dx, 269
	int 10h
	
	mov cx, 1
	mov dx, 270
	int 10h
	
	mov cx, 6
	mov dx, 270
	int 10h
	
	mov cx, 9
	mov dx, 270
	int 10h
	
	mov cx, 14
	mov dx, 270
	int 10h
	
	mov cx, 17
	mov dx, 270
	int 10h
	
	mov cx, 22
	mov dx, 270
	int 10h
	
	mov cx, 25
	mov dx, 270
	int 10h
	
	mov cx, 26
	mov dx, 270
	int 10h
	
	mov cx, 29
	mov dx, 270
	int 10h
	
	mov cx, 42
	mov dx, 270
	int 10h
	
	mov cx, 49
	mov dx, 270
	int 10h
	
	mov cx, 54
	mov dx, 270
	int 10h
	
	mov cx, 56
	mov dx, 270
	int 10h
	
	mov cx, 57
	mov dx, 270
	int 10h
	
	mov cx, 59
	mov dx, 270
	int 10h
	
	mov cx, 60
	mov dx, 270
	int 10h
	
	mov cx, 62
	mov dx, 270
	int 10h
	
	mov cx, 65
	mov dx, 270
	int 10h
	
	mov cx, 66
	mov dx, 270
	int 10h
	
	mov cx, 70
	mov dx, 270
	int 10h
	
	mov cx, 73
	mov dx, 270
	int 10h
	
	mov cx, 78
	mov dx, 270
	int 10h
	
	mov cx, 82
	mov dx, 270
	int 10h
	
	mov cx, 90
	mov dx, 270
	int 10h
	
	mov cx, 94
	mov dx, 270
	int 10h
	
	mov cx, 97
	mov dx, 270
	int 10h
	
	mov cx, 98
	mov dx, 270
	int 10h
	
	mov cx, 101
	mov dx, 270
	int 10h
	
	mov cx, 121
	mov dx, 270
	int 10h
	
	mov cx, 122
	mov dx, 270
	int 10h
	
	mov cx, 126
	mov dx, 270
	int 10h
	
	mov cx, 129
	mov dx, 270
	int 10h
	
	mov cx, 130
	mov dx, 270
	int 10h
	
	mov cx, 133
	mov dx, 270
	int 10h
	
	mov cx, 138
	mov dx, 270
	int 10h
	
	mov cx, 142
	mov dx, 270
	int 10h
	
	mov cx, 145
	mov dx, 270
	int 10h
	
	mov cx, 153
	mov dx, 270
	int 10h
	
	mov cx, 169
	mov dx, 270
	int 10h
	
	mov cx, 178
	mov dx, 270
	int 10h
	
	mov cx, 181
	mov dx, 270
	int 10h
	
	mov cx, 194
	mov dx, 270
	int 10h
	
	mov cx, 201
	mov dx, 270
	int 10h
	
	mov cx, 206
	mov dx, 270
	int 10h
	
	mov cx, 217
	mov dx, 270
	int 10h
	
	mov cx, 226
	mov dx, 270
	int 10h
	
	mov cx, 230
	mov dx, 270
	int 10h
	
	mov cx, 236
	mov dx, 270
	int 10h
	
	mov cx, 242
	mov dx, 270
	int 10h
	
	mov cx, 246
	mov dx, 270
	int 10h
	
	mov cx, 250
	mov dx, 270
	int 10h
	
	mov cx, 258
	mov dx, 270
	int 10h
	
	mov cx, 274
	mov dx, 270
	int 10h
	
	mov cx, 277
	mov dx, 270
	int 10h
	
	mov cx, 281
	mov dx, 270
	int 10h
	
	mov cx, 285
	mov dx, 270
	int 10h
	
	mov cx, 286
	mov dx, 270
	int 10h
	
	mov cx, 289
	mov dx, 270
	int 10h
	
	mov cx, 293
	mov dx, 270
	int 10h
	
	mov cx, 301
	mov dx, 270
	int 10h
	
	mov cx, 305
	mov dx, 270
	int 10h
	
	mov cx, 306
	mov dx, 270
	int 10h
	
	mov cx, 310
	mov dx, 270
	int 10h
	
	mov cx, 314
	mov dx, 270
	int 10h
	
	mov cx, 322
	mov dx, 270
	int 10h
	
	mov cx, 326
	mov dx, 270
	int 10h
	
	mov cx, 329
	mov dx, 270
	int 10h
	
	mov cx, 333
	mov dx, 270
	int 10h
	
	mov cx, 334
	mov dx, 270
	int 10h
	
	mov cx, 345
	mov dx, 270
	int 10h
	
	mov cx, 354
	mov dx, 270
	int 10h
	
	mov cx, 365
	mov dx, 270
	int 10h
	
	mov cx, 369
	mov dx, 270
	int 10h
	
	mov cx, 370
	mov dx, 270
	int 10h
	
	mov cx, 373
	mov dx, 270
	int 10h
	
	mov cx, 378
	mov dx, 270
	int 10h
	
	mov cx, 385
	mov dx, 270
	int 10h
	
	mov cx, 390
	mov dx, 270
	int 10h
	
	mov cx, 393
	mov dx, 270
	int 10h
	
	mov cx, 394
	mov dx, 270
	int 10h
	
	mov cx, 398
	mov dx, 270
	int 10h
	
	mov cx, 408
	mov dx, 270
	int 10h
	
	mov cx, 414
	mov dx, 270
	int 10h
	
	mov cx, 417
	mov dx, 270
	int 10h
	
	mov cx, 418
	mov dx, 270
	int 10h
	
	mov cx, 422
	mov dx, 270
	int 10h
	
	mov cx, 426
	mov dx, 270
	int 10h
	
	mov cx, 436
	mov dx, 270
	int 10h
	
	mov cx, 441
	mov dx, 270
	int 10h
	
	mov cx, 446
	mov dx, 270
	int 10h
	
	mov cx, 449
	mov dx, 270
	int 10h
	
	mov cx, 450
	mov dx, 270
	int 10h
	
	mov cx, 454
	mov dx, 270
	int 10h
	
	mov cx, 457
	mov dx, 270
	int 10h
	
	mov cx, 485
	mov dx, 270
	int 10h
	
	mov cx, 489
	mov dx, 270
	int 10h
	
	mov cx, 490
	mov dx, 270
	int 10h
	
	mov cx, 494
	mov dx, 270
	int 10h
	
	mov cx, 497
	mov dx, 270
	int 10h
	
	mov cx, 501
	mov dx, 270
	int 10h
	
	mov cx, 502
	mov dx, 270
	int 10h
	
	mov cx, 514
	mov dx, 270
	int 10h
	
	mov cx, 521
	mov dx, 270
	int 10h
	
	mov cx, 522
	mov dx, 270
	int 10h
	
	mov cx, 526
	mov dx, 270
	int 10h
	
	mov cx, 530
	mov dx, 270
	int 10h
	
	mov cx, 534
	mov dx, 270
	int 10h
	
	mov cx, 537
	mov dx, 270
	int 10h
	
	mov cx, 538
	mov dx, 270
	int 10h
	
	mov cx, 542
	mov dx, 270
	int 10h
	
	mov cx, 1
	mov dx, 271
	int 10h
	
	mov cx, 6
	mov dx, 271
	int 10h
	
	mov cx, 9
	mov dx, 271
	int 10h
	
	mov cx, 14
	mov dx, 271
	int 10h
	
	mov cx, 17
	mov dx, 271
	int 10h
	
	mov cx, 22
	mov dx, 271
	int 10h
	
	mov cx, 25
	mov dx, 271
	int 10h
	
	mov cx, 41
	mov dx, 271
	int 10h
	
	mov cx, 49
	mov dx, 271
	int 10h
	
	mov cx, 54
	mov dx, 271
	int 10h
	
	mov cx, 56
	mov dx, 271
	int 10h
	
	mov cx, 59
	mov dx, 271
	int 10h
	
	mov cx, 62
	mov dx, 271
	int 10h
	
	mov cx, 65
	mov dx, 271
	int 10h
	
	mov cx, 70
	mov dx, 271
	int 10h
	
	mov cx, 73
	mov dx, 271
	int 10h
	
	mov cx, 78
	mov dx, 271
	int 10h
	
	mov cx, 82
	mov dx, 271
	int 10h
	
	mov cx, 89
	mov dx, 271
	int 10h
	
	mov cx, 94
	mov dx, 271
	int 10h
	
	mov cx, 97
	mov dx, 271
	int 10h
	
	mov cx, 121
	mov dx, 271
	int 10h
	
	mov cx, 126
	mov dx, 271
	int 10h
	
	mov cx, 129
	mov dx, 271
	int 10h
	
	mov cx, 137
	mov dx, 271
	int 10h
	
	mov cx, 142
	mov dx, 271
	int 10h
	
	mov cx, 145
	mov dx, 271
	int 10h
	
	mov cx, 146
	mov dx, 271
	int 10h
	
	mov cx, 153
	mov dx, 271
	int 10h
	
	mov cx, 154
	mov dx, 271
	int 10h
	
	mov cx, 169
	mov dx, 271
	int 10h
	
	mov cx, 178
	mov dx, 271
	int 10h
	
	mov cx, 179
	mov dx, 271
	int 10h
	
	mov cx, 180
	mov dx, 271
	int 10h
	
	mov cx, 181
	mov dx, 271
	int 10h
	
	mov cx, 194
	mov dx, 271
	int 10h
	
	mov cx, 201
	mov dx, 271
	int 10h
	
	mov cx, 206
	mov dx, 271
	int 10h
	
	mov cx, 217
	mov dx, 271
	int 10h
	
	mov cx, 218
	mov dx, 271
	int 10h
	
	mov cx, 225
	mov dx, 271
	int 10h
	
	mov cx, 230
	mov dx, 271
	int 10h
	
	mov cx, 236
	mov dx, 271
	int 10h
	
	mov cx, 241
	mov dx, 271
	int 10h
	
	mov cx, 246
	mov dx, 271
	int 10h
	
	mov cx, 249
	mov dx, 271
	int 10h
	
	mov cx, 258
	mov dx, 271
	int 10h
	
	mov cx, 274
	mov dx, 271
	int 10h
	
	mov cx, 277
	mov dx, 271
	int 10h
	
	mov cx, 281
	mov dx, 271
	int 10h
	
	mov cx, 286
	mov dx, 271
	int 10h
	
	mov cx, 289
	mov dx, 271
	int 10h
	
	mov cx, 293
	mov dx, 271
	int 10h
	
	mov cx, 301
	mov dx, 271
	int 10h
	
	mov cx, 305
	mov dx, 271
	int 10h
	
	mov cx, 310
	mov dx, 271
	int 10h
	
	mov cx, 313
	mov dx, 271
	int 10h
	
	mov cx, 321
	mov dx, 271
	int 10h
	
	mov cx, 326
	mov dx, 271
	int 10h
	
	mov cx, 329
	mov dx, 271
	int 10h
	
	mov cx, 334
	mov dx, 271
	int 10h
	
	mov cx, 346
	mov dx, 271
	int 10h
	
	mov cx, 347
	mov dx, 271
	int 10h
	
	mov cx, 348
	mov dx, 271
	int 10h
	
	mov cx, 354
	mov dx, 271
	int 10h
	
	mov cx, 365
	mov dx, 271
	int 10h
	
	mov cx, 369
	mov dx, 271
	int 10h
	
	mov cx, 378
	mov dx, 271
	int 10h
	
	mov cx, 385
	mov dx, 271
	int 10h
	
	mov cx, 390
	mov dx, 271
	int 10h
	
	mov cx, 393
	mov dx, 271
	int 10h
	
	mov cx, 398
	mov dx, 271
	int 10h
	
	mov cx, 408
	mov dx, 271
	int 10h
	
	mov cx, 414
	mov dx, 271
	int 10h
	
	mov cx, 417
	mov dx, 271
	int 10h
	
	mov cx, 422
	mov dx, 271
	int 10h
	
	mov cx, 426
	mov dx, 271
	int 10h
	
	mov cx, 436
	mov dx, 271
	int 10h
	
	mov cx, 441
	mov dx, 271
	int 10h
	
	mov cx, 446
	mov dx, 271
	int 10h
	
	mov cx, 449
	mov dx, 271
	int 10h
	
	mov cx, 454
	mov dx, 271
	int 10h
	
	mov cx, 457
	mov dx, 271
	int 10h
	
	mov cx, 458
	mov dx, 271
	int 10h
	
	mov cx, 485
	mov dx, 271
	int 10h
	
	mov cx, 489
	mov dx, 271
	int 10h
	
	mov cx, 494
	mov dx, 271
	int 10h
	
	mov cx, 497
	mov dx, 271
	int 10h
	
	mov cx, 502
	mov dx, 271
	int 10h
	
	mov cx, 514
	mov dx, 271
	int 10h
	
	mov cx, 521
	mov dx, 271
	int 10h
	
	mov cx, 526
	mov dx, 271
	int 10h
	
	mov cx, 529
	mov dx, 271
	int 10h
	
	mov cx, 534
	mov dx, 271
	int 10h
	
	mov cx, 537
	mov dx, 271
	int 10h
	
	mov cx, 542
	mov dx, 271
	int 10h
	
	mov cx, 2
	mov dx, 272
	int 10h
	
	mov cx, 5
	mov dx, 272
	int 10h
	
	mov cx, 9
	mov dx, 272
	int 10h
	
	mov cx, 14
	mov dx, 272
	int 10h
	
	mov cx, 17
	mov dx, 272
	int 10h
	
	mov cx, 22
	mov dx, 272
	int 10h
	
	mov cx, 25
	mov dx, 272
	int 10h
	
	mov cx, 41
	mov dx, 272
	int 10h
	
	mov cx, 49
	mov dx, 272
	int 10h
	
	mov cx, 54
	mov dx, 272
	int 10h
	
	mov cx, 56
	mov dx, 272
	int 10h
	
	mov cx, 59
	mov dx, 272
	int 10h
	
	mov cx, 62
	mov dx, 272
	int 10h
	
	mov cx, 65
	mov dx, 272
	int 10h
	
	mov cx, 70
	mov dx, 272
	int 10h
	
	mov cx, 73
	mov dx, 272
	int 10h
	
	mov cx, 78
	mov dx, 272
	int 10h
	
	mov cx, 82
	mov dx, 272
	int 10h
	
	mov cx, 89
	mov dx, 272
	int 10h
	
	mov cx, 90
	mov dx, 272
	int 10h
	
	mov cx, 91
	mov dx, 272
	int 10h
	
	mov cx, 92
	mov dx, 272
	int 10h
	
	mov cx, 93
	mov dx, 272
	int 10h
	
	mov cx, 94
	mov dx, 272
	int 10h
	
	mov cx, 97
	mov dx, 272
	int 10h
	
	mov cx, 121
	mov dx, 272
	int 10h
	
	mov cx, 126
	mov dx, 272
	int 10h
	
	mov cx, 129
	mov dx, 272
	int 10h
	
	mov cx, 137
	mov dx, 272
	int 10h
	
	mov cx, 138
	mov dx, 272
	int 10h
	
	mov cx, 139
	mov dx, 272
	int 10h
	
	mov cx, 140
	mov dx, 272
	int 10h
	
	mov cx, 141
	mov dx, 272
	int 10h
	
	mov cx, 142
	mov dx, 272
	int 10h
	
	mov cx, 147
	mov dx, 272
	int 10h
	
	mov cx, 148
	mov dx, 272
	int 10h
	
	mov cx, 155
	mov dx, 272
	int 10h
	
	mov cx, 156
	mov dx, 272
	int 10h
	
	mov cx, 169
	mov dx, 272
	int 10h
	
	mov cx, 170
	mov dx, 272
	int 10h
	
	mov cx, 171
	mov dx, 272
	int 10h
	
	mov cx, 172
	mov dx, 272
	int 10h
	
	mov cx, 173
	mov dx, 272
	int 10h
	
	mov cx, 177
	mov dx, 272
	int 10h
	
	mov cx, 181
	mov dx, 272
	int 10h
	
	mov cx, 182
	mov dx, 272
	int 10h
	
	mov cx, 194
	mov dx, 272
	int 10h
	
	mov cx, 201
	mov dx, 272
	int 10h
	
	mov cx, 206
	mov dx, 272
	int 10h
	
	mov cx, 219
	mov dx, 272
	int 10h
	
	mov cx, 220
	mov dx, 272
	int 10h
	
	mov cx, 225
	mov dx, 272
	int 10h
	
	mov cx, 226
	mov dx, 272
	int 10h
	
	mov cx, 227
	mov dx, 272
	int 10h
	
	mov cx, 228
	mov dx, 272
	int 10h
	
	mov cx, 229
	mov dx, 272
	int 10h
	
	mov cx, 230
	mov dx, 272
	int 10h
	
	mov cx, 236
	mov dx, 272
	int 10h
	
	mov cx, 241
	mov dx, 272
	int 10h
	
	mov cx, 242
	mov dx, 272
	int 10h
	
	mov cx, 243
	mov dx, 272
	int 10h
	
	mov cx, 244
	mov dx, 272
	int 10h
	
	mov cx, 245
	mov dx, 272
	int 10h
	
	mov cx, 246
	mov dx, 272
	int 10h
	
	mov cx, 249
	mov dx, 272
	int 10h
	
	mov cx, 258
	mov dx, 272
	int 10h
	
	mov cx, 274
	mov dx, 272
	int 10h
	
	mov cx, 277
	mov dx, 272
	int 10h
	
	mov cx, 281
	mov dx, 272
	int 10h
	
	mov cx, 286
	mov dx, 272
	int 10h
	
	mov cx, 289
	mov dx, 272
	int 10h
	
	mov cx, 293
	mov dx, 272
	int 10h
	
	mov cx, 298
	mov dx, 272
	int 10h
	
	mov cx, 299
	mov dx, 272
	int 10h
	
	mov cx, 300
	mov dx, 272
	int 10h
	
	mov cx, 301
	mov dx, 272
	int 10h
	
	mov cx, 305
	mov dx, 272
	int 10h
	
	mov cx, 310
	mov dx, 272
	int 10h
	
	mov cx, 313
	mov dx, 272
	int 10h
	
	mov cx, 321
	mov dx, 272
	int 10h
	
	mov cx, 322
	mov dx, 272
	int 10h
	
	mov cx, 323
	mov dx, 272
	int 10h
	
	mov cx, 324
	mov dx, 272
	int 10h
	
	mov cx, 325
	mov dx, 272
	int 10h
	
	mov cx, 326
	mov dx, 272
	int 10h
	
	mov cx, 329
	mov dx, 272
	int 10h
	
	mov cx, 334
	mov dx, 272
	int 10h
	
	mov cx, 349
	mov dx, 272
	int 10h
	
	mov cx, 354
	mov dx, 272
	int 10h
	
	mov cx, 362
	mov dx, 272
	int 10h
	
	mov cx, 363
	mov dx, 272
	int 10h
	
	mov cx, 364
	mov dx, 272
	int 10h
	
	mov cx, 365
	mov dx, 272
	int 10h
	
	mov cx, 369
	mov dx, 272
	int 10h
	
	mov cx, 378
	mov dx, 272
	int 10h
	
	mov cx, 385
	mov dx, 272
	int 10h
	
	mov cx, 390
	mov dx, 272
	int 10h
	
	mov cx, 393
	mov dx, 272
	int 10h
	
	mov cx, 398
	mov dx, 272
	int 10h
	
	mov cx, 408
	mov dx, 272
	int 10h
	
	mov cx, 414
	mov dx, 272
	int 10h
	
	mov cx, 417
	mov dx, 272
	int 10h
	
	mov cx, 422
	mov dx, 272
	int 10h
	
	mov cx, 426
	mov dx, 272
	int 10h
	
	mov cx, 436
	mov dx, 272
	int 10h
	
	mov cx, 441
	mov dx, 272
	int 10h
	
	mov cx, 446
	mov dx, 272
	int 10h
	
	mov cx, 449
	mov dx, 272
	int 10h
	
	mov cx, 454
	mov dx, 272
	int 10h
	
	mov cx, 459
	mov dx, 272
	int 10h
	
	mov cx, 460
	mov dx, 272
	int 10h
	
	mov cx, 482
	mov dx, 272
	int 10h
	
	mov cx, 483
	mov dx, 272
	int 10h
	
	mov cx, 484
	mov dx, 272
	int 10h
	
	mov cx, 485
	mov dx, 272
	int 10h
	
	mov cx, 489
	mov dx, 272
	int 10h
	
	mov cx, 494
	mov dx, 272
	int 10h
	
	mov cx, 497
	mov dx, 272
	int 10h
	
	mov cx, 502
	mov dx, 272
	int 10h
	
	mov cx, 514
	mov dx, 272
	int 10h
	
	mov cx, 521
	mov dx, 272
	int 10h
	
	mov cx, 526
	mov dx, 272
	int 10h
	
	mov cx, 529
	mov dx, 272
	int 10h
	
	mov cx, 530
	mov dx, 272
	int 10h
	
	mov cx, 531
	mov dx, 272
	int 10h
	
	mov cx, 532
	mov dx, 272
	int 10h
	
	mov cx, 533
	mov dx, 272
	int 10h
	
	mov cx, 534
	mov dx, 272
	int 10h
	
	mov cx, 537
	mov dx, 272
	int 10h
	
	mov cx, 542
	mov dx, 272
	int 10h
	
	mov cx, 2
	mov dx, 273
	int 10h
	
	mov cx, 5
	mov dx, 273
	int 10h
	
	mov cx, 9
	mov dx, 273
	int 10h
	
	mov cx, 14
	mov dx, 273
	int 10h
	
	mov cx, 17
	mov dx, 273
	int 10h
	
	mov cx, 22
	mov dx, 273
	int 10h
	
	mov cx, 25
	mov dx, 273
	int 10h
	
	mov cx, 41
	mov dx, 273
	int 10h
	
	mov cx, 49
	mov dx, 273
	int 10h
	
	mov cx, 54
	mov dx, 273
	int 10h
	
	mov cx, 56
	mov dx, 273
	int 10h
	
	mov cx, 59
	mov dx, 273
	int 10h
	
	mov cx, 62
	mov dx, 273
	int 10h
	
	mov cx, 65
	mov dx, 273
	int 10h
	
	mov cx, 70
	mov dx, 273
	int 10h
	
	mov cx, 73
	mov dx, 273
	int 10h
	
	mov cx, 78
	mov dx, 273
	int 10h
	
	mov cx, 82
	mov dx, 273
	int 10h
	
	mov cx, 89
	mov dx, 273
	int 10h
	
	mov cx, 97
	mov dx, 273
	int 10h
	
	mov cx, 121
	mov dx, 273
	int 10h
	
	mov cx, 126
	mov dx, 273
	int 10h
	
	mov cx, 129
	mov dx, 273
	int 10h
	
	mov cx, 137
	mov dx, 273
	int 10h
	
	mov cx, 149
	mov dx, 273
	int 10h
	
	mov cx, 157
	mov dx, 273
	int 10h
	
	mov cx, 169
	mov dx, 273
	int 10h
	
	mov cx, 177
	mov dx, 273
	int 10h
	
	mov cx, 182
	mov dx, 273
	int 10h
	
	mov cx, 194
	mov dx, 273
	int 10h
	
	mov cx, 201
	mov dx, 273
	int 10h
	
	mov cx, 206
	mov dx, 273
	int 10h
	
	mov cx, 221
	mov dx, 273
	int 10h
	
	mov cx, 225
	mov dx, 273
	int 10h
	
	mov cx, 236
	mov dx, 273
	int 10h
	
	mov cx, 241
	mov dx, 273
	int 10h
	
	mov cx, 249
	mov dx, 273
	int 10h
	
	mov cx, 258
	mov dx, 273
	int 10h
	
	mov cx, 273
	mov dx, 273
	int 10h
	
	mov cx, 274
	mov dx, 273
	int 10h
	
	mov cx, 275
	mov dx, 273
	int 10h
	
	mov cx, 276
	mov dx, 273
	int 10h
	
	mov cx, 277
	mov dx, 273
	int 10h
	
	mov cx, 278
	mov dx, 273
	int 10h
	
	mov cx, 281
	mov dx, 273
	int 10h
	
	mov cx, 286
	mov dx, 273
	int 10h
	
	mov cx, 290
	mov dx, 273
	int 10h
	
	mov cx, 292
	mov dx, 273
	int 10h
	
	mov cx, 297
	mov dx, 273
	int 10h
	
	mov cx, 301
	mov dx, 273
	int 10h
	
	mov cx, 305
	mov dx, 273
	int 10h
	
	mov cx, 310
	mov dx, 273
	int 10h
	
	mov cx, 313
	mov dx, 273
	int 10h
	
	mov cx, 321
	mov dx, 273
	int 10h
	
	mov cx, 329
	mov dx, 273
	int 10h
	
	mov cx, 334
	mov dx, 273
	int 10h
	
	mov cx, 350
	mov dx, 273
	int 10h
	
	mov cx, 354
	mov dx, 273
	int 10h
	
	mov cx, 361
	mov dx, 273
	int 10h
	
	mov cx, 365
	mov dx, 273
	int 10h
	
	mov cx, 369
	mov dx, 273
	int 10h
	
	mov cx, 378
	mov dx, 273
	int 10h
	
	mov cx, 385
	mov dx, 273
	int 10h
	
	mov cx, 390
	mov dx, 273
	int 10h
	
	mov cx, 393
	mov dx, 273
	int 10h
	
	mov cx, 398
	mov dx, 273
	int 10h
	
	mov cx, 408
	mov dx, 273
	int 10h
	
	mov cx, 414
	mov dx, 273
	int 10h
	
	mov cx, 417
	mov dx, 273
	int 10h
	
	mov cx, 422
	mov dx, 273
	int 10h
	
	mov cx, 426
	mov dx, 273
	int 10h
	
	mov cx, 436
	mov dx, 273
	int 10h
	
	mov cx, 441
	mov dx, 273
	int 10h
	
	mov cx, 446
	mov dx, 273
	int 10h
	
	mov cx, 449
	mov dx, 273
	int 10h
	
	mov cx, 454
	mov dx, 273
	int 10h
	
	mov cx, 461
	mov dx, 273
	int 10h
	
	mov cx, 481
	mov dx, 273
	int 10h
	
	mov cx, 485
	mov dx, 273
	int 10h
	
	mov cx, 489
	mov dx, 273
	int 10h
	
	mov cx, 494
	mov dx, 273
	int 10h
	
	mov cx, 497
	mov dx, 273
	int 10h
	
	mov cx, 502
	mov dx, 273
	int 10h
	
	mov cx, 514
	mov dx, 273
	int 10h
	
	mov cx, 521
	mov dx, 273
	int 10h
	
	mov cx, 526
	mov dx, 273
	int 10h
	
	mov cx, 529
	mov dx, 273
	int 10h
	
	mov cx, 537
	mov dx, 273
	int 10h
	
	mov cx, 542
	mov dx, 273
	int 10h
	
	mov cx, 3
	mov dx, 274
	int 10h
	
	mov cx, 4
	mov dx, 274
	int 10h
	
	mov cx, 9
	mov dx, 274
	int 10h
	
	mov cx, 14
	mov dx, 274
	int 10h
	
	mov cx, 17
	mov dx, 274
	int 10h
	
	mov cx, 21
	mov dx, 274
	int 10h
	
	mov cx, 22
	mov dx, 274
	int 10h
	
	mov cx, 25
	mov dx, 274
	int 10h
	
	mov cx, 42
	mov dx, 274
	int 10h
	
	mov cx, 49
	mov dx, 274
	int 10h
	
	mov cx, 54
	mov dx, 274
	int 10h
	
	mov cx, 56
	mov dx, 274
	int 10h
	
	mov cx, 59
	mov dx, 274
	int 10h
	
	mov cx, 62
	mov dx, 274
	int 10h
	
	mov cx, 65
	mov dx, 274
	int 10h
	
	mov cx, 66
	mov dx, 274
	int 10h
	
	mov cx, 70
	mov dx, 274
	int 10h
	
	mov cx, 73
	mov dx, 274
	int 10h
	
	mov cx, 77
	mov dx, 274
	int 10h
	
	mov cx, 78
	mov dx, 274
	int 10h
	
	mov cx, 82
	mov dx, 274
	int 10h
	
	mov cx, 89
	mov dx, 274
	int 10h
	
	mov cx, 97
	mov dx, 274
	int 10h
	
	mov cx, 106
	mov dx, 274
	int 10h
	
	mov cx, 107
	mov dx, 274
	int 10h
	
	mov cx, 121
	mov dx, 274
	int 10h
	
	mov cx, 122
	mov dx, 274
	int 10h
	
	mov cx, 126
	mov dx, 274
	int 10h
	
	mov cx, 129
	mov dx, 274
	int 10h
	
	mov cx, 137
	mov dx, 274
	int 10h
	
	mov cx, 149
	mov dx, 274
	int 10h
	
	mov cx, 157
	mov dx, 274
	int 10h
	
	mov cx, 169
	mov dx, 274
	int 10h
	
	mov cx, 177
	mov dx, 274
	int 10h
	
	mov cx, 182
	mov dx, 274
	int 10h
	
	mov cx, 194
	mov dx, 274
	int 10h
	
	mov cx, 201
	mov dx, 274
	int 10h
	
	mov cx, 206
	mov dx, 274
	int 10h
	
	mov cx, 221
	mov dx, 274
	int 10h
	
	mov cx, 225
	mov dx, 274
	int 10h
	
	mov cx, 236
	mov dx, 274
	int 10h
	
	mov cx, 241
	mov dx, 274
	int 10h
	
	mov cx, 250
	mov dx, 274
	int 10h
	
	mov cx, 258
	mov dx, 274
	int 10h
	
	mov cx, 273
	mov dx, 274
	int 10h
	
	mov cx, 278
	mov dx, 274
	int 10h
	
	mov cx, 281
	mov dx, 274
	int 10h
	
	mov cx, 285
	mov dx, 274
	int 10h
	
	mov cx, 286
	mov dx, 274
	int 10h
	
	mov cx, 290
	mov dx, 274
	int 10h
	
	mov cx, 292
	mov dx, 274
	int 10h
	
	mov cx, 297
	mov dx, 274
	int 10h
	
	mov cx, 301
	mov dx, 274
	int 10h
	
	mov cx, 305
	mov dx, 274
	int 10h
	
	mov cx, 310
	mov dx, 274
	int 10h
	
	mov cx, 314
	mov dx, 274
	int 10h
	
	mov cx, 321
	mov dx, 274
	int 10h
	
	mov cx, 329
	mov dx, 274
	int 10h
	
	mov cx, 333
	mov dx, 274
	int 10h
	
	mov cx, 334
	mov dx, 274
	int 10h
	
	mov cx, 350
	mov dx, 274
	int 10h
	
	mov cx, 354
	mov dx, 274
	int 10h
	
	mov cx, 361
	mov dx, 274
	int 10h
	
	mov cx, 365
	mov dx, 274
	int 10h
	
	mov cx, 369
	mov dx, 274
	int 10h
	
	mov cx, 378
	mov dx, 274
	int 10h
	
	mov cx, 385
	mov dx, 274
	int 10h
	
	mov cx, 389
	mov dx, 274
	int 10h
	
	mov cx, 390
	mov dx, 274
	int 10h
	
	mov cx, 393
	mov dx, 274
	int 10h
	
	mov cx, 394
	mov dx, 274
	int 10h
	
	mov cx, 398
	mov dx, 274
	int 10h
	
	mov cx, 409
	mov dx, 274
	int 10h
	
	mov cx, 413
	mov dx, 274
	int 10h
	
	mov cx, 417
	mov dx, 274
	int 10h
	
	mov cx, 418
	mov dx, 274
	int 10h
	
	mov cx, 422
	mov dx, 274
	int 10h
	
	mov cx, 426
	mov dx, 274
	int 10h
	
	mov cx, 436
	mov dx, 274
	int 10h
	
	mov cx, 441
	mov dx, 274
	int 10h
	
	mov cx, 446
	mov dx, 274
	int 10h
	
	mov cx, 449
	mov dx, 274
	int 10h
	
	mov cx, 454
	mov dx, 274
	int 10h
	
	mov cx, 461
	mov dx, 274
	int 10h
	
	mov cx, 466
	mov dx, 274
	int 10h
	
	mov cx, 467
	mov dx, 274
	int 10h
	
	mov cx, 481
	mov dx, 274
	int 10h
	
	mov cx, 485
	mov dx, 274
	int 10h
	
	mov cx, 489
	mov dx, 274
	int 10h
	
	mov cx, 494
	mov dx, 274
	int 10h
	
	mov cx, 497
	mov dx, 274
	int 10h
	
	mov cx, 501
	mov dx, 274
	int 10h
	
	mov cx, 502
	mov dx, 274
	int 10h
	
	mov cx, 514
	mov dx, 274
	int 10h
	
	mov cx, 521
	mov dx, 274
	int 10h
	
	mov cx, 526
	mov dx, 274
	int 10h
	
	mov cx, 529
	mov dx, 274
	int 10h
	
	mov cx, 537
	mov dx, 274
	int 10h
	
	mov cx, 542
	mov dx, 274
	int 10h
	
	mov cx, 3
	mov dx, 275
	int 10h
	
	mov cx, 4
	mov dx, 275
	int 10h
	
	mov cx, 10
	mov dx, 275
	int 10h
	
	mov cx, 11
	mov dx, 275
	int 10h
	
	mov cx, 12
	mov dx, 275
	int 10h
	
	mov cx, 13
	mov dx, 275
	int 10h
	
	mov cx, 18
	mov dx, 275
	int 10h
	
	mov cx, 19
	mov dx, 275
	int 10h
	
	mov cx, 20
	mov dx, 275
	int 10h
	
	mov cx, 22
	mov dx, 275
	int 10h
	
	mov cx, 25
	mov dx, 275
	int 10h
	
	mov cx, 43
	mov dx, 275
	int 10h
	
	mov cx, 44
	mov dx, 275
	int 10h
	
	mov cx, 45
	mov dx, 275
	int 10h
	
	mov cx, 46
	mov dx, 275
	int 10h
	
	mov cx, 50
	mov dx, 275
	int 10h
	
	mov cx, 51
	mov dx, 275
	int 10h
	
	mov cx, 52
	mov dx, 275
	int 10h
	
	mov cx, 53
	mov dx, 275
	int 10h
	
	mov cx, 56
	mov dx, 275
	int 10h
	
	mov cx, 59
	mov dx, 275
	int 10h
	
	mov cx, 62
	mov dx, 275
	int 10h
	
	mov cx, 65
	mov dx, 275
	int 10h
	
	mov cx, 67
	mov dx, 275
	int 10h
	
	mov cx, 68
	mov dx, 275
	int 10h
	
	mov cx, 69
	mov dx, 275
	int 10h
	
	mov cx, 74
	mov dx, 275
	int 10h
	
	mov cx, 75
	mov dx, 275
	int 10h
	
	mov cx, 76
	mov dx, 275
	int 10h
	
	mov cx, 78
	mov dx, 275
	int 10h
	
	mov cx, 83
	mov dx, 275
	int 10h
	
	mov cx, 84
	mov dx, 275
	int 10h
	
	mov cx, 85
	mov dx, 275
	int 10h
	
	mov cx, 90
	mov dx, 275
	int 10h
	
	mov cx, 91
	mov dx, 275
	int 10h
	
	mov cx, 92
	mov dx, 275
	int 10h
	
	mov cx, 93
	mov dx, 275
	int 10h
	
	mov cx, 94
	mov dx, 275
	int 10h
	
	mov cx, 97
	mov dx, 275
	int 10h
	
	mov cx, 106
	mov dx, 275
	int 10h
	
	mov cx, 107
	mov dx, 275
	int 10h
	
	mov cx, 121
	mov dx, 275
	int 10h
	
	mov cx, 123
	mov dx, 275
	int 10h
	
	mov cx, 124
	mov dx, 275
	int 10h
	
	mov cx, 125
	mov dx, 275
	int 10h
	
	mov cx, 129
	mov dx, 275
	int 10h
	
	mov cx, 138
	mov dx, 275
	int 10h
	
	mov cx, 139
	mov dx, 275
	int 10h
	
	mov cx, 140
	mov dx, 275
	int 10h
	
	mov cx, 141
	mov dx, 275
	int 10h
	
	mov cx, 142
	mov dx, 275
	int 10h
	
	mov cx, 145
	mov dx, 275
	int 10h
	
	mov cx, 146
	mov dx, 275
	int 10h
	
	mov cx, 147
	mov dx, 275
	int 10h
	
	mov cx, 148
	mov dx, 275
	int 10h
	
	mov cx, 153
	mov dx, 275
	int 10h
	
	mov cx, 154
	mov dx, 275
	int 10h
	
	mov cx, 155
	mov dx, 275
	int 10h
	
	mov cx, 156
	mov dx, 275
	int 10h
	
	mov cx, 169
	mov dx, 275
	int 10h
	
	mov cx, 178
	mov dx, 275
	int 10h
	
	mov cx, 179
	mov dx, 275
	int 10h
	
	mov cx, 180
	mov dx, 275
	int 10h
	
	mov cx, 181
	mov dx, 275
	int 10h
	
	mov cx, 195
	mov dx, 275
	int 10h
	
	mov cx, 196
	mov dx, 275
	int 10h
	
	mov cx, 197
	mov dx, 275
	int 10h
	
	mov cx, 202
	mov dx, 275
	int 10h
	
	mov cx, 203
	mov dx, 275
	int 10h
	
	mov cx, 204
	mov dx, 275
	int 10h
	
	mov cx, 205
	mov dx, 275
	int 10h
	
	mov cx, 217
	mov dx, 275
	int 10h
	
	mov cx, 218
	mov dx, 275
	int 10h
	
	mov cx, 219
	mov dx, 275
	int 10h
	
	mov cx, 220
	mov dx, 275
	int 10h
	
	mov cx, 226
	mov dx, 275
	int 10h
	
	mov cx, 227
	mov dx, 275
	int 10h
	
	mov cx, 228
	mov dx, 275
	int 10h
	
	mov cx, 229
	mov dx, 275
	int 10h
	
	mov cx, 230
	mov dx, 275
	int 10h
	
	mov cx, 236
	mov dx, 275
	int 10h
	
	mov cx, 242
	mov dx, 275
	int 10h
	
	mov cx, 243
	mov dx, 275
	int 10h
	
	mov cx, 244
	mov dx, 275
	int 10h
	
	mov cx, 245
	mov dx, 275
	int 10h
	
	mov cx, 246
	mov dx, 275
	int 10h
	
	mov cx, 251
	mov dx, 275
	int 10h
	
	mov cx, 252
	mov dx, 275
	int 10h
	
	mov cx, 253
	mov dx, 275
	int 10h
	
	mov cx, 254
	mov dx, 275
	int 10h
	
	mov cx, 259
	mov dx, 275
	int 10h
	
	mov cx, 260
	mov dx, 275
	int 10h
	
	mov cx, 261
	mov dx, 275
	int 10h
	
	mov cx, 272
	mov dx, 275
	int 10h
	
	mov cx, 279
	mov dx, 275
	int 10h
	
	mov cx, 282
	mov dx, 275
	int 10h
	
	mov cx, 283
	mov dx, 275
	int 10h
	
	mov cx, 284
	mov dx, 275
	int 10h
	
	mov cx, 286
	mov dx, 275
	int 10h
	
	mov cx, 291
	mov dx, 275
	int 10h
	
	mov cx, 298
	mov dx, 275
	int 10h
	
	mov cx, 299
	mov dx, 275
	int 10h
	
	mov cx, 300
	mov dx, 275
	int 10h
	
	mov cx, 301
	mov dx, 275
	int 10h
	
	mov cx, 302
	mov dx, 275
	int 10h
	
	mov cx, 305
	mov dx, 275
	int 10h
	
	mov cx, 310
	mov dx, 275
	int 10h
	
	mov cx, 315
	mov dx, 275
	int 10h
	
	mov cx, 316
	mov dx, 275
	int 10h
	
	mov cx, 317
	mov dx, 275
	int 10h
	
	mov cx, 318
	mov dx, 275
	int 10h
	
	mov cx, 322
	mov dx, 275
	int 10h
	
	mov cx, 323
	mov dx, 275
	int 10h
	
	mov cx, 324
	mov dx, 275
	int 10h
	
	mov cx, 325
	mov dx, 275
	int 10h
	
	mov cx, 326
	mov dx, 275
	int 10h
	
	mov cx, 330
	mov dx, 275
	int 10h
	
	mov cx, 331
	mov dx, 275
	int 10h
	
	mov cx, 332
	mov dx, 275
	int 10h
	
	mov cx, 334
	mov dx, 275
	int 10h
	
	mov cx, 345
	mov dx, 275
	int 10h
	
	mov cx, 346
	mov dx, 275
	int 10h
	
	mov cx, 347
	mov dx, 275
	int 10h
	
	mov cx, 348
	mov dx, 275
	int 10h
	
	mov cx, 349
	mov dx, 275
	int 10h
	
	mov cx, 355
	mov dx, 275
	int 10h
	
	mov cx, 356
	mov dx, 275
	int 10h
	
	mov cx, 357
	mov dx, 275
	int 10h
	
	mov cx, 362
	mov dx, 275
	int 10h
	
	mov cx, 363
	mov dx, 275
	int 10h
	
	mov cx, 364
	mov dx, 275
	int 10h
	
	mov cx, 365
	mov dx, 275
	int 10h
	
	mov cx, 366
	mov dx, 275
	int 10h
	
	mov cx, 369
	mov dx, 275
	int 10h
	
	mov cx, 379
	mov dx, 275
	int 10h
	
	mov cx, 380
	mov dx, 275
	int 10h
	
	mov cx, 381
	mov dx, 275
	int 10h
	
	mov cx, 386
	mov dx, 275
	int 10h
	
	mov cx, 387
	mov dx, 275
	int 10h
	
	mov cx, 388
	mov dx, 275
	int 10h
	
	mov cx, 390
	mov dx, 275
	int 10h
	
	mov cx, 393
	mov dx, 275
	int 10h
	
	mov cx, 395
	mov dx, 275
	int 10h
	
	mov cx, 396
	mov dx, 275
	int 10h
	
	mov cx, 397
	mov dx, 275
	int 10h
	
	mov cx, 410
	mov dx, 275
	int 10h
	
	mov cx, 411
	mov dx, 275
	int 10h
	
	mov cx, 412
	mov dx, 275
	int 10h
	
	mov cx, 417
	mov dx, 275
	int 10h
	
	mov cx, 419
	mov dx, 275
	int 10h
	
	mov cx, 420
	mov dx, 275
	int 10h
	
	mov cx, 421
	mov dx, 275
	int 10h
	
	mov cx, 427
	mov dx, 275
	int 10h
	
	mov cx, 428
	mov dx, 275
	int 10h
	
	mov cx, 429
	mov dx, 275
	int 10h
	
	mov cx, 436
	mov dx, 275
	int 10h
	
	mov cx, 442
	mov dx, 275
	int 10h
	
	mov cx, 443
	mov dx, 275
	int 10h
	
	mov cx, 444
	mov dx, 275
	int 10h
	
	mov cx, 445
	mov dx, 275
	int 10h
	
	mov cx, 449
	mov dx, 275
	int 10h
	
	mov cx, 454
	mov dx, 275
	int 10h
	
	mov cx, 457
	mov dx, 275
	int 10h
	
	mov cx, 458
	mov dx, 275
	int 10h
	
	mov cx, 459
	mov dx, 275
	int 10h
	
	mov cx, 460
	mov dx, 275
	int 10h
	
	mov cx, 466
	mov dx, 275
	int 10h
	
	mov cx, 467
	mov dx, 275
	int 10h
	
	mov cx, 482
	mov dx, 275
	int 10h
	
	mov cx, 483
	mov dx, 275
	int 10h
	
	mov cx, 484
	mov dx, 275
	int 10h
	
	mov cx, 485
	mov dx, 275
	int 10h
	
	mov cx, 486
	mov dx, 275
	int 10h
	
	mov cx, 489
	mov dx, 275
	int 10h
	
	mov cx, 494
	mov dx, 275
	int 10h
	
	mov cx, 498
	mov dx, 275
	int 10h
	
	mov cx, 499
	mov dx, 275
	int 10h
	
	mov cx, 500
	mov dx, 275
	int 10h
	
	mov cx, 502
	mov dx, 275
	int 10h
	
	mov cx, 515
	mov dx, 275
	int 10h
	
	mov cx, 516
	mov dx, 275
	int 10h
	
	mov cx, 517
	mov dx, 275
	int 10h
	
	mov cx, 521
	mov dx, 275
	int 10h
	
	mov cx, 526
	mov dx, 275
	int 10h
	
	mov cx, 530
	mov dx, 275
	int 10h
	
	mov cx, 531
	mov dx, 275
	int 10h
	
	mov cx, 532
	mov dx, 275
	int 10h
	
	mov cx, 533
	mov dx, 275
	int 10h
	
	mov cx, 534
	mov dx, 275
	int 10h
	
	mov cx, 537
	mov dx, 275
	int 10h
	
	mov cx, 542
	mov dx, 275
	int 10h
	
	mov cx, 3
	mov dx, 276
	int 10h
	
	mov cx, 65
	mov dx, 276
	int 10h
	
	mov cx, 107
	mov dx, 276
	int 10h
	
	mov cx, 121
	mov dx, 276
	int 10h
	
	mov cx, 393
	mov dx, 276
	int 10h
	
	mov cx, 417
	mov dx, 276
	int 10h
	
	mov cx, 467
	mov dx, 276
	int 10h
	
	mov cx, 2
	mov dx, 277
	int 10h
	
	mov cx, 3
	mov dx, 277
	int 10h
	
	mov cx, 65
	mov dx, 277
	int 10h
	
	mov cx, 106
	mov dx, 277
	int 10h
	
	mov cx, 121
	mov dx, 277
	int 10h
	
	mov cx, 393
	mov dx, 277
	int 10h
	
	mov cx, 417
	mov dx, 277
	int 10h
	
	mov cx, 466
	mov dx, 277
	int 10h
	
	mov cx, 0
	mov dx, 278
	int 10h
	
	mov cx, 1
	mov dx, 278
	int 10h
	
	mov cx, 2
	mov dx, 278
	int 10h
	
	mov cx, 65
	mov dx, 278
	int 10h
	
	mov cx, 121
	mov dx, 278
	int 10h
	
	mov cx, 393
	mov dx, 278
	int 10h
	
	mov cx, 417
	mov dx, 278
	int 10h
	
	mov cx, 17
	mov dx, 280
	int 10h
	
	mov cx, 18
	mov dx, 280
	int 10h
	
	mov cx, 19
	mov dx, 280
	int 10h
	
	mov cx, 20
	mov dx, 280
	int 10h
	
	mov cx, 75
	mov dx, 280
	int 10h
	
	mov cx, 76
	mov dx, 280
	int 10h
	
	mov cx, 77
	mov dx, 280
	int 10h
	
	mov cx, 78
	mov dx, 280
	int 10h
	
	mov cx, 118
	mov dx, 280
	int 10h
	
	mov cx, 20
	mov dx, 281
	int 10h
	
	mov cx, 74
	mov dx, 281
	int 10h
	
	mov cx, 118
	mov dx, 281
	int 10h
	
	mov cx, 20
	mov dx, 282
	int 10h
	
	mov cx, 42
	mov dx, 282
	int 10h
	
	mov cx, 58
	mov dx, 282
	int 10h
	
	mov cx, 59
	mov dx, 282
	int 10h
	
	mov cx, 60
	mov dx, 282
	int 10h
	
	mov cx, 61
	mov dx, 282
	int 10h
	
	mov cx, 62
	mov dx, 282
	int 10h
	
	mov cx, 74
	mov dx, 282
	int 10h
	
	mov cx, 96
	mov dx, 282
	int 10h
	
	mov cx, 97
	mov dx, 282
	int 10h
	
	mov cx, 101
	mov dx, 282
	int 10h
	
	mov cx, 102
	mov dx, 282
	int 10h
	
	mov cx, 118
	mov dx, 282
	int 10h
	
	mov cx, 2
	mov dx, 283
	int 10h
	
	mov cx, 3
	mov dx, 283
	int 10h
	
	mov cx, 4
	mov dx, 283
	int 10h
	
	mov cx, 5
	mov dx, 283
	int 10h
	
	mov cx, 10
	mov dx, 283
	int 10h
	
	mov cx, 11
	mov dx, 283
	int 10h
	
	mov cx, 12
	mov dx, 283
	int 10h
	
	mov cx, 13
	mov dx, 283
	int 10h
	
	mov cx, 20
	mov dx, 283
	int 10h
	
	mov cx, 26
	mov dx, 283
	int 10h
	
	mov cx, 27
	mov dx, 283
	int 10h
	
	mov cx, 28
	mov dx, 283
	int 10h
	
	mov cx, 29
	mov dx, 283
	int 10h
	
	mov cx, 35
	mov dx, 283
	int 10h
	
	mov cx, 36
	mov dx, 283
	int 10h
	
	mov cx, 37
	mov dx, 283
	int 10h
	
	mov cx, 38
	mov dx, 283
	int 10h
	
	mov cx, 40
	mov dx, 283
	int 10h
	
	mov cx, 41
	mov dx, 283
	int 10h
	
	mov cx, 42
	mov dx, 283
	int 10h
	
	mov cx, 43
	mov dx, 283
	int 10h
	
	mov cx, 44
	mov dx, 283
	int 10h
	
	mov cx, 45
	mov dx, 283
	int 10h
	
	mov cx, 57
	mov dx, 283
	int 10h
	
	mov cx, 66
	mov dx, 283
	int 10h
	
	mov cx, 67
	mov dx, 283
	int 10h
	
	mov cx, 68
	mov dx, 283
	int 10h
	
	mov cx, 72
	mov dx, 283
	int 10h
	
	mov cx, 73
	mov dx, 283
	int 10h
	
	mov cx, 74
	mov dx, 283
	int 10h
	
	mov cx, 75
	mov dx, 283
	int 10h
	
	mov cx, 76
	mov dx, 283
	int 10h
	
	mov cx, 77
	mov dx, 283
	int 10h
	
	mov cx, 78
	mov dx, 283
	int 10h
	
	mov cx, 82
	mov dx, 283
	int 10h
	
	mov cx, 83
	mov dx, 283
	int 10h
	
	mov cx, 84
	mov dx, 283
	int 10h
	
	mov cx, 85
	mov dx, 283
	int 10h
	
	mov cx, 96
	mov dx, 283
	int 10h
	
	mov cx, 97
	mov dx, 283
	int 10h
	
	mov cx, 101
	mov dx, 283
	int 10h
	
	mov cx, 102
	mov dx, 283
	int 10h
	
	mov cx, 106
	mov dx, 283
	int 10h
	
	mov cx, 107
	mov dx, 283
	int 10h
	
	mov cx, 108
	mov dx, 283
	int 10h
	
	mov cx, 109
	mov dx, 283
	int 10h
	
	mov cx, 114
	mov dx, 283
	int 10h
	
	mov cx, 115
	mov dx, 283
	int 10h
	
	mov cx, 116
	mov dx, 283
	int 10h
	
	mov cx, 118
	mov dx, 283
	int 10h
	
	mov cx, 122
	mov dx, 283
	int 10h
	
	mov cx, 123
	mov dx, 283
	int 10h
	
	mov cx, 124
	mov dx, 283
	int 10h
	
	mov cx, 125
	mov dx, 283
	int 10h
	
	mov cx, 1
	mov dx, 284
	int 10h
	
	mov cx, 10
	mov dx, 284
	int 10h
	
	mov cx, 14
	mov dx, 284
	int 10h
	
	mov cx, 20
	mov dx, 284
	int 10h
	
	mov cx, 26
	mov dx, 284
	int 10h
	
	mov cx, 30
	mov dx, 284
	int 10h
	
	mov cx, 34
	mov dx, 284
	int 10h
	
	mov cx, 42
	mov dx, 284
	int 10h
	
	mov cx, 57
	mov dx, 284
	int 10h
	
	mov cx, 69
	mov dx, 284
	int 10h
	
	mov cx, 74
	mov dx, 284
	int 10h
	
	mov cx, 82
	mov dx, 284
	int 10h
	
	mov cx, 86
	mov dx, 284
	int 10h
	
	mov cx, 96
	mov dx, 284
	int 10h
	
	mov cx, 98
	mov dx, 284
	int 10h
	
	mov cx, 100
	mov dx, 284
	int 10h
	
	mov cx, 102
	mov dx, 284
	int 10h
	
	mov cx, 105
	mov dx, 284
	int 10h
	
	mov cx, 110
	mov dx, 284
	int 10h
	
	mov cx, 113
	mov dx, 284
	int 10h
	
	mov cx, 117
	mov dx, 284
	int 10h
	
	mov cx, 118
	mov dx, 284
	int 10h
	
	mov cx, 122
	mov dx, 284
	int 10h
	
	mov cx, 126
	mov dx, 284
	int 10h
	
	mov cx, 1
	mov dx, 285
	int 10h
	
	mov cx, 2
	mov dx, 285
	int 10h
	
	mov cx, 9
	mov dx, 285
	int 10h
	
	mov cx, 14
	mov dx, 285
	int 10h
	
	mov cx, 20
	mov dx, 285
	int 10h
	
	mov cx, 25
	mov dx, 285
	int 10h
	
	mov cx, 30
	mov dx, 285
	int 10h
	
	mov cx, 33
	mov dx, 285
	int 10h
	
	mov cx, 42
	mov dx, 285
	int 10h
	
	mov cx, 58
	mov dx, 285
	int 10h
	
	mov cx, 59
	mov dx, 285
	int 10h
	
	mov cx, 60
	mov dx, 285
	int 10h
	
	mov cx, 69
	mov dx, 285
	int 10h
	
	mov cx, 74
	mov dx, 285
	int 10h
	
	mov cx, 81
	mov dx, 285
	int 10h
	
	mov cx, 86
	mov dx, 285
	int 10h
	
	mov cx, 96
	mov dx, 285
	int 10h
	
	mov cx, 98
	mov dx, 285
	int 10h
	
	mov cx, 100
	mov dx, 285
	int 10h
	
	mov cx, 102
	mov dx, 285
	int 10h
	
	mov cx, 105
	mov dx, 285
	int 10h
	
	mov cx, 110
	mov dx, 285
	int 10h
	
	mov cx, 113
	mov dx, 285
	int 10h
	
	mov cx, 118
	mov dx, 285
	int 10h
	
	mov cx, 121
	mov dx, 285
	int 10h
	
	mov cx, 126
	mov dx, 285
	int 10h
	
	mov cx, 3
	mov dx, 286
	int 10h
	
	mov cx, 4
	mov dx, 286
	int 10h
	
	mov cx, 9
	mov dx, 286
	int 10h
	
	mov cx, 10
	mov dx, 286
	int 10h
	
	mov cx, 11
	mov dx, 286
	int 10h
	
	mov cx, 12
	mov dx, 286
	int 10h
	
	mov cx, 13
	mov dx, 286
	int 10h
	
	mov cx, 14
	mov dx, 286
	int 10h
	
	mov cx, 20
	mov dx, 286
	int 10h
	
	mov cx, 25
	mov dx, 286
	int 10h
	
	mov cx, 26
	mov dx, 286
	int 10h
	
	mov cx, 27
	mov dx, 286
	int 10h
	
	mov cx, 28
	mov dx, 286
	int 10h
	
	mov cx, 29
	mov dx, 286
	int 10h
	
	mov cx, 30
	mov dx, 286
	int 10h
	
	mov cx, 33
	mov dx, 286
	int 10h
	
	mov cx, 42
	mov dx, 286
	int 10h
	
	mov cx, 61
	mov dx, 286
	int 10h
	
	mov cx, 66
	mov dx, 286
	int 10h
	
	mov cx, 67
	mov dx, 286
	int 10h
	
	mov cx, 68
	mov dx, 286
	int 10h
	
	mov cx, 69
	mov dx, 286
	int 10h
	
	mov cx, 74
	mov dx, 286
	int 10h
	
	mov cx, 81
	mov dx, 286
	int 10h
	
	mov cx, 82
	mov dx, 286
	int 10h
	
	mov cx, 83
	mov dx, 286
	int 10h
	
	mov cx, 84
	mov dx, 286
	int 10h
	
	mov cx, 85
	mov dx, 286
	int 10h
	
	mov cx, 86
	mov dx, 286
	int 10h
	
	mov cx, 96
	mov dx, 286
	int 10h
	
	mov cx, 98
	mov dx, 286
	int 10h
	
	mov cx, 100
	mov dx, 286
	int 10h
	
	mov cx, 102
	mov dx, 286
	int 10h
	
	mov cx, 105
	mov dx, 286
	int 10h
	
	mov cx, 110
	mov dx, 286
	int 10h
	
	mov cx, 113
	mov dx, 286
	int 10h
	
	mov cx, 118
	mov dx, 286
	int 10h
	
	mov cx, 121
	mov dx, 286
	int 10h
	
	mov cx, 122
	mov dx, 286
	int 10h
	
	mov cx, 123
	mov dx, 286
	int 10h
	
	mov cx, 124
	mov dx, 286
	int 10h
	
	mov cx, 125
	mov dx, 286
	int 10h
	
	mov cx, 126
	mov dx, 286
	int 10h
	
	mov cx, 5
	mov dx, 287
	int 10h
	
	mov cx, 9
	mov dx, 287
	int 10h
	
	mov cx, 20
	mov dx, 287
	int 10h
	
	mov cx, 25
	mov dx, 287
	int 10h
	
	mov cx, 33
	mov dx, 287
	int 10h
	
	mov cx, 42
	mov dx, 287
	int 10h
	
	mov cx, 62
	mov dx, 287
	int 10h
	
	mov cx, 65
	mov dx, 287
	int 10h
	
	mov cx, 69
	mov dx, 287
	int 10h
	
	mov cx, 74
	mov dx, 287
	int 10h
	
	mov cx, 81
	mov dx, 287
	int 10h
	
	mov cx, 96
	mov dx, 287
	int 10h
	
	mov cx, 99
	mov dx, 287
	int 10h
	
	mov cx, 102
	mov dx, 287
	int 10h
	
	mov cx, 105
	mov dx, 287
	int 10h
	
	mov cx, 110
	mov dx, 287
	int 10h
	
	mov cx, 113
	mov dx, 287
	int 10h
	
	mov cx, 118
	mov dx, 287
	int 10h
	
	mov cx, 121
	mov dx, 287
	int 10h
	
	mov cx, 5
	mov dx, 288
	int 10h
	
	mov cx, 9
	mov dx, 288
	int 10h
	
	mov cx, 20
	mov dx, 288
	int 10h
	
	mov cx, 25
	mov dx, 288
	int 10h
	
	mov cx, 34
	mov dx, 288
	int 10h
	
	mov cx, 42
	mov dx, 288
	int 10h
	
	mov cx, 62
	mov dx, 288
	int 10h
	
	mov cx, 65
	mov dx, 288
	int 10h
	
	mov cx, 69
	mov dx, 288
	int 10h
	
	mov cx, 74
	mov dx, 288
	int 10h
	
	mov cx, 81
	mov dx, 288
	int 10h
	
	mov cx, 96
	mov dx, 288
	int 10h
	
	mov cx, 102
	mov dx, 288
	int 10h
	
	mov cx, 105
	mov dx, 288
	int 10h
	
	mov cx, 110
	mov dx, 288
	int 10h
	
	mov cx, 113
	mov dx, 288
	int 10h
	
	mov cx, 117
	mov dx, 288
	int 10h
	
	mov cx, 118
	mov dx, 288
	int 10h
	
	mov cx, 121
	mov dx, 288
	int 10h
	
	mov cx, 130
	mov dx, 288
	int 10h
	
	mov cx, 131
	mov dx, 288
	int 10h
	
	mov cx, 1
	mov dx, 289
	int 10h
	
	mov cx, 2
	mov dx, 289
	int 10h
	
	mov cx, 3
	mov dx, 289
	int 10h
	
	mov cx, 4
	mov dx, 289
	int 10h
	
	mov cx, 10
	mov dx, 289
	int 10h
	
	mov cx, 11
	mov dx, 289
	int 10h
	
	mov cx, 12
	mov dx, 289
	int 10h
	
	mov cx, 13
	mov dx, 289
	int 10h
	
	mov cx, 14
	mov dx, 289
	int 10h
	
	mov cx, 20
	mov dx, 289
	int 10h
	
	mov cx, 26
	mov dx, 289
	int 10h
	
	mov cx, 27
	mov dx, 289
	int 10h
	
	mov cx, 28
	mov dx, 289
	int 10h
	
	mov cx, 29
	mov dx, 289
	int 10h
	
	mov cx, 30
	mov dx, 289
	int 10h
	
	mov cx, 35
	mov dx, 289
	int 10h
	
	mov cx, 36
	mov dx, 289
	int 10h
	
	mov cx, 37
	mov dx, 289
	int 10h
	
	mov cx, 38
	mov dx, 289
	int 10h
	
	mov cx, 43
	mov dx, 289
	int 10h
	
	mov cx, 44
	mov dx, 289
	int 10h
	
	mov cx, 45
	mov dx, 289
	int 10h
	
	mov cx, 57
	mov dx, 289
	int 10h
	
	mov cx, 58
	mov dx, 289
	int 10h
	
	mov cx, 59
	mov dx, 289
	int 10h
	
	mov cx, 60
	mov dx, 289
	int 10h
	
	mov cx, 61
	mov dx, 289
	int 10h
	
	mov cx, 66
	mov dx, 289
	int 10h
	
	mov cx, 67
	mov dx, 289
	int 10h
	
	mov cx, 68
	mov dx, 289
	int 10h
	
	mov cx, 69
	mov dx, 289
	int 10h
	
	mov cx, 70
	mov dx, 289
	int 10h
	
	mov cx, 74
	mov dx, 289
	int 10h
	
	mov cx, 82
	mov dx, 289
	int 10h
	
	mov cx, 83
	mov dx, 289
	int 10h
	
	mov cx, 84
	mov dx, 289
	int 10h
	
	mov cx, 85
	mov dx, 289
	int 10h
	
	mov cx, 86
	mov dx, 289
	int 10h
	
	mov cx, 96
	mov dx, 289
	int 10h
	
	mov cx, 102
	mov dx, 289
	int 10h
	
	mov cx, 106
	mov dx, 289
	int 10h
	
	mov cx, 107
	mov dx, 289
	int 10h
	
	mov cx, 108
	mov dx, 289
	int 10h
	
	mov cx, 109
	mov dx, 289
	int 10h
	
	mov cx, 114
	mov dx, 289
	int 10h
	
	mov cx, 115
	mov dx, 289
	int 10h
	
	mov cx, 116
	mov dx, 289
	int 10h
	
	mov cx, 118
	mov dx, 289
	int 10h
	
	mov cx, 122
	mov dx, 289
	int 10h
	
	mov cx, 123
	mov dx, 289
	int 10h
	
	mov cx, 124
	mov dx, 289
	int 10h
	
	mov cx, 125
	mov dx, 289
	int 10h
	
	mov cx, 126
	mov dx, 289
	int 10h
	
	mov cx, 130
	mov dx, 289
	int 10h
	
	mov cx, 131
	mov dx, 289
	int 10h
	
	mov cx, 25
	mov dx, 308
	int 10h
	
	mov cx, 43
	mov dx, 308
	int 10h
	
	mov cx, 44
	mov dx, 308
	int 10h
	
	mov cx, 65
	mov dx, 308
	int 10h
	
	mov cx, 66
	mov dx, 308
	int 10h
	
	mov cx, 67
	mov dx, 308
	int 10h
	
	mov cx, 68
	mov dx, 308
	int 10h
	
	mov cx, 83
	mov dx, 308
	int 10h
	
	mov cx, 84
	mov dx, 308
	int 10h
	
	mov cx, 99
	mov dx, 308
	int 10h
	
	mov cx, 100
	mov dx, 308
	int 10h
	
	mov cx, 101
	mov dx, 308
	int 10h
	
	mov cx, 102
	mov dx, 308
	int 10h
	
	mov cx, 147
	mov dx, 308
	int 10h
	
	mov cx, 148
	mov dx, 308
	int 10h
	
	mov cx, 25
	mov dx, 309
	int 10h
	
	mov cx, 43
	mov dx, 309
	int 10h
	
	mov cx, 44
	mov dx, 309
	int 10h
	
	mov cx, 68
	mov dx, 309
	int 10h
	
	mov cx, 83
	mov dx, 309
	int 10h
	
	mov cx, 84
	mov dx, 309
	int 10h
	
	mov cx, 98
	mov dx, 309
	int 10h
	
	mov cx, 147
	mov dx, 309
	int 10h
	
	mov cx, 148
	mov dx, 309
	int 10h
	
	mov cx, 0
	mov dx, 310
	int 10h
	
	mov cx, 1
	mov dx, 310
	int 10h
	
	mov cx, 2
	mov dx, 310
	int 10h
	
	mov cx, 3
	mov dx, 310
	int 10h
	
	mov cx, 4
	mov dx, 310
	int 10h
	
	mov cx, 5
	mov dx, 310
	int 10h
	
	mov cx, 6
	mov dx, 310
	int 10h
	
	mov cx, 25
	mov dx, 310
	int 10h
	
	mov cx, 68
	mov dx, 310
	int 10h
	
	mov cx, 98
	mov dx, 310
	int 10h
	
	mov cx, 138
	mov dx, 310
	int 10h
	
	mov cx, 3
	mov dx, 311
	int 10h
	
	mov cx, 10
	mov dx, 311
	int 10h
	
	mov cx, 11
	mov dx, 311
	int 10h
	
	mov cx, 12
	mov dx, 311
	int 10h
	
	mov cx, 13
	mov dx, 311
	int 10h
	
	mov cx, 19
	mov dx, 311
	int 10h
	
	mov cx, 20
	mov dx, 311
	int 10h
	
	mov cx, 21
	mov dx, 311
	int 10h
	
	mov cx, 22
	mov dx, 311
	int 10h
	
	mov cx, 25
	mov dx, 311
	int 10h
	
	mov cx, 27
	mov dx, 311
	int 10h
	
	mov cx, 28
	mov dx, 311
	int 10h
	
	mov cx, 29
	mov dx, 311
	int 10h
	
	mov cx, 33
	mov dx, 311
	int 10h
	
	mov cx, 35
	mov dx, 311
	int 10h
	
	mov cx, 36
	mov dx, 311
	int 10h
	
	mov cx, 37
	mov dx, 311
	int 10h
	
	mov cx, 41
	mov dx, 311
	int 10h
	
	mov cx, 42
	mov dx, 311
	int 10h
	
	mov cx, 43
	mov dx, 311
	int 10h
	
	mov cx, 44
	mov dx, 311
	int 10h
	
	mov cx, 51
	mov dx, 311
	int 10h
	
	mov cx, 52
	mov dx, 311
	int 10h
	
	mov cx, 53
	mov dx, 311
	int 10h
	
	mov cx, 54
	mov dx, 311
	int 10h
	
	mov cx, 58
	mov dx, 311
	int 10h
	
	mov cx, 59
	mov dx, 311
	int 10h
	
	mov cx, 60
	mov dx, 311
	int 10h
	
	mov cx, 68
	mov dx, 311
	int 10h
	
	mov cx, 81
	mov dx, 311
	int 10h
	
	mov cx, 82
	mov dx, 311
	int 10h
	
	mov cx, 83
	mov dx, 311
	int 10h
	
	mov cx, 84
	mov dx, 311
	int 10h
	
	mov cx, 89
	mov dx, 311
	int 10h
	
	mov cx, 91
	mov dx, 311
	int 10h
	
	mov cx, 92
	mov dx, 311
	int 10h
	
	mov cx, 93
	mov dx, 311
	int 10h
	
	mov cx, 96
	mov dx, 311
	int 10h
	
	mov cx, 97
	mov dx, 311
	int 10h
	
	mov cx, 98
	mov dx, 311
	int 10h
	
	mov cx, 99
	mov dx, 311
	int 10h
	
	mov cx, 100
	mov dx, 311
	int 10h
	
	mov cx, 101
	mov dx, 311
	int 10h
	
	mov cx, 102
	mov dx, 311
	int 10h
	
	mov cx, 106
	mov dx, 311
	int 10h
	
	mov cx, 107
	mov dx, 311
	int 10h
	
	mov cx, 108
	mov dx, 311
	int 10h
	
	mov cx, 109
	mov dx, 311
	int 10h
	
	mov cx, 113
	mov dx, 311
	int 10h
	
	mov cx, 115
	mov dx, 311
	int 10h
	
	mov cx, 116
	mov dx, 311
	int 10h
	
	mov cx, 117
	mov dx, 311
	int 10h
	
	mov cx, 120
	mov dx, 311
	int 10h
	
	mov cx, 122
	mov dx, 311
	int 10h
	
	mov cx, 123
	mov dx, 311
	int 10h
	
	mov cx, 125
	mov dx, 311
	int 10h
	
	mov cx, 126
	mov dx, 311
	int 10h
	
	mov cx, 130
	mov dx, 311
	int 10h
	
	mov cx, 131
	mov dx, 311
	int 10h
	
	mov cx, 132
	mov dx, 311
	int 10h
	
	mov cx, 136
	mov dx, 311
	int 10h
	
	mov cx, 137
	mov dx, 311
	int 10h
	
	mov cx, 138
	mov dx, 311
	int 10h
	
	mov cx, 139
	mov dx, 311
	int 10h
	
	mov cx, 140
	mov dx, 311
	int 10h
	
	mov cx, 141
	mov dx, 311
	int 10h
	
	mov cx, 145
	mov dx, 311
	int 10h
	
	mov cx, 146
	mov dx, 311
	int 10h
	
	mov cx, 147
	mov dx, 311
	int 10h
	
	mov cx, 148
	mov dx, 311
	int 10h
	
	mov cx, 154
	mov dx, 311
	int 10h
	
	mov cx, 155
	mov dx, 311
	int 10h
	
	mov cx, 156
	mov dx, 311
	int 10h
	
	mov cx, 157
	mov dx, 311
	int 10h
	
	mov cx, 161
	mov dx, 311
	int 10h
	
	mov cx, 163
	mov dx, 311
	int 10h
	
	mov cx, 164
	mov dx, 311
	int 10h
	
	mov cx, 165
	mov dx, 311
	int 10h
	
	mov cx, 171
	mov dx, 311
	int 10h
	
	mov cx, 172
	mov dx, 311
	int 10h
	
	mov cx, 3
	mov dx, 312
	int 10h
	
	mov cx, 10
	mov dx, 312
	int 10h
	
	mov cx, 14
	mov dx, 312
	int 10h
	
	mov cx, 18
	mov dx, 312
	int 10h
	
	mov cx, 25
	mov dx, 312
	int 10h
	
	mov cx, 26
	mov dx, 312
	int 10h
	
	mov cx, 30
	mov dx, 312
	int 10h
	
	mov cx, 33
	mov dx, 312
	int 10h
	
	mov cx, 34
	mov dx, 312
	int 10h
	
	mov cx, 38
	mov dx, 312
	int 10h
	
	mov cx, 44
	mov dx, 312
	int 10h
	
	mov cx, 50
	mov dx, 312
	int 10h
	
	mov cx, 61
	mov dx, 312
	int 10h
	
	mov cx, 68
	mov dx, 312
	int 10h
	
	mov cx, 84
	mov dx, 312
	int 10h
	
	mov cx, 89
	mov dx, 312
	int 10h
	
	mov cx, 90
	mov dx, 312
	int 10h
	
	mov cx, 94
	mov dx, 312
	int 10h
	
	mov cx, 98
	mov dx, 312
	int 10h
	
	mov cx, 105
	mov dx, 312
	int 10h
	
	mov cx, 110
	mov dx, 312
	int 10h
	
	mov cx, 113
	mov dx, 312
	int 10h
	
	mov cx, 114
	mov dx, 312
	int 10h
	
	mov cx, 117
	mov dx, 312
	int 10h
	
	mov cx, 120
	mov dx, 312
	int 10h
	
	mov cx, 121
	mov dx, 312
	int 10h
	
	mov cx, 123
	mov dx, 312
	int 10h
	
	mov cx, 124
	mov dx, 312
	int 10h
	
	mov cx, 126
	mov dx, 312
	int 10h
	
	mov cx, 133
	mov dx, 312
	int 10h
	
	mov cx, 138
	mov dx, 312
	int 10h
	
	mov cx, 148
	mov dx, 312
	int 10h
	
	mov cx, 153
	mov dx, 312
	int 10h
	
	mov cx, 158
	mov dx, 312
	int 10h
	
	mov cx, 161
	mov dx, 312
	int 10h
	
	mov cx, 162
	mov dx, 312
	int 10h
	
	mov cx, 166
	mov dx, 312
	int 10h
	
	mov cx, 171
	mov dx, 312
	int 10h
	
	mov cx, 172
	mov dx, 312
	int 10h
	
	mov cx, 3
	mov dx, 313
	int 10h
	
	mov cx, 9
	mov dx, 313
	int 10h
	
	mov cx, 14
	mov dx, 313
	int 10h
	
	mov cx, 17
	mov dx, 313
	int 10h
	
	mov cx, 25
	mov dx, 313
	int 10h
	
	mov cx, 30
	mov dx, 313
	int 10h
	
	mov cx, 33
	mov dx, 313
	int 10h
	
	mov cx, 38
	mov dx, 313
	int 10h
	
	mov cx, 44
	mov dx, 313
	int 10h
	
	mov cx, 49
	mov dx, 313
	int 10h
	
	mov cx, 61
	mov dx, 313
	int 10h
	
	mov cx, 68
	mov dx, 313
	int 10h
	
	mov cx, 84
	mov dx, 313
	int 10h
	
	mov cx, 89
	mov dx, 313
	int 10h
	
	mov cx, 94
	mov dx, 313
	int 10h
	
	mov cx, 98
	mov dx, 313
	int 10h
	
	mov cx, 105
	mov dx, 313
	int 10h
	
	mov cx, 110
	mov dx, 313
	int 10h
	
	mov cx, 113
	mov dx, 313
	int 10h
	
	mov cx, 120
	mov dx, 313
	int 10h
	
	mov cx, 123
	mov dx, 313
	int 10h
	
	mov cx, 126
	mov dx, 313
	int 10h
	
	mov cx, 133
	mov dx, 313
	int 10h
	
	mov cx, 138
	mov dx, 313
	int 10h
	
	mov cx, 148
	mov dx, 313
	int 10h
	
	mov cx, 153
	mov dx, 313
	int 10h
	
	mov cx, 158
	mov dx, 313
	int 10h
	
	mov cx, 161
	mov dx, 313
	int 10h
	
	mov cx, 166
	mov dx, 313
	int 10h
	
	mov cx, 3
	mov dx, 314
	int 10h
	
	mov cx, 9
	mov dx, 314
	int 10h
	
	mov cx, 10
	mov dx, 314
	int 10h
	
	mov cx, 11
	mov dx, 314
	int 10h
	
	mov cx, 12
	mov dx, 314
	int 10h
	
	mov cx, 13
	mov dx, 314
	int 10h
	
	mov cx, 14
	mov dx, 314
	int 10h
	
	mov cx, 17
	mov dx, 314
	int 10h
	
	mov cx, 25
	mov dx, 314
	int 10h
	
	mov cx, 30
	mov dx, 314
	int 10h
	
	mov cx, 33
	mov dx, 314
	int 10h
	
	mov cx, 38
	mov dx, 314
	int 10h
	
	mov cx, 44
	mov dx, 314
	int 10h
	
	mov cx, 49
	mov dx, 314
	int 10h
	
	mov cx, 58
	mov dx, 314
	int 10h
	
	mov cx, 59
	mov dx, 314
	int 10h
	
	mov cx, 60
	mov dx, 314
	int 10h
	
	mov cx, 61
	mov dx, 314
	int 10h
	
	mov cx, 68
	mov dx, 314
	int 10h
	
	mov cx, 84
	mov dx, 314
	int 10h
	
	mov cx, 89
	mov dx, 314
	int 10h
	
	mov cx, 94
	mov dx, 314
	int 10h
	
	mov cx, 98
	mov dx, 314
	int 10h
	
	mov cx, 105
	mov dx, 314
	int 10h
	
	mov cx, 110
	mov dx, 314
	int 10h
	
	mov cx, 113
	mov dx, 314
	int 10h
	
	mov cx, 120
	mov dx, 314
	int 10h
	
	mov cx, 123
	mov dx, 314
	int 10h
	
	mov cx, 126
	mov dx, 314
	int 10h
	
	mov cx, 130
	mov dx, 314
	int 10h
	
	mov cx, 131
	mov dx, 314
	int 10h
	
	mov cx, 132
	mov dx, 314
	int 10h
	
	mov cx, 133
	mov dx, 314
	int 10h
	
	mov cx, 138
	mov dx, 314
	int 10h
	
	mov cx, 148
	mov dx, 314
	int 10h
	
	mov cx, 153
	mov dx, 314
	int 10h
	
	mov cx, 158
	mov dx, 314
	int 10h
	
	mov cx, 161
	mov dx, 314
	int 10h
	
	mov cx, 166
	mov dx, 314
	int 10h
	
	mov cx, 3
	mov dx, 315
	int 10h
	
	mov cx, 9
	mov dx, 315
	int 10h
	
	mov cx, 17
	mov dx, 315
	int 10h
	
	mov cx, 25
	mov dx, 315
	int 10h
	
	mov cx, 30
	mov dx, 315
	int 10h
	
	mov cx, 33
	mov dx, 315
	int 10h
	
	mov cx, 38
	mov dx, 315
	int 10h
	
	mov cx, 44
	mov dx, 315
	int 10h
	
	mov cx, 49
	mov dx, 315
	int 10h
	
	mov cx, 57
	mov dx, 315
	int 10h
	
	mov cx, 61
	mov dx, 315
	int 10h
	
	mov cx, 68
	mov dx, 315
	int 10h
	
	mov cx, 84
	mov dx, 315
	int 10h
	
	mov cx, 89
	mov dx, 315
	int 10h
	
	mov cx, 94
	mov dx, 315
	int 10h
	
	mov cx, 98
	mov dx, 315
	int 10h
	
	mov cx, 105
	mov dx, 315
	int 10h
	
	mov cx, 110
	mov dx, 315
	int 10h
	
	mov cx, 113
	mov dx, 315
	int 10h
	
	mov cx, 120
	mov dx, 315
	int 10h
	
	mov cx, 123
	mov dx, 315
	int 10h
	
	mov cx, 126
	mov dx, 315
	int 10h
	
	mov cx, 129
	mov dx, 315
	int 10h
	
	mov cx, 133
	mov dx, 315
	int 10h
	
	mov cx, 138
	mov dx, 315
	int 10h
	
	mov cx, 148
	mov dx, 315
	int 10h
	
	mov cx, 153
	mov dx, 315
	int 10h
	
	mov cx, 158
	mov dx, 315
	int 10h
	
	mov cx, 161
	mov dx, 315
	int 10h
	
	mov cx, 166
	mov dx, 315
	int 10h
	
	mov cx, 3
	mov dx, 316
	int 10h
	
	mov cx, 9
	mov dx, 316
	int 10h
	
	mov cx, 18
	mov dx, 316
	int 10h
	
	mov cx, 25
	mov dx, 316
	int 10h
	
	mov cx, 30
	mov dx, 316
	int 10h
	
	mov cx, 33
	mov dx, 316
	int 10h
	
	mov cx, 38
	mov dx, 316
	int 10h
	
	mov cx, 44
	mov dx, 316
	int 10h
	
	mov cx, 50
	mov dx, 316
	int 10h
	
	mov cx, 57
	mov dx, 316
	int 10h
	
	mov cx, 61
	mov dx, 316
	int 10h
	
	mov cx, 68
	mov dx, 316
	int 10h
	
	mov cx, 84
	mov dx, 316
	int 10h
	
	mov cx, 89
	mov dx, 316
	int 10h
	
	mov cx, 94
	mov dx, 316
	int 10h
	
	mov cx, 98
	mov dx, 316
	int 10h
	
	mov cx, 105
	mov dx, 316
	int 10h
	
	mov cx, 110
	mov dx, 316
	int 10h
	
	mov cx, 113
	mov dx, 316
	int 10h
	
	mov cx, 120
	mov dx, 316
	int 10h
	
	mov cx, 123
	mov dx, 316
	int 10h
	
	mov cx, 126
	mov dx, 316
	int 10h
	
	mov cx, 129
	mov dx, 316
	int 10h
	
	mov cx, 133
	mov dx, 316
	int 10h
	
	mov cx, 138
	mov dx, 316
	int 10h
	
	mov cx, 148
	mov dx, 316
	int 10h
	
	mov cx, 153
	mov dx, 316
	int 10h
	
	mov cx, 158
	mov dx, 316
	int 10h
	
	mov cx, 161
	mov dx, 316
	int 10h
	
	mov cx, 166
	mov dx, 316
	int 10h
	
	mov cx, 171
	mov dx, 316
	int 10h
	
	mov cx, 172
	mov dx, 316
	int 10h
	
	mov cx, 3
	mov dx, 317
	int 10h
	
	mov cx, 10
	mov dx, 317
	int 10h
	
	mov cx, 11
	mov dx, 317
	int 10h
	
	mov cx, 12
	mov dx, 317
	int 10h
	
	mov cx, 13
	mov dx, 317
	int 10h
	
	mov cx, 14
	mov dx, 317
	int 10h
	
	mov cx, 19
	mov dx, 317
	int 10h
	
	mov cx, 20
	mov dx, 317
	int 10h
	
	mov cx, 21
	mov dx, 317
	int 10h
	
	mov cx, 22
	mov dx, 317
	int 10h
	
	mov cx, 25
	mov dx, 317
	int 10h
	
	mov cx, 30
	mov dx, 317
	int 10h
	
	mov cx, 33
	mov dx, 317
	int 10h
	
	mov cx, 38
	mov dx, 317
	int 10h
	
	mov cx, 44
	mov dx, 317
	int 10h
	
	mov cx, 51
	mov dx, 317
	int 10h
	
	mov cx, 52
	mov dx, 317
	int 10h
	
	mov cx, 53
	mov dx, 317
	int 10h
	
	mov cx, 54
	mov dx, 317
	int 10h
	
	mov cx, 58
	mov dx, 317
	int 10h
	
	mov cx, 59
	mov dx, 317
	int 10h
	
	mov cx, 60
	mov dx, 317
	int 10h
	
	mov cx, 61
	mov dx, 317
	int 10h
	
	mov cx, 62
	mov dx, 317
	int 10h
	
	mov cx, 68
	mov dx, 317
	int 10h
	
	mov cx, 84
	mov dx, 317
	int 10h
	
	mov cx, 89
	mov dx, 317
	int 10h
	
	mov cx, 94
	mov dx, 317
	int 10h
	
	mov cx, 98
	mov dx, 317
	int 10h
	
	mov cx, 106
	mov dx, 317
	int 10h
	
	mov cx, 107
	mov dx, 317
	int 10h
	
	mov cx, 108
	mov dx, 317
	int 10h
	
	mov cx, 109
	mov dx, 317
	int 10h
	
	mov cx, 113
	mov dx, 317
	int 10h
	
	mov cx, 120
	mov dx, 317
	int 10h
	
	mov cx, 123
	mov dx, 317
	int 10h
	
	mov cx, 126
	mov dx, 317
	int 10h
	
	mov cx, 130
	mov dx, 317
	int 10h
	
	mov cx, 131
	mov dx, 317
	int 10h
	
	mov cx, 132
	mov dx, 317
	int 10h
	
	mov cx, 133
	mov dx, 317
	int 10h
	
	mov cx, 134
	mov dx, 317
	int 10h
	
	mov cx, 139
	mov dx, 317
	int 10h
	
	mov cx, 140
	mov dx, 317
	int 10h
	
	mov cx, 141
	mov dx, 317
	int 10h
	
	mov cx, 148
	mov dx, 317
	int 10h
	
	mov cx, 154
	mov dx, 317
	int 10h
	
	mov cx, 155
	mov dx, 317
	int 10h
	
	mov cx, 156
	mov dx, 317
	int 10h
	
	mov cx, 157
	mov dx, 317
	int 10h
	
	mov cx, 161
	mov dx, 317
	int 10h
	
	mov cx, 166
	mov dx, 317
	int 10h
	
	mov cx, 171
	mov dx, 317
	int 10h
	
	mov cx, 172
	mov dx, 317
	int 10h
	
	mov cx, 173
	mov dx, 336
	int 10h
	
	mov cx, 174
	mov dx, 336
	int 10h
	
	mov cx, 521
	mov dx, 336
	int 10h
	
	mov cx, 522
	mov dx, 336
	int 10h
	
	mov cx, 3
	mov dx, 337
	int 10h
	
	mov cx, 11
	mov dx, 337
	int 10h
	
	mov cx, 19
	mov dx, 337
	int 10h
	
	mov cx, 83
	mov dx, 337
	int 10h
	
	mov cx, 84
	mov dx, 337
	int 10h
	
	mov cx, 99
	mov dx, 337
	int 10h
	
	mov cx, 100
	mov dx, 337
	int 10h
	
	mov cx, 107
	mov dx, 337
	int 10h
	
	mov cx, 108
	mov dx, 337
	int 10h
	
	mov cx, 115
	mov dx, 337
	int 10h
	
	mov cx, 116
	mov dx, 337
	int 10h
	
	mov cx, 123
	mov dx, 337
	int 10h
	
	mov cx, 124
	mov dx, 337
	int 10h
	
	mov cx, 131
	mov dx, 337
	int 10h
	
	mov cx, 132
	mov dx, 337
	int 10h
	
	mov cx, 139
	mov dx, 337
	int 10h
	
	mov cx, 140
	mov dx, 337
	int 10h
	
	mov cx, 146
	mov dx, 337
	int 10h
	
	mov cx, 147
	mov dx, 337
	int 10h
	
	mov cx, 148
	mov dx, 337
	int 10h
	
	mov cx, 149
	mov dx, 337
	int 10h
	
	mov cx, 155
	mov dx, 337
	int 10h
	
	mov cx, 156
	mov dx, 337
	int 10h
	
	mov cx, 172
	mov dx, 337
	int 10h
	
	mov cx, 179
	mov dx, 337
	int 10h
	
	mov cx, 180
	mov dx, 337
	int 10h
	
	mov cx, 209
	mov dx, 337
	int 10h
	
	mov cx, 210
	mov dx, 337
	int 10h
	
	mov cx, 211
	mov dx, 337
	int 10h
	
	mov cx, 212
	mov dx, 337
	int 10h
	
	mov cx, 219
	mov dx, 337
	int 10h
	
	mov cx, 220
	mov dx, 337
	int 10h
	
	mov cx, 226
	mov dx, 337
	int 10h
	
	mov cx, 227
	mov dx, 337
	int 10h
	
	mov cx, 228
	mov dx, 337
	int 10h
	
	mov cx, 236
	mov dx, 337
	int 10h
	
	mov cx, 249
	mov dx, 337
	int 10h
	
	mov cx, 250
	mov dx, 337
	int 10h
	
	mov cx, 251
	mov dx, 337
	int 10h
	
	mov cx, 252
	mov dx, 337
	int 10h
	
	mov cx, 267
	mov dx, 337
	int 10h
	
	mov cx, 268
	mov dx, 337
	int 10h
	
	mov cx, 283
	mov dx, 337
	int 10h
	
	mov cx, 284
	mov dx, 337
	int 10h
	
	mov cx, 291
	mov dx, 337
	int 10h
	
	mov cx, 292
	mov dx, 337
	int 10h
	
	mov cx, 299
	mov dx, 337
	int 10h
	
	mov cx, 300
	mov dx, 337
	int 10h
	
	mov cx, 307
	mov dx, 337
	int 10h
	
	mov cx, 308
	mov dx, 337
	int 10h
	
	mov cx, 315
	mov dx, 337
	int 10h
	
	mov cx, 316
	mov dx, 337
	int 10h
	
	mov cx, 323
	mov dx, 337
	int 10h
	
	mov cx, 324
	mov dx, 337
	int 10h
	
	mov cx, 331
	mov dx, 337
	int 10h
	
	mov cx, 332
	mov dx, 337
	int 10h
	
	mov cx, 338
	mov dx, 337
	int 10h
	
	mov cx, 339
	mov dx, 337
	int 10h
	
	mov cx, 355
	mov dx, 337
	int 10h
	
	mov cx, 356
	mov dx, 337
	int 10h
	
	mov cx, 401
	mov dx, 337
	int 10h
	
	mov cx, 402
	mov dx, 337
	int 10h
	
	mov cx, 403
	mov dx, 337
	int 10h
	
	mov cx, 404
	mov dx, 337
	int 10h
	
	mov cx, 405
	mov dx, 337
	int 10h
	
	mov cx, 406
	mov dx, 337
	int 10h
	
	mov cx, 411
	mov dx, 337
	int 10h
	
	mov cx, 412
	mov dx, 337
	int 10h
	
	mov cx, 413
	mov dx, 337
	int 10h
	
	mov cx, 418
	mov dx, 337
	int 10h
	
	mov cx, 419
	mov dx, 337
	int 10h
	
	mov cx, 425
	mov dx, 337
	int 10h
	
	mov cx, 426
	mov dx, 337
	int 10h
	
	mov cx, 427
	mov dx, 337
	int 10h
	
	mov cx, 428
	mov dx, 337
	int 10h
	
	mov cx, 429
	mov dx, 337
	int 10h
	
	mov cx, 430
	mov dx, 337
	int 10h
	
	mov cx, 443
	mov dx, 337
	int 10h
	
	mov cx, 444
	mov dx, 337
	int 10h
	
	mov cx, 459
	mov dx, 337
	int 10h
	
	mov cx, 460
	mov dx, 337
	int 10h
	
	mov cx, 467
	mov dx, 337
	int 10h
	
	mov cx, 468
	mov dx, 337
	int 10h
	
	mov cx, 475
	mov dx, 337
	int 10h
	
	mov cx, 476
	mov dx, 337
	int 10h
	
	mov cx, 483
	mov dx, 337
	int 10h
	
	mov cx, 484
	mov dx, 337
	int 10h
	
	mov cx, 491
	mov dx, 337
	int 10h
	
	mov cx, 492
	mov dx, 337
	int 10h
	
	mov cx, 499
	mov dx, 337
	int 10h
	
	mov cx, 500
	mov dx, 337
	int 10h
	
	mov cx, 507
	mov dx, 337
	int 10h
	
	mov cx, 508
	mov dx, 337
	int 10h
	
	mov cx, 515
	mov dx, 337
	int 10h
	
	mov cx, 516
	mov dx, 337
	int 10h
	
	mov cx, 523
	mov dx, 337
	int 10h
	
	mov cx, 1
	mov dx, 338
	int 10h
	
	mov cx, 3
	mov dx, 338
	int 10h
	
	mov cx, 6
	mov dx, 338
	int 10h
	
	mov cx, 9
	mov dx, 338
	int 10h
	
	mov cx, 11
	mov dx, 338
	int 10h
	
		mov cx, 14
	mov dx, 338
	int 10h
	
	mov cx, 17
	mov dx, 338
	int 10h
	
	mov cx, 19
	mov dx, 338
	int 10h
	
	mov cx, 22
	mov dx, 338
	int 10h
	
	mov cx, 34
	mov dx, 338
	int 10h
	
	mov cx, 35
	mov dx, 338
	int 10h
	
	mov cx, 36
	mov dx, 338
	int 10h
	
	mov cx, 37
	mov dx, 338
	int 10h
	
	mov cx, 38
	mov dx, 338
	int 10h
	
	mov cx, 40
	mov dx, 338
	int 10h
	
	mov cx, 41
	mov dx, 338
	int 10h
	
	mov cx, 42
	mov dx, 338
	int 10h
	
	mov cx, 43
	mov dx, 338
	int 10h
	
	mov cx, 44
	mov dx, 338
	int 10h
	
	mov cx, 45
	mov dx, 338
	int 10h
	
	mov cx, 46
	mov dx, 338
	int 10h
	
	mov cx, 50
	mov dx, 338
	int 10h
	
	mov cx, 51
	mov dx, 338
	int 10h
	
	mov cx, 52
	mov dx, 338
	int 10h
	
	mov cx, 57
	mov dx, 338
	int 10h
	
	mov cx, 58
	mov dx, 338
	int 10h
	
	mov cx, 59
	mov dx, 338
	int 10h
	
	mov cx, 60
	mov dx, 338
	int 10h
	
	mov cx, 61
	mov dx, 338
	int 10h
	
	mov cx, 82
	mov dx, 338
	int 10h
	
	mov cx, 85
	mov dx, 338
	int 10h
	
	mov cx, 98
	mov dx, 338
	int 10h
	
	mov cx, 101
	mov dx, 338
	int 10h
	
	mov cx, 106
	mov dx, 338
	int 10h
	
	mov cx, 109
	mov dx, 338
	int 10h

	mov cx, 114
	mov dx, 338
	int 10h
	
	mov cx, 117
	mov dx, 338
	int 10h
	
	mov cx, 122
	mov dx, 338
	int 10h
	
	mov cx, 125
	mov dx, 338
	int 10h
	
	mov cx, 130
	mov dx, 338
	int 10h
	
	mov cx, 133
	mov dx, 338
	int 10h
	
	mov cx, 138
	mov dx, 338
	int 10h
	
	mov cx, 141
	mov dx, 338
	int 10h
	
	mov cx, 146
	mov dx, 338
	int 10h
	
	mov cx, 154
	mov dx, 338
	int 10h
	
	mov cx, 157
	mov dx, 338
	int 10h
	
	mov cx, 171
	mov dx, 338
	int 10h
	
	mov cx, 178
	mov dx, 338
	int 10h
	
	mov cx, 181
	mov dx, 338
	int 10h
	
	mov cx, 193
	mov dx, 338
	int 10h
	
	mov cx, 194
	mov dx, 338
	int 10h
	
	mov cx, 195
	mov dx, 338
	int 10h
	
	mov cx, 196
	mov dx, 338
	int 10h
	
	mov cx, 197
	mov dx, 338
	int 10h
	
	mov cx, 198
	mov dx, 338
	int 10h
	
	mov cx, 201
	mov dx, 338
	int 10h
	
	mov cx, 202
	mov dx, 338
	int 10h
	
	mov cx, 203
	mov dx, 338
	int 10h
	
	mov cx, 204
	mov dx, 338
	int 10h
	
	mov cx, 213
	mov dx, 338
	int 10h
	
	mov cx, 218
	mov dx, 338
	int 10h
	
	mov cx, 221
	mov dx, 338
	int 10h
	
	mov cx, 225
	mov dx, 338
	int 10h
	
	mov cx, 229
	mov dx, 338
	int 10h
	
	mov cx, 235
	mov dx, 338
	int 10h
	
	mov cx, 236
	mov dx, 338
	int 10h
	
	mov cx, 242
	mov dx, 338
	int 10h
	
	mov cx, 243
	mov dx, 338
	int 10h
	
	mov cx, 244
	mov dx, 338
	int 10h
	
	mov cx, 245
	mov dx, 338
	int 10h
	
	mov cx, 246
	mov dx, 338
	int 10h
	
	mov cx, 253
	mov dx, 338
	int 10h
	
	mov cx, 266
	mov dx, 338
	int 10h
	
	mov cx, 269
	mov dx, 338
	int 10h
	
	mov cx, 282
	mov dx, 338
	int 10h
	
	mov cx, 285
	mov dx, 338
	int 10h
	
	mov cx, 290
	mov dx, 338
	int 10h
	
	mov cx, 293
	mov dx, 338
	int 10h
	
	mov cx, 298
	mov dx, 338
	int 10h
	
	mov cx, 301
	mov dx, 338
	int 10h
	
	mov cx, 306
	mov dx, 338
	int 10h
	
	mov cx, 309
	mov dx, 338
	int 10h
	
	mov cx, 314
	mov dx, 338
	int 10h
	
	mov cx, 317
	mov dx, 338
	int 10h
	
	mov cx, 322
	mov dx, 338
	int 10h
	
	mov cx, 325
	mov dx, 338
	int 10h
	
	mov cx, 330
	mov dx, 338
	int 10h
	
	mov cx, 333
	mov dx, 338
	int 10h
	
	mov cx, 336
	mov dx, 338
	int 10h
	
	mov cx, 337
	mov dx, 338
	int 10h
	
	mov cx, 339
	mov dx, 338
	int 10h
	
	mov cx, 354
	mov dx, 338
	int 10h
	
	mov cx, 357
	mov dx, 338
	int 10h
	
	mov cx, 369
	mov dx, 338
	int 10h
	
	mov cx, 370
	mov dx, 338
	int 10h
	
	mov cx, 371
	mov dx, 338
	int 10h
	
	mov cx, 372
	mov dx, 338
	int 10h
	
	mov cx, 373
	mov dx, 338
	int 10h
	
	mov cx, 374
	mov dx, 338
	int 10h
	
	mov cx, 377
	mov dx, 338
	int 10h
	
	mov cx, 378
	mov dx, 338
	int 10h
	
	mov cx, 379
	mov dx, 338
	int 10h
	
	mov cx, 380
	mov dx, 338
	int 10h
	
	mov cx, 381
	mov dx, 338
	int 10h
	
	mov cx, 385
	mov dx, 338
	int 10h
	
	mov cx, 386
	mov dx, 338
	int 10h
	
	mov cx, 387
	mov dx, 338
	int 10h
	
	mov cx, 388
	mov dx, 338
	int 10h
	
	mov cx, 389
	mov dx, 338
	int 10h
	
	mov cx, 390
	mov dx, 338
	int 10h
	
	mov cx, 393
	mov dx, 338
	int 10h
	
	mov cx, 394
	mov dx, 338
	int 10h
	
	mov cx, 395
	mov dx, 338
	int 10h
	
	mov cx, 396
	mov dx, 338
	int 10h
	
	mov cx, 397
	mov dx, 338
	int 10h
	
	mov cx, 398
	mov dx, 338
	int 10h
	
	mov cx, 406
	mov dx, 338
	int 10h
	
	mov cx, 410
	mov dx, 338
	int 10h
	
	mov cx, 416
	mov dx, 338
	int 10h
	
	mov cx, 417
	mov dx, 338
	int 10h
	
	mov cx, 419
	mov dx, 338
	int 10h
	
	mov cx, 430
	mov dx, 338
	int 10h
	
	mov cx, 442
	mov dx, 338
	int 10h
	
	mov cx, 445
	mov dx, 338
	int 10h
	
	mov cx, 458
	mov dx, 338
	int 10h
	
	mov cx, 461
	mov dx, 338
	int 10h
	
	mov cx, 466
	mov dx, 338
	int 10h
	
	mov cx, 469
	mov dx, 338
	int 10h
	
	mov cx, 474
	mov dx, 338
	int 10h
	
	mov cx, 477
	mov dx, 338
	int 10h
	
	mov cx, 482
	mov dx, 338
	int 10h
	
	mov cx, 485
	mov dx, 338
	int 10h
	
	mov cx, 490
	mov dx, 338
	int 10h
	
	mov cx, 493
	mov dx, 338
	int 10h
	
	mov cx, 498
	mov dx, 338
	int 10h
	
	mov cx, 501
	mov dx, 338
	int 10h
	
	mov cx, 506
	mov dx, 338
	int 10h
	
	mov cx, 509
	mov dx, 338
	int 10h
	
	mov cx, 514
	mov dx, 338
	int 10h
	
	mov cx, 517
	mov dx, 338
	int 10h
	
	mov cx, 524
	mov dx, 338
	int 10h
	
	mov cx, 2
	mov dx, 339
	int 10h
	
	mov cx, 5
	mov dx, 339
	int 10h
	
	mov cx, 10
	mov dx, 339
	int 10h
	
	mov cx, 13
	mov dx, 339
	int 10h
	
	mov cx, 18
	mov dx, 339
	int 10h
	
	mov cx, 21
	mov dx, 339
	int 10h
	
	mov cx, 33
	mov dx, 339
	int 10h
	
	mov cx, 43
	mov dx, 339
	int 10h
	
	mov cx, 49
	mov dx, 339
	int 10h
	
	mov cx, 53
	mov dx, 339
	int 10h
	
	mov cx, 57
	mov dx, 339
	int 10h
	
	mov cx, 62
	mov dx, 339
	int 10h
	
	mov cx, 67
	mov dx, 339
	int 10h
	
	mov cx, 68
	mov dx, 339
	int 10h
	
	mov cx, 81
	mov dx, 339
	int 10h
	
	mov cx, 86
	mov dx, 339
	int 10h
	
	mov cx, 89
	mov dx, 339
	int 10h
	
	mov cx, 94
	mov dx, 339
	int 10h
	
	mov cx, 97
	mov dx, 339
	int 10h
	
	mov cx, 102
	mov dx, 339
	int 10h
	
	mov cx, 105
	mov dx, 339
	int 10h
	
	mov cx, 110
	mov dx, 339
	int 10h
	
	mov cx, 113
	mov dx, 339
	int 10h
	
	mov cx, 118
	mov dx, 339
	int 10h
	
	mov cx, 121
	mov dx, 339
	int 10h
	
	mov cx, 126
	mov dx, 339
	int 10h
	
	mov cx, 129
	mov dx, 339
	int 10h
	
	mov cx, 134
	mov dx, 339
	int 10h
	
	mov cx, 137
	mov dx, 339
	int 10h
	
	mov cx, 142
	mov dx, 339
	int 10h
	
	mov cx, 146
	mov dx, 339
	int 10h
	
	mov cx, 153
	mov dx, 339
	int 10h
	
	mov cx, 158
	mov dx, 339
	int 10h
	
	mov cx, 170
	mov dx, 339
	int 10h
	
	mov cx, 171
	mov dx, 339
	int 10h
	
	mov cx, 177
	mov dx, 339
	int 10h
	
	mov cx, 182
	mov dx, 339
	int 10h
	
	mov cx, 185
	mov dx, 339
	int 10h
	
	mov cx, 190
	mov dx, 339
	int 10h
	
	mov cx, 193
	mov dx, 339
	int 10h
	
	mov cx, 201
	mov dx, 339
	int 10h
	
	mov cx, 205
	mov dx, 339
	int 10h
	
	mov cx, 213
	mov dx, 339
	int 10h
	
	mov cx, 217
	mov dx, 339
	int 10h
	
	mov cx, 222
	mov dx, 339
	int 10h
	
	mov cx, 225
	mov dx, 339
	int 10h
	
	mov cx, 230
	mov dx, 339
	int 10h
	
	mov cx, 234
	mov dx, 339
	int 10h
	
	mov cx, 236
	mov dx, 339
	int 10h
	
	mov cx, 241
	mov dx, 339
	int 10h
	
	mov cx, 253
	mov dx, 339
	int 10h
	
	mov cx, 265
	mov dx, 339
	int 10h
	
	mov cx, 270
	mov dx, 339
	int 10h
	
	mov cx, 273
	mov dx, 339
	int 10h
	
	mov cx, 278
	mov dx, 339
	int 10h
	
	mov cx, 281
	mov dx, 339
	int 10h
	
	mov cx, 286
	mov dx, 339
	int 10h
	
	mov cx, 289
	mov dx, 339
	int 10h
	
	mov cx, 294
	mov dx, 339
	int 10h
	
	mov cx, 297
	mov dx, 339
	int 10h
	
	mov cx, 302
	mov dx, 339
	int 10h
	
	mov cx, 305
	mov dx, 339
	int 10h
	
	mov cx, 310
	mov dx, 339
	int 10h
	
	mov cx, 313
	mov dx, 339
	int 10h
	
	mov cx, 318
	mov dx, 339
	int 10h
	
	mov cx, 321
	mov dx, 339
	int 10h
	
	mov cx, 326
	mov dx, 339
	int 10h
	
	mov cx, 329
	mov dx, 339
	int 10h
	
	mov cx, 334
	mov dx, 339
	int 10h
	
	mov cx, 339
	mov dx, 339
	int 10h
	
	mov cx, 353
	mov dx, 339
	int 10h
	
	mov cx, 358
	mov dx, 339
	int 10h
	
	mov cx, 361
	mov dx, 339
	int 10h
	
	mov cx, 366
	mov dx, 339
	int 10h
	
	mov cx, 369
	mov dx, 339
	int 10h
	
	mov cx, 377
	mov dx, 339
	int 10h
	
	mov cx, 382
	mov dx, 339
	int 10h
	
	mov cx, 385
	mov dx, 339
	int 10h
	
	mov cx, 393
	mov dx, 339
	int 10h
	
	mov cx, 405
	mov dx, 339
	int 10h
	
	mov cx, 409
	mov dx, 339
	int 10h
	
	mov cx, 419
	mov dx, 339
	int 10h
	
	mov cx, 429
	mov dx, 339
	int 10h
	
	mov cx, 441
	mov dx, 339
	int 10h
	
	mov cx, 446
	mov dx, 339
	int 10h
	
	mov cx, 449
	mov dx, 339
	int 10h
	
	mov cx, 454
	mov dx, 339
	int 10h
	
	mov cx, 457
	mov dx, 339
	int 10h
	
	mov cx, 462
	mov dx, 339
	int 10h
	
	mov cx, 465
	mov dx, 339
	int 10h
	
	mov cx, 470
	mov dx, 339
	int 10h
	
	mov cx, 473
	mov dx, 339
	int 10h
	
	mov cx, 478
	mov dx, 339
	int 10h
	
	mov cx, 481
	mov dx, 339
	int 10h
	
	mov cx, 486
	mov dx, 339
	int 10h
	
	mov cx, 489
	mov dx, 339
	int 10h
	
	mov cx, 494
	mov dx, 339
	int 10h
	
	mov cx, 497
	mov dx, 339
	int 10h
	
	mov cx, 502
	mov dx, 339
	int 10h
	
	mov cx, 505
	mov dx, 339
	int 10h
	
	mov cx, 510
	mov dx, 339
	int 10h
	
	mov cx, 513
	mov dx, 339
	int 10h
	
	mov cx, 518
	mov dx, 339
	int 10h
	
	mov cx, 525
	mov dx, 339
	int 10h
	
	mov cx, 2
	mov dx, 340
	int 10h
	
	mov cx, 3
	mov dx, 340
	int 10h
	
	mov cx, 4
	mov dx, 340
	int 10h
	
	mov cx, 5
	mov dx, 340
	int 10h
	
	mov cx, 10
	mov dx, 340
	int 10h
	
	mov cx, 11
	mov dx, 340
	int 10h
	
	mov cx, 12
	mov dx, 340
	int 10h
	
	mov cx, 13
	mov dx, 340
	int 10h
	
	mov cx, 18
	mov dx, 340
	int 10h
	
	mov cx, 19
	mov dx, 340
	int 10h
	
	mov cx, 20
	mov dx, 340
	int 10h
	
	mov cx, 21
	mov dx, 340
	int 10h
	
	mov cx, 33
	mov dx, 340
	int 10h
	
	mov cx, 43
	mov dx, 340
	int 10h
	
	mov cx, 48
	mov dx, 340
	int 10h
	
	mov cx, 54
	mov dx, 340
	int 10h
	
	mov cx, 57
	mov dx, 340
	int 10h
	
	mov cx, 62
	mov dx, 340
	int 10h
	
	mov cx, 67
	mov dx, 340
	int 10h
	
	mov cx, 68
	mov dx, 340
	int 10h
	
	mov cx, 81
	mov dx, 340
	int 10h
	
	mov cx, 86
	mov dx, 340
	int 10h
	
	mov cx, 90
	mov dx, 340
	int 10h
	
	mov cx, 93
	mov dx, 340
	int 10h
	
	mov cx, 97
	mov dx, 340
	int 10h
	
	mov cx, 102
	mov dx, 340
	int 10h
	
	mov cx, 105
	mov dx, 340
	int 10h
	
	mov cx, 110
	mov dx, 340
	int 10h
	
	mov cx, 113
	mov dx, 340
	int 10h
	
	mov cx, 118
	mov dx, 340
	int 10h
	
	mov cx, 121
	mov dx, 340
	int 10h
	
	mov cx, 126
	mov dx, 340
	int 10h
	
	mov cx, 129
	mov dx, 340
	int 10h
	
	mov cx, 134
	mov dx, 340
	int 10h
	
	mov cx, 137
	mov dx, 340
	int 10h
	
	mov cx, 142
	mov dx, 340
	int 10h
	
	mov cx, 146
	mov dx, 340
	int 10h
	
	mov cx, 147
	mov dx, 340
	int 10h
	
	mov cx, 148
	mov dx, 340
	int 10h
	
	mov cx, 153
	mov dx, 340
	int 10h
	
	mov cx, 158
	mov dx, 340
	int 10h
	
	mov cx, 170
	mov dx, 340
	int 10h
	
	mov cx, 177
	mov dx, 340
	int 10h
	
	mov cx, 182
	mov dx, 340
	int 10h
	
	mov cx, 186
	mov dx, 340
	int 10h
	
	mov cx, 189
	mov dx, 340
	int 10h
	
	mov cx, 193
	mov dx, 340
	int 10h
	
	mov cx, 201
	mov dx, 340
	int 10h
	
	mov cx, 206
	mov dx, 340
	int 10h
	
	mov cx, 212
	mov dx, 340
	int 10h
	
	mov cx, 217
	mov dx, 340
	int 10h
	
	mov cx, 222
	mov dx, 340
	int 10h
	
	mov cx, 225
	mov dx, 340
	int 10h
	
	mov cx, 230
	mov dx, 340
	int 10h
	
	mov cx, 234
	mov dx, 340
	int 10h
	
	mov cx, 236
	mov dx, 340
	int 10h
	
	mov cx, 240
	mov dx, 340
	int 10h
	
	mov cx, 253
	mov dx, 340
	int 10h
	
	mov cx, 265
	mov dx, 340
	int 10h
	
	mov cx, 270
	mov dx, 340
	int 10h
	
	mov cx, 274
	mov dx, 340
	int 10h
	
	mov cx, 277
	mov dx, 340
	int 10h
	
	mov cx, 281
	mov dx, 340
	int 10h
	
	mov cx, 286
	mov dx, 340
	int 10h
	
	mov cx, 289
	mov dx, 340
	int 10h
	
	mov cx, 294
	mov dx, 340
	int 10h
	
	mov cx, 297
	mov dx, 340
	int 10h
	
	mov cx, 302
	mov dx, 340
	int 10h
	
	mov cx, 305
	mov dx, 340
	int 10h
	
	mov cx, 310
	mov dx, 340
	int 10h
	
	mov cx, 313
	mov dx, 340
	int 10h
	
	mov cx, 318
	mov dx, 340
	int 10h
	
	mov cx, 321
	mov dx, 340
	int 10h
	
	mov cx, 326
	mov dx, 340
	int 10h
	
	mov cx, 329
	mov dx, 340
	int 10h
	
	mov cx, 334
	mov dx, 340
	int 10h
	
	mov cx, 339
	mov dx, 340
	int 10h
	
	mov cx, 353
	mov dx, 340
	int 10h
	
	mov cx, 358
	mov dx, 340
	int 10h
	
	mov cx, 362
	mov dx, 340
	int 10h
	
	mov cx, 365
	mov dx, 340
	int 10h
	
	mov cx, 369
	mov dx, 340
	int 10h
	
	mov cx, 377
	mov dx, 340
	int 10h
	
	mov cx, 382
	mov dx, 340
	int 10h
	
	mov cx, 385
	mov dx, 340
	int 10h
	
	mov cx, 393
	mov dx, 340
	int 10h
	
	mov cx, 404
	mov dx, 340
	int 10h
	
	mov cx, 409
	mov dx, 340
	int 10h
	
	mov cx, 411
	mov dx, 340
	int 10h
	
	mov cx, 412
	mov dx, 340
	int 10h
	
	mov cx, 413
	mov dx, 340
	int 10h
	
	mov cx, 419
	mov dx, 340
	int 10h
	
	mov cx, 428
	mov dx, 340
	int 10h
	
	mov cx, 441
	mov dx, 340
	int 10h
	
	mov cx, 446
	mov dx, 340
	int 10h
	
	mov cx, 450
	mov dx, 340
	int 10h
	
	mov cx, 453
	mov dx, 340
	int 10h
	
	mov cx, 457
	mov dx, 340
	int 10h
	
	mov cx, 462
	mov dx, 340
	int 10h
	
	mov cx, 465
	mov dx, 340
	int 10h
	
	mov cx, 470
	mov dx, 340
	int 10h
	
	mov cx, 473
	mov dx, 340
	int 10h
	
	mov cx, 478
	mov dx, 340
	int 10h
	
	mov cx, 481
	mov dx, 340
	int 10h
	
	mov cx, 486
	mov dx, 340
	int 10h
	
	mov cx, 489
	mov dx, 340
	int 10h
	
	mov cx, 494
	mov dx, 340
	int 10h
	
	mov cx, 497
	mov dx, 340
	int 10h
	
	mov cx, 502
	mov dx, 340
	int 10h
	
	mov cx, 505
	mov dx, 340
	int 10h
	
	mov cx, 510
	mov dx, 340
	int 10h
	
	mov cx, 513
	mov dx, 340
	int 10h
	
	mov cx, 518
	mov dx, 340
	int 10h
	
	mov cx, 525
	mov dx, 340
	int 10h
	
	mov cx, 2
	mov dx, 341
	int 10h
	
	mov cx, 5
	mov dx, 341
	int 10h
	
	mov cx, 10
	mov dx, 341
	int 10h
	
	mov cx, 13
	mov dx, 341
	int 10h
	
	mov cx, 18
	mov dx, 341
	int 10h
	
	mov cx, 21
	mov dx, 341
	int 10h
	
	mov cx, 34
	mov dx, 341
	int 10h
	
	mov cx, 35
	mov dx, 341
	int 10h
	
	mov cx, 36
	mov dx, 341
	int 10h
	
	mov cx, 43
	mov dx, 341
	int 10h
	
	mov cx, 48
	mov dx, 341
	int 10h
	
	mov cx, 54
	mov dx, 341
	int 10h
	
	mov cx, 57
	mov dx, 341
	int 10h
	
	mov cx, 62
	mov dx, 341
	int 10h
	
	mov cx, 81
	mov dx, 341
	int 10h
	
	mov cx, 86
	mov dx, 341
	int 10h
	
	mov cx, 91
	mov dx, 341
	int 10h
	
	mov cx, 92
	mov dx, 341
	int 10h
	
	mov cx, 97
	mov dx, 341
	int 10h
	
	mov cx, 102
	mov dx, 341
	int 10h
	
	mov cx, 105
	mov dx, 341
	int 10h
	
	mov cx, 110
	mov dx, 341
	int 10h
	
	mov cx, 113
	mov dx, 341
	int 10h
	
	mov cx, 118
	mov dx, 341
	int 10h
	
	mov cx, 121
	mov dx, 341
	int 10h
	
	mov cx, 126
	mov dx, 341
	int 10h
	
	mov cx, 129
	mov dx, 341
	int 10h
	
	mov cx, 134
	mov dx, 341
	int 10h
	
	mov cx, 137
	mov dx, 341
	int 10h
	
	mov cx, 142
	mov dx, 341
	int 10h
	
	mov cx, 149
	mov dx, 341
	int 10h
	
	mov cx, 153
	mov dx, 341
	int 10h
	
	mov cx, 158
	mov dx, 341
	int 10h
	
	mov cx, 170
	mov dx, 341
	int 10h
	
	mov cx, 177
	mov dx, 341
	int 10h
	
	mov cx, 182
	mov dx, 341
	int 10h
	
	mov cx, 187
	mov dx, 341
	int 10h
	
	mov cx, 188
	mov dx, 341
	int 10h
	
	mov cx, 193
	mov dx, 341
	int 10h
	
	mov cx, 201
	mov dx, 341
	int 10h
	
	mov cx, 206
	mov dx, 341
	int 10h
	
	mov cx, 210
	mov dx, 341
	int 10h
	
	mov cx, 211
	mov dx, 341
	int 10h
	
	mov cx, 217
	mov dx, 341
	int 10h
	
	mov cx, 222
	mov dx, 341
	int 10h
	
	mov cx, 225
	mov dx, 341
	int 10h
	
	mov cx, 229
	mov dx, 341
	int 10h
	
	mov cx, 230
	mov dx, 341
	int 10h
	
	mov cx, 233
	mov dx, 341
	int 10h
	
	mov cx, 236
	mov dx, 341
	int 10h
	
	mov cx, 240
	mov dx, 341
	int 10h
	
	mov cx, 252
	mov dx, 341
	int 10h
	
	mov cx, 265
	mov dx, 341
	int 10h
	
	mov cx, 270
	mov dx, 341
	int 10h
	
	mov cx, 275
	mov dx, 341
	int 10h
	
	mov cx, 276
	mov dx, 341
	int 10h
	
	mov cx, 281
	mov dx, 341
	int 10h
	
	mov cx, 286
	mov dx, 341
	int 10h
	
	mov cx, 289
	mov dx, 341
	int 10h
	
	mov cx, 294
	mov dx, 341
	int 10h
	
	mov cx, 297
	mov dx, 341
	int 10h
	
	mov cx, 302
	mov dx, 341
	int 10h
	
	mov cx, 305
	mov dx, 341
	int 10h
	
	mov cx, 310
	mov dx, 341
	int 10h
	
	mov cx, 313
	mov dx, 341
	int 10h
	
	mov cx, 318
	mov dx, 341
	int 10h
	
	mov cx, 321
	mov dx, 341
	int 10h
	
	mov cx, 326
	mov dx, 341
	int 10h
	
	mov cx, 329
	mov dx, 341
	int 10h
	
	mov cx, 334
	mov dx, 341
	int 10h
	
	mov cx, 339
	mov dx, 341
	int 10h
	
	mov cx, 353
	mov dx, 341
	int 10h
	
	mov cx, 358
	mov dx, 341
	int 10h
	
	mov cx, 363
	mov dx, 341
	int 10h
	
	mov cx, 364
	mov dx, 341
	int 10h
	
	mov cx, 369
	mov dx, 341
	int 10h
	
	mov cx, 377
	mov dx, 341
	int 10h
	
	mov cx, 378
	mov dx, 341
	int 10h
	
	mov cx, 379
	mov dx, 341
	int 10h
	
	mov cx, 380
	mov dx, 341
	int 10h
	
	mov cx, 381
	mov dx, 341
	int 10h
	
	mov cx, 385
	mov dx, 341
	int 10h
	
	mov cx, 393
	mov dx, 341
	int 10h
	
	mov cx, 404
	mov dx, 341
	int 10h
	
	mov cx, 409
	mov dx, 341
	int 10h
	
	mov cx, 410
	mov dx, 341
	int 10h
	
	mov cx, 414
	mov dx, 341
	int 10h
	
	mov cx, 419
	mov dx, 341
	int 10h
	
	mov cx, 428
	mov dx, 341
	int 10h
	
	mov cx, 441
	mov dx, 341
	int 10h
	
	mov cx, 446
	mov dx, 341
	int 10h
	
	mov cx, 451
	mov dx, 341
	int 10h
	
	mov cx, 452
	mov dx, 341
	int 10h
	
	mov cx, 457
	mov dx, 341
	int 10h
	
	mov cx, 462
	mov dx, 341
	int 10h
	
	mov cx, 465
	mov dx, 341
	int 10h
	
	mov cx, 470
	mov dx, 341
	int 10h
	
	mov cx, 473
	mov dx, 341
	int 10h
	
	mov cx, 478
	mov dx, 341
	int 10h
	
	mov cx, 481
	mov dx, 341
	int 10h
	
	mov cx, 486
	mov dx, 341
	int 10h
	
	mov cx, 489
	mov dx, 341
	int 10h
	
	mov cx, 494
	mov dx, 341
	int 10h
	
	mov cx, 497
	mov dx, 341
	int 10h
	
	mov cx, 502
	mov dx, 341
	int 10h
	
	mov cx, 505
	mov dx, 341
	int 10h
	
	mov cx, 510
	mov dx, 341
	int 10h
	
	mov cx, 513
	mov dx, 341
	int 10h
	
	mov cx, 518
	mov dx, 341
	int 10h
	
	mov cx, 525
	mov dx, 341
	int 10h
	
	mov cx, 37
	mov dx, 342
	int 10h
	
	mov cx, 43
	mov dx, 342
	int 10h
	
	mov cx, 48
	mov dx, 342
	int 10h
	
	mov cx, 54
	mov dx, 342
	int 10h
	
	mov cx, 57
	mov dx, 342
	int 10h
	
	mov cx, 58
	mov dx, 342
	int 10h
	
	mov cx, 59
	mov dx, 342
	int 10h
	
	mov cx, 60
	mov dx, 342
	int 10h
	
	mov cx, 61
	mov dx, 342
	int 10h
	
	mov cx, 81
	mov dx, 342
	int 10h
	
	mov cx, 86
	mov dx, 342
	int 10h
	
	mov cx, 91
	mov dx, 342
	int 10h
	
	mov cx, 92
	mov dx, 342
	int 10h
	
	mov cx, 97
	mov dx, 342
	int 10h
	
	mov cx, 102
	mov dx, 342
	int 10h
	
	mov cx, 105
	mov dx, 342
	int 10h
	
	mov cx, 110
	mov dx, 342
	int 10h
	
	mov cx, 113
	mov dx, 342
	int 10h
	
	mov cx, 118
	mov dx, 342
	int 10h
	
	mov cx, 121
	mov dx, 342
	int 10h
	
	mov cx, 126
	mov dx, 342
	int 10h
	
	mov cx, 129
	mov dx, 342
	int 10h
	
	mov cx, 134
	mov dx, 342
	int 10h
	
	mov cx, 137
	mov dx, 342
	int 10h
	
	mov cx, 142
	mov dx, 342
	int 10h
	
	mov cx, 149
	mov dx, 342
	int 10h
	
	mov cx, 153
	mov dx, 342
	int 10h
	
	mov cx, 158
	mov dx, 342
	int 10h
	
	mov cx, 170
	mov dx, 342
	int 10h
	
	mov cx, 177
	mov dx, 342
	int 10h
	
	mov cx, 182
	mov dx, 342
	int 10h
	
	mov cx, 187
	mov dx, 342
	int 10h
	
	mov cx, 188
	mov dx, 342
	int 10h
	
	mov cx, 193
	mov dx, 342
	int 10h
	
	mov cx, 194
	mov dx, 342
	int 10h
	
	mov cx, 195
	mov dx, 342
	int 10h
	
	mov cx, 196
	mov dx, 342
	int 10h
	
	mov cx, 197
	mov dx, 342
	int 10h
	
	mov cx, 201
	mov dx, 342
	int 10h
	
	mov cx, 206
	mov dx, 342
	int 10h
	
	mov cx, 212
	mov dx, 342
	int 10h
	
	mov cx, 213
	mov dx, 342
	int 10h
	
	mov cx, 217
	mov dx, 342
	int 10h
	
	mov cx, 222
	mov dx, 342
	int 10h
	
	mov cx, 226
	mov dx, 342
	int 10h
	
	mov cx, 227
	mov dx, 342
	int 10h
	
	mov cx, 228
	mov dx, 342
	int 10h
	
	mov cx, 230
	mov dx, 342
	int 10h
	
	mov cx, 232
	mov dx, 342
	int 10h
	
	mov cx, 236
	mov dx, 342
	int 10h
	
	mov cx, 240
	mov dx, 342
	int 10h
	
	mov cx, 251
	mov dx, 342
	int 10h
	
	mov cx, 265
	mov dx, 342
	int 10h
	
	mov cx, 270
	mov dx, 342
	int 10h
	
	mov cx, 275
	mov dx, 342
	int 10h
	
	mov cx, 276
	mov dx, 342
	int 10h
	
	mov cx, 281
	mov dx, 342
	int 10h
	
	mov cx, 286
	mov dx, 342
	int 10h
	
	mov cx, 289
	mov dx, 342
	int 10h
	
	mov cx, 294
	mov dx, 342
	int 10h
	
	mov cx, 297
	mov dx, 342
	int 10h
	
	mov cx, 302
	mov dx, 342
	int 10h
	
	mov cx, 305
	mov dx, 342
	int 10h
	
	mov cx, 310
	mov dx, 342
	int 10h
	
	mov cx, 313
	mov dx, 342
	int 10h
	
	mov cx, 318
	mov dx, 342
	int 10h
	
	mov cx, 321
	mov dx, 342
	int 10h
	
	mov cx, 326
	mov dx, 342
	int 10h
	
	mov cx, 329
	mov dx, 342
	int 10h
	
	mov cx, 334
	mov dx, 342
	int 10h
	
	mov cx, 339
	mov dx, 342
	int 10h
	
	mov cx, 353
	mov dx, 342
	int 10h
	
	mov cx, 358
	mov dx, 342
	int 10h
	
	mov cx, 363
	mov dx, 342
	int 10h
	
	mov cx, 364
	mov dx, 342
	int 10h
	
	mov cx, 369
	mov dx, 342
	int 10h
	
	mov cx, 370
	mov dx, 342
	int 10h
	
	mov cx, 371
	mov dx, 342
	int 10h
	
	mov cx, 372
	mov dx, 342
	int 10h
	
	mov cx, 373
	mov dx, 342
	int 10h
	
	mov cx, 377
	mov dx, 342
	int 10h
	
	mov cx, 382
	mov dx, 342
	int 10h
	
	mov cx, 385
	mov dx, 342
	int 10h
	
	mov cx, 386
	mov dx, 342
	int 10h
	
	mov cx, 387
	mov dx, 342
	int 10h
	
	mov cx, 388
	mov dx, 342
	int 10h
	
	mov cx, 389
	mov dx, 342
	int 10h
	
	mov cx, 393
	mov dx, 342
	int 10h
	
	mov cx, 394
	mov dx, 342
	int 10h
	
	mov cx, 395
	mov dx, 342
	int 10h
	
	mov cx, 396
	mov dx, 342
	int 10h
	
	mov cx, 397
	mov dx, 342
	int 10h
	
	mov cx, 403
	mov dx, 342
	int 10h
	
	mov cx, 409
	mov dx, 342
	int 10h
	
	mov cx, 414
	mov dx, 342
	int 10h
	
	mov cx, 419
	mov dx, 342
	int 10h
	
	mov cx, 427
	mov dx, 342
	int 10h
	
	mov cx, 441
	mov dx, 342
	int 10h
	
	mov cx, 446
	mov dx, 342
	int 10h
	
	mov cx, 451
	mov dx, 342
	int 10h
	
	mov cx, 452
	mov dx, 342
	int 10h
	
	mov cx, 457
	mov dx, 342
	int 10h
	
	mov cx, 462
	mov dx, 342
	int 10h
	
	mov cx, 465
	mov dx, 342
	int 10h
	
	mov cx, 470
	mov dx, 342
	int 10h
	
	mov cx, 473
	mov dx, 342
	int 10h
	
	mov cx, 478
	mov dx, 342
	int 10h
	
	mov cx, 481
	mov dx, 342
	int 10h
	
	mov cx, 486
	mov dx, 342
	int 10h
	
	mov cx, 489
	mov dx, 342
	int 10h
	
	mov cx, 494
	mov dx, 342
	int 10h
	
	mov cx, 497
	mov dx, 342
	int 10h
	
	mov cx, 502
	mov dx, 342
	int 10h
	
	mov cx, 505
	mov dx, 342
	int 10h
	
	mov cx, 510
	mov dx, 342
	int 10h
	
	mov cx, 513
	mov dx, 342
	int 10h
	
	mov cx, 518
	mov dx, 342
	int 10h
	
	mov cx, 525
	mov dx, 342
	int 10h
	
	mov cx, 38
	mov dx, 343
	int 10h
	
	mov cx, 43
	mov dx, 343
	int 10h
	
	mov cx, 48
	mov dx, 343
	int 10h
	
	mov cx, 54
	mov dx, 343
	int 10h
	
	mov cx, 57
	mov dx, 343
	int 10h
	
	mov cx, 81
	mov dx, 343
	int 10h
	
	mov cx, 86
	mov dx, 343
	int 10h
	
	mov cx, 91
	mov dx, 343
	int 10h
	
	mov cx, 92
	mov dx, 343
	int 10h
	
	mov cx, 97
	mov dx, 343
	int 10h
	
	mov cx, 102
	mov dx, 343
	int 10h
	
	mov cx, 105
	mov dx, 343
	int 10h
	
	mov cx, 110
	mov dx, 343
	int 10h
	
	mov cx, 113
	mov dx, 343
	int 10h
	
	mov cx, 118
	mov dx, 343
	int 10h
	
	mov cx, 121
	mov dx, 343
	int 10h
	
	mov cx, 126
	mov dx, 343
	int 10h
	
	mov cx, 129
	mov dx, 343
	int 10h
	
	mov cx, 134
	mov dx, 343
	int 10h
	
	mov cx, 137
	mov dx, 343
	int 10h
	
	mov cx, 142
	mov dx, 343
	int 10h
	
	mov cx, 149
	mov dx, 343
	int 10h
	
	mov cx, 153
	mov dx, 343
	int 10h
	
	mov cx, 158
	mov dx, 343
	int 10h
	
	mov cx, 170
	mov dx, 343
	int 10h
	
	mov cx, 177
	mov dx, 343
	int 10h
	
	mov cx, 182
	mov dx, 343
	int 10h
	
	mov cx, 187
	mov dx, 343
	int 10h
	
	mov cx, 188
	mov dx, 343
	int 10h
	
	mov cx, 193
	mov dx, 343
	int 10h
	
	mov cx, 201
	mov dx, 343
	int 10h
	
	mov cx, 206
	mov dx, 343
	int 10h
	
	mov cx, 213
	mov dx, 343
	int 10h
	
	mov cx, 217
	mov dx, 343
	int 10h
	
	mov cx, 222
	mov dx, 343
	int 10h
	
	mov cx, 230
	mov dx, 343
	int 10h
	
	mov cx, 232
	mov dx, 343
	int 10h
	
	mov cx, 233
	mov dx, 343
	int 10h
	
	mov cx, 234
	mov dx, 343
	int 10h
	
	mov cx, 235
	mov dx, 343
	int 10h
	
	mov cx, 236
	mov dx, 343
	int 10h
	
	mov cx, 237
	mov dx, 343
	int 10h
	
	mov cx, 240
	mov dx, 343
	int 10h
	
	mov cx, 250
	mov dx, 343
	int 10h
	
	mov cx, 265
	mov dx, 343
	int 10h
	
	mov cx, 270
	mov dx, 343
	int 10h
	
	mov cx, 275
	mov dx, 343
	int 10h
	
	mov cx, 276
	mov dx, 343
	int 10h
	
	mov cx, 281
	mov dx, 343
	int 10h
	
	mov cx, 286
	mov dx, 343
	int 10h
	
	mov cx, 289
	mov dx, 343
	int 10h
	
	mov cx, 294
	mov dx, 343
	int 10h
	
	mov cx, 297
	mov dx, 343
	int 10h
	
	mov cx, 302
	mov dx, 343
	int 10h
	
	mov cx, 305
	mov dx, 343
	int 10h
	
	mov cx, 310
	mov dx, 343
	int 10h
	
	mov cx, 313
	mov dx, 343
	int 10h
	
	mov cx, 318
	mov dx, 343
	int 10h
	
	mov cx, 321
	mov dx, 343
	int 10h
	
	mov cx, 326
	mov dx, 343
	int 10h
	
	mov cx, 329
	mov dx, 343
	int 10h
	
	mov cx, 334
	mov dx, 343
	int 10h
	
	mov cx, 339
	mov dx, 343
	int 10h
	
	mov cx, 353
	mov dx, 343
	int 10h
	
	mov cx, 358
	mov dx, 343
	int 10h
	
	mov cx, 363
	mov dx, 343
	int 10h
	
	mov cx, 364
	mov dx, 343
	int 10h
	
	mov cx, 369
	mov dx, 343
	int 10h
	
	mov cx, 377
	mov dx, 343
	int 10h
	
	mov cx, 382
	mov dx, 343
	int 10h
	
	mov cx, 385
	mov dx, 343
	int 10h
	
	mov cx, 393
	mov dx, 343
	int 10h
	
	mov cx, 403
	mov dx, 343
	int 10h
	
	mov cx, 409
	mov dx, 343
	int 10h
	
	mov cx, 414
	mov dx, 343
	int 10h
	
	mov cx, 419
	mov dx, 343
	int 10h
	
	mov cx, 427
	mov dx, 343
	int 10h
	
	mov cx, 441
	mov dx, 343
	int 10h
	
	mov cx, 446
	mov dx, 343
	int 10h
	
	mov cx, 451
	mov dx, 343
	int 10h
	
	mov cx, 452
	mov dx, 343
	int 10h
	
	mov cx, 457
	mov dx, 343
	int 10h
	
	mov cx, 462
	mov dx, 343
	int 10h
	
	mov cx, 465
	mov dx, 343
	int 10h
	
	mov cx, 470
	mov dx, 343
	int 10h
	
	mov cx, 473
	mov dx, 343
	int 10h
	
	mov cx, 478
	mov dx, 343
	int 10h
	
	mov cx, 481
	mov dx, 343
	int 10h
	
	mov cx, 486
	mov dx, 343
	int 10h
	
	mov cx, 489
	mov dx, 343
	int 10h
	
	mov cx, 494
	mov dx, 343
	int 10h
	
	mov cx, 497
	mov dx, 343
	int 10h
	
	mov cx, 502
	mov dx, 343
	int 10h
	
	mov cx, 505
	mov dx, 343
	int 10h
	
	mov cx, 510
	mov dx, 343
	int 10h
	
	mov cx, 513
	mov dx, 343
	int 10h
	
	mov cx, 518
	mov dx, 343
	int 10h
	
	mov cx, 525
	mov dx, 343
	int 10h
	
	mov cx, 38
	mov dx, 344
	int 10h
	
	mov cx, 43
	mov dx, 344
	int 10h
	
	mov cx, 49
	mov dx, 344
	int 10h
	
	mov cx, 53
	mov dx, 344
	int 10h
	
	mov cx, 57
	mov dx, 344
	int 10h
	
	mov cx, 67
	mov dx, 344
	int 10h
	
	mov cx, 68
	mov dx, 344
	int 10h
	
	mov cx, 82
	mov dx, 344
	int 10h
	
	mov cx, 85
	mov dx, 344
	int 10h
	
	mov cx, 90
	mov dx, 344
	int 10h
	
	mov cx, 93
	mov dx, 344
	int 10h
	
	mov cx, 98
	mov dx, 344
	int 10h
	
	mov cx, 101
	mov dx, 344
	int 10h
	
	mov cx, 106
	mov dx, 344
	int 10h
	
	mov cx, 109
	mov dx, 344
	int 10h
	
	mov cx, 114
	mov dx, 344
	int 10h
	
	mov cx, 117
	mov dx, 344
	int 10h
	
	mov cx, 122
	mov dx, 344
	int 10h
	
	mov cx, 125
	mov dx, 344
	int 10h
	
	mov cx, 130
	mov dx, 344
	int 10h
	
	mov cx, 133
	mov dx, 344
	int 10h
	
	mov cx, 138
	mov dx, 344
	int 10h
	
	mov cx, 141
	mov dx, 344
	int 10h
	
	mov cx, 149
	mov dx, 344
	int 10h
	
	mov cx, 154
	mov dx, 344
	int 10h
	
	mov cx, 157
	mov dx, 344
	int 10h
	
	mov cx, 170
	mov dx, 344
	int 10h
	
	mov cx, 171
	mov dx, 344
	int 10h
	
	mov cx, 178
	mov dx, 344
	int 10h
	
	mov cx, 181
	mov dx, 344
	int 10h
	
	mov cx, 186
	mov dx, 344
	int 10h
	
	mov cx, 189
	mov dx, 344
	int 10h
	
	mov cx, 193
	mov dx, 344
	int 10h
	
	mov cx, 201
	mov dx, 344
	int 10h
	
	mov cx, 205
	mov dx, 344
	int 10h
	
	mov cx, 213
	mov dx, 344
	int 10h
	
	mov cx, 218
	mov dx, 344
	int 10h
	
	mov cx, 221
	mov dx, 344
	int 10h
	
	mov cx, 229
	mov dx, 344
	int 10h
	
	mov cx, 236
	mov dx, 344
	int 10h
	
	mov cx, 241
	mov dx, 344
	int 10h
	
	mov cx, 249
	mov dx, 344
	int 10h
	
	mov cx, 258
	mov dx, 344
	int 10h
	
	mov cx, 259
	mov dx, 344
	int 10h
	
	mov cx, 266
	mov dx, 344
	int 10h
	
	mov cx, 269
	mov dx, 344
	int 10h
	
	mov cx, 274
	mov dx, 344
	int 10h
	
	mov cx, 277
	mov dx, 344
	int 10h
	
	mov cx, 282
	mov dx, 344
	int 10h
	
	mov cx, 285
	mov dx, 344
	int 10h
	
	mov cx, 290
	mov dx, 344
	int 10h
	
	mov cx, 293
	mov dx, 344
	int 10h
	
	mov cx, 298
	mov dx, 344
	int 10h
	
	mov cx, 301
	mov dx, 344
	int 10h
	
	mov cx, 306
	mov dx, 344
	int 10h
	
	mov cx, 309
	mov dx, 344
	int 10h
	
	mov cx, 314
	mov dx, 344
	int 10h
	
	mov cx, 317
	mov dx, 344
	int 10h
	
	mov cx, 322
	mov dx, 344
	int 10h
	
	mov cx, 325
	mov dx, 344
	int 10h
	
	mov cx, 330
	mov dx, 344
	int 10h
	
	mov cx, 333
	mov dx, 344
	int 10h
	
	mov cx, 339
	mov dx, 344
	int 10h
	
	mov cx, 346
	mov dx, 344
	int 10h
	
	mov cx, 347
	mov dx, 344
	int 10h
	
	mov cx, 354
	mov dx, 344
	int 10h
	
	mov cx, 357
	mov dx, 344
	int 10h
	
	mov cx, 362
	mov dx, 344
	int 10h
	
	mov cx, 365
	mov dx, 344
	int 10h
	
	mov cx, 369
	mov dx, 344
	int 10h
	
	mov cx, 377
	mov dx, 344
	int 10h
	
	mov cx, 382
	mov dx, 344
	int 10h
	
	mov cx, 385
	mov dx, 344
	int 10h
	
	mov cx, 393
	mov dx, 344
	int 10h
	
	mov cx, 402
	mov dx, 344
	int 10h
	
	mov cx, 410
	mov dx, 344
	int 10h
	
	mov cx, 414
	mov dx, 344
	int 10h
	
	mov cx, 419
	mov dx, 344
	int 10h
	
	mov cx, 426
	mov dx, 344
	int 10h
	
	mov cx, 434
	mov dx, 344
	int 10h
	
	mov cx, 435
	mov dx, 344
	int 10h
	
	mov cx, 442
	mov dx, 344
	int 10h
	
	mov cx, 445
	mov dx, 344
	int 10h
	
	mov cx, 450
	mov dx, 344
	int 10h
	
	mov cx, 453
	mov dx, 344
	int 10h
	
	mov cx, 458
	mov dx, 344
	int 10h
	
	mov cx, 461
	mov dx, 344
	int 10h
	
	mov cx, 466
	mov dx, 344
	int 10h
	
	mov cx, 469
	mov dx, 344
	int 10h
	
	mov cx, 474
	mov dx, 344
	int 10h
	
	mov cx, 477
	mov dx, 344
	int 10h
	
	mov cx, 482
	mov dx, 344
	int 10h
	
	mov cx, 485
	mov dx, 344
	int 10h
	
	mov cx, 490
	mov dx, 344
	int 10h
	
	mov cx, 493
	mov dx, 344
	int 10h
	
	mov cx, 498
	mov dx, 344
	int 10h
	
	mov cx, 501
	mov dx, 344
	int 10h
	
	mov cx, 506
	mov dx, 344
	int 10h
	
	mov cx, 509
	mov dx, 344
	int 10h
	
	mov cx, 514
	mov dx, 344
	int 10h
	
	mov cx, 517
	mov dx, 344
	int 10h
	
	mov cx, 525
	mov dx, 344
	int 10h
	
	mov cx, 33
	mov dx, 345
	int 10h
	
	mov cx, 34
	mov dx, 345
	int 10h
	
	mov cx, 35
	mov dx, 345
	int 10h
	
	mov cx, 36
	mov dx, 345
	int 10h
	
	mov cx, 37
	mov dx, 345
	int 10h
	
	mov cx, 43
	mov dx, 345
	int 10h
	
	mov cx, 50
	mov dx, 345
	int 10h
	
	mov cx, 51
	mov dx, 345
	int 10h
	
	mov cx, 52
	mov dx, 345
	int 10h
	
	mov cx, 57
	mov dx, 345
	int 10h
	
	mov cx, 67
	mov dx, 345
	int 10h
	
	mov cx, 68
	mov dx, 345
	int 10h
	
	mov cx, 82
	mov dx, 345
	int 10h
	
	mov cx, 83
	mov dx, 345
	int 10h
	
	mov cx, 84
	mov dx, 345
	int 10h
	
	mov cx, 85
	mov dx, 345
	int 10h
	
	mov cx, 89
	mov dx, 345
	int 10h
	
	mov cx, 94
	mov dx, 345
	int 10h
	
	mov cx, 98
	mov dx, 345
	int 10h
	
	mov cx, 99
	mov dx, 345
	int 10h
	
	mov cx, 100
	mov dx, 345
	int 10h
	
	mov cx, 101
	mov dx, 345
	int 10h
	
	mov cx, 106
	mov dx, 345
	int 10h
	
	mov cx, 107
	mov dx, 345
	int 10h
	
	mov cx, 108
	mov dx, 345
	int 10h
	
	mov cx, 109
	mov dx, 345
	int 10h
	
	mov cx, 114
	mov dx, 345
	int 10h
	
	mov cx, 115
	mov dx, 345
	int 10h
	
	mov cx, 116
	mov dx, 345
	int 10h
	
	mov cx, 117
	mov dx, 345
	int 10h
	
	mov cx, 122
	mov dx, 345
	int 10h
	
	mov cx, 123
	mov dx, 345
	int 10h
	
	mov cx, 124
	mov dx, 345
	int 10h
	
	mov cx, 125
	mov dx, 345
	int 10h
	
	mov cx, 130
	mov dx, 345
	int 10h
	
	mov cx, 131
	mov dx, 345
	int 10h
	
	mov cx, 132
	mov dx, 345
	int 10h
	
	mov cx, 133
	mov dx, 345
	int 10h
	
	mov cx, 138
	mov dx, 345
	int 10h
	
	mov cx, 139
	mov dx, 345
	int 10h
	
	mov cx, 140
	mov dx, 345
	int 10h
	
	mov cx, 141
	mov dx, 345
	int 10h
	
	mov cx, 146
	mov dx, 345
	int 10h
	
	mov cx, 147
	mov dx, 345
	int 10h
	
	mov cx, 148
	mov dx, 345
	int 10h
	
	mov cx, 154
	mov dx, 345
	int 10h
	
	mov cx, 155
	mov dx, 345
	int 10h
	
	mov cx, 156
	mov dx, 345
	int 10h
	
	mov cx, 157
	mov dx, 345
	int 10h
	
	mov cx, 171
	mov dx, 345
	int 10h
	
	mov cx, 178
	mov dx, 345
	int 10h
	
	mov cx, 179
	mov dx, 345
	int 10h
	
	mov cx, 180
	mov dx, 345
	int 10h
	
	mov cx, 181
	mov dx, 345
	int 10h
	
	mov cx, 185
	mov dx, 345
	int 10h
	
	mov cx, 190
	mov dx, 345
	int 10h
	
	mov cx, 193
	mov dx, 345
	int 10h
	
	mov cx, 201
	mov dx, 345
	int 10h
	
	mov cx, 202
	mov dx, 345
	int 10h
	
	mov cx, 203
	mov dx, 345
	int 10h
	
	mov cx, 204
	mov dx, 345
	int 10h
	
	mov cx, 209
	mov dx, 345
	int 10h
	
	mov cx, 210
	mov dx, 345
	int 10h
	
	mov cx, 211
	mov dx, 345
	int 10h
	
	mov cx, 212
	mov dx, 345
	int 10h
	
	mov cx, 218
	mov dx, 345
	int 10h
	
	mov cx, 219
	mov dx, 345
	int 10h
	
	mov cx, 220
	mov dx, 345
	int 10h
	
	mov cx, 221
	mov dx, 345
	int 10h
	
	mov cx, 226
	mov dx, 345
	int 10h
	
	mov cx, 227
	mov dx, 345
	int 10h
	
	mov cx, 228
	mov dx, 345
	int 10h
	
	mov cx, 236
	mov dx, 345
	int 10h
	
	mov cx, 242
	mov dx, 345
	int 10h
	
	mov cx, 243
	mov dx, 345
	int 10h
	
	mov cx, 244
	mov dx, 345
	int 10h
	
	mov cx, 245
	mov dx, 345
	int 10h
	
	mov cx, 246
	mov dx, 345
	int 10h
	
	mov cx, 249
	mov dx, 345
	int 10h
	
	mov cx, 250
	mov dx, 345
	int 10h
	
	mov cx, 251
	mov dx, 345
	int 10h
	
	mov cx, 252
	mov dx, 345
	int 10h
	
	mov cx, 253
	mov dx, 345
	int 10h
	
	mov cx, 258
	mov dx, 345
	int 10h
	
	mov cx, 259
	mov dx, 345
	int 10h
	
	mov cx, 266
	mov dx, 345
	int 10h
	
	mov cx, 267
	mov dx, 345
	int 10h
	
	mov cx, 268
	mov dx, 345
	int 10h
	
	mov cx, 269
	mov dx, 345
	int 10h
	
	mov cx, 273
	mov dx, 345
	int 10h
	
	mov cx, 278
	mov dx, 345
	int 10h
	
	mov cx, 282
	mov dx, 345
	int 10h
	
	mov cx, 283
	mov dx, 345
	int 10h
	
	mov cx, 284
	mov dx, 345
	int 10h
	
	mov cx, 285
	mov dx, 345
	int 10h
	
	mov cx, 290
	mov dx, 345
	int 10h
	
	mov cx, 291
	mov dx, 345
	int 10h
	
	mov cx, 292
	mov dx, 345
	int 10h
	
	mov cx, 293
	mov dx, 345
	int 10h
	
	mov cx, 298
	mov dx, 345
	int 10h
	
	mov cx, 299
	mov dx, 345
	int 10h
	
	mov cx, 300
	mov dx, 345
	int 10h
	
	mov cx, 301
	mov dx, 345
	int 10h
	
	mov cx, 306
	mov dx, 345
	int 10h
	
	mov cx, 307
	mov dx, 345
	int 10h
	
	mov cx, 308
	mov dx, 345
	int 10h
	
	mov cx, 309
	mov dx, 345
	int 10h
	
	mov cx, 314
	mov dx, 345
	int 10h
	
	mov cx, 315
	mov dx, 345
	int 10h
	
	mov cx, 316
	mov dx, 345
	int 10h
	
	mov cx, 317
	mov dx, 345
	int 10h
	
	mov cx, 322
	mov dx, 345
	int 10h
	
	mov cx, 323
	mov dx, 345
	int 10h
	
	mov cx, 324
	mov dx, 345
	int 10h
	
	mov cx, 325
	mov dx, 345
	int 10h
	
	mov cx, 330
	mov dx, 345
	int 10h
	
	mov cx, 331
	mov dx, 345
	int 10h
	
	mov cx, 332
	mov dx, 345
	int 10h
	
	mov cx, 333
	mov dx, 345
	int 10h
	
	mov cx, 336
	mov dx, 345
	int 10h
	
	mov cx, 337
	mov dx, 345
	int 10h
	
	mov cx, 338
	mov dx, 345
	int 10h
	
	mov cx, 339
	mov dx, 345
	int 10h
	
	mov cx, 340
	mov dx, 345
	int 10h
	
	mov cx, 341
	mov dx, 345
	int 10h
	
	mov cx, 342
	mov dx, 345
	int 10h
	
	mov cx, 346
	mov dx, 345
	int 10h
	
	mov cx, 347
	mov dx, 345
	int 10h
	
	mov cx, 354
	mov dx, 345
	int 10h
	
	mov cx, 355
	mov dx, 345
	int 10h
	
	mov cx, 356
	mov dx, 345
	int 10h
	
	mov cx, 357
	mov dx, 345
	int 10h
	
	mov cx, 361
	mov dx, 345
	int 10h
	
	mov cx, 366
	mov dx, 345
	int 10h
	
	mov cx, 369
	mov dx, 345
	int 10h
	
	mov cx, 377
	mov dx, 345
	int 10h
	
	mov cx, 378
	mov dx, 345
	int 10h
	
	mov cx, 379
	mov dx, 345
	int 10h
	
	mov cx, 380
	mov dx, 345
	int 10h
	
	mov cx, 381
	mov dx, 345
	int 10h
	
	mov cx, 385
	mov dx, 345
	int 10h
	
	mov cx, 393
	mov dx, 345
	int 10h
	
	mov cx, 394
	mov dx, 345
	int 10h
	
	mov cx, 395
	mov dx, 345
	int 10h
	
	mov cx, 396
	mov dx, 345
	int 10h
	
	mov cx, 397
	mov dx, 345
	int 10h
	
	mov cx, 398
	mov dx, 345
	int 10h
	
	mov cx, 402
	mov dx, 345
	int 10h
	
	mov cx, 411
	mov dx, 345
	int 10h
	
	mov cx, 412
	mov dx, 345
	int 10h
	
	mov cx, 413
	mov dx, 345
	int 10h
	
	mov cx, 416
	mov dx, 345
	int 10h
	
	mov cx, 417
	mov dx, 345
	int 10h
	
	mov cx, 418
	mov dx, 345
	int 10h
	
	mov cx, 419
	mov dx, 345
	int 10h
	
	mov cx, 420
	mov dx, 345
	int 10h
	
	mov cx, 421
	mov dx, 345
	int 10h
	
	mov cx, 422
	mov dx, 345
	int 10h
	
	mov cx, 426
	mov dx, 345
	int 10h
	
	mov cx, 434
	mov dx, 345
	int 10h
	
	mov cx, 435
	mov dx, 345
	int 10h
	
	mov cx, 442
	mov dx, 345
	int 10h
	
	mov cx, 443
	mov dx, 345
	int 10h
	
	mov cx, 444
	mov dx, 345
	int 10h
	
	mov cx, 445
	mov dx, 345
	int 10h
	
	mov cx, 449
	mov dx, 345
	int 10h
	
	mov cx, 454
	mov dx, 345
	int 10h
	
	mov cx, 458
	mov dx, 345
	int 10h
	
	mov cx, 459
	mov dx, 345
	int 10h
	
	mov cx, 460
	mov dx, 345
	int 10h
	
	mov cx, 461
	mov dx, 345
	int 10h
	
	mov cx, 466
	mov dx, 345
	int 10h
	
	mov cx, 467
	mov dx, 345
	int 10h
	
	mov cx, 468
	mov dx, 345
	int 10h
	
	mov cx, 469
	mov dx, 345
	int 10h
	
	mov cx, 474
	mov dx, 345
	int 10h
	
	mov cx, 475
	mov dx, 345
	int 10h
	
	mov cx, 476
	mov dx, 345
	int 10h
	
	mov cx, 477
	mov dx, 345
	int 10h
	
	mov cx, 482
	mov dx, 345
	int 10h
	
	mov cx, 483
	mov dx, 345
	int 10h
	
	mov cx, 484
	mov dx, 345
	int 10h
	
	mov cx, 485
	mov dx, 345
	int 10h
	
	mov cx, 490
	mov dx, 345
	int 10h
	
	mov cx, 491
	mov dx, 345
	int 10h
	
	mov cx, 492
	mov dx, 345
	int 10h
	
	mov cx, 493
	mov dx, 345
	int 10h
	
	mov cx, 498
	mov dx, 345
	int 10h
	
	mov cx, 499
	mov dx, 345
	int 10h
	
	mov cx, 500
	mov dx, 345
	int 10h
	
	mov cx, 501
	mov dx, 345
	int 10h
	
	mov cx, 506
	mov dx, 345
	int 10h
	
	mov cx, 507
	mov dx, 345
	int 10h
	
	mov cx, 508
	mov dx, 345
	int 10h
	
	mov cx, 509
	mov dx, 345
	int 10h
	
	mov cx, 514
	mov dx, 345
	int 10h
	
	mov cx, 515
	mov dx, 345
	int 10h
	
	mov cx, 516
	mov dx, 345
	int 10h
	
	mov cx, 517
	mov dx, 345
	int 10h
	
	mov cx, 524
	mov dx, 345
	int 10h
	
	mov cx, 172
	mov dx, 346
	int 10h
	
	mov cx, 259
	mov dx, 346
	int 10h
	
	mov cx, 347
	mov dx, 346
	int 10h
	
	mov cx, 435
	mov dx, 346
	int 10h
	
	mov cx, 523
	mov dx, 346
	int 10h
	
	mov cx, 173
	mov dx, 347
	int 10h
	
	mov cx, 174
	mov dx, 347
	int 10h
	
	mov cx, 258
	mov dx, 347
	int 10h
	
	mov cx, 346
	mov dx, 347
	int 10h
	
	mov cx, 434
	mov dx, 347
	int 10h
	
	mov cx, 521
	mov dx, 347
	int 10h
	
	mov cx, 522
	mov dx, 347
	int 10h
	
	mov cx, 174
	mov dx, 378
	int 10h
	
	mov cx, 182
	mov dx, 378
	int 10h
	
	mov cx, 297
	mov dx, 378
	int 10h
	
	mov cx, 534
	mov dx, 378
	int 10h
	
	mov cx, 550
	mov dx, 378
	int 10h
	
	mov cx, 558
	mov dx, 378
	int 10h
	
	mov cx, 3
	mov dx, 379
	int 10h
	
	mov cx, 11
	mov dx, 379
	int 10h
	
	mov cx, 19
	mov dx, 379
	int 10h
	
	mov cx, 174
	mov dx, 379
	int 10h
	
	mov cx, 182
	mov dx, 379
	int 10h
	
	mov cx, 257
	mov dx, 379
	int 10h
	
	mov cx, 258
	mov dx, 379
	int 10h
	
	mov cx, 259
	mov dx, 379
	int 10h
	
	mov cx, 260
	mov dx, 379
	int 10h
	
	mov cx, 261
	mov dx, 379
	int 10h
	
	mov cx, 262
	mov dx, 379
	int 10h
	
	mov cx, 267
	mov dx, 379
	int 10h
	
	mov cx, 268
	mov dx, 379
	int 10h
	
	mov cx, 269
	mov dx, 379
	int 10h
	
	mov cx, 274
	mov dx, 379
	int 10h
	
	mov cx, 275
	mov dx, 379
	int 10h
	
	mov cx, 281
	mov dx, 379
	int 10h
	
	mov cx, 282
	mov dx, 379
	int 10h
	
	mov cx, 283
	mov dx, 379
	int 10h
	
	mov cx, 284
	mov dx, 379
	int 10h
	
	mov cx, 285
	mov dx, 379
	int 10h
	
	mov cx, 286
	mov dx, 379
	int 10h
	
	mov cx, 297
	mov dx, 379
	int 10h
	
	mov cx, 394
	mov dx, 379
	int 10h
	
	mov cx, 395
	mov dx, 379
	int 10h
	
	mov cx, 396
	mov dx, 379
	int 10h
	
	mov cx, 397
	mov dx, 379
	int 10h
	
	mov cx, 403
	mov dx, 379
	int 10h
	
	mov cx, 404
	mov dx, 379
	int 10h
	
	mov cx, 411
	mov dx, 379
	int 10h
	
	mov cx, 412
	mov dx, 379
	int 10h
	
	mov cx, 419
	mov dx, 379
	int 10h
	
	mov cx, 420
	mov dx, 379
	int 10h
	
	mov cx, 521
	mov dx, 379
	int 10h
	
	mov cx, 522
	mov dx, 379
	int 10h
	
	mov cx, 523
	mov dx, 379
	int 10h
	
	mov cx, 524
	mov dx, 379
	int 10h
	
	mov cx, 534
	mov dx, 379
	int 10h
	
	mov cx, 539
	mov dx, 379
	int 10h
	
	mov cx, 540
	mov dx, 379
	int 10h
	
	mov cx, 541
	mov dx, 379
	int 10h
	
	mov cx, 550
	mov dx, 379
	int 10h
	
	mov cx, 558
	mov dx, 379
	int 10h
	
	mov cx, 563
	mov dx, 379
	int 10h
	
	mov cx, 564
	mov dx, 379
	int 10h
	
	mov cx, 565
	mov dx, 379
	int 10h
	
	mov cx, 569
	mov dx, 379
	int 10h
	
	mov cx, 570
	mov dx, 379
	int 10h
	
	mov cx, 571
	mov dx, 379
	int 10h
	
	mov cx, 572
	mov dx, 379
	int 10h
	
	mov cx, 573
	mov dx, 379
	int 10h
	
	mov cx, 574
	mov dx, 379
	int 10h
	
	mov cx, 1
	mov dx, 380
	int 10h
	
	mov cx, 3
	mov dx, 380
	int 10h
	
	mov cx, 6
	mov dx, 380
	int 10h
	
	mov cx, 9
	mov dx, 380
	int 10h
	
	mov cx, 11
	mov dx, 380
	int 10h
	
	mov cx, 14
	mov dx, 380
	int 10h
	
	mov cx, 17
	mov dx, 380
	int 10h
	
	mov cx, 19
	mov dx, 380
	int 10h
	
	mov cx, 22
	mov dx, 380
	int 10h
	
	mov cx, 42
	mov dx, 380
	int 10h
	
	mov cx, 43
	mov dx, 380
	int 10h
	
	mov cx, 44
	mov dx, 380
	int 10h
	
	mov cx, 45
	mov dx, 380
	int 10h
	
	mov cx, 46
	mov dx, 380
	int 10h
	
	mov cx, 49
	mov dx, 380
	int 10h
	
	mov cx, 50
	mov dx, 380
	int 10h
	
	mov cx, 51
	mov dx, 380
	int 10h
	
	mov cx, 52
	mov dx, 380
	int 10h
	
	mov cx, 53
	mov dx, 380
	int 10h
	
	mov cx, 58
	mov dx, 380
	int 10h
	
	mov cx, 59
	mov dx, 380
	int 10h
	
	mov cx, 60
	mov dx, 380
	int 10h
	
	mov cx, 61
	mov dx, 380
	int 10h
	
	mov cx, 62
	mov dx, 380
	int 10h
	
	mov cx, 64
	mov dx, 380
	int 10h
	
	mov cx, 65
	mov dx, 380
	int 10h
	
	mov cx, 69
	mov dx, 380
	int 10h
	
	mov cx, 70
	mov dx, 380
	int 10h
	
	mov cx, 73
	mov dx, 380
	int 10h
	
	mov cx, 74
	mov dx, 380
	int 10h
	
	mov cx, 75
	mov dx, 380
	int 10h
	
	mov cx, 76
	mov dx, 380
	int 10h
	
	mov cx, 82
	mov dx, 380
	int 10h
	
	mov cx, 83
	mov dx, 380
	int 10h
	
	mov cx, 84
	mov dx, 380
	int 10h
	
	mov cx, 85
	mov dx, 380
	int 10h
	
	mov cx, 86
	mov dx, 380
	int 10h
	
	mov cx, 90
	mov dx, 380
	int 10h
	
	mov cx, 91
	mov dx, 380
	int 10h
	
	mov cx, 92
	mov dx, 380
	int 10h
	
	mov cx, 97
	mov dx, 380
	int 10h
	
	mov cx, 102
	mov dx, 380
	int 10h
	
	mov cx, 114
	mov dx, 380
	int 10h
	
	mov cx, 115
	mov dx, 380
	int 10h
	
	mov cx, 116
	mov dx, 380
	int 10h
	
	mov cx, 117
	mov dx, 380
	int 10h
	
	mov cx, 118
	mov dx, 380
	int 10h
	
	mov cx, 120
	mov dx, 380
	int 10h
	
	mov cx, 126
	mov dx, 380
	int 10h
	
	mov cx, 130
	mov dx, 380
	int 10h
	
	mov cx, 131
	mov dx, 380
	int 10h
	
	mov cx, 132
	mov dx, 380
	int 10h
	
	mov cx, 133
	mov dx, 380
	int 10h
	
	mov cx, 134
	mov dx, 380
	int 10h
	
	mov cx, 163
	mov dx, 380
	int 10h
	
	mov cx, 164
	mov dx, 380
	int 10h
	
	mov cx, 174
	mov dx, 380
	int 10h
	
	mov cx, 182
	mov dx, 380
	int 10h
	
	mov cx, 225
	mov dx, 380
	int 10h
	
	mov cx, 226
	mov dx, 380
	int 10h
	
	mov cx, 227
	mov dx, 380
	int 10h
	
	mov cx, 228
	mov dx, 380
	int 10h
	
	mov cx, 229
	mov dx, 380
	int 10h
	
	mov cx, 230
	mov dx, 380
	int 10h
	
	mov cx, 233
	mov dx, 380
	int 10h
	
	mov cx, 234
	mov dx, 380
	int 10h
	
	mov cx, 235
	mov dx, 380
	int 10h
	
	mov cx, 236
	mov dx, 380
	int 10h
	
	mov cx, 237
	mov dx, 380
	int 10h
	
	mov cx, 241
	mov dx, 380
	int 10h
	
	mov cx, 242
	mov dx, 380
	int 10h
	
	mov cx, 243
	mov dx, 380
	int 10h
	
	mov cx, 244
	mov dx, 380
	int 10h
	
	mov cx, 245
	mov dx, 380
	int 10h
	
	mov cx, 246
	mov dx, 380
	int 10h
	
	mov cx, 249
	mov dx, 380
	int 10h
	
	mov cx, 250
	mov dx, 380
	int 10h
	
	mov cx, 251
	mov dx, 380
	int 10h
	
	mov cx, 252
	mov dx, 380
	int 10h
	
	mov cx, 253
	mov dx, 380
	int 10h
	
	mov cx, 254
	mov dx, 380
	int 10h
	
	mov cx, 262
	mov dx, 380
	int 10h
	
	mov cx, 266
	mov dx, 380
	int 10h
	
	mov cx, 272
	mov dx, 380
	int 10h
	
	mov cx, 273
	mov dx, 380
	int 10h
	
	mov cx, 275
	mov dx, 380
	int 10h
	
	mov cx, 286
	mov dx, 380
	int 10h
	
	mov cx, 297
	mov dx, 380
	int 10h
	
	mov cx, 346
	mov dx, 380
	int 10h
	
	mov cx, 361
	mov dx, 380
	int 10h
	
	mov cx, 362
	mov dx, 380
	int 10h
	
	mov cx, 363
	mov dx, 380
	int 10h
	
	mov cx, 364
	mov dx, 380
	int 10h
	
	mov cx, 365
	mov dx, 380
	int 10h
	
	mov cx, 366
	mov dx, 380
	int 10h
	
	mov cx, 369
	mov dx, 380
	int 10h
	
	mov cx, 370
	mov dx, 380
	int 10h
	
	mov cx, 371
	mov dx, 380
	int 10h
	
	mov cx, 372
	mov dx, 380
	int 10h
	
	mov cx, 373
	mov dx, 380
	int 10h
	
	mov cx, 377
	mov dx, 380
	int 10h
	
	mov cx, 378
	mov dx, 380
	int 10h
	
	mov cx, 379
	mov dx, 380
	int 10h
	
	mov cx, 380
	mov dx, 380
	int 10h
	
	mov cx, 381
	mov dx, 380
	int 10h
	
	mov cx, 382
	mov dx, 380
	int 10h
	
	mov cx, 385
	mov dx, 380
	int 10h
	
	mov cx, 386
	mov dx, 380
	int 10h
	
	mov cx, 387
	mov dx, 380
	int 10h
	
	mov cx, 388
	mov dx, 380
	int 10h
	
	mov cx, 389
	mov dx, 380
	int 10h
	
	mov cx, 390
	mov dx, 380
	int 10h
	
	mov cx, 394
	mov dx, 380
	int 10h
	
	mov cx, 402
	mov dx, 380
	int 10h
	
	mov cx, 405
	mov dx, 380
	int 10h
	
	mov cx, 410
	mov dx, 380
	int 10h
	
	mov cx, 413
	mov dx, 380
	int 10h
	
	mov cx, 418
	mov dx, 380
	int 10h
	
	mov cx, 421
	mov dx, 380
	int 10h
	
	mov cx, 441
	mov dx, 380
	int 10h
	
	mov cx, 442
	mov dx, 380
	int 10h
	
	mov cx, 443
	mov dx, 380
	int 10h
	
	mov cx, 444
	mov dx, 380
	int 10h
	
	mov cx, 458
	mov dx, 380
	int 10h
	
	mov cx, 474
	mov dx, 380
	int 10h
	
	mov cx, 475
	mov dx, 380
	int 10h
	
	mov cx, 476
	mov dx, 380
	int 10h
	
	mov cx, 477
	mov dx, 380
	int 10h
	
	mov cx, 478
	mov dx, 380
	int 10h
	
	mov cx, 482
	mov dx, 380
	int 10h
	
	mov cx, 525
	mov dx, 380
	int 10h
	
	mov cx, 534
	mov dx, 380
	int 10h
	
	mov cx, 538
	mov dx, 380
	int 10h
	
	mov cx, 550
	mov dx, 380
	int 10h
	
	mov cx, 558
	mov dx, 380
	int 10h
	
	mov cx, 562
	mov dx, 380
	int 10h
	
	mov cx, 574
	mov dx, 380
	int 10h
	
	mov cx, 2
	mov dx, 381
	int 10h
	
	mov cx, 5
	mov dx, 381
	int 10h
	
	mov cx, 10
	mov dx, 381
	int 10h
	
	mov cx, 13
	mov dx, 381
	int 10h
	
	mov cx, 18
	mov dx, 381
	int 10h
	
	mov cx, 21
	mov dx, 381
	int 10h
	
	mov cx, 41
	mov dx, 381
	int 10h
	
	mov cx, 49
	mov dx, 381
	int 10h
	
	mov cx, 54
	mov dx, 381
	int 10h
	
	mov cx, 57
	mov dx, 381
	int 10h
	
	mov cx, 64
	mov dx, 381
	int 10h
	
	mov cx, 65
	mov dx, 381
	int 10h
	
	mov cx, 69
	mov dx, 381
	int 10h
	
	mov cx, 70
	mov dx, 381
	int 10h
	
	mov cx, 73
	mov dx, 381
	int 10h
	
	mov cx, 77
	mov dx, 381
	int 10h
	
	mov cx, 81
	mov dx, 381
	int 10h
	
	mov cx, 89
	mov dx, 381
	int 10h
	
	mov cx, 93
	mov dx, 381
	int 10h
	
	mov cx, 97
	mov dx, 381
	int 10h
	
	mov cx, 98
	mov dx, 381
	int 10h
	
	mov cx, 102
	mov dx, 381
	int 10h
	
	mov cx, 113
	mov dx, 381
	int 10h
	
	mov cx, 121
	mov dx, 381
	int 10h
	
	mov cx, 125
	mov dx, 381
	int 10h
	
	mov cx, 129
	mov dx, 381
	int 10h
	
	mov cx, 163
	mov dx, 381
	int 10h
	
	mov cx, 164
	mov dx, 381
	int 10h
	
	mov cx, 170
	mov dx, 381
	int 10h
	
	mov cx, 171
	mov dx, 381
	int 10h
	
	mov cx, 172
	mov dx, 381
	int 10h
	
	mov cx, 174
	mov dx, 381
	int 10h
	
	mov cx, 178
	mov dx, 381
	int 10h
	
	mov cx, 179
	mov dx, 381
	int 10h
	
	mov cx, 180
	mov dx, 381
	int 10h
	
	mov cx, 182
	mov dx, 381
	int 10h
	
	mov cx, 185
	mov dx, 381
	int 10h
	
	mov cx, 187
	mov dx, 381
	int 10h
	
	mov cx, 188
	mov dx, 381
	int 10h
	
	mov cx, 189
	mov dx, 381
	int 10h
	
	mov cx, 194
	mov dx, 381
	int 10h
	
	mov cx, 195
	mov dx, 381
	int 10h
	
	mov cx, 196
	mov dx, 381
	int 10h
	
	mov cx, 197
	mov dx, 381
	int 10h
	
	mov cx, 202
	mov dx, 381
	int 10h
	
	mov cx, 203
	mov dx, 381
	int 10h
	
	mov cx, 204
	mov dx, 381
	int 10h
	
	mov cx, 205
	mov dx, 381
	int 10h
	
	mov cx, 210
	mov dx, 381
	int 10h
	
	mov cx, 211
	mov dx, 381
	int 10h
	
	mov cx, 212
	mov dx, 381
	int 10h
	
	mov cx, 213
	mov dx, 381
	int 10h
	
	mov cx, 225
	mov dx, 381
	int 10h
	
	mov cx, 233
	mov dx, 381
	int 10h
	
	mov cx, 238
	mov dx, 381
	int 10h
	
	mov cx, 241
	mov dx, 381
	int 10h
	
	mov cx, 249
	mov dx, 381
	int 10h
	
	mov cx, 261
	mov dx, 381
	int 10h
	
	mov cx, 265
	mov dx, 381
	int 10h
	
	mov cx, 275
	mov dx, 381
	int 10h
	
	mov cx, 285
	mov dx, 381
	int 10h
	
	mov cx, 297
	mov dx, 381
	int 10h
	
	mov cx, 299
	mov dx, 381
	int 10h
	
	mov cx, 300
	mov dx, 381
	int 10h
	
	mov cx, 301
	mov dx, 381
	int 10h
	
	mov cx, 306
	mov dx, 381
	int 10h
	
	mov cx, 307
	mov dx, 381
	int 10h
	
	mov cx, 308
	mov dx, 381
	int 10h
	
	mov cx, 314
	mov dx, 381
	int 10h
	
	mov cx, 315
	mov dx, 381
	int 10h
	
	mov cx, 316
	mov dx, 381
	int 10h
	
	mov cx, 317
	mov dx, 381
	int 10h
	
	mov cx, 322
	mov dx, 381
	int 10h
	
	mov cx, 323
	mov dx, 381
	int 10h
	
	mov cx, 324
	mov dx, 381
	int 10h
	
	mov cx, 325
	mov dx, 381
	int 10h
	
	mov cx, 338
	mov dx, 381
	int 10h
	
	mov cx, 339
	mov dx, 381
	int 10h
	
	mov cx, 340
	mov dx, 381
	int 10h
	
	mov cx, 344
	mov dx, 381
	int 10h
	
	mov cx, 345
	mov dx, 381
	int 10h
	
	mov cx, 346
	mov dx, 381
	int 10h
	
	mov cx, 347
	mov dx, 381
	int 10h
	
	mov cx, 348
	mov dx, 381
	int 10h
	
	mov cx, 349
	mov dx, 381
	int 10h
	
	mov cx, 361
	mov dx, 381
	int 10h
	
	mov cx, 369
	mov dx, 381
	int 10h
	
	mov cx, 374
	mov dx, 381
	int 10h
	
	mov cx, 377
	mov dx, 381
	int 10h
	
	mov cx, 385
	mov dx, 381
	int 10h
	
	mov cx, 394
	mov dx, 381
	int 10h
	
	mov cx, 401
	mov dx, 381
	int 10h
	
	mov cx, 406
	mov dx, 381
	int 10h
	
	mov cx, 409
	mov dx, 381
	int 10h
	
	mov cx, 414
	mov dx, 381
	int 10h
	
	mov cx, 417
	mov dx, 381
	int 10h
	
	mov cx, 422
	mov dx, 381
	int 10h
	
	mov cx, 441
	mov dx, 381
	int 10h
	
	mov cx, 445
	mov dx, 381
	int 10h
	
	mov cx, 450
	mov dx, 381
	int 10h
	
	mov cx, 451
	mov dx, 381
	int 10h
	
	mov cx, 452
	mov dx, 381
	int 10h
	
	mov cx, 456
	mov dx, 381
	int 10h
	
	mov cx, 457
	mov dx, 381
	int 10h
	
	mov cx, 458
	mov dx, 381
	int 10h
	
	mov cx, 459
	mov dx, 381
	int 10h
	
	mov cx, 460
	mov dx, 381
	int 10h
	
	mov cx, 461
	mov dx, 381
	int 10h
	
	mov cx, 466
	mov dx, 381
	int 10h
	
	mov cx, 467
	mov dx, 381
	int 10h
	
	mov cx, 468
	mov dx, 381
	int 10h
	
	mov cx, 469
	mov dx, 381
	int 10h
	
	mov cx, 473
	mov dx, 381
	int 10h
	
	mov cx, 480
	mov dx, 381
	int 10h
	
	mov cx, 481
	mov dx, 381
	int 10h
	
	mov cx, 482
	mov dx, 381
	int 10h
	
	mov cx, 483
	mov dx, 381
	int 10h
	
	mov cx, 484
	mov dx, 381
	int 10h
	
	mov cx, 485
	mov dx, 381
	int 10h
	
	mov cx, 490
	mov dx, 381
	int 10h
	
	mov cx, 491
	mov dx, 381
	int 10h
	
	mov cx, 492
	mov dx, 381
	int 10h
	
	mov cx, 496
	mov dx, 381
	int 10h
	
	mov cx, 498
	mov dx, 381
	int 10h
	
	mov cx, 499
	mov dx, 381
	int 10h
	
	mov cx, 501
	mov dx, 381
	int 10h
	
	mov cx, 502
	mov dx, 381
	int 10h
	
	mov cx, 505
	mov dx, 381
	int 10h
	
	mov cx, 507
	mov dx, 381
	int 10h
	
	mov cx, 508
	mov dx, 381
	int 10h
	
	mov cx, 509
	mov dx, 381
	int 10h
	
	mov cx, 525
	mov dx, 381
	int 10h
	
	mov cx, 530
	mov dx, 381
	int 10h
	
	mov cx, 531
	mov dx, 381
	int 10h
	
	mov cx, 532
	mov dx, 381
	int 10h
	
	mov cx, 534
	mov dx, 381
	int 10h
	
	mov cx, 537
	mov dx, 381
	int 10h
	
	mov cx, 546
	mov dx, 381
	int 10h
	
	mov cx, 547
	mov dx, 381
	int 10h
	
	mov cx, 548
	mov dx, 381
	int 10h
	
	mov cx, 550
	mov dx, 381
	int 10h
	
	mov cx, 554
	mov dx, 381
	int 10h
	
	mov cx, 555
	mov dx, 381
	int 10h
	
	mov cx, 556
	mov dx, 381
	int 10h
	
	mov cx, 558
	mov dx, 381
	int 10h
	
	mov cx, 561
	mov dx, 381
	int 10h
	
	mov cx, 573
	mov dx, 381
	int 10h
	
	mov cx, 579
	mov dx, 381
	int 10h
	
	mov cx, 580
	mov dx, 381
	int 10h
	
	mov cx, 581
	mov dx, 381
	int 10h
	
	mov cx, 582
	mov dx, 381
	int 10h
	
	mov cx, 2
	mov dx, 382
	int 10h
	
	mov cx, 3
	mov dx, 382
	int 10h
	
	mov cx, 4
	mov dx, 382
	int 10h
	
	mov cx, 5
	mov dx, 382
	int 10h
	
	mov cx, 10
	mov dx, 382
	int 10h
	
	mov cx, 11
	mov dx, 382
	int 10h
	
	mov cx, 12
	mov dx, 382
	int 10h
	
	mov cx, 13
	mov dx, 382
	int 10h
	
	mov cx, 18
	mov dx, 382
	int 10h
	
	mov cx, 19
	mov dx, 382
	int 10h
	
	mov cx, 20
	mov dx, 382
	int 10h
	
	mov cx, 21
	mov dx, 382
	int 10h
	
	mov cx, 41
	mov dx, 382
	int 10h
	
	mov cx, 49
	mov dx, 382
	int 10h
	
	mov cx, 54
	mov dx, 382
	int 10h
	
	mov cx, 56
	mov dx, 382
	int 10h
	
	mov cx, 64
	mov dx, 382
	int 10h
	
	mov cx, 66
	mov dx, 382
	int 10h
	
	mov cx, 68
	mov dx, 382
	int 10h
	
	mov cx, 70
	mov dx, 382
	int 10h
	
	mov cx, 73
	mov dx, 382
	int 10h
	
	mov cx, 78
	mov dx, 382
	int 10h
	
	mov cx, 80
	mov dx, 382
	int 10h
	
	mov cx, 88
	mov dx, 382
	int 10h
	
	mov cx, 94
	mov dx, 382
	int 10h
	
	mov cx, 97
	mov dx, 382
	int 10h
	
	mov cx, 99
	mov dx, 382
	int 10h
	
	mov cx, 102
	mov dx, 382
	int 10h
	
	mov cx, 113
	mov dx, 382
	int 10h
	
	mov cx, 122
	mov dx, 382
	int 10h
	
	mov cx, 124
	mov dx, 382
	int 10h
	
	mov cx, 129
	mov dx, 382
	int 10h
	
	mov cx, 162
	mov dx, 382
	int 10h
	
	mov cx, 165
	mov dx, 382
	int 10h
	
	mov cx, 169
	mov dx, 382
	int 10h
	
	mov cx, 173
	mov dx, 382
	int 10h
	
	mov cx, 174
	mov dx, 382
	int 10h
	
	mov cx, 177
	mov dx, 382
	int 10h
	
	mov cx, 181
	mov dx, 382
	int 10h
	
	mov cx, 182
	mov dx, 382
	int 10h
	
	mov cx, 185
	mov dx, 382
	int 10h
	
	mov cx, 186
	mov dx, 382
	int 10h
	
	mov cx, 189
	mov dx, 382
	int 10h
	
	mov cx, 194
	mov dx, 382
	int 10h
	
	mov cx, 198
	mov dx, 382
	int 10h
	
	mov cx, 201
	mov dx, 382
	int 10h
	
	mov cx, 209
	mov dx, 382
	int 10h
	
	mov cx, 225
	mov dx, 382
	int 10h
	
	mov cx, 233
	mov dx, 382
	int 10h
	
	mov cx, 238
	mov dx, 382
	int 10h
	
	mov cx, 241
	mov dx, 382
	int 10h
	
	mov cx, 249
	mov dx, 382
	int 10h
	
	mov cx, 260
	mov dx, 382
	int 10h
	
	mov cx, 265
	mov dx, 382
	int 10h
	
	mov cx, 267
	mov dx, 382
	int 10h
	
	mov cx, 268
	mov dx, 382
	int 10h
	
	mov cx, 269
	mov dx, 382
	int 10h
	
	mov cx, 275
	mov dx, 382
	int 10h
	
	mov cx, 284
	mov dx, 382
	int 10h
	
	mov cx, 297
	mov dx, 382
	int 10h
	
	mov cx, 298
	mov dx, 382
	int 10h
	
	mov cx, 302
	mov dx, 382
	int 10h
	
	mov cx, 309
	mov dx, 382
	int 10h
	
	mov cx, 313
	mov dx, 382
	int 10h
	
	mov cx, 322
	mov dx, 382
	int 10h
	
	mov cx, 326
	mov dx, 382
	int 10h
	
	mov cx, 341
	mov dx, 382
	int 10h
	
	mov cx, 346
	mov dx, 382
	int 10h
	
	mov cx, 361
	mov dx, 382
	int 10h
	
	mov cx, 369
	mov dx, 382
	int 10h
	
	mov cx, 374
	mov dx, 382
	int 10h
	
	mov cx, 377
	mov dx, 382
	int 10h
	
	mov cx, 385
	mov dx, 382
	int 10h
	
	mov cx, 394
	mov dx, 382
	int 10h
	
	mov cx, 395
	mov dx, 382
	int 10h
	
	mov cx, 396
	mov dx, 382
	int 10h
	
	mov cx, 401
	mov dx, 382
	int 10h
	
	mov cx, 406
	mov dx, 382
	int 10h
	
	mov cx, 409
	mov dx, 382
	int 10h
	
	mov cx, 414
	mov dx, 382
	int 10h
	
	mov cx, 417
	mov dx, 382
	int 10h
	
	mov cx, 422
	mov dx, 382
	int 10h
	
	mov cx, 441
	mov dx, 382
	int 10h
	
	mov cx, 446
	mov dx, 382
	int 10h
	
	mov cx, 453
	mov dx, 382
	int 10h
	
	mov cx, 458
	mov dx, 382
	int 10h
	
	mov cx, 466
	mov dx, 382
	int 10h
	
	mov cx, 470
	mov dx, 382
	int 10h
	
	mov cx, 473
	mov dx, 382
	int 10h
	
	mov cx, 482
	mov dx, 382
	int 10h
	
	mov cx, 493
	mov dx, 382
	int 10h
	
	mov cx, 496
	mov dx, 382
	int 10h
	
	mov cx, 497
	mov dx, 382
	int 10h
	
	mov cx, 499
	mov dx, 382
	int 10h
	
	mov cx, 500
	mov dx, 382
	int 10h
	
	mov cx, 502
	mov dx, 382
	int 10h
	
	mov cx, 505
	mov dx, 382
	int 10h
	
	mov cx, 506
	mov dx, 382
	int 10h
	
	mov cx, 510
	mov dx, 382
	int 10h
	
	mov cx, 524
	mov dx, 382
	int 10h
	
	mov cx, 529
	mov dx, 382
	int 10h
	
	mov cx, 533
	mov dx, 382
	int 10h
	
	mov cx, 534
	mov dx, 382
	int 10h
	
	mov cx, 537
	mov dx, 382
	int 10h
	
	mov cx, 539
	mov dx, 382
	int 10h
	
	mov cx, 540
	mov dx, 382
	int 10h
	
	mov cx, 541
	mov dx, 382
	int 10h
	
	mov cx, 545
	mov dx, 382
	int 10h
	
	mov cx, 549
	mov dx, 382
	int 10h
	
	mov cx, 550
	mov dx, 382
	int 10h
	
	mov cx, 553
	mov dx, 382
	int 10h
	
	mov cx, 557
	mov dx, 382
	int 10h
	
	mov cx, 558
	mov dx, 382
	int 10h
	
	mov cx, 561
	mov dx, 382
	int 10h
	
	mov cx, 563
	mov dx, 382
	int 10h
	
	mov cx, 564
	mov dx, 382
	int 10h
	
	mov cx, 565
	mov dx, 382
	int 10h
	
	mov cx, 572
	mov dx, 382
	int 10h
	
	mov cx, 578
	mov dx, 382
	int 10h
	
	mov cx, 2
	mov dx, 383
	int 10h
	
	mov cx, 5
	mov dx, 383
	int 10h
	
	mov cx, 10
	mov dx, 383
	int 10h
	
	mov cx, 13
	mov dx, 383
	int 10h
	
	mov cx, 18
	mov dx, 383
	int 10h
	
	mov cx, 21
	mov dx, 383
	int 10h
	
	mov cx, 42
	mov dx, 383
	int 10h
	
	mov cx, 43
	mov dx, 383
	int 10h
	
	mov cx, 44
	mov dx, 383
	int 10h
	
	mov cx, 49
	mov dx, 383
	int 10h
	
	mov cx, 54
	mov dx, 383
	int 10h
	
	mov cx, 56
	mov dx, 383
	int 10h
	
	mov cx, 64
	mov dx, 383
	int 10h
	
	mov cx, 66
	mov dx, 383
	int 10h
	
	mov cx, 68
	mov dx, 383
	int 10h
	
	mov cx, 70
	mov dx, 383
	int 10h
	
	mov cx, 73
	mov dx, 383
	int 10h
	
	mov cx, 78
	mov dx, 383
	int 10h
	
	mov cx, 80
	mov dx, 383
	int 10h
	
	mov cx, 88
	mov dx, 383
	int 10h
	
	mov cx, 94
	mov dx, 383
	int 10h
	
	mov cx, 97
	mov dx, 383
	int 10h
	
	mov cx, 99
	mov dx, 383
	int 10h
	
	mov cx, 102
	mov dx, 383
	int 10h
	
	mov cx, 114
	mov dx, 383
	int 10h
	
	mov cx, 115
	mov dx, 383
	int 10h
	
	mov cx, 116
	mov dx, 383
	int 10h
	
	mov cx, 122
	mov dx, 383
	int 10h
	
	mov cx, 124
	mov dx, 383
	int 10h
	
	mov cx, 130
	mov dx, 383
	int 10h
	
	mov cx, 131
	mov dx, 383
	int 10h
	
	mov cx, 132
	mov dx, 383
	int 10h
	
	mov cx, 162
	mov dx, 383
	int 10h
	
	mov cx, 165
	mov dx, 383
	int 10h
	
	mov cx, 169
	mov dx, 383
	int 10h
	
	mov cx, 174
	mov dx, 383
	int 10h
	
	mov cx, 177
	mov dx, 383
	int 10h
	
	mov cx, 182
	mov dx, 383
	int 10h
	
	mov cx, 185
	mov dx, 383
	int 10h
	
	mov cx, 193
	mov dx, 383
	int 10h
	
	mov cx, 198
	mov dx, 383
	int 10h
	
	mov cx, 201
	mov dx, 383
	int 10h
	
	mov cx, 202
	mov dx, 383
	int 10h
	
	mov cx, 209
	mov dx, 383
	int 10h
	
	mov cx, 210
	mov dx, 383
	int 10h
	
	mov cx, 225
	mov dx, 383
	int 10h
	
	mov cx, 233
	mov dx, 383
	int 10h
	
	mov cx, 234
	mov dx, 383
	int 10h
	
	mov cx, 235
	mov dx, 383
	int 10h
	
	mov cx, 236
	mov dx, 383
	int 10h
	
	mov cx, 237
	mov dx, 383
	int 10h
	
	mov cx, 241
	mov dx, 383
	int 10h
	
	mov cx, 249
	mov dx, 383
	int 10h
	
	mov cx, 260
	mov dx, 383
	int 10h
	
	mov cx, 265
	mov dx, 383
	int 10h
	
	mov cx, 266
	mov dx, 383
	int 10h
	
	mov cx, 270
	mov dx, 383
	int 10h
	
	mov cx, 275
	mov dx, 383
	int 10h
	
	mov cx, 284
	mov dx, 383
	int 10h
	
	mov cx, 297
	mov dx, 383
	int 10h
	
	mov cx, 302
	mov dx, 383
	int 10h
	
	mov cx, 309
	mov dx, 383
	int 10h
	
	mov cx, 313
	mov dx, 383
	int 10h
	
	mov cx, 314
	mov dx, 383
	int 10h
	
	mov cx, 321
	mov dx, 383
	int 10h
	
	mov cx, 326
	mov dx, 383
	int 10h
	
	mov cx, 341
	mov dx, 383
	int 10h
	
	mov cx, 346
	mov dx, 383
	int 10h
	
	mov cx, 361
	mov dx, 383
	int 10h
	
	mov cx, 369
	mov dx, 383
	int 10h
	
	mov cx, 370
	mov dx, 383
	int 10h
	
	mov cx, 371
	mov dx, 383
	int 10h
	
	mov cx, 372
	mov dx, 383
	int 10h
	
	mov cx, 373
	mov dx, 383
	int 10h
	
	mov cx, 377
	mov dx, 383
	int 10h
	
	mov cx, 385
	mov dx, 383
	int 10h
	
	mov cx, 397
	mov dx, 383
	int 10h
	
	mov cx, 401
	mov dx, 383
	int 10h
	
	mov cx, 406
	mov dx, 383
	int 10h
	
	mov cx, 409
	mov dx, 383
	int 10h
	
	mov cx, 414
	mov dx, 383
	int 10h
	
	mov cx, 417
	mov dx, 383
	int 10h
	
	mov cx, 422
	mov dx, 383
	int 10h
	
	mov cx, 441
	mov dx, 383
	int 10h
	
	mov cx, 446
	mov dx, 383
	int 10h
	
	mov cx, 453
	mov dx, 383
	int 10h
	
	mov cx, 458
	mov dx, 383
	int 10h
	
	mov cx, 465
	mov dx, 383
	int 10h
	
	mov cx, 470
	mov dx, 383
	int 10h
	
	mov cx, 474
	mov dx, 383
	int 10h
	
	mov cx, 475
	mov dx, 383
	int 10h
	
	mov cx, 476
	mov dx, 383
	int 10h
	
	mov cx, 482
	mov dx, 383
	int 10h
	
	mov cx, 493
	mov dx, 383
	int 10h
	
	mov cx, 496
	mov dx, 383
	int 10h
	
	mov cx, 499
	mov dx, 383
	int 10h
	
	mov cx, 502
	mov dx, 383
	int 10h
	
	mov cx, 505
	mov dx, 383
	int 10h
	
	mov cx, 510
	mov dx, 383
	int 10h
	
	mov cx, 522
	mov dx, 383
	int 10h
	
	mov cx, 523
	mov dx, 383
	int 10h
	
	mov cx, 529
	mov dx, 383
	int 10h
	
	mov cx, 534
	mov dx, 383
	int 10h
	
	mov cx, 537
	mov dx, 383
	int 10h
	
	mov cx, 538
	mov dx, 383
	int 10h
	
	mov cx, 542
	mov dx, 383
	int 10h
	
	mov cx, 545
	mov dx, 383
	int 10h
	
	mov cx, 550
	mov dx, 383
	int 10h
	
	mov cx, 553
	mov dx, 383
	int 10h
	
	mov cx, 558
	mov dx, 383
	int 10h
	
	mov cx, 561
	mov dx, 383
	int 10h
	
	mov cx, 562
	mov dx, 383
	int 10h
	
	mov cx, 566
	mov dx, 383
	int 10h
	
	mov cx, 572
	mov dx, 383
	int 10h
	
	mov cx, 577
	mov dx, 383
	int 10h
	
	mov cx, 45
	mov dx, 384
	int 10h
	
	mov cx, 49
	mov dx, 384
	int 10h
	
	mov cx, 50
	mov dx, 384
	int 10h
	
	mov cx, 51
	mov dx, 384
	int 10h
	
	mov cx, 52
	mov dx, 384
	int 10h
	
	mov cx, 53
	mov dx, 384
	int 10h
	
	mov cx, 56
	mov dx, 384
	int 10h
	
	mov cx, 64
	mov dx, 384
	int 10h
	
	mov cx, 66
	mov dx, 384
	int 10h
	
	mov cx, 68
	mov dx, 384
	int 10h
	
	mov cx, 70
	mov dx, 384
	int 10h
	
	mov cx, 73
	mov dx, 384
	int 10h
	
	mov cx, 78
	mov dx, 384
	int 10h
	
	mov cx, 80
	mov dx, 384
	int 10h
	
	mov cx, 88
	mov dx, 384
	int 10h
	
	mov cx, 94
	mov dx, 384
	int 10h
	
	mov cx, 97
	mov dx, 384
	int 10h
	
	mov cx, 100
	mov dx, 384
	int 10h
	
	mov cx, 102
	mov dx, 384
	int 10h
	
	mov cx, 117
	mov dx, 384
	int 10h
	
	mov cx, 123
	mov dx, 384
	int 10h
	
	mov cx, 133
	mov dx, 384
	int 10h
	
	mov cx, 145
	mov dx, 384
	int 10h
	
	mov cx, 146
	mov dx, 384
	int 10h
	
	mov cx, 147
	mov dx, 384
	int 10h
	
	mov cx, 148
	mov dx, 384
	int 10h
	
	mov cx, 149
	mov dx, 384
	int 10h
	
	mov cx, 150
	mov dx, 384
	int 10h
	
	mov cx, 162
	mov dx, 384
	int 10h
	
	mov cx, 165
	mov dx, 384
	int 10h
	
	mov cx, 169
	mov dx, 384
	int 10h
	
	mov cx, 174
	mov dx, 384
	int 10h
	
	mov cx, 177
	mov dx, 384
	int 10h
	
	mov cx, 182
	mov dx, 384
	int 10h
	
	mov cx, 185
	mov dx, 384
	int 10h
	
	mov cx, 193
	mov dx, 384
	int 10h
	
	mov cx, 194
	mov dx, 384
	int 10h
	
	mov cx, 195
	mov dx, 384
	int 10h
	
	mov cx, 196
	mov dx, 384
	int 10h
	
	mov cx, 197
	mov dx, 384
	int 10h
	
	mov cx, 198
	mov dx, 384
	int 10h
	
	mov cx, 203
	mov dx, 384
	int 10h
	
	mov cx, 204
	mov dx, 384
	int 10h
	
	mov cx, 211
	mov dx, 384
	int 10h
	
	mov cx, 212
	mov dx, 384
	int 10h
	
	mov cx, 225
	mov dx, 384
	int 10h
	
	mov cx, 226
	mov dx, 384
	int 10h
	
	mov cx, 227
	mov dx, 384
	int 10h
	
	mov cx, 228
	mov dx, 384
	int 10h
	
	mov cx, 229
	mov dx, 384
	int 10h
	
	mov cx, 233
	mov dx, 384
	int 10h
	
	mov cx, 238
	mov dx, 384
	int 10h
	
	mov cx, 241
	mov dx, 384
	int 10h
	
	mov cx, 242
	mov dx, 384
	int 10h
	
	mov cx, 243
	mov dx, 384
	int 10h
	
	mov cx, 244
	mov dx, 384
	int 10h
	
	mov cx, 245
	mov dx, 384
	int 10h
	
	mov cx, 249
	mov dx, 384
	int 10h
	
	mov cx, 250
	mov dx, 384
	int 10h
	
	mov cx, 251
	mov dx, 384
	int 10h
	
	mov cx, 252
	mov dx, 384
	int 10h
	
	mov cx, 253
	mov dx, 384
	int 10h
	
	mov cx, 259
	mov dx, 384
	int 10h
	
	mov cx, 265
	mov dx, 384
	int 10h
	
	mov cx, 270
	mov dx, 384
	int 10h
	
	mov cx, 275
	mov dx, 384
	int 10h
	
	mov cx, 283
	mov dx, 384
	int 10h
	
	mov cx, 297
	mov dx, 384
	int 10h
	
	mov cx, 302
	mov dx, 384
	int 10h
	
	mov cx, 306
	mov dx, 384
	int 10h
	
	mov cx, 307
	mov dx, 384
	int 10h
	
	mov cx, 308
	mov dx, 384
	int 10h
	
	mov cx, 309
	mov dx, 384
	int 10h
	
	mov cx, 315
	mov dx, 384
	int 10h
	
	mov cx, 316
	mov dx, 384
	int 10h
	
	mov cx, 321
	mov dx, 384
	int 10h
	
	mov cx, 322
	mov dx, 384
	int 10h
	
	mov cx, 323
	mov dx, 384
	int 10h
	
	mov cx, 324
	mov dx, 384
	int 10h
	
	mov cx, 325
	mov dx, 384
	int 10h
	
	mov cx, 326
	mov dx, 384
	int 10h
	
	mov cx, 338
	mov dx, 384
	int 10h
	
	mov cx, 339
	mov dx, 384
	int 10h
	
	mov cx, 340
	mov dx, 384
	int 10h
	
	mov cx, 341
	mov dx, 384
	int 10h
	
	mov cx, 346
	mov dx, 384
	int 10h
	
	mov cx, 361
	mov dx, 384
	int 10h
	
	mov cx, 362
	mov dx, 384
	int 10h
	
	mov cx, 363
	mov dx, 384
	int 10h
	
	mov cx, 364
	mov dx, 384
	int 10h
	
	mov cx, 365
	mov dx, 384
	int 10h
	
	mov cx, 369
	mov dx, 384
	int 10h
	
	mov cx, 374
	mov dx, 384
	int 10h
	
	mov cx, 377
	mov dx, 384
	int 10h
	
	mov cx, 378
	mov dx, 384
	int 10h
	
	mov cx, 379
	mov dx, 384
	int 10h
	
	mov cx, 380
	mov dx, 384
	int 10h
	
	mov cx, 381
	mov dx, 384
	int 10h
	
	mov cx, 385
	mov dx, 384
	int 10h
	
	mov cx, 386
	mov dx, 384
	int 10h
	
	mov cx, 387
	mov dx, 384
	int 10h
	
	mov cx, 388
	mov dx, 384
	int 10h
	
	mov cx, 389
	mov dx, 384
	int 10h
	
	mov cx, 397
	mov dx, 384
	int 10h
	
	mov cx, 401
	mov dx, 384
	int 10h
	
	mov cx, 406
	mov dx, 384
	int 10h
	
	mov cx, 409
	mov dx, 384
	int 10h
	
	mov cx, 414
	mov dx, 384
	int 10h
	
	mov cx, 417
	mov dx, 384
	int 10h
	
	mov cx, 422
	mov dx, 384
	int 10h
	
	mov cx, 441
	mov dx, 384
	int 10h
	
	mov cx, 446
	mov dx, 384
	int 10h
	
	mov cx, 450
	mov dx, 384
	int 10h
	
	mov cx, 451
	mov dx, 384
	int 10h
	
	mov cx, 452
	mov dx, 384
	int 10h
	
	mov cx, 453
	mov dx, 384
	int 10h
	
	mov cx, 458
	mov dx, 384
	int 10h
	
	mov cx, 465
	mov dx, 384
	int 10h
	
	mov cx, 466
	mov dx, 384
	int 10h
	
	mov cx, 467
	mov dx, 384
	int 10h
	
	mov cx, 468
	mov dx, 384
	int 10h
	
	mov cx, 469
	mov dx, 384
	int 10h
	
	mov cx, 470
	mov dx, 384
	int 10h
	
	mov cx, 477
	mov dx, 384
	int 10h
	
	mov cx, 482
	mov dx, 384
	int 10h
	
	mov cx, 490
	mov dx, 384
	int 10h
	
	mov cx, 491
	mov dx, 384
	int 10h
	
	mov cx, 492
	mov dx, 384
	int 10h
	
	mov cx, 493
	mov dx, 384
	int 10h
	
	mov cx, 496
	mov dx, 384
	int 10h
	
	mov cx, 499
	mov dx, 384
	int 10h
	
	mov cx, 502
	mov dx, 384
	int 10h
	
	mov cx, 505
	mov dx, 384
	int 10h
	
	mov cx, 510
	mov dx, 384
	int 10h
	
	mov cx, 524
	mov dx, 384
	int 10h
	
	mov cx, 525
	mov dx, 384
	int 10h
	
	mov cx, 529
	mov dx, 384
	int 10h
	
	mov cx, 534
	mov dx, 384
	int 10h
	
	mov cx, 537
	mov dx, 384
	int 10h
	
	mov cx, 542
	mov dx, 384
	int 10h
	
	mov cx, 545
	mov dx, 384
	int 10h
	
	mov cx, 550
	mov dx, 384
	int 10h
	
	mov cx, 553
	mov dx, 384
	int 10h
	
	mov cx, 558
	mov dx, 384
	int 10h
	
	mov cx, 561
	mov dx, 384
	int 10h
	
	mov cx, 566
	mov dx, 384
	int 10h
	
	mov cx, 571
	mov dx, 384
	int 10h
	
	mov cx, 577
	mov dx, 384
	int 10h
	
	mov cx, 46
	mov dx, 385
	int 10h
	
	mov cx, 49
	mov dx, 385
	int 10h
	
	mov cx, 56
	mov dx, 385
	int 10h
	
	mov cx, 64
	mov dx, 385
	int 10h
	
	mov cx, 67
	mov dx, 385
	int 10h
	
	mov cx, 70
	mov dx, 385
	int 10h
	
	mov cx, 73
	mov dx, 385
	int 10h
	
	mov cx, 78
	mov dx, 385
	int 10h
	
	mov cx, 80
	mov dx, 385
	int 10h
	
	mov cx, 88
	mov dx, 385
	int 10h
	
	mov cx, 94
	mov dx, 385
	int 10h
	
	mov cx, 97
	mov dx, 385
	int 10h
	
	mov cx, 100
	mov dx, 385
	int 10h
	
	mov cx, 102
	mov dx, 385
	int 10h
	
	mov cx, 118
	mov dx, 385
	int 10h
	
	mov cx, 123
	mov dx, 385
	int 10h
	
	mov cx, 134
	mov dx, 385
	int 10h
	
	mov cx, 161
	mov dx, 385
	int 10h
	
	mov cx, 162
	mov dx, 385
	int 10h
	
	mov cx, 163
	mov dx, 385
	int 10h
	
	mov cx, 164
	mov dx, 385
	int 10h
	
	mov cx, 165
	mov dx, 385
	int 10h
	
	mov cx, 166
	mov dx, 385
	int 10h
	
	mov cx, 169
	mov dx, 385
	int 10h
	
	mov cx, 174
	mov dx, 385
	int 10h
	
	mov cx, 177
	mov dx, 385
	int 10h
	
	mov cx, 182
	mov dx, 385
	int 10h
	
	mov cx, 185
	mov dx, 385
	int 10h
	
	mov cx, 193
	mov dx, 385
	int 10h
	
	mov cx, 205
	mov dx, 385
	int 10h
	
	mov cx, 213
	mov dx, 385
	int 10h
	
	mov cx, 225
	mov dx, 385
	int 10h
	
	mov cx, 233
	mov dx, 385
	int 10h
	
	mov cx, 238
	mov dx, 385
	int 10h
	
	mov cx, 241
	mov dx, 385
	int 10h
	
	mov cx, 249
	mov dx, 385
	int 10h
	
	mov cx, 259
	mov dx, 385
	int 10h
	
	mov cx, 265
	mov dx, 385
	int 10h
	
	mov cx, 270
	mov dx, 385
	int 10h
	
	mov cx, 275
	mov dx, 385
	int 10h
	
	mov cx, 283
	mov dx, 385
	int 10h
	
	mov cx, 297
	mov dx, 385
	int 10h
	
	mov cx, 302
	mov dx, 385
	int 10h
	
	mov cx, 305
	mov dx, 385
	int 10h
	
	mov cx, 309
	mov dx, 385
	int 10h
	
	mov cx, 317
	mov dx, 385
	int 10h
	
	mov cx, 321
	mov dx, 385
	int 10h
	
	mov cx, 337
	mov dx, 385
	int 10h
	
	mov cx, 341
	mov dx, 385
	int 10h
	
	mov cx, 346
	mov dx, 385
	int 10h
	
	mov cx, 361
	mov dx, 385
	int 10h
	
	mov cx, 369
	mov dx, 385
	int 10h
	
	mov cx, 374
	mov dx, 385
	int 10h
	
	mov cx, 377
	mov dx, 385
	int 10h
	
	mov cx, 385
	mov dx, 385
	int 10h
	
	mov cx, 397
	mov dx, 385
	int 10h
	
	mov cx, 401
	mov dx, 385
	int 10h
	
	mov cx, 406
	mov dx, 385
	int 10h
	
	mov cx, 409
	mov dx, 385
	int 10h
	
	mov cx, 414
	mov dx, 385
	int 10h
	
	mov cx, 417
	mov dx, 385
	int 10h
	
	mov cx, 422
	mov dx, 385
	int 10h
	
	mov cx, 441
	mov dx, 385
	int 10h
	
	mov cx, 446
	mov dx, 385
	int 10h
	
	mov cx, 449
	mov dx, 385
	int 10h
	
	mov cx, 453
	mov dx, 385
	int 10h
	
	mov cx, 458
	mov dx, 385
	int 10h
	
	mov cx, 465
	mov dx, 385
	int 10h
	
	mov cx, 478
	mov dx, 385
	int 10h
	
	mov cx, 482
	mov dx, 385
	int 10h
	
	mov cx, 489
	mov dx, 385
	int 10h
	
	mov cx, 493
	mov dx, 385
	int 10h
	
	mov cx, 496
	mov dx, 385
	int 10h
	
	mov cx, 499
	mov dx, 385
	int 10h
	
	mov cx, 502
	mov dx, 385
	int 10h
	
	mov cx, 505
	mov dx, 385
	int 10h
	
	mov cx, 510
	mov dx, 385
	int 10h
	
	mov cx, 525
	mov dx, 385
	int 10h
	
	mov cx, 529
	mov dx, 385
	int 10h
	
	mov cx, 534
	mov dx, 385
	int 10h
	
	mov cx, 537
	mov dx, 385
	int 10h
	
	mov cx, 542
	mov dx, 385
	int 10h
	
	mov cx, 545
	mov dx, 385
	int 10h
	
	mov cx, 550
	mov dx, 385
	int 10h
	
	mov cx, 553
	mov dx, 385
	int 10h
	
	mov cx, 558
	mov dx, 385
	int 10h
	
	mov cx, 561
	mov dx, 385
	int 10h
	
	mov cx, 566
	mov dx, 385
	int 10h
	
	mov cx, 571
	mov dx, 385
	int 10h
	
	mov cx, 577
	mov dx, 385
	int 10h
	
	mov cx, 46
	mov dx, 386
	int 10h
	
	mov cx, 49
	mov dx, 386
	int 10h
	
	mov cx, 57
	mov dx, 386
	int 10h
	
	mov cx, 64
	mov dx, 386
	int 10h
	
	mov cx, 70
	mov dx, 386
	int 10h
	
	mov cx, 73
	mov dx, 386
	int 10h
	
	mov cx, 77
	mov dx, 386
	int 10h
	
	mov cx, 81
	mov dx, 386
	int 10h
	
	mov cx, 89
	mov dx, 386
	int 10h
	
	mov cx, 93
	mov dx, 386
	int 10h
	
	mov cx, 97
	mov dx, 386
	int 10h
	
	mov cx, 101
	mov dx, 386
	int 10h
	
	mov cx, 102
	mov dx, 386
	int 10h
	
	mov cx, 106
	mov dx, 386
	int 10h
	
	mov cx, 107
	mov dx, 386
	int 10h
	
	mov cx, 118
	mov dx, 386
	int 10h
	
	mov cx, 123
	mov dx, 386
	int 10h
	
	mov cx, 134
	mov dx, 386
	int 10h
	
	mov cx, 161
	mov dx, 386
	int 10h
	
	mov cx, 166
	mov dx, 386
	int 10h
	
	mov cx, 169
	mov dx, 386
	int 10h
	
	mov cx, 173
	mov dx, 386
	int 10h
	
	mov cx, 174
	mov dx, 386
	int 10h
	
	mov cx, 177
	mov dx, 386
	int 10h
	
	mov cx, 181
	mov dx, 386
	int 10h
	
	mov cx, 182
	mov dx, 386
	int 10h
	
	mov cx, 185
	mov dx, 386
	int 10h
	
	mov cx, 193
	mov dx, 386
	int 10h
	
	mov cx, 205
	mov dx, 386
	int 10h
	
	mov cx, 213
	mov dx, 386
	int 10h
	
	mov cx, 225
	mov dx, 386
	int 10h
	
	mov cx, 233
	mov dx, 386
	int 10h
	
	mov cx, 238
	mov dx, 386
	int 10h
	
	mov cx, 241
	mov dx, 386
	int 10h
	
	mov cx, 249
	mov dx, 386
	int 10h
	
	mov cx, 258
	mov dx, 386
	int 10h
	
	mov cx, 266
	mov dx, 386
	int 10h
	
	mov cx, 270
	mov dx, 386
	int 10h
	
	mov cx, 275
	mov dx, 386
	int 10h
	
	mov cx, 282
	mov dx, 386
	int 10h
	
	mov cx, 297
	mov dx, 386
	int 10h
	
	mov cx, 298
	mov dx, 386
	int 10h
	
	mov cx, 302
	mov dx, 386
	int 10h
	
	mov cx, 305
	mov dx, 386
	int 10h
	
	mov cx, 309
	mov dx, 386
	int 10h
	
	mov cx, 317
	mov dx, 386
	int 10h
	
	mov cx, 321
	mov dx, 386
	int 10h
	
	mov cx, 337
	mov dx, 386
	int 10h
	
	mov cx, 341
	mov dx, 386
	int 10h
	
	mov cx, 346
	mov dx, 386
	int 10h
	
	mov cx, 361
	mov dx, 386
	int 10h
	
	mov cx, 369
	mov dx, 386
	int 10h
	
	mov cx, 374
	mov dx, 386
	int 10h
	
	mov cx, 377
	mov dx, 386
	int 10h
	
	mov cx, 385
	mov dx, 386
	int 10h
	
	mov cx, 397
	mov dx, 386
	int 10h
	
	mov cx, 402
	mov dx, 386
	int 10h
	
	mov cx, 405
	mov dx, 386
	int 10h
	
	mov cx, 410
	mov dx, 386
	int 10h
	
	mov cx, 413
	mov dx, 386
	int 10h
	
	mov cx, 418
	mov dx, 386
	int 10h
	
	mov cx, 421
	mov dx, 386
	int 10h
	
	mov cx, 426
	mov dx, 386
	int 10h
	
	mov cx, 427
	mov dx, 386
	int 10h
	
	mov cx, 441
	mov dx, 386
	int 10h
	
	mov cx, 445
	mov dx, 386
	int 10h
	
	mov cx, 449
	mov dx, 386
	int 10h
	
	mov cx, 453
	mov dx, 386
	int 10h
	
	mov cx, 458
	mov dx, 386
	int 10h
	
	mov cx, 465
	mov dx, 386
	int 10h
	
	mov cx, 478
	mov dx, 386
	int 10h
	
	mov cx, 482
	mov dx, 386
	int 10h
	
	mov cx, 489
	mov dx, 386
	int 10h
	
	mov cx, 493
	mov dx, 386
	int 10h
	
	mov cx, 496
	mov dx, 386
	int 10h
	
	mov cx, 499
	mov dx, 386
	int 10h
	
	mov cx, 502
	mov dx, 386
	int 10h
	
	mov cx, 505
	mov dx, 386
	int 10h
	
	mov cx, 506
	mov dx, 386
	int 10h
	
	mov cx, 510
	mov dx, 386
	int 10h
	
	mov cx, 525
	mov dx, 386
	int 10h
	
	mov cx, 529
	mov dx, 386
	int 10h
	
	mov cx, 533
	mov dx, 386
	int 10h
	
	mov cx, 534
	mov dx, 386
	int 10h
	
	mov cx, 538
	mov dx, 386
	int 10h
	
	mov cx, 542
	mov dx, 386
	int 10h
	
	mov cx, 545
	mov dx, 386
	int 10h
	
	mov cx, 549
	mov dx, 386
	int 10h
	
	mov cx, 550
	mov dx, 386
	int 10h
	
	mov cx, 553
	mov dx, 386
	int 10h
	
	mov cx, 557
	mov dx, 386
	int 10h
	
	mov cx, 558
	mov dx, 386
	int 10h
	
	mov cx, 562
	mov dx, 386
	int 10h
	
	mov cx, 566
	mov dx, 386
	int 10h
	
	mov cx, 570
	mov dx, 386
	int 10h
	
	mov cx, 578
	mov dx, 386
	int 10h
	
	mov cx, 41
	mov dx, 387
	int 10h
	
	mov cx, 42
	mov dx, 387
	int 10h
	
	mov cx, 43
	mov dx, 387
	int 10h
	
	mov cx, 44
	mov dx, 387
	int 10h
	
	mov cx, 45
	mov dx, 387
	int 10h
	
	mov cx, 49
	mov dx, 387
	int 10h
	
	mov cx, 58
	mov dx, 387
	int 10h
	
	mov cx, 59
	mov dx, 387
	int 10h
	
	mov cx, 60
	mov dx, 387
	int 10h
	
	mov cx, 61
	mov dx, 387
	int 10h
	
	mov cx, 62
	mov dx, 387
	int 10h
	
	mov cx, 64
	mov dx, 387
	int 10h
	
	mov cx, 70
	mov dx, 387
	int 10h
	
	mov cx, 73
	mov dx, 387
	int 10h
	
	mov cx, 74
	mov dx, 387
	int 10h
	
	mov cx, 75
	mov dx, 387
	int 10h
	
	mov cx, 76
	mov dx, 387
	int 10h
	
	mov cx, 82
	mov dx, 387
	int 10h
	
	mov cx, 83
	mov dx, 387
	int 10h
	
	mov cx, 84
	mov dx, 387
	int 10h
	
	mov cx, 85
	mov dx, 387
	int 10h
	
	mov cx, 86
	mov dx, 387
	int 10h
	
	mov cx, 90
	mov dx, 387
	int 10h
	
	mov cx, 91
	mov dx, 387
	int 10h
	
	mov cx, 92
	mov dx, 387
	int 10h
	
	mov cx, 97
	mov dx, 387
	int 10h
	
	mov cx, 102
	mov dx, 387
	int 10h
	
	mov cx, 106
	mov dx, 387
	int 10h
	
	mov cx, 107
	mov dx, 387
	int 10h
	
	mov cx, 113
	mov dx, 387
	int 10h
	
	mov cx, 114
	mov dx, 387
	int 10h
	
	mov cx, 115
	mov dx, 387
	int 10h
	
	mov cx, 116
	mov dx, 387
	int 10h
	
	mov cx, 117
	mov dx, 387
	int 10h
	
	mov cx, 123
	mov dx, 387
	int 10h
	
	mov cx, 129
	mov dx, 387
	int 10h
	
	mov cx, 130
	mov dx, 387
	int 10h
	
	mov cx, 131
	mov dx, 387
	int 10h
	
	mov cx, 132
	mov dx, 387
	int 10h
	
	mov cx, 133
	mov dx, 387
	int 10h
	
	mov cx, 160
	mov dx, 387
	int 10h
	
	mov cx, 167
	mov dx, 387
	int 10h
	
	mov cx, 170
	mov dx, 387
	int 10h
	
	mov cx, 171
	mov dx, 387
	int 10h
	
	mov cx, 172
	mov dx, 387
	int 10h
	
	mov cx, 174
	mov dx, 387
	int 10h
	
	mov cx, 178
	mov dx, 387
	int 10h
	
	mov cx, 179
	mov dx, 387
	int 10h
	
	mov cx, 180
	mov dx, 387
	int 10h
	
	mov cx, 182
	mov dx, 387
	int 10h
	
	mov cx, 185
	mov dx, 387
	int 10h
	
	mov cx, 194
	mov dx, 387
	int 10h
	
	mov cx, 195
	mov dx, 387
	int 10h
	
	mov cx, 196
	mov dx, 387
	int 10h
	
	mov cx, 197
	mov dx, 387
	int 10h
	
	mov cx, 198
	mov dx, 387
	int 10h
	
	mov cx, 201
	mov dx, 387
	int 10h
	
	mov cx, 202
	mov dx, 387
	int 10h
	
	mov cx, 203
	mov dx, 387
	int 10h
	
	mov cx, 204
	mov dx, 387
	int 10h
	
	mov cx, 209
	mov dx, 387
	int 10h
	
	mov cx, 210
	mov dx, 387
	int 10h
	
	mov cx, 211
	mov dx, 387
	int 10h
	
	mov cx, 212
	mov dx, 387
	int 10h
	
	mov cx, 225
	mov dx, 387
	int 10h
	
	mov cx, 233
	mov dx, 387
	int 10h
	
	mov cx, 234
	mov dx, 387
	int 10h
	
	mov cx, 235
	mov dx, 387
	int 10h
	
	mov cx, 236
	mov dx, 387
	int 10h
	
	mov cx, 237
	mov dx, 387
	int 10h
	
	mov cx, 241
	mov dx, 387
	int 10h
	
	mov cx, 249
	mov dx, 387
	int 10h
	
	mov cx, 250
	mov dx, 387
	int 10h
	
	mov cx, 251
	mov dx, 387
	int 10h
	
	mov cx, 252
	mov dx, 387
	int 10h
	
	mov cx, 253
	mov dx, 387
	int 10h
	
	mov cx, 254
	mov dx, 387
	int 10h
	
	mov cx, 258
	mov dx, 387
	int 10h
	
	mov cx, 267
	mov dx, 387
	int 10h
	
	mov cx, 268
	mov dx, 387
	int 10h
	
	mov cx, 269
	mov dx, 387
	int 10h
	
	mov cx, 272
	mov dx, 387
	int 10h
	
	mov cx, 273
	mov dx, 387
	int 10h
	
	mov cx, 274
	mov dx, 387
	int 10h
	
	mov cx, 275
	mov dx, 387
	int 10h
	
	mov cx, 276
	mov dx, 387
	int 10h
	
	mov cx, 277
	mov dx, 387
	int 10h
	
	mov cx, 278
	mov dx, 387
	int 10h
	
	mov cx, 282
	mov dx, 387
	int 10h
	
	mov cx, 297
	mov dx, 387
	int 10h
	
	mov cx, 299
	mov dx, 387
	int 10h
	
	mov cx, 300
	mov dx, 387
	int 10h
	
	mov cx, 301
	mov dx, 387
	int 10h
	
	mov cx, 306
	mov dx, 387
	int 10h
	
	mov cx, 307
	mov dx, 387
	int 10h
	
	mov cx, 308
	mov dx, 387
	int 10h
	
	mov cx, 309
	mov dx, 387
	int 10h
	
	mov cx, 310
	mov dx, 387
	int 10h
	
	mov cx, 313
	mov dx, 387
	int 10h
	
	mov cx, 314
	mov dx, 387
	int 10h
	
	mov cx, 315
	mov dx, 387
	int 10h
	
	mov cx, 316
	mov dx, 387
	int 10h
	
	mov cx, 322
	mov dx, 387
	int 10h
	
	mov cx, 323
	mov dx, 387
	int 10h
	
	mov cx, 324
	mov dx, 387
	int 10h
	
	mov cx, 325
	mov dx, 387
	int 10h
	
	mov cx, 326
	mov dx, 387
	int 10h
	
	mov cx, 338
	mov dx, 387
	int 10h
	
	mov cx, 339
	mov dx, 387
	int 10h
	
	mov cx, 340
	mov dx, 387
	int 10h
	
	mov cx, 341
	mov dx, 387
	int 10h
	
	mov cx, 342
	mov dx, 387
	int 10h
	
	mov cx, 347
	mov dx, 387
	int 10h
	
	mov cx, 348
	mov dx, 387
	int 10h
	
	mov cx, 349
	mov dx, 387
	int 10h
	
	mov cx, 361
	mov dx, 387
	int 10h
	
	mov cx, 369
	mov dx, 387
	int 10h
	
	mov cx, 370
	mov dx, 387
	int 10h
	
	mov cx, 371
	mov dx, 387
	int 10h
	
	mov cx, 372
	mov dx, 387
	int 10h
	
	mov cx, 373
	mov dx, 387
	int 10h
	
	mov cx, 377
	mov dx, 387
	int 10h
	
	mov cx, 385
	mov dx, 387
	int 10h
	
	mov cx, 386
	mov dx, 387
	int 10h
	
	mov cx, 387
	mov dx, 387
	int 10h
	
	mov cx, 388
	mov dx, 387
	int 10h
	
	mov cx, 389
	mov dx, 387
	int 10h
	
	mov cx, 390
	mov dx, 387
	int 10h
	
	mov cx, 394
	mov dx, 387
	int 10h
	
	mov cx, 395
	mov dx, 387
	int 10h
	
	mov cx, 396
	mov dx, 387
	int 10h
	
	mov cx, 402
	mov dx, 387
	int 10h
	
	mov cx, 403
	mov dx, 387
	int 10h
	
	mov cx, 404
	mov dx, 387
	int 10h
	
	mov cx, 405
	mov dx, 387
	int 10h
	
	mov cx, 410
	mov dx, 387
	int 10h
	
	mov cx, 411
	mov dx, 387
	int 10h
	
	mov cx, 412
	mov dx, 387
	int 10h
	
	mov cx, 413
	mov dx, 387
	int 10h
	
	mov cx, 418
	mov dx, 387
	int 10h
	
	mov cx, 419
	mov dx, 387
	int 10h
	
	mov cx, 420
	mov dx, 387
	int 10h
	
	mov cx, 421
	mov dx, 387
	int 10h
	
	mov cx, 426
	mov dx, 387
	int 10h
	
	mov cx, 427
	mov dx, 387
	int 10h
	
	mov cx, 441
	mov dx, 387
	int 10h
	
	mov cx, 442
	mov dx, 387
	int 10h
	
	mov cx, 443
	mov dx, 387
	int 10h
	
	mov cx, 444
	mov dx, 387
	int 10h
	
	mov cx, 450
	mov dx, 387
	int 10h
	
	mov cx, 451
	mov dx, 387
	int 10h
	
	mov cx, 452
	mov dx, 387
	int 10h
	
	mov cx, 453
	mov dx, 387
	int 10h
	
	mov cx, 454
	mov dx, 387
	int 10h
	
	mov cx, 459
	mov dx, 387
	int 10h
	
	mov cx, 460
	mov dx, 387
	int 10h
	
	mov cx, 461
	mov dx, 387
	int 10h
	
	mov cx, 466
	mov dx, 387
	int 10h
	
	mov cx, 467
	mov dx, 387
	int 10h
	
	mov cx, 468
	mov dx, 387
	int 10h
	
	mov cx, 469
	mov dx, 387
	int 10h
	
	mov cx, 470
	mov dx, 387
	int 10h
	
	mov cx, 473
	mov dx, 387
	int 10h
	
	mov cx, 474
	mov dx, 387
	int 10h
	
	mov cx, 475
	mov dx, 387
	int 10h
	
	mov cx, 476
	mov dx, 387
	int 10h
	
	mov cx, 477
	mov dx, 387
	int 10h
	
	mov cx, 483
	mov dx, 387
	int 10h
	
	mov cx, 484
	mov dx, 387
	int 10h
	
	mov cx, 485
	mov dx, 387
	int 10h
	
	mov cx, 490
	mov dx, 387
	int 10h
	
	mov cx, 491
	mov dx, 387
	int 10h
	
	mov cx, 492
	mov dx, 387
	int 10h
	
	mov cx, 493
	mov dx, 387
	int 10h
	
	mov cx, 494
	mov dx, 387
	int 10h
	
	mov cx, 496
	mov dx, 387
	int 10h
	
	mov cx, 499
	mov dx, 387
	int 10h
	
	mov cx, 502
	mov dx, 387
	int 10h
	
	mov cx, 505
	mov dx, 387
	int 10h
	
	mov cx, 507
	mov dx, 387
	int 10h
	
	mov cx, 508
	mov dx, 387
	int 10h
	
	mov cx, 509
	mov dx, 387
	int 10h
	
	mov cx, 521
	mov dx, 387
	int 10h
	
	mov cx, 522
	mov dx, 387
	int 10h
	
	mov cx, 523
	mov dx, 387
	int 10h
	
	mov cx, 524
	mov dx, 387
	int 10h
	
	mov cx, 530
	mov dx, 387
	int 10h
	
	mov cx, 531
	mov dx, 387
	int 10h
	
	mov cx, 532
	mov dx, 387
	int 10h
	
	mov cx, 534
	mov dx, 387
	int 10h
	
	mov cx, 539
	mov dx, 387
	int 10h
	
	mov cx, 540
	mov dx, 387
	int 10h
	
	mov cx, 541
	mov dx, 387
	int 10h
	
	mov cx, 546
	mov dx, 387
	int 10h
	
	mov cx, 547
	mov dx, 387
	int 10h
	
	mov cx, 548
	mov dx, 387
	int 10h
	
	mov cx, 550
	mov dx, 387
	int 10h
	
	mov cx, 554
	mov dx, 387
	int 10h
	
	mov cx, 555
	mov dx, 387
	int 10h
	
	mov cx, 556
	mov dx, 387
	int 10h
	
	mov cx, 558
	mov dx, 387
	int 10h
	
	mov cx, 563
	mov dx, 387
	int 10h
	
	mov cx, 564
	mov dx, 387
	int 10h
	
	mov cx, 565
	mov dx, 387
	int 10h
	
	mov cx, 570
	mov dx, 387
	int 10h
	
	mov cx, 579
	mov dx, 387
	int 10h
	
	mov cx, 580
	mov dx, 387
	int 10h
	
	mov cx, 581
	mov dx, 387
	int 10h
	
	mov cx, 582
	mov dx, 387
	int 10h
	
	mov cx, 427
	mov dx, 388
	int 10h
	
	mov cx, 505
	mov dx, 388
	int 10h
	
	mov cx, 426
	mov dx, 389
	int 10h
	
	mov cx, 505
	mov dx, 389
	int 10h
	
	mov cx, 505
	mov dx, 390
	int 10h
	ret

times 131072 - ($ - $$) db 0

;=========================================================================================================================================================================================================================================
;=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
;=========================================================================================================================================================================================================================================

; bubble_sort.asm
; My name is: Cole Wilshire
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:DWORD

.data
	arrayInt	DWORD	7,5,2,4

.code

; In your watch window you might want to use
; *((&arrayInt)+0)
; *((&arrayInt)+1)
; *((&arrayInt)+2)
; *((&arrayInt)+3)

main PROC
	mov	edi, OFFSET arrayInt		; EDI = address of arrayInt
	mov ecx, LENGTHOF arrayInt	; initialize loop counter.
	dec ecx						; I don't want to go all the way to the end.
	
L1:
	;CODE: Get the EDI-th element of the array and save it into EAX.
	mov EAX, [EDI]
	;CODE: Add "one" to EDI to make it point to the next element in the array.
	add EDI,TYPE arrayInt
	;CODE: Get the current EDI-th element of the array of save it into EBX.
	mov EBX, [EDI]
	;CODE: Subtract "one" from EDI to make it point to the previous array element once again.
	sub EDI, TYPE arrayInt
	cmp EAX, EBX
	JG L2
	jmp L3
	
	L2:
		;CODE: Exchange the values of EAX and EBX.  Hint: use "XCHG"
		xchg EAX, EBX
		;CODE: Move the value of EAX into the EDI-th element of the array.
		mov [EDI], EAX
		;CODE: Add "one" to EDI to make it point to the next element in the array.
		add EDI, TYPE arrayInt
		;CODE: Move the value of EBX into the now EDI-th element of the array.
		mov [EDI], EBX
		;CODE: Reset EDI so it points to the first element of the array.
		mov EDI, OFFSET arrayInt
		mov ECX, LENGTHOF arrayInt
		loop L1
	L3:
	add edi, TYPE arrayInt		; point to the next element of the arrayInt.
	loop L1	
	
INVOKE ExitProcess,0  ; if done correctly intArray is now 2,4,5,7.
main ENDP
END main
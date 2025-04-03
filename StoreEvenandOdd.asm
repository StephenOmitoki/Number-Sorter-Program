INCLUDE Irvine32.inc 

.data
    nums DWORD 0,1,2,3,4,5
    lenght DWORD LENGTHOF nums
    storeEven DWORD LENGTHOF nums DUP(0)
    storeOdd DWORD LENGTHOF nums DUP(0)
    evenCount DWORD 0
    oddCount DWORD 0
    msgEven BYTE "Even numbers: ", 0
    msgOdd BYTE "Odd Numbers: ", 0


.code
MAIN PROC
    mov ESI, OFFSET nums
    mov ECX, lenght
    
    xor EBX, EBX
    xor EDI, EDI
    xor EDX, EDX
    
    mov EBX, OFFSET storeEven
    mov EDI, OFFSET storeOdd
   
   
   
   
   
ProcessNumbers:
    mov EAX,[ESI]
    TEST EAX, 1
    
    JZ storeEvenLoop
	;JMP storeOddLoop
	
    
    
storeOddLoop:
    mov [EDI], EAX
	add EDI, 4
	INC oddCount
	JMP NextNum
	
	
storeEvenLoop:
    mov [EBX], EAX
    add EBX, 4	
	INC EvenCount
	JMP Nextnum
	
    
    
    
NextNum:
   add ESI, 4
   loop ProcessNumbers
   
   
;displayNumbers

  mov EDX, OFFSET msgEven
  call WriteString
  call Crlf
  
  mov ESI, OFFSET storeEven
  mov ECX, evenCount
  call DisplayArray
  call Crlf
  
  mov EDX, OFFSET msgOdd
  call WriteString
  call Crlf
  
  mov ESI, OFFSET  storeOdd
  mov ECX, oddCount
  call DisplayArray
  call Crlf
  
  exit
  
main ENDP

DisplayArray PROC 

 push ESI
 push ECX
 
L1:
 
 mov EAX, [ESI]
 call WriteDec
 call Crlf
 add ESI, 4
 loop L1
 pop ECX
 pop ESI
 ret
DisplayArray ENDP

END MAIN 
  
  
  
  
   
    
    
    
    
    
    
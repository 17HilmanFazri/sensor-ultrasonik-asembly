ORG 00H               
MOV DPTR,#LUT          
MOV P1,#00000000B      
MOV P0,#00000000B      
CLR P3.0               
SETB P3.1              
MOV TMOD,#00100000B    
MAIN: MOV TL1,#207D    
      MOV TH1,#207D    
      MOV A,#00000000B 
      SETB P3.0        
      ACALL DELAY1     
      CLR P3.0         
HERE: JNB P3.1,HERE    
BACK: SETB TR1         
HERE1: JNB TF1,HERE1   
      CLR TR1          
      CLR TF1         
      INC A            
      JB P3.1,BACK     
      MOV R4,A         
      ACALL DLOOP      
      SJMP MAIN        

DELAY1: MOV R6,#2D     
LABEL1: DJNZ R6,LABEL1
        RET     

DLOOP: MOV R5,#100D    
BACK1: MOV A,R4        
       MOV B,#100D     
       DIV AB          
       SETB P1.0       
       ACALL DISPLAY   
       MOV P0,A        
       ACALL DELAY     
       ACALL DELAY
       MOV A,B         
       MOV B,#10D      
       DIV AB         
       CLR P1.0        
       SETB P1.1       
       ACALL DISPLAY
       MOV P0,A        
       ACALL DELAY
       ACALL DELAY
       MOV A,B         
       CLR P1.1        
       SETB P1.2       
       ACALL DISPLAY
       MOV P0,A        
       ACALL DELAY
       ACALL DELAY
       CLR P1.2       
       DJNZ R5,BACK1  
       RET

DELAY: MOV R7,#250D       
LABEL2: DJNZ R7,LABEL2
        RET

DISPLAY: MOVC A,@A+DPTR   
         CPL A            
         RET
LUT: DB 3FH               
     DB 06H
     DB 5BH
     DB 4FH
     DB 66H
     DB 6DH
     DB 7DH
     DB 07H
     DB 7FH
     DB 6FH
END

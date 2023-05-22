.model small
.stack 100h
    

.data
    msg db 'Merhaba! 1. Kare Seciminiz:', 0DH, 0AH, '$' 
    msg1 db ' ', 0DH, 0AH,
         db '2. Kare Seciminiz:', 0DH, 0AH, '$'  
    msgTrue db ' ', 0DH, 0AH,
         db 'Dogru Bildiniz! :)', 0DH, 0AH, '$'
    msgFalse db ' ', 0DH, 0AH,
         db 'Yanlis Yaptiniz :(', 0DH, 0AH, '$' 
    buffer db 100, 0   ; Metin giri�i i�in kullan�lan tampon bellek
    
.code   
        ; 3x2 Kare Olusumu
        mov ah, 0
        mov al, 13h
        INT 10h
        
        
        mov ah, 0ch ; terminaldeki bir kare piksel
        MOV AL, 100 ; renk kodu  
        
        ; 1. Kare 
        
        MOV CX, 200  ; yatay duzlem
        MOV DX, 10  ; dikey duzlem
        INT 10H
        
        MOV BL, 50  ; Karenin ust kenari
        firstLine1:
        INT 10H
        INC CX
        DEC BL
        JNZ firstLine1         
        
        MOV BL, 50  ; Karenin sag kenari
        secondLine1:
        INT 10H
        INC DX
        DEC BL
        JNZ secondLine1 
        
        MOV BL, 50  ; Karenin alt kenari
        thirdLine1:
        INT 10H
        DEC CX
        DEC BL
        JNZ thirdLine1   
        
        MOV BL, 50  ; Karenin sol kenari
        fourthLine1:
        INT 10H
        DEC DX
        DEC BL
        JNZ fourthLine1        
        
        
        ; 2. KARE
          
        MOV CX, 250  ; yatay duzlem
        MOV DX, 10  ; dikey duzlem
        
        MOV BL, 50  ; Karenin ust kenari
        firstLine2:
        INT 10H
        INC CX
        DEC BL
        JNZ firstLine2         
        
        MOV BL, 50  ; Karenin sag kenari
        secondLine2:
        INT 10H
        INC DX
        DEC BL
        JNZ secondLine2
        
        MOV BL, 50   ; Karenin alt kenari
        thirdLine2:
        INT 10H
        DEC CX
        DEC BL
        JNZ thirdLine2  
        
        
        ; 3. Kare 

        MOV CX, 250  ; yatay duzlem
        MOV DX, 60  ; dikey duzlem
        INT 10H        
        
        MOV BL, 50  ; Karenin sag kenari
        secondLine3:
        INT 10H
        INC DX
        DEC BL
        JNZ secondLine3 
        
        MOV BL, 50  ; Karenin alt kenari
        thirdLine3:
        INT 10H
        DEC CX
        DEC BL
        JNZ thirdLine3   
        
        MOV BL, 50  ; Karenin sol kenari
        fourthLine3:
        INT 10H
        DEC DX
        DEC BL
        JNZ fourthLine3        
        
        
        ; 4. KARE
          
        MOV CX, 300  ; yatay duzlem
        MOV DX, 60  ; dikey duzlem       
        
        MOV BL, 50  ; Karenin sag kenari
        secondLine4:
        INT 10H
        INC DX
        DEC BL
        JNZ secondLine4
        
        MOV BL, 50   ; Karenin alt kenari
        thirdLine4:
        INT 10H
        DEC CX
        DEC BL
        JNZ thirdLine4
        
        
        ; 5. Kare 

        MOV CX, 250  ; yatay duzlem
        MOV DX, 110  ; dikey duzlem
        INT 10H     
        
        MOV BL, 50  ; Karenin sag kenari
        secondLine5:
        INT 10H
        INC DX
        DEC BL
        JNZ secondLine5
        
        MOV BL, 50  ; Karenin alt kenari
        thirdLine5:
        INT 10H
        DEC CX
        DEC BL
        JNZ thirdLine5
        
        MOV BL, 50  ; Karenin sol kenari
        fourthLine5:
        INT 10H
        DEC DX
        DEC BL
        JNZ fourthLine5     
        
        
        ; 6. KARE
          
        MOV CX, 300  ; yatay duzlem
        MOV DX, 110  ; dikey duzlem     
        
        MOV BL, 50  ; Karenin sag kenari
        secondLine6:
        INT 10H
        INC DX
        DEC BL
        JNZ secondLine6
        
        MOV BL, 50   ; Karenin alt kenari
        thirdLine6:
        INT 10H
        DEC CX
        DEC BL
        JNZ thirdLine6    
        
        
        ; Klavyeden girdi  
        mov di,0
        mov ax, @data
        mov ds, ax
    
        mov ah, 9       ; Ilk giris mesaji ekrana yazdirmak icin AH=9'u kullaniyoruz
        mov dx, offset msg
        int 21h    
    
    
    klavye_metin_girisi:
        mov ah, 0       ; AH kaydedicisini s�f�rla
        int 16h         ; Klavyeden bir tu�a bas�lmas�n� bekler
    
        cmp ah, 0       ; AH kaydedicisini 0 ile kar��la�t�rarak tu�un bas�l� olup olmad���n� kontrol et
        je klavye_metin_girisi   ; Tu� bas�l� de�ilse tekrar tu�a bas�lmas�n� bekler
    
        mov dl, al      ; Giri� tu�unu DL kaydedicisine aktar
        cmp dl, 0DH     ; Giri� tu�u Enter tu�u (0DH) ise d�ng�den ��k
        je klavye_metin_girisi_cikis
    
        ; Giri� tu�unu kullanarak yapmak istedi�iniz i�lemi ger�ekle�tirin
        ; �rne�in, tu�un ASCII de�erini yazd�rabilirsiniz
        mov ah, 2       ; DOS i�levi �a��rmak i�in kullan�lan AH kaydedicisi
        int 21h         ; AH=2 oldu�unda karakteri yazd�ran DOS kesmesi
    
        ; Giri� tu�unu buffer'�n sonuna ekleyin
        mov si, 0       ; SI kaydedicisini s�f�rla
    klavye_metin_girisi_ekle:
        cmp byte ptr [buffer+si], 0  ; Buffer'�n sonunu kontrol et
        jne klavye_metin_girisi_sonraki  ; Buffer'�n sonu de�ilse sonraki byte'a ge�
        mov byte ptr [buffer+si], dl   ; Giri� tu�unu buffer'a ekle
        inc si                         ; SI kaydedicisini bir sonraki byte'a hareket ettir
        jmp klavye_metin_girisi        ; Bir sonraki tu�a bas�lmas�n� beklemek i�in d�ng�ye geri d�n
    
    klavye_metin_girisi_sonraki:
        inc si                         ; SI kaydedicisini bir sonraki byte'a hareket ettir
        jmp klavye_metin_girisi_ekle   ; Giri� tu�unu buffer'a ekle
    
    klavye_metin_girisi_cikis:
        ; Metin girisi tamamlaniginda yapilacak islemler buraya yazilabilir
    
        cmp byte ptr [buffer+1], '1' ; buffer+1'deki degeri '1' ile karsilastir
        jne not_equal2                ; Esit degilse "not_equal2" etiketine git
    
        ;1. Kare secilirse kirmizi olma kismi
        mov ah, 0ch
        MOV AL, 4 ; renk kodu 
        mov bp, 0 ; kare kenar cizim sayisi 
        
        
        MOV CX, 210  ; yatay duzlem
        MOV DX, 20  ; dikey duzlem
        INT 10H
       renkKirmizi:
        MOV BL, 30  ; Karenin ust kenari
        firstLine1k:
        INT 10H
        INC CX
        DEC BL
        JNZ firstLine1k         
        
        MOV BL, 30  ; Karenin sag kenari
        secondLine1k:
        INT 10H
        INC DX
        DEC BL
        JNZ secondLine1k 
        
        MOV BL, 30  ; Karenin alt kenari
        thirdLine1k:
        INT 10H
        DEC CX
        DEC BL
        JNZ thirdLine1k   
        
        MOV BL, 30  ; Karenin sol kenari
        fourthLine1k:
        INT 10H
        DEC DX
        DEC BL
        JNZ fourthLine1k 
        
        INC bp
        CMP bp, 3       ; BP, 3'den kucuk mu?
        JGE Ikinci_Kart_secim   	    ; Yanit hayirsa Ikinci_Kart_secim etiketine atla   
        
        ADD CX,1
        ADD DX,1
       
        JMP renkKirmizi     	; Dogruysa renkKirmizi etiketine atla  
        
    
    not_equal2:         ; Esit degilse buraya istenilen islemleri yazabilirsiniz 
        ; Metin girisi tamamlaniginda yapilacak islemler buraya yazilabilir
    
        cmp byte ptr [buffer+1], '2'  ; buffer+1'deki degeri '1' ile karsilastir
        jne not_equal3                ; Esit degilse "not_equal2" etiketine git
        
        ;2. Kare secilirse sari olma kismi
        mov ah, 0ch
        MOV AL, 67 ; renk kodu 
        mov bp, 0 ; kare kenar cizim sayisi 
        
        
        MOV CX, 260  ; yatay duzlem
        MOV DX, 20  ; dikey duzlem
        INT 10H
       renkSari:
        MOV BL, 30  ; Karenin ust kenari
        firstLine1s:
        INT 10H
        INC CX
        DEC BL
        JNZ firstLine1s         
        
        MOV BL, 30  ; Karenin sag kenari
        secondLine1s:
        INT 10H
        INC DX
        DEC BL
        JNZ secondLine1s
        
        MOV BL, 30  ; Karenin alt kenari
        thirdLine1s:
        INT 10H
        DEC CX
        DEC BL
        JNZ thirdLine1s  
        
        MOV BL, 30  ; Karenin sol kenari
        fourthLine1s:
        INT 10H
        DEC DX
        DEC BL
        JNZ fourthLine1s
        
        INC bp
        CMP bp, 3       ; BP, 3'den kucuk mu?
        JGE Ikinci_Kart_secim   	    ; Yanit hayirsa Ikinci_Kart_secim etiketine atla   
        
        ADD CX,1
        ADD DX,1
       
        JMP renkSari     	; Dogruysa renkSari etiketine atla        
        
       not_equal3:       
       ; Metin girisi tamamlaniginda yapilacak islemler buraya yazilabilir
    
        cmp byte ptr [buffer+1], '3'  ; buffer+1'deki degeri '1' ile karsilastir
        jne not_equal4                ; Esit degilse "not_equal2" etiketine git
        
        ;3. Kare secilirse mavi olma kismi
        mov ah, 0ch
        MOV AL, 9 ; renk kodu 
        mov bp, 0 ; kare kenar cizim sayisi 
        
        
        MOV CX, 210  ; yatay duzlem
        MOV DX, 70  ; dikey duzlem
        INT 10H
       renkMavi:
        MOV BL, 30  ; Karenin ust kenari
        firstLine1m:
        INT 10H
        INC CX
        DEC BL
        JNZ firstLine1s         
        
        MOV BL, 30  ; Karenin sag kenari
        secondLine1m:
        INT 10H
        INC DX
        DEC BL
        JNZ secondLine1m
        
        MOV BL, 30  ; Karenin alt kenari
        thirdLine1m:
        INT 10H
        DEC CX
        DEC BL
        JNZ thirdLine1m  
        
        MOV BL, 30  ; Karenin sol kenari
        fourthLine1m:
        INT 10H
        DEC DX
        DEC BL
        JNZ fourthLine1m
        
        INC bp
        CMP bp, 3       ; BP, 3'den kucuk mu?
        JGE Ikinci_Kart_secim   	    ; Yanit hayirsa Ikinci_Kart_secim etiketine atla   
        
        ADD CX,1
        ADD DX,1
       
        JMP renkMavi     	; Dogruysa renkMavi etiketine atla    
        
      not_equal4:       
       ; Metin girisi tamamlaniginda yapilacak islemler buraya yazilabilir
    
        cmp byte ptr [buffer+1], '4'  ; buffer+1'deki degeri '1' ile karsilastir
        jne not_equal5                ; Esit degilse "not_equal2" etiketine git
        
        ;4. Kare secilirse kirmizi olma kismi
        mov ah, 0ch
        MOV AL, 4 ; renk kodu 
        mov bp, 0 ; kare kenar cizim sayisi 
        
        
        MOV CX, 260  ; yatay duzlem
        MOV DX, 70  ; dikey duzlem
        INT 10H
       renkKirmizi2:
        MOV BL, 30  ; Karenin ust kenari
        firstLine2k:
        INT 10H
        INC CX
        DEC BL
        JNZ firstLine2k         
        
        MOV BL, 30  ; Karenin sag kenari
        secondLine2k:
        INT 10H
        INC DX
        DEC BL
        JNZ secondLine2k
        
        MOV BL, 30  ; Karenin alt kenari
        thirdLine2k:
        INT 10H
        DEC CX
        DEC BL
        JNZ thirdLine2k  
        
        MOV BL, 30  ; Karenin sol kenari
        fourthLine2k:
        INT 10H
        DEC DX
        DEC BL
        JNZ fourthLine2k
        
        INC bp
        CMP bp, 3       ; BP, 3'den kucuk mu?
        JGE Ikinci_Kart_secim   	    ; Yanit hayirsa Ikinci_Kart_secim etiketine atla   
        
        ADD CX,1
        ADD DX,1
       
        JMP renkKirmizi2     	; Dogruysa renkKirmizi2 etiketine atla 
        
       not_equal5:   
        ; Metin girisi tamamlaniginda yapilacak islemler buraya yazilabilir
    
        cmp byte ptr [buffer+1], '5'  ; buffer+1'deki degeri '1' ile karsilastir
        jne not_equal6                ; Esit degilse "not_equal2" etiketine git
        
        ;5. Kare secilirse mavi olma kismi
        mov ah, 0ch
        MOV AL, 9 ; renk kodu 
        mov bp, 0 ; kare kenar cizim sayisi 
        
        
        MOV CX, 210  ; yatay duzlem
        MOV DX, 120  ; dikey duzlem
        INT 10H
       renkMavi2:
        MOV BL, 30  ; Karenin ust kenari
        firstLine2m:
        INT 10H
        INC CX
        DEC BL
        JNZ firstLine2s         
        
        MOV BL, 30  ; Karenin sag kenari
        secondLine2m:
        INT 10H
        INC DX
        DEC BL
        JNZ secondLine2m
        
        MOV BL, 30  ; Karenin alt kenari
        thirdLine2m:
        INT 10H
        DEC CX
        DEC BL
        JNZ thirdLine2m  
        
        MOV BL, 30  ; Karenin sol kenari
        fourthLine2m:
        INT 10H
        DEC DX
        DEC BL
        JNZ fourthLine2m
        
        INC bp
        CMP bp, 3       ; BP, 3'den kucuk mu?
        JGE Ikinci_Kart_secim   	    ; Yanit hayirsa Ikinci_Kart_secim etiketine atla   
        
        ADD CX,1
        ADD DX,1
       
        JMP renkMavi2     	; Dogruysa renkMavi etiketine atla     
        
       not_equal6:         ; Esit degilse buraya istenilen islemleri yazabilirsiniz 
        ; Metin girisi tamamlaniginda yapilacak islemler buraya yazilabilir
    
        cmp byte ptr [buffer+1], '6'  ; buffer+1'deki degeri '1' ile karsilastir
        jne yanlisExit                ; Esit degilse "not_equal2" etiketine git
        
        ;6. Kare secilirse sari olma kismi
        mov ah, 0ch
        MOV AL, 67 ; renk kodu 
        mov bp, 0 ; kare kenar cizim sayisi 
        
        
        MOV CX, 260  ; yatay duzlem
        MOV DX, 120  ; dikey duzlem
        INT 10H
       renkSari2:
        MOV BL, 30  ; Karenin ust kenari
        firstLine2s:
        INT 10H
        INC CX
        DEC BL
        JNZ firstLine2s         
        
        MOV BL, 30  ; Karenin sa� kenari
        secondLine2s:
        INT 10H
        INC DX
        DEC BL
        JNZ secondLine2s
        
        MOV BL, 30  ; Karenin alt kenari
        thirdLine2s:
        INT 10H
        DEC CX
        DEC BL
        JNZ thirdLine2s  
        
        MOV BL, 30  ; Karenin sol kenari
        fourthLine2s:
        INT 10H
        DEC DX
        DEC BL
        JNZ fourthLine2s
        
        INC bp
        CMP bp, 3       ; BP, 3'den kucuk mu?
        JGE Ikinci_Kart_secim   	    ; Yanit hayirsa Ikinci_Kart_secim etiketine atla   
        
        ADD CX,1
        ADD DX,1
       
        JMP renkSari2     	; Dogruysa renkSari etiketine atla  
      
      Ikinci_Kart_secim:  
      
        INC di
        cmp di,2
        
        JGE Secim_Sonuc_Karsilastirma
        mov ch, 0   
        mov ch, [buffer+1]
        mov byte ptr [buffer+3], ch  
        mov byte ptr [buffer+1], 0 
        mov ax, @data
        mov ds, ax
    
        mov ah, 9       ; Ilk giris mesaji ekrana yazdirmak icin AH=9'u kullaniyoruz
        mov dx, offset msg1
        int 21h 
        
        JMP klavye_metin_girisi
            
        
    Secim_Sonuc_Karsilastirma: 
        mov bx, 0    
        mov bh, [buffer+3]   ; 1. se�imin sonucu BH a atan�yor
        mov bl, [buffer+1]   ; 2. se�imin sonucu BL ye atan�yor 
 
        ; 1. Se�im i�in kar��la�t�rmalar       
        cmp bh, '1'
        je sonuc4
        
        cmp bh, '2'
        je sonuc6
        
        cmp bh, '3'
        je sonuc5
        
        cmp bh, '4'
        je sonuc1
        
        cmp bh, '6'
        je sonuc2
        
        cmp bh, '5'
        je sonuc3
       
       ; 2. Se�im i�in kar��la�t�rmalar 
       sonuc1:
          cmp bl, '1'
          je  dogruExit
          call yanlisExit  
       sonuc2:
          cmp bl, '2'
          je  dogruExit
          call yanlisExit   
       sonuc3:
          cmp bl, '3'
          je  dogruExit
          call yanlisExit  
       sonuc4:
          cmp bl, '4'
          je  dogruExit
          call yanlisExit
       sonuc5:
          cmp bl, '5'
          je  dogruExit
          call yanlisExit   
       sonuc6:
          cmp bl, '6'
          je  dogruExit
          call yanlisExit                 
       
    dogruExit:
        mov ax, @data
        mov ds, ax
    
        mov ah, 9       ; mesaji ekrana yazdirmak icin AH=9'u kullaniyoruz
        mov dx, offset msgTrue
        int 21h   
        
        mov ah, 4Ch     ; AH=4Ch - Program� sonland�rmak i�in kesmeyi �a��r
        int 21h
    yanlisExit: 
        mov ax, @data
        mov ds, ax
    
        mov ah, 9       ; mesaji ekrana yazdirmak icin AH=9'u kullaniyoruz
        mov dx, offset msgFalse
        int 21h
        mov ah, 4Ch     ; AH=4Ch - Program� sonland�rmak i�in kesmeyi �a��r
        int 21h
end


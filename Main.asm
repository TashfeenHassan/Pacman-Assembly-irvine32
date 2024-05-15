;include windows.inc
;include kernel32.inc
;include user32.inc
include Irvine32.inc
includelib kernel32.lib
includelib user32.lib
includelib Winmm.lib

.386
.model flat, stdcall
.stack 4096
PlaySound PROTO,
        pszSound:PTR BYTE, 
        hmod:DWORD, 
        fdwSound:DWORD
ExitProcess PROTO, dwExitCode:DWORD

.data

file BYTE "t2.wav",0
file2 BYTE "t3.wav",0
file3 BYTE "t4.wav",0

gameover   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "       ________   ________   _____ ______    _______           ________   ___      ___  _______    ________          ", 0ah
		   DB  "      |\   ____\ |\   __  \ |\   _ \  _   \ |\  ___ \         |\   __  \ |\  \    /  /||\  ___ \  |\   __  \         ", 0ah
		   DB  "      \ \  \___| \ \  \|\  \\ \  \\\__\ \  \\ \   __/|        \ \  \|\  \\ \  \  /  / /\ \   __/| \ \  \|\  \        ", 0ah
		   DB  "       \ \  \  ___\ \   __  \\ \  \\|__| \  \\ \  \_|/__       \ \  \\\  \\ \  \/  / /  \ \  \_|/__\ \   _  _\       ", 0ah
		   DB  "        \ \  \|\  \\ \  \ \  \\ \  \    \ \  \\ \  \_|\ \       \ \  \\\  \\ \    / /    \ \  \_|\ \\ \  \\  \|      ", 0ah
		   DB  "         \ \_______\\ \__\ \__\\ \__\    \ \__\\ \_______\       \ \_______\\ \__/ /      \ \_______\\ \__\\ _\      ", 0ah
		   DB  "          \|_______| \|__|\|__| \|__|     \|__| \|_______|        \|_______| \|__|/        \|_______| \|__|\|__|     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah

youwin     DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                 ___    ___  ________      ___  ___          ___       __       ___      ________                    ", 0ah
		   DB  "                |\  \  /  /||\   __  \    |\  \|\  \        |\  \     |\  \    |\  \    |\   ___  \                  ", 0ah
		   DB  "                \ \  \/  / /\ \  \|\  \   \ \  \\\  \       \ \  \    \ \  \   \ \  \   \ \  \\ \  \                 ", 0ah
		   DB  "                 \ \    / /  \ \  \\\  \   \ \  \\\  \       \ \  \  __\ \  \   \ \  \   \ \  \\ \  \                ", 0ah
		   DB  "                  \/  /  /    \ \  \\\  \   \ \  \\\  \       \ \  \|\__\_\  \   \ \  \   \ \  \\ \  \               ", 0ah
		   DB  "                __/  / /       \ \_______\   \ \_______\       \ \____________\   \ \__\   \ \__\\ \__\              ", 0ah
		   DB  "               |\___/ /         \|_______|    \|_______|        \|____________|    \|__|    \|__| \|__|              ", 0ah
		   DB  "               \|___|/                                                                                               ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah


splash     DB  "                                                                                                                     ", 0ah
		   DB  "  .----------------. .----------------. .----------------. .----------------. .----------------. .-----------------. ", 0ah          
           DB  "  | .--------------. | .--------------. | .--------------. | .--------------. | .--------------. | .--------------. |", 0ah          
           DB  "  | |   ______     | | |      __      | | |     ______   | | | ____    ____ | | |      __      | | | ____  _____  | |", 0ah          
           DB  "  | |  |_   __ \   | | |     /  \     | | |   .' ___  |  | | ||_   \  /   _|| | |     /  \     | | ||_   \|_   _| | |", 0ah          
           DB  "  | |    | |__) |  | | |    / /\ \    | | |  / .'   \_|  | | |  |   \/   |  | | |    / /\ \    | | |  |   \ | |   | |", 0ah
           DB  "  | |    |  ___/   | | |   / ____ \   | | |  | |         | | |  | |\  /| |  | | |   / ____ \   | | |  | |\ \| |   | |", 0ah
           DB  "  | |   _| |_      | | | _/ /    \ \_ | | |  \ `.___.'\  | | | _| |_\/_| |_ | | | _/ /    \ \_ | | | _| |_\   |_  | |", 0ah
           DB  "  | |  |_____|     | | ||____|  |____|| | |   `._____.'  | | ||_____||_____|| | ||____|  |____|| | ||_____|\____| | |", 0ah
           DB  "  | |              | | |              | | |              | | |              | | |              | | |              | |", 0ah
           DB  "  | '--------------' | '--------------' | '--------------' | '--------------' | '--------------' | '--------------' |", 0ah
           DB  "   '----------------' '----------------' '----------------' '----------------' '----------------' '----------------' ", 0ah
           DB  "                                                                                                                     ", 0ah
           DB  "                                                                                                                     ", 0ah
           DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
           DB  "                                                                                                                     ", 0ah
           DB  "                                                                                                                     ", 0ah
           DB  "                              __     _____ __  _        __        _                   __                             ", 0ah
           DB  "                             |__ |\ |  |  |__ |_|  \ / |  | |  | |_|  |\ |  /\  |\/| |__                             ", 0ah
           DB  "                             |__ | \|  |  |__ |\    |  |__| |__| |\   | \| /--\ |  | |__                             ", 0ah
           
		 
		   
xPos BYTE 57
yPos BYTE 20

menu       DB  "                                                                                                                     ", 0ah
		   DB  "  .----------------. .----------------. .----------------. .----------------. .----------------. .-----------------. ", 0ah          
           DB  "  | .--------------. | .--------------. | .--------------. | .--------------. | .--------------. | .--------------. |", 0ah          
           DB  "  | |   ______     | | |      __      | | |     ______   | | | ____    ____ | | |      __      | | | ____  _____  | |", 0ah          
           DB  "  | |  |_   __ \   | | |     /  \     | | |   .' ___  |  | | ||_   \  /   _|| | |     /  \     | | ||_   \|_   _| | |", 0ah          
           DB  "  | |    | |__) |  | | |    / /\ \    | | |  / .'   \_|  | | |  |   \/   |  | | |    / /\ \    | | |  |   \ | |   | |", 0ah
           DB  "  | |    |  ___/   | | |   / ____ \   | | |  | |         | | |  | |\  /| |  | | |   / ____ \   | | |  | |\ \| |   | |", 0ah
           DB  "  | |   _| |_      | | | _/ /    \ \_ | | |  \ `.___.'\  | | | _| |_\/_| |_ | | | _/ /    \ \_ | | | _| |_\   |_  | |", 0ah
           DB  "  | |  |_____|     | | ||____|  |____|| | |   `._____.'  | | ||_____||_____|| | ||____|  |____|| | ||_____|\____| | |", 0ah
           DB  "  | |              | | |              | | |              | | |              | | |              | | |              | |", 0ah
           DB  "  | '--------------' | '--------------' | '--------------' | '--------------' | '--------------' | '--------------' |", 0ah
           DB  "   '----------------' '----------------' '----------------' '----------------' '----------------' '----------------' ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                                                                                                     ", 0ah
		   DB  "                                    ___  ___  ___  ______           __                                               ", 0ah
		   DB  "                                   / _/ <  / /  / / __/ /____ _____/ /_                                              ", 0ah
		   DB  "                                  / /   / /  / / _\ \/ __/ _ `/ __/ __/                                              ", 0ah
		   DB  "                                 / /   /_/ _/ / /___/\__/\_,_/_/  \__/                                               ", 0ah
		   DB  "                                /__/___  _/__/  ___  ____        __               __  _                              ", 0ah
		   DB  "                                   / _/ |_  |  /  / /  _/__  ___/ /_______ ______/ /_(_)__  ___  ___                 ", 0ah
		   DB  "                                  / /  / __/   / / _/ // _ \(_-< __/ __/ // / __/ __/ / _ \/ _ \(_-<                 ", 0ah
		   DB  "                                 / /  /____/ _/ / /___/_//_/___|__/_/  \_,_/\__/\__/_/\___/_//_/___/                 ", 0ah
		   DB  "                                /__/___  ___/__/___  ____      _ __                                                  ", 0ah
		   DB  "                                   / _/ |_  /  /  / / __/_ __ (_) /_                                                 ", 0ah
		   DB  "                                  / /  _/_ <   / / / _/ \ \ // / __/                                                 ", 0ah
		   DB  "                                 / /  /____/ _/ / /___//_\_\/_/\__/                                                  ", 0ah
		   DB  "                                /__/        /__/                                                                     ", 0ah
		   


boundar    DB  "                                                                                                                     ", 0ah          
           DB  "    -------------------------------------------------------------------------------------------------------------    ", 0ah          
           DB  "    -------------------------------------------------------------------------------------------------------------    ", 0ah          
           DB  "    ----  ---           o     o      o       o      o      o      o      o      o       o               ---  ----    ", 0ah          
           DB  "    ----                                                                                                     ----    ", 0ah
           DB  "    ----       ------------------------------------------------------------------------------------          ----    ", 0ah
           DB  "    ----       ------------------------------------------------------------------------------------          ----    ", 0ah
           DB  "    ----  o    ----    o       o   o   o                                   o   o   o       o   ----      o   ----    ", 0ah
           DB  "    ----       ----                                                                            ----          ----    ", 0ah
           DB  "    ----  o    ----               --        ------------------------          --               ----      o   ----    ", 0ah
           DB  "    ----       ----    o       o  --   o    ------------------------       o  --   o       o   ----          ----    ", 0ah
           DB  "    ----  o    ----               --        ----                ----          --               ----      o   ----    ", 0ah
           DB  "    ----       ----    o       o  --   o    ----   o   o   o    ----       o  --   o       o   ----          ----    ", 0ah
           DB  "    ----  o    ----               --                                          --               ----      o   ----    ", 0ah
           DB  "    ----       ----    o       o  --   o   o   o   o   o   o   o   o   o   o  --   o       o   ----          ----    ", 0ah
           DB  "    ----  o    ----               --                                          --               ----      o   ----    ", 0ah
           DB  "    ----       ----    o       o  --        ----     -     -    ----          --   o       o   ----          ----    ", 0ah
           DB  "    ----  o    ----               --        ----     -     -    ----          --               ----      o   ----    ", 0ah
           DB  "    ----       ----    o   o   o  --        ------------------------          --   o   o   o   ----          ----    ", 0ah
           DB  "    ----  o    ----               --        ------------------------          --               ----      o   ----    ", 0ah
           DB  "    ----       ---------------------                                          ---------------------          ----    ", 0ah
           DB  "    ----       ---------------------                                          ---------------------          ----    ", 0ah
           DB  "    ----                                                                                                     ----    ", 0ah
           DB  "    ----              o     o     o     o--   o     o     o     o       --o       o       o     o            ----    ", 0ah
		   DB  "    -------------------------------------------------------------------------------------------------------------    ", 0ah
		   DB  "    -------------------------------------------------------------------------------------------------------------    ", 0ah
		   DB  "                                                                                                                     ", 0ah
;83
;176
;166
ghostDirection db 1
ghostDirection2 db 0
ghostDirection3 db 3
ghostDirection4 db 3

boundar2   DB  "                                                                                                                     ", 0ah          
           DB  "    -------------------------------------------------------------------------------------------------------------    ", 0ah          
           DB  "    -----------      o     o     F --------------------------------------------  o     o     o     --------------    ", 0ah          
           DB  "    ----          o     o     o     o     o     o     o     o     o     o     o     o     o     o     o      ----    ", 0ah          
           DB  "    ----        ---------------                                                    ---------------           ----    ", 0ah
           DB  "    ----        ---------------                        ----                        ---------------           ----    ", 0ah
           DB  "    ----  o     o     o     o     o --- o     o     o  ----  o     o     o --- o     o     o     o     F     ----    ", 0ah
           DB  "    ----                ---         ---                ----                ---         ---                   ----    ", 0ah
           DB  "    ----  o     o     o --- o     o --- o     o     o  ----  o     o     o --- o     o --- o     o     o     ----    ", 0ah
           DB  "    ----                ---         ---                ----                ---         ---                   ----    ", 0ah
           DB  "    ----  o     o     o --- o     o --- o     o     o  ----  o     o     o --- o     o --- o     o     o     ----    ", 0ah
           DB  "    ----                ---         ---     --------------------------     ---         ---                   ----    ", 0ah
           DB  "    ----  o     o     o --- o     o --- o   --------------------------   o --- o     o --- o     o     o     ----    ", 0ah
           DB  "    ----                ---         ---                ----                ---         ---                   ----    ", 0ah
           DB  "    ----  o     o     o --- o     o     o     o     o  ----  o     o     o     o     o --- o     o     o     ----    ", 0ah
           DB  "    ----                ---                            ----                            ---                   ----    ", 0ah
           DB  "    ----  o    ----   o --- o   ----       ---o     o  ----  o     F---  o    ----   o --- o   ----    o     ----    ", 0ah
           DB  "    ----       ----     ---     ----       ---         ----         ---       ----     ---     ----          ----    ", 0ah
           DB  "    ----  o    ----   o --- o   ----       ---o     o  ----  o     o---  o    ----   o --- o   ----    o     ----    ", 0ah
           DB  "    ----       ----             ----       ---                      ---       ----             ----          ----    ", 0ah
           DB  "    ----  o    --------- o ---------       ------------    ------------  o    --------- o ---------    o     ----    ", 0ah
           DB  "    ----       ---------------------       ------------    ------------       ---------------------          ----    ", 0ah
           DB  "    ----  o                                                                                            o     ----    ", 0ah
           DB  "    ----            o     F     o     o  --  o    o    o    o    o    o --  o     o     o     o              ----    ", 0ah
		   DB  "    -------------------------------------------------------------------------------------------------------------    ", 0ah
		   DB  "    -------------------------------------------------------------------------------------------------------------    ", 0ah
		   DB  "                                                                                                                     ", 0ah

		   
ghostColl db 0
score dw 0

loadingscreen DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah
			  DB  "---------------------------------------------------------------------------------------------------------------------", 0ah

boundar3   DB  "                                                                                                                     ", 0ah          
           DB  "    --------------------+++++-----------------------------------------------------------+++++--------------------    ", 0ah          
           DB  "    ---------------  o     o --------------------------        -------------------------     o    ---------------    ", 0ah          
           DB  "    ----------    o     o     o     o     F     o     o     o     o     o     o     o     o     o     o----------    ", 0ah          
           DB  "    -----                    --------------------------        -------------------------                    -----    ", 0ah
           DB  "    ----                     --------------------------        -------------------------                     ----    ", 0ah
           DB  "    ---- o     o     o     o     o     o     o     o      o     o     o     o     o     o     o     o     o  ----    ", 0ah
           DB  "    ---                              ---------------     ----     ---------------                             ---    ", 0ah
           DB  "    ---  o     o------------o     o  -------------      o----o      ------------- o     o------------o    o   ---    ", 0ah
           DB  "    --          --        --         ---                 ----                 ---        --        --          --    ", 0ah
           DB  "    --   o     o--        --o     o  ---o    o    o     o----o     o     F    --- o     o--        --o    o    --    ", 0ah
           DB  "    -           ------------         ---    ---          ----          ---    ---        ------------           -    ", 0ah
           DB  "    -    o     o    o--     o     o  ---o   ---   o      ----          ---o   --- o     o    o-- o   o    o     -    ", 0ah
           DB  "    -------------------------               ---          ----          ---              -------------------------    ", 0ah
           DB  "    -------------------------   o     o    o---   o     o----o     o   ---o    o     o  -------------------------    ", 0ah
           DB  "    --                               ----------          ----          ----------                              --    ", 0ah
           DB  "    --  o     o     o     o     o    ----------   o     o----o     o   ----------    o     o     o     o     F --    ", 0ah
           DB  "    ---              ------------                        ----                       ------------              ---    ", 0ah
           DB  "    ---   o     F    ---      ---  o    o   ---   o     o----o     o   ---   o    o ---      ---    o     o   ---    ", 0ah
           DB  "    ----             ---      ---           ---          ----          ---          ---      ---             ----    ", 0ah
           DB  "    ----     o     o ---      ---  o    o   ---   o     o    o     o   ---   o    o ---      --- o     o     ----    ", 0ah
           DB  "    -----            ------------           ------------------------------          ------------            -----    ", 0ah
           DB  "    ----------  o     o     o----  o    o   ------------------------------   o    o ----o     o     o  ----------    ", 0ah
           DB  "    ---------------          ----                        ----                       ----          ---------------    ", 0ah
		   DB  "    --------------------    o----  o    o    o    o    o ---- o    o    o    o    o ----o    --------------------    ", 0ah
		   DB  "    --------------------+++++-----------------------------------------------------------+++++--------------------    ", 0ah
		   DB  "                                                                                                                     ", 0ah

finalscore db "Your Score Was : ",0ah

ghost db "M",0
scoreDisp db " Your Score : ",0ah
gx db 10
gy db 4
gx2 db 96
gy2 db 22
gx3 db 15
gy3 db 22
gx4 db 80
gy4 db 6
ll db "Lives",0ah
nextgx db ?
nextgy db ?
nextgx2 db ?
nextgy2 db ?
nextgx3 db ?
nextgy3 db ?
nextgx4 db ?
nextgy4 db ?
instru db "| W - up | A - left | S - Down | D - Right | P - Pause |",0ah
lives db 3
nextx BYTE ?
nexty BYTE ?
xCoinPos BYTE ?
yCoinPos BYTE ?
spac db " ",0
test12 db "g",0
levelcount db 1
levelbool db 0
inputChar BYTE ?

.code
main PROC
    INVOKE PlaySound, OFFSET file2, NULL, 20001H ; SND_ASYNC | SND_FILENAME
	mov esi,0
	mov ecx,2450
sup:
	cmp esi,826
	jg sk1
	mov eax,cyan(black*16)
	call settextcolor
	jmp sk2
	sk1:
	mov eax,yellow(black*16)
	call settextcolor
	sk2:
	mov eax,0
	call delay
	mov eax,0
	mov al,splash[esi]
	call writechar
	inc esi
	loop sup
	mov dl,55
	mov dh,22
	call gotoxy
	lea edx,scoreDisp
	mov ecx,255
	call readstring
	mov esi,0
	mov ecx,3068
	mov dl,0
	mov dh,0
	call gotoxy
	sup2:
	cmp esi,826
	jg sk3
	mov eax,cyan(black*16)
	call settextcolor
	jmp sk4
	sk3:
	mov eax,yellow(black*16)
	call settextcolor
	sk4:
	mov eax,0
	mov al,menu[esi]
	call writechar
	inc esi
	loop sup2
	hel:
	call readchar
	mov inputChar,al
	cmp inputChar,"1"
	je startgl1
	cmp inputChar,"3"
	je exitGame
	mov dl,0
	mov dh,26
	call gotoxy
	mov eax,white(black*16)
	call settextcolor
	mov ecx,57
	mov esi,0
	instl:
		mov al,instru[esi]
		call writechar
		inc esi
		loop instl
	call waitmsg
	mov dl,0
	mov dh,26
	call gotoxy
	mov eax,white(black*16)
	call settextcolor
	mov ecx,177
	mov esi,0
	in2:
		mov al," "
		call writechar
		inc esi
		loop in2
	jmp hel

	
	startgl1:
	mov esi,0
	mov ecx,3068
	mov dl,0
	mov dh,0
	call gotoxy
	sup3:
	mov eax,cyan(black*16)
	call settextcolor
	mov eax,0
	mov al,loadingscreen[esi]
	call writechar
	inc esi
	loop sup3
	call crlf
	mov dl,45
	mov dh,13
	call gotoxy

	mov eax,white(black*16)
	call settextcolor
	call waitmsg
	cmp levelcount,1
	jne dou
	call drawl1
	call DrawPlayer
	call ghostd1
	jmp gameLoop
	dou:
	cmp levelcount,2
	jne teen
	call drawl2
	call DrawPlayer
	call ghostd1
	jmp gameLoop
	teen:
	cmp levelcount,3
	jne exitGame
	call drawl3
	call DrawPlayer
	call ghostd1
	jmp gameLoop
	gameLoop:
		cmp levelcount,4
		jl w8
		jmp wingame
		w8:
		call Dliv
		call Dscore
		cmp lives,0
		jz exitGame
		cmp levelbool,0
		je res
		mov levelbool,0
		mov xPos,56
		mov yPos,20
		jmp startgl1
		res:
		;GHOST MOVEMENT
		call randghost
		cmp levelcount,2
		jl p
		call randghost2
		p:
		cmp levelcount,3
		jl p2
		call randghost3
		call randghost4
		p2:
		; get user key input:
		cmp levelcount,1
		jne speed2
		mov eax,80
		call delay
		jmp rea
		speed2:
		cmp levelcount,2
		jne speed3
		mov eax,50
		call delay
		jmp rea
		speed3:
		cmp levelcount,3
		jne rea
		mov eax,30
		call delay
		rea:
		call Readkey
		mov cl,inputChar
		mov inputChar,al
		cmp inputChar,1
		jne co
		mov inputChar,cl
		co:
		; exit game if user types 'x':
		cmp inputChar,"x"
		je exitGame

		cmp inputChar,"n"
		je wingame

		cmp inputChar,"p"
		jne o
		call readchar
		o:
		cmp inputChar,"w"
		je moveUp

		cmp inputChar,"s"
		je moveDown

		cmp inputChar,"a"
		je moveLeft

		cmp inputChar,"d"
		je moveRight
		jmp gameloop

		moveUp:
		mov bh,1
		mov bl,xPos
		mov nextx,bl
		mov bl,yPos
		mov nexty,bl
		dec nexty
		call coll1
		call keepscore
		call DScore
		con1:
		cmp bh,-1
		je cont1
		call UpdatePlayer
		dec yPos
		
		cont1:
		call gpc
		call gpc2
		call gpc3
		call gpc4
		call DrawPlayer
		cmp levelbool,0
		je gameLoop
		mov eax,1000
		call delay
		jmp gameLoop

		moveDown:
		mov bh,1
		mov bl,xPos
		mov nextx,bl
		mov bl,yPos
		mov nexty,bl
		inc nexty
		call coll1
		call keepscore
		call DScore
		con2:
		cmp bh,-1
		je cont2
		call UpdatePlayer
		inc yPos
		
		cont2:
		call gpc
		call gpc2
		call gpc3
		call gpc4
		call DrawPlayer
		cmp levelbool,0
		je gameLoop
		mov eax,1000
		call delay
		jmp gameLoop

		moveLeft:
		mov bh,1
		mov bl,xPos
		mov nextx,bl
		mov bl,yPos
		mov nexty,bl
		dec nextx
		call coll1
		call keepscore
		call DScore
		con3:
		cmp bh,-1
		je cont3
		call UpdatePlayer
		dec xPos
		cont3:
		call gpc
		call gpc2
		call gpc3
		call gpc4
		call DrawPlayer
		cmp levelbool,0
		je gameLoop
		mov eax,1000
		call delay
		jmp gameLoop

		moveRight:
		mov bh,1
		mov bl,xPos
		mov nextx,bl
		mov bl,yPos
		mov nexty,bl
		inc nextx
		call coll1
		call keepscore
		call DScore
		con4:
		cmp bh,-1
		je cont4
		call UpdatePlayer
		inc xPos
		cont4:
		call gpc
		call gpc2
		call gpc3
		call gpc4
		call DrawPlayer
		cmp levelbool,0
		je gameLoop
		mov eax,1000
		call delay
		jmp gameLoop

	jmp gameLoop

	exitGame:
	INVOKE PlaySound, OFFSET file, NULL, 20001H
	mov ecx,3068
	mov dl,0
	mov dh,0
	call gotoxy
	mov esi,0
	
	go:
		mov eax,0
		cmp ecx,1420
		jg g2
		mov eax,cyan(black*16)
		call settextcolor
		mov al,gameover[esi]
		call writechar
		inc esi
		jmp g3
		g2:
		mov eax,yellow(black*16)
		call settextcolor
		mov al,gameover[esi]
		call writechar
		inc esi
		g3:
		loop go
	mov eax,yellow(black*16)
	call settextcolor
	mov dl,50
	mov dh,28
	call gotoxy
	lea edx,finalscore
	call writestring
	mov dl,68
	mov dh,28
	call gotoxy 
	movzx eax,score
	call writedec
	call crlf
	mov ecx,200
	lll:
		mov al," "
		call writechar
		loop lll
	
	mov dl,0
	mov dh,28
	call gotoxy
	mov ecx,5
	llll:
		mov al," "
		call writechar
	loop llll
	call waitmsg
	exit
	wingame:
		INVOKE PlaySound, OFFSET file3, NULL, 20001H
		mov esi,0
		mov dl,0
		mov dh,0
		call gotoxy
		mov ecx,3540
		w1:
		mov eax,0
		cmp ecx,1900
		jg w2
		mov eax,cyan(black*16)
		call settextcolor
		mov al,youwin[esi]
		call writechar
		inc esi
		jmp w3
		w2:
		mov eax,yellow(black*16)
		call settextcolor
		mov al,youwin[esi]
		call writechar
		inc esi
		w3:
		loop w1
		call waitmsg
		exit
main ENDP

drawl1 PROC
	mov esi,0
	mov dl,0
	mov dh,0
	call gotoxy
	mov ecx,3186
	l1:
		mov bl,boundar[esi]
		cmp bl,"-"
		jne n1
		mov eax,cyan(black*16)
		call settextcolor
		n1:
		cmp bl,"o"
		jne n2
		mov eax,yellow(black*16)
		call settextcolor
		n2:
		cmp bl," "
		jne n3
		mov eax,black(black*16)
		call settextcolor
		n3:
		cmp bl,"F"
		jne n4
		mov eax,red(black*16)
		call settextcolor
		n4:
		movzx eax,bl
		call writechar
		inc esi
		loop l1
ret
drawl1 ENDP

drawl2 PROC
	mov esi,0
	mov dl,0
	mov dh,0
	call gotoxy
	mov ecx,3186
	l1:
		mov bl,boundar2[esi]
		cmp bl,"-"
		jne n1
		mov eax,cyan(black*16)
		call settextcolor
		n1:
		cmp bl,"o"
		jne n2
		mov eax,yellow(black*16)
		call settextcolor
		n2:
		cmp bl," "
		jne n3
		mov eax,black(black*16)
		call settextcolor
		n3:
		cmp bl,"F"
		jne n4
		mov eax,red(black*16)
		call settextcolor
		n4:
		movzx eax,bl
		call writechar
		inc esi
		loop l1
ret
drawl2 ENDP

drawl3 PROC
	mov esi,0
	mov dl,0
	mov dh,0
	call gotoxy
	mov ecx,3186
	l1:
		mov bl,boundar3[esi]
		cmp bl,"-"
		jne n1
		mov eax,cyan(black*16)
		call settextcolor
		n1:
		cmp bl,"o"
		jne n2
		mov eax,yellow(black*16)
		call settextcolor
		n2:
		cmp bl," "
		jne n3
		mov eax,black(black*16)
		call settextcolor
		n3:
		cmp bl,"F"
		jne n4
		mov eax,red(black*16)
		call settextcolor
		n4:
		movzx eax,bl
		call writechar
		inc esi
		loop l1
ret
drawl3 ENDP

DScore PROC
	mov dl,50
	mov dh,28
	call gotoxy
	mov eax,yellow(black*16)
	call settextcolor
	lea edx,scoreDisp
	call writestring
	mov dl,54
	mov dh,29
	call gotoxy
	mov eax,black(yellow*16)
	call settextcolor
	mov eax,0
	mov ax,score
	call writedec
	mov eax,white(black*16)
	call settextcolor
ret
DScore ENDP

Dliv PROC
	mov dl,0
	mov dh,28
	call gotoxy
	mov eax,yellow(black*16)
	call settextcolor
	mov ecx,5
	mov esi,0
	l:
		mov al,ll[esi]
		call writechar
		inc esi
		loop l
	mov dl,2
	mov dh,29
	call gotoxy
	mov eax,black(lightred*16)
	call settextcolor
	mov eax,0
	mov al,lives
	call writedec
	mov eax,white(black*16)
	call settextcolor
ret
Dliv ENDP

DrawPlayer PROC
	; draw player at (xPos,yPos):
	mov eax,black(yellow*16)
	call settextcolor
	mov dl,xPos
	mov dh,yPos
	call Gotoxy
	mov al,"<"
	call WriteChar
	mov eax,white(black*16)
	call settextcolor
	ret
DrawPlayer ENDP

UpdatePlayer PROC
	mov dl,xPos
	mov dh,yPos
	call Gotoxy
	mov al," "
	call WriteChar
	ret
UpdatePlayer ENDP

coll1 PROC
	movzx esi,nexty
	imul esi,118
	movzx eax,nextx
	add esi,eax
	cmp levelcount,1
	jne b2
	mov bl,boundar[esi]
	jmp b4
	b2:
	cmp levelcount,2
	jne b3
	mov bl,boundar2[esi]
	jmp b4
	b3:
	cmp levelcount,3
	jne b4
	mov bl,boundar3[esi]
	jmp b4
	b4:
	cmp bl,"-"
	jne ex
	mov bh,-1
	jmp ex2
	ex:
	cmp levelcount,1
	jne a2
	mov boundar[esi]," "
	jmp ex2
	a2:
	cmp levelcount,2
	jne a3
	mov boundar2[esi]," "
	jmp ex2
	a3:
	cmp bl,"+"
	jne n
	mov bh,-1
	cmp yPos,5
	jg n2
	call UpdatePlayer
	add yPos,22
	call DrawPlayer
	jmp n
	n2:
	call UpdatePlayer
	sub yPos,22
	call DrawPlayer
	n:
	mov boundar3[esi]," "
	jmp ex2
	ex2:
ret
coll1 ENDP

keepscore PROC
	cmp bl,"o"
	jne nex
	inc score
	jmp nex2
	nex:
	cmp bl,"F"
	jne ex
	add score,10
	nex2:
	cmp score,83
	je l
	cmp score,269
	je l
	cmp score,445
	jne ex
	l:
	add score,10
	inc levelcount
	inc levelbool
	ex:
ret
keepscore ENDP

randghost PROC
	cmp ghostDirection,0
		je moveUpG
		cmp ghostDirection,1
		je moveDownG
		cmp ghostDirection,2
		je moveLeftG
		cmp ghostDirection,3
		je moveRightG

		moveUpG:
		mov bh,1
		mov bl,gx
		mov nextgx,bl
		mov bl,gy
		mov nextgy,bl
		dec nextgy
		call ghostc1
		cmp bh,-1
		je contG1
		call ghostu1
		dec gy
		call ghostd1
		jmp inp
		contG1:
		call Randomize               
        mov  eax,4  
		call RandomRange
		mov  ghostDirection,al
		jmp inp

		moveDownG:
		mov bh,1
		mov bl,gx
		mov nextgx,bl
		mov bl,gy
		mov nextgy,bl
		inc nextgy
		call ghostc1
		cmp bh,-1
		je contG2
		call ghostu1
		inc gy
		call ghostd1
		jmp inp
		contG2:
		call Randomize               
        mov  eax,4  
		call RandomRange
		mov  ghostDirection,al
		jmp inp

		moveLeftG:
		mov bh,1
		mov bl,gx
		mov nextgx,bl
		mov bl,gy
		mov nextgy,bl
		dec nextgx
		call ghostc1
		cmp bh,-1
		je contG3
		call ghostu1
		dec gx
		call ghostd1
		jmp inp
		contG3:
		call Randomize               
        mov  eax,4  
		call RandomRange
		mov  ghostDirection,al
		jmp inp

		moveRightG:
		mov bh,1
		mov bl,gx
		mov nextgx,bl
		mov bl,gy
		mov nextgy,bl
		inc nextgx
		call ghostc1
		cmp bh,-1
		je contG4
		call ghostu1
		inc gx
		call ghostd1
		jmp inp
		contG4:
		call Randomize               
        mov  eax,4  
		call RandomRange
		mov  ghostDirection,al
		jmp inp

		inp:
ret
randghost ENDP

ghostu1 PROC
	mov eax,yellow(black*16)
	call settextcolor
	mov dl,gx
	mov dh,gy
	call Gotoxy
	movzx esi,gy
	imul esi,118
	movzx eax,gx
	add esi,eax
	mov eax,0
	cmp levelcount,1
	jne n2
	mov al,boundar[esi]
	call writechar
	ret
	n2:
	cmp levelcount,2
	jne n3
	mov al,boundar2[esi]
	call writechar
	ret
	n3:	
	mov al,boundar3[esi]
	call writechar
	ret
ghostu1 ENDP
	
ghostd1 PROC
	mov dl,gx
	mov dh,gy
	call Gotoxy
	mov eax,red(red*16)
	call settextcolor
	lea edx,ghost
	call Writestring
	mov eax,white(black*16)
	call settextcolor
	ret
ret
ghostd1 ENDP

gpc PROC
	mov dl,xPos
	mov dh,yPos
	cmp dl,nextgx
	jne ex
	cmp dh,nextgy
	jne ex
	mov xPos,57
	mov yPos,20
	dec lives
	ex:
ret
gpc ENDP

ghostc1 PROC
	movzx esi,nextgy
	imul esi,118
	movzx eax,nextgx
	add esi,eax
	cmp levelcount,1
	jne n1
	mov bl,boundar[esi]
	jmp n4
	n1:
	cmp levelcount,2
	jne n2
	mov bl,boundar2[esi]
	jmp n4
	n2:
	cmp levelcount,3
	mov bl,boundar3[esi]
	jmp n4
	n4:
	cmp bl,"-"
	je ex3
	cmp bl,"+"
	jne ex
	ex3:
	mov bh,-1
	ex:
ret
ghostc1 ENDP


ghostu2 PROC
	mov eax,yellow(black*16)
	call settextcolor
	mov dl,gx2
	mov dh,gy2
	call Gotoxy
	movzx esi,gy2
	imul esi,118
	movzx eax,gx2
	add esi,eax
	mov eax,0
	cmp levelcount,2
	jne n3
	mov al,boundar2[esi]
	call writechar
	ret
	n3:	
	mov al,boundar3[esi]
	call writechar
	ret
ghostu2 ENDP
	
ghostd2 PROC
	mov dl,gx2
	mov dh,gy2
	call Gotoxy
	mov eax,magenta(magenta*16)
	call settextcolor
	lea edx,ghost
	call Writestring
	mov eax,white(black*16)
	call settextcolor
	ret
ret
ghostd2 ENDP

gpc2 PROC
	mov dl,xPos
	mov dh,yPos
	cmp dl,nextgx2
	jne ex
	cmp dh,nextgy2
	jne ex
	mov xPos,57
	mov yPos,20
	dec lives
	ex:
ret
gpc2 ENDP

ghostc2 PROC
	movzx esi,nextgy2
	imul esi,118
	movzx eax,nextgx2
	add esi,eax
	cmp levelcount,2
	jne n2
	mov bl,boundar2[esi]
	jmp n4
	n2:
	cmp levelcount,3
	mov bl,boundar3[esi]
	jmp n4
	n4:
	cmp bl,"-"
	je ex3
	cmp bl,"+"
	jne ex
	ex3:
	mov bh,-1
	ex:
ret
ghostc2 ENDP

randghost2 PROC
	cmp ghostDirection2,0
		je moveUpG
		cmp ghostDirection2,1
		je moveDownG
		cmp ghostDirection2,2
		je moveLeftG
		cmp ghostDirection2,3
		je moveRightG

		moveUpG:
		mov bh,1
		mov bl,gx2
		mov nextgx2,bl
		mov bl,gy2
		mov nextgy2,bl
		dec nextgy2
		call ghostc2
		cmp bh,-1
		je contG1
		call ghostu2
		dec gy2
		call ghostd2
		jmp inp
		contG1:
		call Randomize               
        mov  eax,4  
		call RandomRange
		mov  ghostDirection2,al
		jmp inp

		moveDownG:
		mov bh,1
		mov bl,gx2
		mov nextgx2,bl
		mov bl,gy2
		mov nextgy2,bl
		inc nextgy2
		call ghostc2
		cmp bh,-1
		je contG2
		call ghostu2
		inc gy2
		call ghostd2
		jmp inp
		contG2:
		call Randomize               
        mov  eax,4  
		call RandomRange
		mov  ghostDirection2,al
		jmp inp

		moveLeftG:
		mov bh,1
		mov bl,gx2
		mov nextgx2,bl
		mov bl,gy2
		mov nextgy2,bl
		dec nextgx2
		call ghostc2
		cmp bh,-1
		je contG3
		call ghostu2
		dec gx2
		call ghostd2
		jmp inp
		contG3:
		call Randomize               
        mov  eax,4  
		call RandomRange
		mov  ghostDirection2,al
		jmp inp

		moveRightG:
		mov bh,1
		mov bl,gx2
		mov nextgx2,bl
		mov bl,gy2
		mov nextgy2,bl
		inc nextgx2
		call ghostc2
		cmp bh,-1
		je contG4
		call ghostu2
		inc gx2
		call ghostd2
		jmp inp
		contG4:
		call Randomize               
        mov  eax,4  
		call RandomRange
		mov  ghostDirection2,al
		jmp inp

		inp:
ret
randghost2 ENDP

ghostu3 PROC
	mov eax,yellow(black*16)
	call settextcolor
	mov dl,gx3
	mov dh,gy3
	call Gotoxy
	movzx esi,gy3
	imul esi,118
	movzx eax,gx3
	add esi,eax
	mov eax,0
	mov al,boundar3[esi]
	call writechar
	ret
ghostu3 ENDP
	
ghostd3 PROC
	mov dl,gx3
	mov dh,gy3
	call Gotoxy
	mov eax,brown(brown*16)
	call settextcolor
	lea edx,ghost
	call Writestring
	mov eax,white(black*16)
	call settextcolor
	ret
ret
ghostd3 ENDP

gpc3 PROC
	mov dl,xPos
	mov dh,yPos
	cmp dl,nextgx3
	jne ex
	cmp dh,nextgy3
	jne ex
	mov xPos,57
	mov yPos,20
	dec lives
	ex:
ret
gpc3 ENDP

ghostc3 PROC
	movzx esi,nextgy3
	imul esi,118
	movzx eax,nextgx3
	add esi,eax
	mov bl,boundar3[esi]
	cmp bl,"-"
	je ex3
	cmp bl,"+"
	jne ex
	ex3:
	mov bh,-1
	ex:
ret
ghostc3 ENDP

randghost3 PROC
	cmp ghostDirection3,0
		je moveUpG
		cmp ghostDirection3,1
		je moveDownG
		cmp ghostDirection3,2
		je moveLeftG
		cmp ghostDirection3,3
		je moveRightG

		moveUpG:
		mov bh,1
		mov bl,gx3
		mov nextgx3,bl
		mov bl,gy3
		mov nextgy3,bl
		dec nextgy3
		call ghostc3
		cmp bh,-1
		je contG1
		call ghostu3
		dec gy3
		call ghostd3
		jmp inp
		contG1:
		call Randomize               
        mov  eax,4  
		call RandomRange
		mov  ghostDirection3,al
		jmp inp

		moveDownG:
		mov bh,1
		mov bl,gx3
		mov nextgx3,bl
		mov bl,gy3
		mov nextgy3,bl
		inc nextgy3
		call ghostc3
		cmp bh,-1
		je contG2
		call ghostu3
		inc gy3
		call ghostd3
		jmp inp
		contG2:
		call Randomize               
        mov  eax,4  
		call RandomRange
		mov  ghostDirection3,al
		jmp inp

		moveLeftG:
		mov bh,1
		mov bl,gx3
		mov nextgx3,bl
		mov bl,gy3
		mov nextgy3,bl
		dec nextgx3
		call ghostc3
		cmp bh,-1
		je contG3
		call ghostu3
		dec gx3
		call ghostd3
		jmp inp
		contG3:
		call Randomize               
        mov  eax,4  
		call RandomRange
		mov  ghostDirection3,al
		jmp inp

		moveRightG:
		mov bh,1
		mov bl,gx3
		mov nextgx3,bl
		mov bl,gy3
		mov nextgy3,bl
		inc nextgx3
		call ghostc3
		cmp bh,-1
		je contG4
		call ghostu3
		inc gx3
		call ghostd3
		jmp inp
		contG4:
		call Randomize               
        mov  eax,4  
		call RandomRange
		mov  ghostDirection3,al
		jmp inp

		inp:
ret
randghost3 ENDP

ghostu4 PROC
	mov eax,yellow(black*16)
	call settextcolor
	mov dl,gx4
	mov dh,gy4
	call Gotoxy
	movzx esi,gy4
	imul esi,118
	movzx eax,gx4
	add esi,eax
	mov eax,0
	mov al,boundar3[esi]
	call writechar
	ret
ghostu4 ENDP
	
ghostd4 PROC
	mov dl,gx4
	mov dh,gy4
	call Gotoxy
	mov eax,green(green*16)
	call settextcolor
	lea edx,ghost
	call Writestring
	mov eax,white(black*16)
	call settextcolor
	ret
ret
ghostd4 ENDP

gpc4 PROC
	mov dl,xPos
	mov dh,yPos
	cmp dl,nextgx4
	jne ex
	cmp dh,nextgy4
	jne ex
	mov xPos,57
	mov yPos,20
	dec lives
	ex:
ret
gpc4 ENDP

ghostc4 PROC
	movzx esi,nextgy4
	imul esi,118
	movzx eax,nextgx4
	add esi,eax
	mov bl,boundar3[esi]
	cmp bl,"-"
	je ex3
	cmp bl,"+"
	jne ex
	ex3:
	mov bh,-1
	ex:
ret
ghostc4 ENDP

randghost4 PROC
	cmp ghostDirection4,0
		je moveUpG
		cmp ghostDirection4,1
		je moveDownG
		cmp ghostDirection4,2
		je moveLeftG
		cmp ghostDirection4,3
		je moveRightG

		moveUpG:
		mov bh,1
		mov bl,gx4
		mov nextgx4,bl
		mov bl,gy4
		mov nextgy4,bl
		dec nextgy4
		call ghostc4
		cmp bh,-1
		je contG1
		call ghostu4
		dec gy4
		call ghostd4
		jmp inp
		contG1:
		call Randomize               
        mov  eax,4  
		call RandomRange
		mov  ghostDirection4,al
		jmp inp

		moveDownG:
		mov bh,1
		mov bl,gx4
		mov nextgx4,bl
		mov bl,gy4
		mov nextgy4,bl
		inc nextgy4
		call ghostc4
		cmp bh,-1
		je contG2
		call ghostu4
		inc gy4
		call ghostd4
		jmp inp
		contG2:
		call Randomize               
        mov  eax,4  
		call RandomRange
		mov  ghostDirection4,al
		jmp inp

		moveLeftG:
		mov bh,1
		mov bl,gx4
		mov nextgx4,bl
		mov bl,gy4
		mov nextgy4,bl
		dec nextgx4
		call ghostc4
		cmp bh,-1
		je contG3
		call ghostu4
		dec gx4
		call ghostd4
		jmp inp
		contG3:
		call Randomize               
        mov  eax,4  
		call RandomRange
		mov  ghostDirection4,al
		jmp inp

		moveRightG:
		mov bh,1
		mov bl,gx4
		mov nextgx4,bl
		mov bl,gy4
		mov nextgy4,bl
		inc nextgx4
		call ghostc4
		cmp bh,-1
		je contG4
		call ghostu4
		inc gx4
		call ghostd4
		jmp inp
		contG4:
		call Randomize               
        mov  eax,4  
		call RandomRange
		mov  ghostDirection4,al
		jmp inp

		inp:
ret
randghost4 ENDP

END main



	;cmp bl,"o"
	;jne ex
	;mov eax,yellow(black*16)
	;call settextcolor
	;mov al,bl
	;call writechar
	;mov eax,white(black*16)
	;call settextcolor
	;jmp exi
	;ex:
	;lea edx,spac
	;call writestring
	;exi:
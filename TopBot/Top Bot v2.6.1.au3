;  TopBot
;  Copyright (C) 2007 Filipe Carvalho
; 
;  This program is free software: you can redistribute it and/or modify
;  it under the terms of the GNU General Public License as published by
;  the Free Software Foundation, either version 3 of the License, or
;  (at your option) any later version.
; 
;  This program is distributed in the hope that it will be useful,
;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;  GNU General Public License for more details.
; 
;  You should have received a copy of the GNU General Public License
;  along with this program.  If not, see <http://www.gnu.org/licenses/>.

#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_icon=TOP Bot.ico
#AutoIt3Wrapper_outfile=TOP Bot.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Res_Comment=TOP Bot by Tenza
#AutoIt3Wrapper_Res_Description=Tales Of Pirates Bot
#AutoIt3Wrapper_Res_Fileversion=2.6.1.0
#AutoIt3Wrapper_Res_LegalCopyright=View the LICENSE
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

;*********************************************************************************************************************************
;********** Menus and startup checks **********
;*********************************************************************************************************************************

;********** Trial variables **********
Dim $trial
Dim $version = "v.2.6.1"
;********** Tank variables **********
Dim $attacks_t = IniRead ( "Config.ini", "Tank", "attacks_t_save", "2" )
Dim $attacks_counter_t = 0
Dim $skill_delay_t = IniRead ( "Config.ini", "Tank", "skill_delay_t_save", "6" )
Dim $skill_delay_real_t = IniRead ( "Config.ini", "Tank", "skill_delay_real_t_save", "6000" )
Dim $insert_t = IniRead ( "Config.ini", "Tank", "insert_t_save", "{Insert}" )
Dim $insert_input_t = IniRead ( "Config.ini", "Tank", "insert_input_t_save", "Activated" )
Dim $insert_delay_t = IniRead ( "Config.ini", "Tank", "insert_delay_t_save", "25" )
Dim $insert_delay_real_t = IniRead ( "Config.ini", "Tank", "insert_delay_real_t_save", "25000" )
Dim $hotkey_t = IniRead ( "Config.ini", "Tank", "hotkey_t_save", "{F1}" )
Dim $hotkey_input_t = IniRead ( "Config.ini", "Tank", "hotkey_input_t_save", "F1" )
;********** SharpShooter variables **********
Dim $attacks_ss = IniRead ( "Config.ini", "Sharpshooter", "attacks_ss_save", "1" )
Dim $attacks_counter_ss = 0
Dim $skill_delay_ss = IniRead ( "Config.ini", "Sharpshooter", "skill_delay_ss_save", "1" )
Dim $skill_delay_real_ss = IniRead ( "Config.ini", "Sharpshooter", "skill_delay_real_ss_save", "1000" )
Dim $insert_ss = IniRead ( "Config.ini", "Sharpshooter", "insert_ss_save", "{Insert}" )
Dim $insert_input_ss = IniRead ( "Config.ini", "Sharpshooter", "insert_input_ss_save", "Activated" )
Dim $insert_delay_ss = IniRead ( "Config.ini", "Sharpshooter", "insert_delay_ss_save", "14" )
Dim $insert_delay_real_ss = IniRead ( "Config.ini", "Sharpshooter", "insert_delay_real_ss_save", "14000" )
Dim $hotkey_ss = IniRead ( "Config.ini", "Sharpshooter", "hotkey_ss_save", "{F1}" )
Dim $hotkey_input_ss = IniRead ( "Config.ini", "Sharpshooter", "hotkey_input_ss_save", "F1" )
;********** PixelKiller variables **********
Dim $hex_input = IniRead ( "Config.ini", "Pixelkiller", "hex_input_save", "?" )
Dim $hotkey_pk = IniRead ( "Config.ini", "Pixelkiller", "hotkey_pk_save", "{F1}" )
Dim $hotkey_input_pk = IniRead ( "Config.ini", "Pixelkiller", "hotkey_input_pk_save", "F1" )
;********** GM Finder variables **********
Dim $gm_finder = IniRead ( "Config.ini", "GM_Finder", "gm_finder_save", "Disabled" )
Dim $char = IniRead ( "Config.ini", "GM_Finder", "char_save", "?" )
Dim $gm_finder_delay = IniRead ( "Config.ini", "GM_Finder", "gm_finder_delay_save", "0" )
Dim $gm_finder_delay_real = IniRead ( "Config.ini", "GM_Finder", "gm_finder_delay_real_save", "0" )
Dim $gm_finder_cont = 0
Dim $gm_finder_num = 0
Dim $gm_perf_t_ss = IniRead ( "Config.ini", "GM_Finder", "gm_perf_t_ss_save", "300" )
Dim $gm_perf_pk = IniRead ( "Config.ini", "GM_Finder", "gm_perf_pk_save", "100" )
;********** Auto HP variables **********
Dim $auto_hp = IniRead ( "Config.ini", "Auto_HP", "auto_hp", "Disabled" )
Dim $eat_cake = IniRead ( "Config.ini", "Auto_HP", "eat_cake_save", "0" )
Dim $cake_count = 0
Dim $hotkey_cake = IniRead ( "Config.ini", "Auto_HP", "hotkey_cake_save", "?" )
Dim $hotkey_input_cake = IniRead ( "Config.ini", "Auto_HP", "hotkey_input_cake_save", "?" )
;********** Window variables **********
Dim $fullscreen = IniRead ( "Config.ini", "Window", "fullscreen", "?" )
Dim $non_sup_res = IniRead ( "Config.ini", "Window", "non-suported", "No" )
Dim $non_hp_sup = "0"
Dim $dheight2 = IniRead ( "Config.ini", "Window", "dheight2", "" )
Dim $other_res = IniRead ( "Config.ini", "Window", "other_res", "No" )
Dim $other_type = IniRead ( "Config.ini", "Window", "other_type", "?" )
Dim $800_res_full = IniRead ( "Config.ini", "Window", "800_res_full", "No" )
Dim $800_res_non_full = IniRead ( "Config.ini", "Window", "800_res_non_full", "No" )
Dim $1024_res_full = IniRead ( "Config.ini", "Window", "1024_res_full", "No" )
Dim $1024_res_non_full = IniRead ( "Config.ini", "Window", "1024_res_non_full", "No" )
Dim $1280_res_full = IniRead ( "Config.ini", "Window", "1280_res_full", "No" )
Dim $1280_res_non_full = IniRead ( "Config.ini", "Window", "1280_res_non_full", "No" )

;********** Constants **********
AutoItSetOption ("WinTitleMatchMode", 1)

#include <Constants.au3>
#include <Date.au3>
#include <Array.au3>
#include <GuiConstants.au3>

;********** Startup **********
$trial = _DateDiff( 'd', @YEAR & "/" & @MON & "/" & @MDAY, "2050/01/01") ;disable trial, final version

;Just to force my friends to update the bot :D
If $trial <= 0 Then
	MsgBox(0x30, "Trial Version", "Ask me for a new version!")
	Exit
Else
	;MsgBox(0x30, "Trial Version", "Days left : " & $trial )
EndIf

;********** Supported Resolutions **********
;Central button, works for any resolution.
Dim $dwidth = @DesktopWidth
Dim $dheight = @DesktopHeight

Dim $coord_width_sub1 = $dwidth - 800
Dim $coord_height_sub2 = $dheight - 600

Dim $coord_width = $coord_width_sub1 / 2
Dim $coord_height = $coord_height_sub2 / 2

Dim $Switch_Confirm_1 = 403 + $coord_width
Dim $Switch_Confirm_2 = 347 + $coord_height

If $fullscreen = "Yes" Then
	If $dwidth = 800 And $dheight = 600 Then
		Dim $gm_char1 = 205
		Dim $gm_char2 = 430
		Dim $gm_char3 = 610
		Dim $gm_char_h = 385
		$non_sup_res = "No"
		IniWrite ( "Config.ini", "Window", "non-suported", $non_sup_res )
	ElseIf $dwidth = 1024 And $dheight = 768 Then
		Dim $gm_char1 = 260
		Dim $gm_char2 = 550
		Dim $gm_char3 = 775
		Dim $gm_char_h = 480
		$non_sup_res = "No"
		IniWrite ( "Config.ini", "Window", "non-suported", $non_sup_res )
	ElseIf $dwidth = 1280 And $dheight = 1024 Then
		Dim $gm_char1 = 325
		Dim $gm_char2 = 680
		Dim $gm_char3 = 970
		Dim $gm_char_h = 640
		$non_sup_res = "No"
		IniWrite ( "Config.ini", "Window", "non-suported", $non_sup_res )
	Else
		If $non_sup_res = "No" Then
			MsgBox(0x30, "Attention", "Your windows resolution is NOT supported." & @CRLF &"GM Finder may not work correctly!" & @CRLF & @CRLF & "Supported resolutions : 800x600 /1024x768/ 1280x1024" & @CRLF & @CRLF & "PS: With your current resolution you can try other supported resolution, go to Settings -> Window Menu")
			$non_sup_res = "Yes"
			IniWrite ( "Config.ini", "Window", "non-suported", $non_sup_res )
			$gm_finder = "Disabled"
			IniWrite ( "Config.ini", "GM_Finder", "gm_finder_save", $gm_finder )
			$char = "?"
			IniWrite ( "Config.ini", "GM_Finder", "char_save", $char )
			$gm_finder_delay = "0"
			IniWrite ( "Config.ini", "GM_Finder", "gm_finder_delay_save", $gm_finder_delay )
			$gm_finder_delay_real = "0"
			IniWrite ( "Config.ini", "GM_Finder", "gm_finder_delay_real_save", $gm_finder_delay_real )
		EndIf
	EndIf
EndIf

If $fullscreen = "No" Then
	If $dwidth = 800 And $dheight = 600 Then
		Dim $gm_char1 = 205
		Dim $gm_char2 = 430
		Dim $gm_char3 = 610
		Dim $gm_char_h = 385
		$non_sup_res = "No"
		IniWrite ( "Config.ini", "Window", "non-suported", $non_sup_res )
	ElseIf $dwidth = 1024 And $dheight = 768 Then
		Dim $gm_char1 = 315
		Dim $gm_char2 = 540
		Dim $gm_char3 = 720
		Dim $gm_char_h = 475
		$non_sup_res = "No"
		IniWrite ( "Config.ini", "Window", "non-suported", $non_sup_res )
	ElseIf $dwidth = 1280 And $dheight = 1024 Then
		Dim $gm_char1 = 440
		Dim $gm_char2 = 670
		Dim $gm_char3 = 850
		Dim $gm_char_h = 600
		$non_sup_res = "No"
		IniWrite ( "Config.ini", "Window", "non-suported", $non_sup_res )
	Else
		If $non_sup_res = "No" Then
			MsgBox(0x30, "Attention", "Your windows resolution is NOT supported." & @CRLF &"GM Finder may not work correctly!" & @CRLF & @CRLF & "Supported resolutions : 800x600 /1024x768/ 1280x1024" & @CRLF & @CRLF & "PS: With your current resolution you can try other supported resolution, go to Settings -> Window Menu")
			$non_sup_res = "Yes"
			IniWrite ( "Config.ini", "Window", "non-suported", $non_sup_res )
			$gm_finder = "Disabled"
			IniWrite ( "Config.ini", "GM_Finder", "gm_finder_save", $gm_finder )
			$char = "?"
			IniWrite ( "Config.ini", "GM_Finder", "char_save", $char )
			$gm_finder_delay = "0"
			IniWrite ( "Config.ini", "GM_Finder", "gm_finder_delay_save", $gm_finder_delay )
			$gm_finder_delay_real = "0"
			IniWrite ( "Config.ini", "GM_Finder", "gm_finder_delay_real_save", $gm_finder_delay_real )
		EndIf
	EndIf
EndIf

;********** Non-Supported Resolutions **********
;If the resolution changes, other resolution settings will be deleted.
If $dheight <> $dheight2 Then
	$800_res_full = "No"
	IniWrite ( "Config.ini", "Window", "800_res_full", $800_res_full )
	$800_res_non_full = "No"
	IniWrite ( "Config.ini", "Window", "800_res_non_full", $800_res_non_full )
	$1024_res_full = "No"
	IniWrite ( "Config.ini", "Window", "1024_res_full", $1024_res_full )
	$1024_res_non_full = "No"
	IniWrite ( "Config.ini", "Window", "1024_res_non_full", $1024_res_non_full )
	$1280_res_full = "No"
	IniWrite ( "Config.ini", "Window", "1280_res_full", $1280_res_full )
	$1280_res_non_full = "No"
	IniWrite ( "Config.ini", "Window", "1280_res_non_full", $1280_res_non_full )
	$other_res = "No"
	IniWrite ( "Config.ini", "Window", "other_res", $other_res )
	$other_type = "?"
	IniWrite ( "Config.ini", "Window", "other_type", $other_type )
	$dheight2 = @DesktopHeight
	IniWrite ( "Config.ini", "Window", "dheight2", $dheight2 )
EndIf

;Verifies if a resolution was alredy set, else deletes GM Finder settings. (again)
If $800_res_full = "Yes" Then
	Dim $gm_char1 = 205
	Dim $gm_char2 = 430
	Dim $gm_char3 = 610
	Dim $gm_char_h = 385
ElseIf $800_res_non_full = "Yes" Then
	Dim $gm_char1 = 205
	Dim $gm_char2 = 430
	Dim $gm_char3 = 610
	Dim $gm_char_h = 385
ElseIf $1024_res_full = "Yes" Then
	Dim $gm_char1 = 260
	Dim $gm_char2 = 550
	Dim $gm_char3 = 775
	Dim $gm_char_h = 480
ElseIf $1024_res_non_full = "Yes" Then
	Dim $gm_char1 = 315
	Dim $gm_char2 = 540
	Dim $gm_char3 = 720
	Dim $gm_char_h = 475
ElseIf $1280_res_full = "Yes" Then
	Dim $gm_char1 = 325
	Dim $gm_char2 = 680
	Dim $gm_char3 = 970
	Dim $gm_char_h = 640
ElseIf $1280_res_non_full = "Yes" Then
	Dim $gm_char1 = 440
	Dim $gm_char2 = 670
	Dim $gm_char3 = 850
	Dim $gm_char_h = 600
ElseIf $non_sup_res = "Yes" Then
	$gm_finder = "Disabled"
	IniWrite ( "Config.ini", "GM_Finder", "gm_finder_save", $gm_finder )
	$char = "?"
	IniWrite ( "Config.ini", "GM_Finder", "char_save", $char )
	$gm_finder_delay = "0"
	IniWrite ( "Config.ini", "GM_Finder", "gm_finder_delay_save", $gm_finder_delay )
	$gm_finder_delay_real = "0"
	IniWrite ( "Config.ini", "GM_Finder", "gm_finder_delay_real_save", $gm_finder_delay_real )
EndIf

;********** Auto HP **********
;Works for any resolution
If $fullscreen = "Yes" Then
	Dim $hp1 = 130
	Dim $hp2 = 28
EndIf

;Works for non-fullscreen only (supported type)
If $fullscreen = "No" Then
	If $dwidth = 800 And $dheight = 600 Then
		Dim $hp1 = 130
		Dim $hp2 = 51
	ElseIf $dwidth = 1024 And $dheight = 768 Then
		Dim $hp1 = 243
		Dim $hp2 = 125
	ElseIf $dwidth = 1280 And $dheight = 1024 Then
		Dim $hp1 = 370
		Dim $hp2 = 253
	Else
		$non_hp_sup = "1"
		$auto_hp = "Disabled"
		IniWrite ( "Config.ini", "Auto_HP", "auto_hp", $auto_hp )
		$eat_cake = "0"
		IniWrite ( "Config.ini", "Auto_HP", "eat_cake_save", $eat_cake )
		$hotkey_cake = "?"
		IniWrite ( "Config.ini", "Auto_HP", "hotkey_cake_save", $hotkey_cake )
		$hotkey_input_cake = "?"
		IniWrite ( "Config.ini", "Auto_HP", "hotkey_input_cake_save", $hotkey_input_cake )
	EndIf
EndIf

;********** Start Menu  **********
TrayTip("TOP Bot " & $version, "Alt+Z = Tank Menu" & @CRLF & "Alt+X = Sharpshooter Menu" & @CRLF & "Alt+C = Pixel Killer Menu" & @CRLF & "Alt+V = Settings", 8 , 1 )
TraySetToolTip("TOP Bot " & $version & " by Tenza")

HotKeySet ("!z",  "menu_tank")
HotKeySet ("!x",  "menu_sharpshooter")
HotKeySet ("!c",  "menu_pixel_killer")
HotKeySet ("!v",  "menu_settings")

HotKeySet ("!a", "menu")

;********** Back Menu **********
Func menu ()
	TrayTip("TOP Bot " & $version, "Alt+Z = Tank Menu" & @CRLF & "Alt+X = Sharpshooter Menu" & @CRLF & "Alt+C = Pixel Killer Menu" & @CRLF & "Alt+V = Settings", 8 , 1 )

	HotKeySet ("!z",  "menu_tank")
	HotKeySet ("!x",  "menu_sharpshooter")
	HotKeySet ("!c",  "menu_pixel_killer")
	HotKeySet ("!v",  "menu_settings")

	HotKeySet ("!a", "menu")
EndFunc

;*********************************************************************************************************************************
;********** Tank **********
;*********************************************************************************************************************************

;********** Menu Tank **********
Func menu_tank ()
	TrayTip("Tank Menu (Skill Holw - "& $hotkey_input_t &") Edit = Ctrl+K", "F9 = Start!" & @CRLF & "F10 = Stop bot" & @CRLF & @CRLF & "Nº of attacks = " & $attacks_t & @CRLF & "+/- nº of attacks = Alt+Up/Down" & @CRLF & @CRLF & "Delay between skills = " & $skill_delay_t & "s" & @CRLF & "+/- Delay in skills = Alt+PgUp/PgDown" & @CRLF & @CRLF & "Insert is: " & $insert_input_t & " / " & $insert_delay_t & "s" & @CRLF & "Yes / No Insert = Ctrl+I" & @CRLF & "+/- Delay in Insert = Alt+O/L" & @CRLF & @CRLF & "Alt+A = Back" , 8, 1 )

	HotKeySet ("{F9}", "tank_attack")
	HotkeySet ("{F10}", "Stop")
	HotKeySet ("!a", "menu")

	HotKeySet ("^k", "edit_key_tank")
	HotKeySet ("!{up}", "up_attacks_tank")
	HotKeySet ("!{down}", "down_attacks_tank")
	HotKeySet ("!{pgup}", "up_delay_attacks_tank")
	HotKeySet ("!{pgdn}", "down_delay_attacks_tank")
	HotKeySet ("^i", "yes_no_tank")
	HotKeySet ("!o", "up_delay_insert_tank")
	HotKeySet ("!l", "down_delay_insert_tank")
EndFunc

;********** Functions: Up/Down Attack **********
Func up_attacks_tank ()
	$attacks_t = $attacks_t + 1
	IniWrite ( "Config.ini", "Tank", "attacks_t_save", $attacks_t )
	TrayTip ("Edit nº of attacks" , "Number of attacks is " & $attacks_t & @CRLF & @CRLF & "Alt+Z =  Back",10,1)
EndFunc

Func down_attacks_tank ()
	If $attacks_t = 1 Then ;No zero allowed

	Else
		$attacks_t = $attacks_t - 1
		IniWrite ( "Config.ini", "Tank", "attacks_t_save", $attacks_t )
		TrayTip ("Edit nº of attacks" , "Number of attacks is " & $attacks_t & @CRLF & @CRLF & "Alt+Z =  Back",10,1)
	EndIf
	If $attacks_t = 1 Then ;Changes delays on the first time.
		$skill_delay_t = 0
		IniWrite ( "Config.ini", "Tank", "skill_delay_t_save", $skill_delay_t )
		$skill_delay_real_t =  0
		IniWrite ( "Config.ini", "Tank", "skill_delay_real_t_save", $skill_delay_real_t )
	EndIf
EndFunc

;********** Functions: Up/Down time of the attack **********
Func up_delay_attacks_tank ()
	If $attacks_t = 1 Then
		TrayTip ("Attention" , "Give more attacks, to edit delay" & @CRLF & @CRLF & "Alt+Z = Back",10,1)
	Else
		$skill_delay_t = $skill_delay_t + 1
		IniWrite ( "Config.ini", "Tank", "skill_delay_t_save", $skill_delay_t )
		TrayTip ("Edit attack delay" , "Delay between attacks is " & $skill_delay_t & "s" & @CRLF & @CRLF & "Alt+Z = Back",10,1)

		$skill_delay_real_t = $skill_delay_t * 1000 ; multiplicar por 1000 porque utiliza milisegundos
		IniWrite ( "Config.ini", "Tank", "skill_delay_real_t_save", $skill_delay_real_t )
	EndIf
EndFunc

Func down_delay_attacks_tank ()
	If $skill_delay_t = 0 Then ;No zero allowed

	Else
		$skill_delay_t = $skill_delay_t - 1
		IniWrite ( "Config.ini", "Tank", "skill_delay_t_save", $skill_delay_t )
		TrayTip ("Edit attack delay" , "Delay between attacks is " & $skill_delay_t & "s" & @CRLF & @CRLF &"Alt+Z = Back",10,1)

		$skill_delay_real_t = $skill_delay_t * 1000
		IniWrite ( "Config.ini", "Tank", "skill_delay_real_t_save", $skill_delay_real_t )
	EndIf
EndFunc

;********** Functions: Activate/Desactivate Insert **********
Func yes_no_tank ()
	Switch MsgBox($mb_yesno, "Insert Key", "Wounld you like to activate Insert key?")
		Case $idyes
			$insert_t = "{Insert}"
			IniWrite ( "Config.ini", "Tank", "insert_t_save", $insert_t )
			$insert_input_t = "Activated"
			IniWrite ( "Config.ini", "Tank", "insert_input_t_save", $insert_input_t )
			$insert_delay_t = "25"
			IniWrite ( "Config.ini", "Tank", "insert_delay_t_save", $insert_delay_t )
			$insert_delay_real_t = "25000"
			IniWrite ( "Config.ini", "Tank", "insert_delay_real_t_save", $insert_delay_real_t )
			MsgBox(0x40, "Insert", "Insert is Activated!")
		Case $idno
			$insert_t = ""
			IniWrite ( "Config.ini", "Tank", "insert_t_save", $insert_t )
			$insert_input_t = "Disabled"
			IniWrite ( "Config.ini", "Tank", "insert_input_t_save", $insert_input_t )
			$insert_delay_t = "0"
			IniWrite ( "Config.ini", "Tank", "insert_delay_t_save", $insert_delay_t )
			$insert_delay_real_t = "0"
			IniWrite ( "Config.ini", "Tank", "insert_delay_real_t_save", $insert_delay_real_t )
			MsgBox(0x40, "Insert", "Insert is Disabled!")
	EndSwitch
EndFunc

;********** Functions: Up/Down time of Insert **********
Func up_delay_insert_tank ()
	If $insert_input_t = "Disabled" Then
		TrayTip( "Attention", "Insert Key is at the moment Disabled" & @CRLF & "reactivate to edit the delay." & @CRLF & @CRLF & "Ctrl+I to reactivate",10,1)
	Else
		$insert_delay_t = $insert_delay_t + 1
		IniWrite ( "Config.ini", "Tank", "insert_delay_t_save", $insert_delay_t )
		TrayTip ("Edit Insert Delay" , "Insert delay is " & $insert_delay_t & "s" & @CRLF & @CRLF & "Alt+Z = Back",10,1)

		$insert_delay_real_t = $insert_delay_t * 1000
		IniWrite ( "Config.ini", "Tank", "insert_delay_real_t_save", $insert_delay_real_t )
	EndIf
EndFunc

Func down_delay_insert_tank ()
	If $insert_input_t = "Disabled" Then
		TrayTip( "Attention", "Insert Key is at the moment Disabled" & @CRLF & "reactivate to edit the delay." & @CRLF & @CRLF & "Ctrl+I to reactivate",10,1)
	else
			If $insert_delay_t = 1 Then

			Else
				$insert_delay_t = $insert_delay_t - 1
				IniWrite ( "Config.ini", "Tank", "insert_delay_t_save", $insert_delay_t )
				TrayTip ("Edit Insert Delay" , "Insert delay is " & $insert_delay_t & "s" & @CRLF & @CRLF &"Alt+Z = Back",10,1)

				$insert_delay_real_t = $insert_delay_t * 1000
				IniWrite ( "Config.ini", "Tank", "insert_delay_real_t_save", $insert_delay_real_t )
			EndIf
	EndIf
EndFunc

;********** Edit a Hotkey **********
Func edit_key_tank ()
	$hotkey_input_t = InputBox("Tank Skill", "Input your Holw hotkey", $hotkey_input_t, "", 280, 120, Default, Default, 10)
	If $hotkey_input_t = "F1" Then
		$hotkey_t = "{F1}" ;changes skill to be used
		IniWrite ( "Config.ini", "Tank", "hotkey_t_save", $hotkey_t )
		$hotkey_input_t = "F1" ;Only to show "F" uppercase on tray xD
		IniWrite ( "Config.ini", "Tank", "hotkey_input_t_save", $hotkey_input_t )
	ElseIf $hotkey_input_t = "F2" Then
		$hotkey_t = "{F2}"
		IniWrite ( "Config.ini", "Tank", "hotkey_t_save", $hotkey_t )
		$hotkey_input_t = "F2"
		IniWrite ( "Config.ini", "Tank", "hotkey_input_t_save", $hotkey_input_t )
	ElseIf $hotkey_input_t = "F3" Then
		$hotkey_t = "{F3}"
		IniWrite ( "Config.ini", "Tank", "hotkey_t_save", $hotkey_t )
		$hotkey_input_t = "F3"
		IniWrite ( "Config.ini", "Tank", "hotkey_input_t_save", $hotkey_input_t )
	ElseIf $hotkey_input_t = "F4" Then
		$hotkey_t = "{F4}"
		IniWrite ( "Config.ini", "Tank", "hotkey_t_save", $hotkey_t )
		$hotkey_input_t = "F4"
		IniWrite ( "Config.ini", "Tank", "hotkey_input_t_save", $hotkey_input_t )
	ElseIf $hotkey_input_t = "F5" Then
		$hotkey_t = "{F5}"
		IniWrite ( "Config.ini", "Tank", "hotkey_t_save", $hotkey_t )
		$hotkey_input_t = "F5"
		IniWrite ( "Config.ini", "Tank", "hotkey_input_t_save", $hotkey_input_t )
	ElseIf $hotkey_input_t = "F6" Then
		$hotkey_t = "{F6}"
		IniWrite ( "Config.ini", "Tank", "hotkey_t_save", $hotkey_t )
		$hotkey_input_t = "F6"
		IniWrite ( "Config.ini", "Tank", "hotkey_input_t_save", $hotkey_input_t )
	ElseIf $hotkey_input_t = "F7" Then
		$hotkey_t = "{F7}"
		IniWrite ( "Config.ini", "Tank", "hotkey_t_save", $hotkey_t )
		$hotkey_input_t = "F7"
		IniWrite ( "Config.ini", "Tank", "hotkey_input_t_save", $hotkey_input_t )
	ElseIf $hotkey_input_t = "F8" Then
		$hotkey_t = "{F8}"
		IniWrite ( "Config.ini", "Tank", "hotkey_t_save", $hotkey_t )
		$hotkey_input_t = "F8"
		IniWrite ( "Config.ini", "Tank", "hotkey_input_t_save", $hotkey_input_t )
		;F8 = TOP maximum
	Else
		$hotkey_t = IniRead ( "Config.ini", "Tank", "hotkey_t_save", "{F1}" )
		$hotkey_input_t = IniRead ( "Config.ini", "Tank", "hotkey_input_t_save", "F1" )
		MsgBox(0x30, "Attention", "The Hotkey was NOT changed!" & @CRLF & "Please check again the key introduced" & @CRLF & "" & @CRLF & "PS: Only F1, F2, F3 ... F8 are allowed.")
	EndIf
EndFunc

;********** Functions: AFK Attack **********
Func tank_attack ()
	While (1)
		Sleep(100)
			Do
				Sleep(100)
				Send($hotkey_t)
				Sleep(100)
				Sleep($skill_delay_real_t)
				$attacks_counter_t = $attacks_counter_t + 1
			Until $attacks_counter_t = $attacks_t
				Sleep(100)
				$attacks_counter_t = 0
				If WinActive("Tales of Pirates") Then
				Else
					WinActivate("Tales of Pirates")
				EndIf
				Sleep(300)
				Send($insert_t)
				Sleep($insert_delay_real_t)
					If $gm_finder = "Activated" Then
						Do
							$gm_finder_cont = $gm_finder_cont + 1
								$m2a = PixelSearch( 0, 0, $dwidth, $dheight, 0xEDD745, 1)
									If IsArray($m2a) Then
										$m2b = PixelSearch( 0, 0, $dwidth, $dheight, 0xF1D942, 1)
											If IsArray($m2b) Then
												$m2c = PixelSearch( 0, 0, $dwidth, $dheight, 0xA57321, 1)
													If IsArray($m2c) Then
														$m2d = PixelSearch( 0, 0, $dwidth, $dheight, 0x825917, 1)
															If IsArray($m2d) Then
																$m2e = PixelSearch( 0, 0, $dwidth, $dheight, 0xA27120, 1)
																	If IsArray($m2e) Then
																		Sleep(200)
																		Send("{esc}")
																		Sleep(1000)
																		MouseClick ("left", $Switch_Confirm_1, $Switch_Confirm_2, 15, 10)
																		Sleep($gm_finder_delay_real)
																			If $char = 1 Then
																				MouseClick ("left", $gm_char1, $gm_char_h, 10, 10)
																			ElseIf $char = 2 Then
																				MouseClick ("left", $gm_char2, $gm_char_h, 10, 10)
																			ElseIf $char = 3 then
																				MouseClick ("left", $gm_char3, $gm_char_h, 10, 10)
																			EndIf
																				Sleep(6000)
																				$gm_finder_num = $gm_finder_num + 1
																	EndIf
															EndIf
													EndIf
											EndIf
									EndIf
						Until $gm_finder_cont = $gm_perf_t_ss
							  $gm_finder_cont = 0
					EndIf
					If $auto_hp = "Activated" Then
						$pgc = PixelGetColor( $hp1 , $hp2 )
						$rlypgc = Hex($pgc, 6)
							If $rlypgc = "538BA7" Then
								Do
									$cake_count = $cake_count + 1
									Send($hotkey_cake)
									Sleep(1000)
								Until $cake_count = $eat_cake
								$cake_count = 0
							EndIf
					EndIf
				Send($insert_t)
				Sleep(500)
	WEnd
EndFunc

;*********************************************************************************************************************************
;********** Sharpshooter **********
;*********************************************************************************************************************************

;********** Menu Sharpshooter **********
Func menu_sharpshooter ()
	TrayTip("Sharpshooter Menu (Skill Magna Bullet - "& $hotkey_input_ss &") Edit = Ctrl+K", "F9 = Start!" & @CRLF & "F10 = Stop bot" & @CRLF & @CRLF & "Nº of attacks = " & $attacks_ss & @CRLF & "+/- nº of attacks = Alt+Up/Down" & @CRLF & @CRLF & "Delay between skills = " & $skill_delay_ss & "s" & @CRLF & "+/- Delay in skills = Alt+PgUp/PgDown" & @CRLF & @CRLF & "Insert is: " & $insert_input_ss & " / " & $insert_delay_ss & "s" & @CRLF & "Yes / No Insert = Ctrl+I" & @CRLF & "+/- Delay in Insert = Alt+O/L" & @CRLF & @CRLF & "Alt+A = Back" , 8, 1 )

	HotKeySet ("{F9}", "sharpshooter_attack")
	HotkeySet ("{F10}", "Stop")
	HotKeySet ("!a", "menu")

	HotKeySet ("^k", "edit_key_ss")
	HotKeySet ("!{up}", "up_attacks_ss")
	HotKeySet ("!{down}", "down_attacks_ss")
	HotKeySet ("!{pgup}", "up_delay_attacks_ss")
	HotKeySet ("!{pgdn}", "down_delay_attacks_ss")
	HotKeySet ("^i", "yes_no_ss")
	HotKeySet ("!o", "up_delay_insert_ss")
	HotKeySet ("!l", "down_delay_insert_ss")
EndFunc

;********** Functions: Up/Down Attacks **********
Func up_attacks_ss ()
	$attacks_ss = $attacks_ss + 1
	IniWrite ( "Config.ini", "Sharpshooter", "attacks_ss_save", $attacks_ss )
	TrayTip ("Edit nº of attacks" , "Number of attacks is " & $attacks_ss & @CRLF & @CRLF & "Alt+X =  Back",10,1)
EndFunc

Func down_attacks_ss ()
	If $attacks_ss = 1 Then

	Else
		$attacks_ss = $attacks_ss - 1
		IniWrite ( "Config.ini", "Sharpshooter", "attacks_ss_save", $attacks_ss )
		TrayTip ("Edit nº of attacks" , "Number of attacks is " & $attacks_ss & @CRLF & @CRLF & "Alt+X =  Back",10,1)
	EndIf
	If $attacks_ss = 1 Then
		$skill_delay_ss = 0
		IniWrite ( "Config.ini", "Tank", "skill_delay_ss_save", $skill_delay_ss )
		$skill_delay_real_ss =  0
		IniWrite ( "Config.ini", "Tank", "skill_delay_real_ss_save", $skill_delay_real_ss )
	EndIf
EndFunc

;********** Functions: Up/Down time of attack **********
Func up_delay_attacks_ss ()
	If $attacks_ss = 1 Then
		TrayTip ("Attention" , "Give more attacks, to edit delay" & @CRLF & @CRLF & "Alt+X = Back",10,1)
	Else
		$skill_delay_ss = $skill_delay_ss + 1
		IniWrite ( "Config.ini", "Sharpshooter", "skill_delay_ss_save", $skill_delay_ss )
		TrayTip ("Edit attack delay" , "Delay between attacks is " & $skill_delay_ss & "s" & @CRLF & @CRLF & "Alt+X = Back",10,1)

		$skill_delay_real_ss = $skill_delay_ss * 1000 ;milliseconds
		IniWrite ( "Config.ini", "Sharpshooter", "skill_delay_real_ss_save", $skill_delay_real_ss )
	EndIf
EndFunc

Func down_delay_attacks_ss ()
	If $skill_delay_ss = 0 Then ;No zero allowed

	Else
		$skill_delay_ss = $skill_delay_ss - 1
		IniWrite ( "Config.ini", "Sharpshooter", "skill_delay_ss_save", $skill_delay_ss )
		TrayTip ("Edit attack delay" , "Delay between attacks is " & $skill_delay_ss & "s" & @CRLF & @CRLF &"Alt+X = Back",10,1)

		$skill_delay_real_ss = $skill_delay_ss * 1000
		IniWrite ( "Config.ini", "Sharpshooter", "skill_delay_real_ss_save", $skill_delay_real_ss )
	EndIf
EndFunc

;********** Functions: Activate/Desactivate Insert **********
Func yes_no_ss ()
	Switch MsgBox($mb_yesno, "Insert Key", "Wounld you like to activate Insert key?")
		Case $idyes
			$insert_ss = "{Insert}"
			IniWrite ( "Config.ini", "Sharpshooter", "insert_ss_save", $insert_ss )
			$insert_input_ss = "Activated"
			IniWrite ( "Config.ini", "Sharpshooter", "insert_input_ss_save", $insert_input_ss )
			$insert_delay_ss = "14"
			IniWrite ( "Config.ini", "Sharpshooter", "insert_delay_ss_save", $insert_delay_ss )
			$insert_delay_real_ss = "14000"
			IniWrite ( "Config.ini", "Sharpshooter", "insert_delay_real_ss_save", $insert_delay_real_ss )
			MsgBox(0x40, "Insert", "Insert is Activated!")
		Case $idno
			$insert_ss = ""
			IniWrite ( "Config.ini", "Sharpshooter", "insert_ss_save", $insert_ss )
			$insert_input_ss = "Disabled"
			IniWrite ( "Config.ini", "Sharpshooter", "insert_input_ss_save", $insert_input_ss )
			$insert_delay_ss = "0"
			IniWrite ( "Config.ini", "Sharpshooter", "insert_delay_ss_save", $insert_delay_ss )
			$insert_delay_real_ss = "0"
			IniWrite ( "Config.ini", "Sharpshooter", "insert_delay_real_ss_save", $insert_delay_real_ss )
			MsgBox(0x40, "Insert", "Insert is Disabled!")
	EndSwitch
EndFunc


;********** Functions: Up/Down time of Insert **********
Func up_delay_insert_ss ()
	If $insert_input_ss = "Disabled" Then
		TrayTip( "Attention", "Insert Key is at the moment Disabled" & @CRLF & "reactivate to edit the delay." & @CRLF & @CRLF & "Ctrl+I to reactivate",10,1)
	Else
		$insert_delay_ss = $insert_delay_ss + 1
		IniWrite ( "Config.ini", "Sharpshooter", "insert_delay_ss_save", $insert_delay_ss )
		TrayTip ("Edit Insert Delay" , "Insert delay is " & $insert_delay_ss & "s" & @CRLF & @CRLF & "Alt+X = Back",10,1)

		$insert_delay_real_ss = $insert_delay_ss * 1000
		IniWrite ( "Config.ini", "Sharpshooter", "insert_delay_real_ss_save", $insert_delay_real_ss )
	EndIf
EndFunc

Func down_delay_insert_ss ()
	If $insert_input_ss = "Disabled" Then
		TrayTip( "Attention", "Insert Key is at the moment Disabled" & @CRLF & "reactivate to edit the delay." & @CRLF & @CRLF & "Ctrl+I to reactivate",10,1)
	else
			If $insert_delay_ss = 1 Then

			Else
				$insert_delay_ss = $insert_delay_ss - 1
				IniWrite ( "Config.ini", "Sharpshooter", "insert_delay_ss_save", $insert_delay_ss )
				TrayTip ("Edit Insert Delay" , "Insert delay is " & $insert_delay_ss & "s" & @CRLF & @CRLF &"Alt+X = Back",10,1)

				$insert_delay_real_ss = $insert_delay_ss * 1000
				IniWrite ( "Config.ini", "Sharpshooter", "insert_delay_real_ss_save", $insert_delay_real_ss )
			EndIf
	EndIf
EndFunc

;********** Change Hotkey **********
Func edit_key_ss ()
	$hotkey_input_ss = InputBox("Tank Skill", "Input your Magna Bullet hotkey", $hotkey_input_ss, "", 280, 120, Default, Default, 10)
	If $hotkey_input_ss = "F1" Then
		$hotkey_ss = "{F1}" 
		IniWrite ( "Config.ini", "Sharpshooter", "hotkey_ss_save", $hotkey_ss )
		$hotkey_input_ss = "F1" 
		IniWrite ( "Config.ini", "Sharpshooter", "hotkey_input_ss_save", $hotkey_input_ss )
	ElseIf $hotkey_input_ss = "F2" Then
		$hotkey_ss = "{F2}"
		IniWrite ( "Config.ini", "Sharpshooter", "hotkey_ss_save", $hotkey_ss )
		$hotkey_input_ss = "F2"
		IniWrite ( "Config.ini", "Sharpshooter", "hotkey_input_ss_save", $hotkey_input_ss )
	ElseIf $hotkey_input_ss = "F3" Then
		$hotkey_ss = "{F3}"
		IniWrite ( "Config.ini", "Sharpshooter", "hotkey_ss_save", $hotkey_ss )
		$hotkey_input_ss = "F3"
		IniWrite ( "Config.ini", "Sharpshooter", "hotkey_input_ss_save", $hotkey_input_ss )
	ElseIf $hotkey_input_ss = "F4" Then
		$hotkey_ss = "{F4}"
		IniWrite ( "Config.ini", "Sharpshooter", "hotkey_ss_save", $hotkey_ss )
		$hotkey_input_ss = "F4"
		IniWrite ( "Config.ini", "Sharpshooter", "hotkey_input_ss_save", $hotkey_input_ss )
	ElseIf $hotkey_input_ss = "F5" Then
		$hotkey_ss = "{F5}"
		IniWrite ( "Config.ini", "Sharpshooter", "hotkey_ss_save", $hotkey_ss )
		$hotkey_input_ss = "F5"
		IniWrite ( "Config.ini", "Sharpshooter", "hotkey_input_ss_save", $hotkey_input_ss )
	ElseIf $hotkey_input_ss = "F6" Then
		$hotkey_ss = "{F6}"
		IniWrite ( "Config.ini", "Sharpshooter", "hotkey_ss_save", $hotkey_ss )
		$hotkey_input_ss = "F6"
		IniWrite ( "Config.ini", "Sharpshooter", "hotkey_input_ss_save", $hotkey_input_ss )
	ElseIf $hotkey_input_ss = "F7" Then
		$hotkey_ss = "{F7}"
		IniWrite ( "Config.ini", "Sharpshooter", "hotkey_ss_save", $hotkey_ss )
		$hotkey_input_ss = "F7"
		IniWrite ( "Config.ini", "Sharpshooter", "hotkey_input_ss_save", $hotkey_input_ss )
	ElseIf $hotkey_input_ss = "F8" Then
		$hotkey_ss = "{F8}"
		IniWrite ( "Config.ini", "Sharpshooter", "hotkey_ss_save", $hotkey_ss )
		$hotkey_input_ss = "F8"
		IniWrite ( "Config.ini", "Sharpshooter", "hotkey_input_ss_save", $hotkey_input_ss )
	Else
		$hotkey_ss = IniRead ( "Config.ini", "Sharpshooter", "hotkey_ss_save", "{F1}" )
		$hotkey_input_ss = IniRead ( "Config.ini", "Sharpshooter", "hotkey_input_ss_save", "F1" )
		MsgBox(0x30, "Attention", "The Hotkey was NOT changed!" & @CRLF & "Please check again the key introduced" & @CRLF & "" & @CRLF & "PS: Only F1, F2, F3 ... F8 are allowed.")
	EndIf
EndFunc

;********** Functions: AFK Attack **********
Func sharpshooter_attack ()
	While (1)
		Sleep(100)
			Do
				Sleep(100)
				Send($hotkey_ss)
				Sleep(500)
					MouseDown("left")
					Sleep(100)
					MouseUp("left")
				Sleep($skill_delay_real_ss)
				$attacks_counter_ss = $attacks_counter_ss + 1
			Until $attacks_counter_ss = $attacks_ss
				Sleep(100)
				$attacks_counter_ss = 0
				If WinActive("Tales of Pirates") Then
				Else
					WinActivate("Tales of Pirates")
				EndIf
				Sleep(300)
				Send($insert_ss)
				Sleep($insert_delay_real_ss)
					If $gm_finder = "Activated" Then
						Do
							$gm_finder_cont = $gm_finder_cont + 1
								$m2a = PixelSearch( 0, 0, $dwidth, $dheight, 0xEDD745, 1)
									If IsArray($m2a) Then
										$m2b = PixelSearch( 0, 0, $dwidth, $dheight, 0xF1D942, 1)
											If IsArray($m2b) Then
												$m2c = PixelSearch( 0, 0, $dwidth, $dheight, 0xA57321, 1)
													If IsArray($m2c) Then
														$m2d = PixelSearch( 0, 0, $dwidth, $dheight, 0x825917, 1)
															If IsArray($m2d) Then
																$m2e = PixelSearch( 0, 0, $dwidth, $dheight, 0xA27120, 1)
																	If IsArray($m2e) Then
																		Sleep(200)
																		Send("{esc}")
																		Sleep(1000)
																		MouseClick ("left", $Switch_Confirm_1, $Switch_Confirm_2, 15, 10)
																		Sleep($gm_finder_delay_real)
																			If $char = 1 Then
																				MouseClick ("left", $gm_char1, $gm_char_h, 10, 10)
																			ElseIf $char = 2 Then
																				MouseClick ("left", $gm_char2, $gm_char_h, 10, 10)
																			ElseIf $char = 3 then
																				MouseClick ("left", $gm_char3, $gm_char_h, 10, 10)
																			EndIf
																				Sleep(6000)
																				$gm_finder_num = $gm_finder_num + 1
																	EndIf
															EndIf
													EndIf
											EndIf
									EndIf
						Until $gm_finder_cont = $gm_perf_t_ss
							  $gm_finder_cont = 0
					EndIf
					If $auto_hp = "Activated" Then
						$pgc = PixelGetColor( $hp1 , $hp2 )
						$rlypgc = Hex($pgc, 6)
							If $rlypgc = "538BA7" Then
								Do
									$cake_count = $cake_count + 1
									Send($hotkey_cake)
									Sleep(1000)
								Until $cake_count = $eat_cake
								$cake_count = 0
							EndIf
					EndIf
				Send($insert_ss)
				Sleep(1000)
	WEnd
EndFunc

;*********************************************************************************************************************************
;********** Pixel Killer **********
;*********************************************************************************************************************************

;********** Menu pixel killer **********
Func menu_pixel_killer ()
	TrayTip("Pixel Killer (Full Screen is recommended) " , "F8 = Normal attack" & @CRLF & "F9 = Skill attack (Skill - "& $hotkey_input_pk &") Edit = Ctrl+K" & @CRLF & "F10 = Stop" & @CRLF & @CRLF & "Current code = "& $hex_input & @CRLF & "Input code = Ctrl+H" & @CRLF & "Code list = Ctrl+L" & @CRLF & "Create Code = Ctrl+G" & @CRLF & @CRLF & "Alt+A = Back" , 8 , 1 )

	HotKeySet ("{F8}", "pk_normal")
	HotkeySet ("{F9}", "pk_magic")
	HotkeySet ("{F10}", "Stop")
	HotKeySet ("!a",  "menu")

	HotkeySet ("^h", "hexadecimal")
	HotkeySet ("^l", "list_mobs")
	HotkeySet ("^g", "code_gen")
	HotKeySet ("^k", "edit_key_pk")
EndFunc

;********** Functions: Input Hexadecimal **********
Func hexadecimal ()
	$hex_input = InputBox ("Hexadecimal", "Input a Hexadecimal code" , $hex_input, "", 280, 120, Default, Default, 10)
		If $hex_input = "?" Then
			$hex_input = IniRead ( "Config.ini", "Pixelkiller", "hex_input_save", "?" )
		EndIf
		If @Error = 1 Then
			$hex_input = IniRead ( "Config.ini", "Pixelkiller", "hex_input_save", "?" )
		Else
			IniWrite ( "Config.ini", "Pixelkiller", "hex_input_save", $hex_input )
		EndIf
EndFunc

;********** Functions: List **********
Func list_mobs ()
ShellExecute("Hexacodes.txt", "", @ScriptDir, "edit")
if @error Then
	EndIf
EndFunc

;********** Functions: Generate o hexadecimal code **********
Func code_gen ()
	MsgBox(0x40, "Code Generator", "1- Take a ScreenShot of the monster" & @CRLF & "2- Use 'Paint' to save your ScreenShot" & @CRLF & "3- Put your mouse over the monster and press Alt+Shift+C" & @CRLF & "4- You will get the code of your monster, copy it" & @CRLF & "5- Save your code in Hexacodes.txt to use later")
	TrayTip("Code Generator", "You can now press Alt+Shift+C to get Code!" & @CRLF & @CRLF & "Alt+C = Back",10,1)
	HotKeySet ("!+c",  "get_code")
EndFunc

Func get_code ()
	$m_pos = MouseGetPos()
	$get_color = PixelGetColor($m_pos[0] , $m_pos[1])
	$hexx = Hex($get_color, 6)
	InputBox ("Hexadecimal", "You can now copy the code, and save it in Hexacodes.txt" & @CRLF & "Or just use it in 'Input Code' xD", "0x" & $hexx ,"", 320, 150, Default, Default, 20)
EndFunc

;********** Changes Hotkey **********
Func edit_key_pk ()
	$hotkey_input_pk = InputBox("Input Skill", "Input your skill hotkey", $hotkey_input_pk, "", 280, 120, Default, Default, 10)
	If $hotkey_input_pk = "F1" Then
		$hotkey_pk = "{F1}" 
		IniWrite ( "Config.ini", "Pixelkiller", "hotkey_pk_save", $hotkey_pk )
		$hotkey_input_pk = "F1" 
		IniWrite ( "Config.ini", "Pixelkiller", "hotkey_input_pk_save", $hotkey_input_pk )
	ElseIf $hotkey_input_pk = "F2" Then
		$hotkey_pk = "{F2}"
		IniWrite ( "Config.ini", "Pixelkiller", "hotkey_pk_save", $hotkey_pk )
		$hotkey_input_pk = "F2"
		IniWrite ( "Config.ini", "Pixelkiller", "hotkey_input_pk_save", $hotkey_input_pk )
	ElseIf $hotkey_input_pk = "F3" Then
		$hotkey_pk = "{F3}"
		IniWrite ( "Config.ini", "Pixelkiller", "hotkey_pk_save", $hotkey_pk )
		$hotkey_input_pk = "F3"
		IniWrite ( "Config.ini", "Pixelkiller", "hotkey_input_pk_save", $hotkey_input_pk )
	ElseIf $hotkey_input_pk = "F4" Then
		$hotkey_pk = "{F4}"
		IniWrite ( "Config.ini", "Pixelkiller", "hotkey_pk_save", $hotkey_pk )
		$hotkey_input_pk = "F4"
		IniWrite ( "Config.ini", "Pixelkiller", "hotkey_input_pk_save", $hotkey_input_pk )
	ElseIf $hotkey_input_pk = "F5" Then
		$hotkey_pk = "{F5}"
		IniWrite ( "Config.ini", "Pixelkiller", "hotkey_pk_save", $hotkey_pk )
		$hotkey_input_pk = "F5"
		IniWrite ( "Config.ini", "Pixelkiller", "hotkey_input_pk_save", $hotkey_input_pk )
	ElseIf $hotkey_input_pk = "F6" Then
		$hotkey_pk = "{F6}"
		IniWrite ( "Config.ini", "Pixelkiller", "hotkey_pk_save", $hotkey_pk )
		$hotkey_input_pk = "F6"
		IniWrite ( "Config.ini", "Pixelkiller", "hotkey_input_pk_save", $hotkey_input_pk )
	ElseIf $hotkey_input_pk = "F7" Then
		$hotkey_pk = "{F7}"
		IniWrite ( "Config.ini", "Pixelkiller", "hotkey_pk_save", $hotkey_pk )
		$hotkey_input_pk = "F7"
		IniWrite ( "Config.ini", "Pixelkiller", "hotkey_input_pk_save", $hotkey_input_pk )
	ElseIf $hotkey_input_pk = "F8" Then
		$hotkey_pk = "{F8}"
		IniWrite ( "Config.ini", "Pixelkiller", "hotkey_pk_save", $hotkey_pk )
		$hotkey_input_pk = "F8"
		IniWrite ( "Config.ini", "Pixelkiller", "hotkey_input_pk_save", $hotkey_input_pk )
	Else
		$hotkey_pk = IniRead ( "Config.ini", "Pixelkiller", "hotkey_pk_save", "{F1}" )
		$hotkey_input_pk = IniRead ( "Config.ini", "Pixelkiller", "hotkey_input_pk_save", "F1" )
		MsgBox(0x30, "Attention", "The Hotkey was NOT changed!" & @CRLF & "Please check again the key introduced" & @CRLF & "" & @CRLF & "PS: Only F1, F2, F3 ... F8 are allowed.")
	EndIf
EndFunc

;********** Functions: AFK Attack Normal **********
Func pk_normal ()
	If $hex_input = "" Then
		MsgBox(0x30, "Attention", "First you need to input the code" & @CRLF & @CRLF &  "Ctrl+L - To see the codes already available." & @CRLF & "Ctrl+H - To input the code." & @CRLF & "Ctrl+G - Create your code.")
	ElseIf $hex_input = "?" Then
		MsgBox(0x30, "Attention", "First you need to input the code" & @CRLF & @CRLF &  "Ctrl+L - To see the codes already available." & @CRLF & "Ctrl+H - To input the code." & @CRLF & "Ctrl+G - Create your code.")
	Else
		While (1)
			$a = PixelSearch( 0, 0, $dwidth, $dheight, $hex_input, 2)
				If IsArray($a) Then
					MouseClick ("left", $a[0], $a[1], 3, 5)
				EndIf
				If WinActive("Tales of Pirates") Then
				Else
					WinActivate("Tales of Pirates")
				EndIf
					If $gm_finder = "Activated" Then
						Do
							$gm_finder_cont = $gm_finder_cont + 1
								$m2a = PixelSearch( 0, 0, $dwidth, $dheight, 0xEDD745, 1)
									If IsArray($m2a) Then
										$m2b = PixelSearch( 0, 0, $dwidth, $dheight, 0xF1D942, 1)
											If IsArray($m2b) Then
												$m2c = PixelSearch( 0, 0, $dwidth, $dheight, 0xA57321, 1)
													If IsArray($m2c) Then
														$m2d = PixelSearch( 0, 0, $dwidth, $dheight, 0x825917, 1)
															If IsArray($m2d) Then
																$m2e = PixelSearch( 0, 0, $dwidth, $dheight, 0xA27120, 1)
																	If IsArray($m2e) Then
																		Sleep(200)
																		Send("{esc}")
																		Sleep(1000)
																		MouseClick ("left", $Switch_Confirm_1, $Switch_Confirm_2, 15, 10)
																		Sleep($gm_finder_delay_real)
																			If $char = 1 Then
																				MouseClick ("left", $gm_char1, $gm_char_h, 10, 10)
																			ElseIf $char = 2 Then
																				MouseClick ("left", $gm_char2, $gm_char_h, 10, 10)
																			ElseIf $char = 3 then
																				MouseClick ("left", $gm_char3, $gm_char_h, 10, 10)
																			EndIf
																				Sleep(6000)
																				$gm_finder_num = $gm_finder_num + 1
																	EndIf
															EndIf
													EndIf
											EndIf
									EndIf
						Until $gm_finder_cont = $gm_perf_pk
							  $gm_finder_cont = 0
					EndIf
					If $auto_hp = "Activated" Then
						$pgc = PixelGetColor( $hp1 , $hp2 )
						$rlypgc = Hex($pgc, 6)
							If $rlypgc = "538BA7" Then
								Do
									$cake_count = $cake_count + 1
									Send($hotkey_cake)
									Sleep(1000)
								Until $cake_count = $eat_cake
								$cake_count = 0
							EndIf
					EndIf
		WEnd
	EndIf
EndFunc

;********** Functions: AFK Attack Magic **********
Func pk_magic ()
	If $hex_input = "" Then
		MsgBox(0x30, "Attention", "First you need to input the code" & @CRLF & @CRLF &  "Ctrl+L - To see the codes already available." & @CRLF & "Ctrl+H - To input the code." & @CRLF & "Ctrl+G - Create your code.")
	ElseIf $hex_input = "?" Then
		MsgBox(0x30, "Attention", "First you need to input the code" & @CRLF & @CRLF &  "Ctrl+L - To see the codes already available." & @CRLF & "Ctrl+H - To input the code." & @CRLF & "Ctrl+G - Create your code.")
	Else
		While (1)
			$a = PixelSearch( 0, 0, $dwidth, $dheight, $hex_input, 2)
				If IsArray($a) Then
					Send($hotkey_pk)
					MouseClick ("left", $a[0], $a[1], 1, 5)
				EndIf
				If WinActive("Tales of Pirates") Then
				Else
					WinActivate("Tales of Pirates")
				EndIf
					If $gm_finder = "Activated" Then
						Do
							$gm_finder_cont = $gm_finder_cont + 1
								$m2a = PixelSearch( 0, 0, $dwidth, $dheight, 0xEDD745, 1)
									If IsArray($m2a) Then
										$m2b = PixelSearch( 0, 0, $dwidth, $dheight, 0xF1D942, 1)
											If IsArray($m2b) Then
												$m2c = PixelSearch( 0, 0, $dwidth, $dheight, 0xA57321, 1)
													If IsArray($m2c) Then
														$m2d = PixelSearch( 0, 0, $dwidth, $dheight, 0x825917, 1)
															If IsArray($m2d) Then
																$m2e = PixelSearch( 0, 0, $dwidth, $dheight, 0xA27120, 1)
																	If IsArray($m2e) Then
																		Sleep(200)
																		Send("{esc}")
																		Sleep(1000)
																		MouseClick ("left", $Switch_Confirm_1, $Switch_Confirm_2, 15, 10)
																		Sleep($gm_finder_delay_real)
																			If $char = 1 Then
																				MouseClick ("left", $gm_char1, $gm_char_h, 10, 10)
																			ElseIf $char = 2 Then
																				MouseClick ("left", $gm_char2, $gm_char_h, 10, 10)
																			ElseIf $char = 3 then
																				MouseClick ("left", $gm_char3, $gm_char_h, 10, 10)
																			EndIf
																				Sleep(6000)
																				$gm_finder_num = $gm_finder_num + 1
																	EndIf
															EndIf
													EndIf
											EndIf
									EndIf
						Until $gm_finder_cont = $gm_perf_pk
							  $gm_finder_cont = 0
					EndIf
					If $auto_hp = "Activated" Then
						$pgc = PixelGetColor( $hp1 , $hp2 )
						$rlypgc = Hex($pgc, 6)
							If $rlypgc = "538BA7" Then
								Do
									$cake_count = $cake_count + 1
									Send($hotkey_cake)
									Sleep(1000)
								Until $cake_count = $eat_cake
								$cake_count = 0
							EndIf
					EndIf
		WEnd
	EndIf
EndFunc

;*********************************************************************************************************************************
;********** Settings **********
;*********************************************************************************************************************************
Func menu_settings ()
	TrayTip("Settings Menu", "Alt+Q = GM Finder Menu" & @CRLF & "Alt+W = Auto HP Menu" & @CRLF & "Alt+E = Window Menu" & @CRLF & @CRLF & "Alt+A = Back", 8 , 1 )

	HotKeySet ("!q",  "gm_finder_menu")
	HotKeySet ("!w",  "auto_hp_menu")
	HotKeySet ("!e",  "window_menu")

	HotKeySet ("!a",  "menu")
EndFunc

;*********************************************************************************************************************************

;********** GM Finder Menu **********
Func gm_finder_menu ()
	If $fullscreen = "?" Then
		Switch MsgBox($mb_yesno, "Game Window", "Do you play with Full Screen ?" & @CRLF & @CRLF & "Info: If the reply is wrong, the GM Finder / Auto HP will Not work")
			Case $idyes
				$fullscreen = "Yes"
				IniWrite ( "Config.ini", "Window", "fullscreen", $fullscreen )
				MsgBox(0x30, "Attention", "Full Screen is good :)" & @CRLF & @CRLF & "The bot will close automatically to the changes take effect." & @CRLF & "Please restart it.")
				Exit
			Case $idno
				$fullscreen = "No"
				IniWrite ( "Config.ini", "Window", "fullscreen", $fullscreen )
				MsgBox(0x30, "Attention", "Never move the window from the center!" & @CRLF & "Or GM Finder/Auto HP will Not work!" & @CRLF & @CRLF & "The bot will close automatically to the changes take effect." & @CRLF & "Please restart it.")
				Exit
		EndSwitch
	EndIf

	TrayTip("GM Finder Menu", "Info:" & @CRLF & "GM Finder is: " & $gm_finder & @CRLF & "Character nº - " & $char & @CRLF & "DC Delay: "& $gm_finder_delay & "min" & @CRLF & @CRLF &"Edit GM Finder = Ctrl+Shift+G" & @CRLF & "Test GM Finder = Ctrl+T" & @CRLF & "GM Finder Ajust (Advanced) = Alt+P" & @CRLF & @CRLF & "Alt+V = Back", 8 , 1 )

	HotKeySet ("^+g",  "gm_finder_ask")
	HotKeySet ("^t",  "test_gm")
	HotKeySet ("!p",  "gm_perf_menu")
EndFunc

;********** GM Finder **********
Func gm_finder_ask ()
;If the resolution is not supported, does not enter
	If $non_sup_res = "Yes" And $other_res = "No" Then
		MsgBox(0x30, "Attention", "Your current resolution is not supported." & @CRLF & @CRLF & "Go to Settings -> Window Menu, and choose other resolution supported by GM Finder" & @CRLF & "before activate GM Finder.")
	Else
		Switch MsgBox($mb_yesno, "GM Finder", "Would you like to activate GM Finder?" & @CRLF & @CRLF & "Some notes you need:" & @CRLF & "This option will take effect in every AFK mode of this script!" & @CRLF & "Note this will take more 2~5sec." & @CRLF & "This option need ALL highest settings in game" & @CRLF & "Recommended: Full Screen!" & @CRLF & @CRLF & "When GM finds you, the script will make Switch Character, and back to AFK." & @CRLF & "So you need to chose your character position." & @CRLF & "Delay time, is the time you will be disconnected when GM finds you."& @CRLF & @CRLF & " PS: Delete your Music dir, to avoid game crash.")
			Case $idyes
				$char = InputBox("Character Number", "Input your character number (1, 2, 3)", $char, "", 280, 120, Default, Default, 10)
					If $char = "1" then
						IniWrite ( "Config.ini", "GM_Finder", "char_save", $char )
						$gm_finder = "Activated"
						IniWrite ( "Config.ini", "GM_Finder", "gm_finder_save", $gm_finder )
					ElseIf $char = "2" then
						IniWrite ( "Config.ini", "GM_Finder", "char_save", $char )
						$gm_finder = "Activated"
						IniWrite ( "Config.ini", "GM_Finder", "gm_finder_save", $gm_finder )
					ElseIf $char = "3" then
						IniWrite ( "Config.ini", "GM_Finder", "char_save", $char )
						$gm_finder = "Activated"
						IniWrite ( "Config.ini", "GM_Finder", "gm_finder_save", $gm_finder )
					Else
						MsgBox(0x30, "Attention", "You only can have 3 chars -.-'")
						$gm_finder = IniRead ( "Config.ini", "GM_Finder", "gm_finder_save", "Disabled" )
						$char = IniRead ( "Config.ini", "GM_Finder", "char_save", "?" )
					EndIf
					If $char = "1" Or $char = "2" Or $char = "3" Then
						$gm_finder_delay = InputBox("Delay Time", "Disconnect delay when GM finds you. (in minutes)", $gm_finder_delay, "", 280, 120, Default, Default, 10)
						If $gm_finder_delay <= 0 Then
							MsgBox(0x30, "Attention", "Please give more delay!")
							$gm_finder_delay = IniRead ( "Config.ini", "GM_Finder", "gm_finder_delay_save", "0" )
							$gm_finder_delay_real = IniRead ( "Config.ini", "GM_Finder", "gm_finder_delay_real_save", "0" )
						ElseIf $gm_finder_delay > 100 Then
							MsgBox(0x30, "Attention", "Max delay is 100!")
							$gm_finder_delay = IniRead ( "Config.ini", "GM_Finder", "gm_finder_delay_save", "0" )
							$gm_finder_delay_real = IniRead ( "Config.ini", "GM_Finder", "gm_finder_delay_real_save", "0" )
						Else
							IniWrite ( "Config.ini", "GM_Finder", "gm_finder_delay_save", $gm_finder_delay )
							$gm_finder_delay_real = $gm_finder_delay * 60000
							IniWrite ( "Config.ini", "GM_Finder", "gm_finder_delay_real_save", $gm_finder_delay_real )
						EndIf
					EndIf
					MsgBox(0x40, "GM Finder", "GM Finder is " & $gm_finder & @CRLF & "Character nº "& $char & @CRLF & "Delay is: " & $gm_finder_delay & " minutes")
			Case $idno
				$gm_finder = "Disabled"
				IniWrite ( "Config.ini", "GM_Finder", "gm_finder_save", $gm_finder )
				$char = "?"
				IniWrite ( "Config.ini", "GM_Finder", "char_save", $char )
				$gm_finder_delay = "0"
				IniWrite ( "Config.ini", "GM_Finder", "gm_finder_delay_save", $gm_finder_delay )
				$gm_finder_delay_real = "0"
				IniWrite ( "Config.ini", "GM_Finder", "gm_finder_delay_real_save", $gm_finder_delay_real )
				MsgBox(0x40, "GM Finder", "GM Finder is " & $gm_finder & @CRLF & "Character nº "& $char & @CRLF & "Delay is: " & $gm_finder_delay & " minutes")
		EndSwitch
	EndIf
EndFunc

Func test_gm ()
	If WinExists ("Tales of Pirates") Then
	MsgBox(0x30, "Attention", "DC delay here is only 2s" & @CRLF & "This is just to test the 'clicks'")
		WinActivate("Tales of Pirates")
		Sleep (1000)
			If $gm_finder = "Activated" Then
				Send("{esc}")
				Sleep(1000)
				MouseClick ("left", $Switch_Confirm_1, $Switch_Confirm_2, 15, 10)
				Sleep(2500)
					If $char = 1 Then
						MouseClick ("left", $gm_char1, $gm_char_h, 10, 10)
					ElseIf $char = 2 Then
						MouseClick ("left", $gm_char2, $gm_char_h, 10, 10)
					ElseIf $char = 3 then
						MouseClick ("left", $gm_char3, $gm_char_h, 10, 10)
					EndIf
			Else
					MsgBox(0x10,"Error", "Active and configure GM Finder first!")
			EndIf
	Else
		MsgBox(0x10,"Error","Please open the game and login first.")
	EndIf
EndFunc

Func gm_perf_menu ()
	MsgBox(0x30,"Attention", "This option allow you to adjust the performance of GM Finder" & @CRLF & @CRLF & "If you increase the number, GM Finder will be more effective." & @CRLF & "Otherwise will turn your PC more slow." & @CRLF & "So, be aware of the machine you are using. Ajust it acording with yours." & @CRLF & @CRLF &  "Why PixelKiller is different?" & @CRLF & "Because the GM verification is more often than other AFK modes." & @CRLF & "So the number required is lower." )
	TrayTip("GM Finder Ajuster", "Info:" & @CRLF & "Tank/SharpShooter: " & $gm_perf_t_ss & @CRLF & "PixelKiller: " & $gm_perf_pk & @CRLF & @CRLF & "Edit Tank/SharpShooter = Alt+up/down" & @CRLF & "Edit PixelKiller = Alt+pgup/pgdown"& @CRLF & @CRLF & "Alt+Q = Back", 8 , 1 )

	HotKeySet ("!{up}", "gm_perf_up_t_ss")
	HotKeySet ("!{down}", "gm_perf_down_t_ss")

	HotKeySet ("!{pgup}", "gm_perf_up_pk")
	HotKeySet ("!{pgdn}", "gm_perf_down_pk")
EndFunc

Func gm_perf_menu_2 ()
	TrayTip("GM Finder Ajuster", "Info:" & @CRLF & "Tank/SharpShooter: " & $gm_perf_t_ss & @CRLF & "PixelKiller: " & $gm_perf_pk & @CRLF & @CRLF & "Edit Tank/SharpShooter = Alt+up/down" & @CRLF & "Edit PixelKiller = Alt+pgup/pgdown" & @CRLF & @CRLF & "Alt+Q = Back", 8 , 1 )

	HotKeySet ("!{up}", "gm_perf_up_t_ss")
	HotKeySet ("!{down}", "gm_perf_down_t_ss")

	HotKeySet ("!{pgup}", "gm_perf_up_pk")
	HotKeySet ("!{pgdn}", "gm_perf_down_pk")
EndFunc

Func gm_perf_up_t_ss ()
	HotKeySet ("!p", "gm_perf_menu_2")
	If $gm_perf_t_ss = 700 Then
		TrayTip ("GM Finder Performance" , "Tank/SharpShooter: " & $gm_perf_t_ss & " max!" & @CRLF & @CRLF & "Alt+P =  Back",10,1)
	Else
		$gm_perf_t_ss = $gm_perf_t_ss + 50
		IniWrite ( "Config.ini", "GM_Finder", "gm_perf_t_ss_save", $gm_perf_t_ss )
		TrayTip ("GM Finder Performance" , "Tank/SharpShooter: " & $gm_perf_t_ss & @CRLF & @CRLF & "Alt+P =  Back",10,1)
	EndIf
EndFunc

Func gm_perf_down_t_ss ()
	HotKeySet ("!p", "gm_perf_menu_2")
	If $gm_perf_t_ss = 150 Then
		TrayTip ("GM Finder Performance" , "Tank/SharpShooter: " & $gm_perf_t_ss & " min!" & @CRLF & @CRLF & "Alt+P =  Back",10,1)
	Else
		$gm_perf_t_ss = $gm_perf_t_ss - 50
		IniWrite ( "Config.ini", "GM_Finder", "gm_perf_t_ss_save", $gm_perf_t_ss )
		TrayTip ("GM Finder Performance" , "Tank/SharpShooter: " & $gm_perf_t_ss & @CRLF & @CRLF & "Alt+P =  Back",10,1)
	EndIf
EndFunc

Func gm_perf_up_pk ()
	HotKeySet ("!p", "gm_perf_menu_2")
	If $gm_perf_pk = 500 Then
		TrayTip ("GM Finder Performance" , "PixelKiller: " & $gm_perf_pk & " max!" & @CRLF & @CRLF & "Alt+P =  Back",10,1)
	Else
		$gm_perf_pk = $gm_perf_pk + 50
		IniWrite ( "Config.ini", "GM_Finder", "gm_perf_pk_save", $gm_perf_pk )
		TrayTip ("GM Finder Performance" , "PixelKiller: " & $gm_perf_pk & @CRLF & @CRLF & "Alt+P =  Back",10,1)
	EndIf
EndFunc

Func gm_perf_down_pk ()
	HotKeySet ("!p", "gm_perf_menu_2")
	If $gm_perf_pk = 50 Then
		TrayTip ("GM Finder Performance" , "PixelKiller: " & $gm_perf_pk & " min!" & @CRLF & @CRLF & "Alt+P =  Back",10,1)
	Else
		$gm_perf_pk = $gm_perf_pk - 50
		IniWrite ( "Config.ini", "GM_Finder", "gm_perf_pk_save", $gm_perf_pk )
		TrayTip ("GM Finder Performance" , "PixelKiller: " & $gm_perf_pk & @CRLF & @CRLF & "Alt+P =  Back",10,1)
	EndIf
EndFunc

;*********************************************************************************************************************************

Func auto_hp_menu ()
	If $fullscreen = "?" Then
		Switch MsgBox($mb_yesno, "Game Window", "Do you play with Full Screen ?" & @CRLF & @CRLF & "Info: If the reply is wrong, the GM Finder / Auto HP will Not work")
			Case $idyes
				$fullscreen = "Yes"
				IniWrite ( "Config.ini", "Window", "fullscreen", $fullscreen )
				MsgBox(0x30, "Attention", "Full Screen is good :)" & @CRLF & @CRLF & "The bot will close automatically to the changes take effect." & @CRLF & "Please restart it.")
				Exit
			Case $idno
				$fullscreen = "No"
				IniWrite ( "Config.ini", "Window", "fullscreen", $fullscreen )
				MsgBox(0x30, "Attention", "Never move the window from the center!" & @CRLF & "Or GM Finder/Auto HP will Not work!" & @CRLF & @CRLF & "The bot will close automatically to the changes take effect." & @CRLF & "Please restart it.")
				Exit
		EndSwitch
	EndIf

	TrayTip("Auto HP Menu", "Info:" & @CRLF & "Auto HP is: " & $auto_hp & @CRLF & "Number of Cakes: " & $eat_cake & @CRLF & "HotKey to use Cake: " & $hotkey_input_cake & @CRLF & @CRLF &"Edit Auto HP = Ctrl+Shift+P" & @CRLF & "+/- Cakes = Alt+Up/Down" & @CRLF & "Edit HotKey = Ctrl+K" & @CRLF & @CRLF & "Alt+V = Back", 8 , 1 )

	HotKeySet ("^+p",  "auto_hp_ask")
	HotKeySet ("!{up}", "num_cake_up")
	HotKeySet ("!{down}", "num_cake_down")

	HotKeySet ("^k", "edit_key_cake")
EndFunc

;********** AutoHP **********
Func auto_hp_ask ()
	If $non_hp_sup = "0" Then
		Switch MsgBox($mb_yesno, "Auto HP", "Would you like to activate Auto HP ?")
			Case $idyes
				$auto_hp = "Activated"
				IniWrite ( "Config.ini", "Auto_HP", "auto_hp", $auto_hp )
				$eat_cake = "2"
				IniWrite ( "Config.ini", "Auto_HP", "eat_cake_save", $eat_cake )
				$hotkey_cake = "{F1}"
				IniWrite ( "Config.ini", "Auto_HP", "hotkey_cake_save", $hotkey_cake )
				$hotkey_input_cake = "F1"
				IniWrite ( "Config.ini", "Auto_HP", "hotkey_input_cake_save", $hotkey_input_cake )
				MsgBox(0x40, "Auto HP", "Auto HP is Activated!" & @CRLF & "The Bot will eat " & $eat_cake & " 'cake' when your HP reach 50%" & @CRLF & "This will take effect in every AFK mode of this script!")
			Case $idno
				$auto_hp = "Disabled"
				IniWrite ( "Config.ini", "Auto_HP", "auto_hp", $auto_hp )
				$eat_cake = "0"
				IniWrite ( "Config.ini", "Auto_HP", "eat_cake_save", $eat_cake )
				$hotkey_cake = "?"
				IniWrite ( "Config.ini", "Auto_HP", "hotkey_cake_save", $hotkey_cake )
				$hotkey_input_cake = "?"
				IniWrite ( "Config.ini", "Auto_HP", "hotkey_input_cake_save", $hotkey_input_cake )
				MsgBox(0x40, "Auto HP", "Auto HP is Disabled!")
		EndSwitch
	Else
		MsgBox(0x30, "Attention", "Auto HP DONT support your current resolution without FullScreen!")
	EndIf
EndFunc

Func num_cake_up ()
	If	$auto_hp = "Activated" Then
		$eat_cake = $eat_cake + 1
		IniWrite ( "Config.ini", "Auto_HP", "eat_cake_save", $eat_cake )
		TrayTip ("Edit nº of Cakes" , "When HP reach 50% eat: " & $eat_cake & "'cakes'" & @CRLF & @CRLF & "Alt+W =  Back",10,1)
	Else
		MsgBox(0x30, "Auto HP", "Activate Auto HP first!")
	EndIf
EndFunc

Func num_cake_down ()
	If	$auto_hp = "Activated" Then
		If $eat_cake = 1 Then

		Else
			$eat_cake = $eat_cake - 1
			IniWrite ( "Config.ini", "Auto_HP", "eat_cake_save", $eat_cake )
			TrayTip ("Edit nº of Cakes" , "When HP reach 50% eat: " & $eat_cake & "'cakes'" & @CRLF & @CRLF & "Alt+W =  Back",10,1)
		EndIf
	Else
		MsgBox(0x30, "Auto HP", "Activate Auto HP first!")
	EndIf
EndFunc

	;********** Changes Hotkey **********
Func edit_key_cake ()
	If	$auto_hp = "Activated" Then
		$hotkey_input_cake = InputBox("Input Skill", "Input your hotkey to use Cake.", $hotkey_input_cake, "", 280, 120, Default, Default, 10)
		If $hotkey_input_cake = "F1" Then
			$hotkey_cake = "{F1}"
			IniWrite ( "Config.ini", "Auto_HP", "hotkey_pk_save", $hotkey_cake )
			$hotkey_input_cake = "F1"
			IniWrite ( "Config.ini", "Auto_HP", "hotkey_input_cake_save", $hotkey_input_cake )
		ElseIf $hotkey_input_cake = "F2" Then
			$hotkey_cake = "{F2}"
			IniWrite ( "Config.ini", "Auto_HP", "hotkey_cake_save", $hotkey_cake )
			$hotkey_input_cake = "F2"
			IniWrite ( "Config.ini", "Auto_HP", "hotkey_input_cake_save", $hotkey_input_cake )
		ElseIf $hotkey_input_cake = "F3" Then
			$hotkey_cake = "{F3}"
			IniWrite ( "Config.ini", "Auto_HP", "hotkey_cake_save", $hotkey_cake )
			$hotkey_input_cake = "F3"
			IniWrite ( "Config.ini", "Auto_HP", "hotkey_input_cake_save", $hotkey_input_cake )
		ElseIf $hotkey_input_cake = "F4" Then
			$hotkey_cake = "{F4}"
			IniWrite ( "Config.ini", "Auto_HP", "hotkey_cake_save", $hotkey_cake )
			$hotkey_input_cake = "F4"
			IniWrite ( "Config.ini", "Auto_HP", "hotkey_input_cake_save", $hotkey_input_cake )
		ElseIf $hotkey_input_cake = "F5" Then
			$hotkey_cake = "{F5}"
			IniWrite ( "Config.ini", "Auto_HP", "hotkey_cake_save", $hotkey_cake )
			$hotkey_input_cake = "F5"
			IniWrite ( "Config.ini", "Auto_HP", "hotkey_input_cake_save", $hotkey_input_cake )
		ElseIf $hotkey_input_cake = "F6" Then
			$hotkey_cake = "{F6}"
			IniWrite ( "Config.ini", "Auto_HP", "hotkey_cake_save", $hotkey_cake )
			$hotkey_input_cake = "F6"
			IniWrite ( "Config.ini", "Auto_HP", "hotkey_input_cake_save", $hotkey_input_cake )
		ElseIf $hotkey_input_cake = "F7" Then
			$hotkey_cake = "{F7}"
			IniWrite ( "Config.ini", "Auto_HP", "hotkey_cake_save", $hotkey_cake )
			$hotkey_input_cake = "F7"
			IniWrite ( "Config.ini", "Auto_HP", "hotkey_input_cake_save", $hotkey_input_cake )
		ElseIf $hotkey_input_cake = "F8" Then
			$hotkey_cake = "{F8}"
			IniWrite ( "Config.ini", "Auto_HP", "hotkey_cake_save", $hotkey_cake )
			$hotkey_input_cake = "F8"
			IniWrite ( "Config.ini", "Auto_HP", "hotkey_input_cake_save", $hotkey_input_cake )
		Else
			$hotkey_cake = IniRead ( "Config.ini", "Auto_HP", "hotkey_cake_save", "{F1}" )
			$hotkey_input_cake = IniRead ( "Config.ini", "Auto_HP", "hotkey_input_cake_save", "F1" )
			MsgBox(0x30, "Attention", "The Hotkey was NOT changed!" & @CRLF & "Please check again the key introduced" & @CRLF & "" & @CRLF & "PS: Only F1, F2, F3 ... F8 are allowed.")
		EndIf
	Else
		MsgBox(0x30, "Auto HP", "Activate Auto HP first!")
	EndIf
EndFunc

;*********************************************************************************************************************************

Func window_menu ()
	If $fullscreen = "?" Then
		Switch MsgBox($mb_yesno, "Game Window", "Do you play with Full Screen ?" & @CRLF & @CRLF & "Info: If the reply is wrong, the GM Finder / Auto HP will Not work")
			Case $idyes
				$fullscreen = "Yes"
				IniWrite ( "Config.ini", "Window", "fullscreen", $fullscreen )
				MsgBox(0x30, "Attention", "Full Screen is good :)" & @CRLF & @CRLF & "The bot will close automatically to the changes take effect." & @CRLF & "Please restart it.")
				Exit
			Case $idno
				$fullscreen = "No"
				IniWrite ( "Config.ini", "Window", "fullscreen", $fullscreen )
				MsgBox(0x30, "Attention", "Never move the window from the center!" & @CRLF & "Or GM Finder/Auto HP will Not work!" & @CRLF & @CRLF & "The bot will close automatically to the changes take effect." & @CRLF & "Please restart it.")
				Exit
		EndSwitch
	EndIf

	TrayTip("Window Menu", "Info:" & @CRLF & "Windows Resolution: " & $dwidth & "x" & $dheight & @CRLF &"FullScreen Game : " & $fullscreen & @CRLF & @CRLF & "Non-Support Resolution: " & $non_sup_res & @CRLF & "Other Resolution: " & $other_res & " - " & $other_type & @CRLF & @CRLF & "FullScreen Edit = Ctrl+Shift+T" & @CRLF & "Non-Suported Resolution = Ctrl+Shift+Q" & @CRLF & @CRLF & "Alt+V = Back", 8 , 1 )

	HotKeySet ("^+t",  "get_game_res")
	HotKeySet ("^+q", "other_res")
EndFunc

Func get_game_res ()
   ;Other resolution, GM Finder and AutoHP is deleted to force reboot.
   ;GM Finder will only be reactivated if other resolution is chosen.
   ;The AutoHP, was already defined at starup.
	Switch MsgBox($mb_yesno, "Game Window", "Do you play with Full Screen ?" & @CRLF & @CRLF & "Info: The GM Finder / Auto HP settings will be reseted.")
		Case $idyes
			$fullscreen = "Yes"
			IniWrite ( "Config.ini", "Window", "fullscreen", $fullscreen )
			$800_res_full = "No"
			IniWrite ( "Config.ini", "Window", "800_res_full", $800_res_full )
			$800_res_non_full = "No"
			IniWrite ( "Config.ini", "Window", "800_res_non_full", $800_res_non_full )
			$1024_res_full = "No"
			IniWrite ( "Config.ini", "Window", "1024_res_full", $1024_res_full )
			$1024_res_non_full = "No"
			IniWrite ( "Config.ini", "Window", "1024_res_non_full", $1024_res_non_full )
			$1280_res_full = "No"
			IniWrite ( "Config.ini", "Window", "1280_res_full", $1280_res_full )
			$1280_res_non_full = "No"
			IniWrite ( "Config.ini", "Window", "1280_res_non_full", $1280_res_non_full )
			$other_res = "No"
			IniWrite ( "Config.ini", "Window", "other_res", $other_res )
			$other_type = "?"
			IniWrite ( "Config.ini", "Window", "other_type", $other_type )
			$auto_hp = "Disabled"
			IniWrite ( "Config.ini", "Auto_HP", "auto_hp", $auto_hp )
			$eat_cake = "0"
			IniWrite ( "Config.ini", "Auto_HP", "eat_cake_save", $eat_cake )
			$hotkey_cake = "?"
			IniWrite ( "Config.ini", "Auto_HP", "hotkey_cake_save", $hotkey_cake )
			$hotkey_input_cake = "?"
			IniWrite ( "Config.ini", "Auto_HP", "hotkey_input_cake_save", $hotkey_input_cake )
			$gm_finder = "Disabled"
			IniWrite ( "Config.ini", "GM_Finder", "gm_finder_save", $gm_finder )
			$char = "?"
			IniWrite ( "Config.ini", "GM_Finder", "char_save", $char )
			$gm_finder_delay = "0"
			IniWrite ( "Config.ini", "GM_Finder", "gm_finder_delay_save", $gm_finder_delay )
			$gm_finder_delay_real = "0"
			IniWrite ( "Config.ini", "GM_Finder", "gm_finder_delay_real_save", $gm_finder_delay_real )
			MsgBox(0x30, "Attention", "Full Screen is good :)" & @CRLF & @CRLF & "The bot will close automatically to the changes take effect." & @CRLF & "Please restart it.")
			Exit
		Case $idno
			$fullscreen = "No"
			IniWrite ( "Config.ini", "Window", "fullscreen", $fullscreen )
			$800_res_full = "No"
			IniWrite ( "Config.ini", "Window", "800_res_full", $800_res_full )
			$800_res_non_full = "No"
			IniWrite ( "Config.ini", "Window", "800_res_non_full", $800_res_non_full )
			$1024_res_full = "No"
			IniWrite ( "Config.ini", "Window", "1024_res_full", $1024_res_full )
			$1024_res_non_full = "No"
			IniWrite ( "Config.ini", "Window", "1024_res_non_full", $1024_res_non_full )
			$1280_res_full = "No"
			IniWrite ( "Config.ini", "Window", "1280_res_full", $1280_res_full )
			$1280_res_non_full = "No"
			IniWrite ( "Config.ini", "Window", "1280_res_non_full", $1280_res_non_full )
			$other_res = "No"
			IniWrite ( "Config.ini", "Window", "other_res", $other_res )
			$other_type = "?"
			IniWrite ( "Config.ini", "Window", "other_type", $other_type )
			$auto_hp = "Disabled"
			IniWrite ( "Config.ini", "Auto_HP", "auto_hp", $auto_hp )
			$eat_cake = "0"
			IniWrite ( "Config.ini", "Auto_HP", "eat_cake_save", $eat_cake )
			$hotkey_cake = "?"
			IniWrite ( "Config.ini", "Auto_HP", "hotkey_cake_save", $hotkey_cake )
			$hotkey_input_cake = "?"
			IniWrite ( "Config.ini", "Auto_HP", "hotkey_input_cake_save", $hotkey_input_cake )
			$gm_finder = "Disabled"
			IniWrite ( "Config.ini", "GM_Finder", "gm_finder_save", $gm_finder )
			$char = "?"
			IniWrite ( "Config.ini", "GM_Finder", "char_save", $char )
			$gm_finder_delay = "0"
			IniWrite ( "Config.ini", "GM_Finder", "gm_finder_delay_save", $gm_finder_delay )
			$gm_finder_delay_real = "0"
			IniWrite ( "Config.ini", "GM_Finder", "gm_finder_delay_real_save", $gm_finder_delay_real )
			MsgBox(0x30, "Attention", "Never move the window from the center!" & @CRLF & "Or GM Finder/Auto HP will Not work!" & @CRLF & @CRLF & "The bot will close automatically to the changes take effect." & @CRLF & "Please restart it.")
			Exit
	EndSwitch
EndFunc

Func other_res ()
	If $non_sup_res = "Yes" Then
			GUICreate("Resolution", 210, 90)
			$Label = GUICtrlCreateLabel("Your resolution is Not supported." & @CRLF & "Try other supported resolution" & @CRLF & "by GM Finder and maybe work.", 10, 10)
			$id800  = GUICtrlCreateButton("800x600", 10, 60, 60, 20)
			$id1024 = GUICtrlCreateButton("1024x768", 75, 60, 60, 20)
			$id1280 = GUICtrlCreateButton("1280x1024", 140, 60, 60, 20)

			$dheight2 = @DesktopHeight
			IniWrite ( "Config.ini", "Window", "dheight2", $dheight2 )

			GUISetState()

			Do
				$msg = GUIGetMsg()
				Select
					Case $msg= $id800
					$other_res = "Yes"
					IniWrite ( "Config.ini", "Window", "other_res", $other_res )
					$other_type = "800x600"
					IniWrite ( "Config.ini", "Window", "other_type", $other_type )
						If $fullscreen = "Yes" Then
							MsgBox(0x40, "Resolution", "GM Finder will work with 800x600(Different of your resolution) with FullScreen " & @CRLF & @CRLF & "Make a test in GM Finder, before go AFK!")
							$800_res_full = "Yes"
							IniWrite ( "Config.ini", "Window", "800_res_full", $800_res_full )
							$800_res_non_full = "No"
							IniWrite ( "Config.ini", "Window", "800_res_non_full", $800_res_non_full )
							$1024_res_full = "No"
							IniWrite ( "Config.ini", "Window", "1024_res_full", $1024_res_full )
							$1024_res_non_full = "No"
							IniWrite ( "Config.ini", "Window", "1024_res_non_full", $1024_res_non_full )
							$1280_res_full = "No"
							IniWrite ( "Config.ini", "Window", "1280_res_full", $1280_res_full )
							$1280_res_non_full = "No"
							IniWrite ( "Config.ini", "Window", "1280_res_non_full", $1280_res_non_full )
							Dim $gm_char1 = 205
							Dim $gm_char2 = 430
							Dim $gm_char3 = 610
							Dim $gm_char_h = 385
							ExitLoop
						ElseIf $fullscreen = "No" Then
							MsgBox(0x40, "Resolution", "GM Finder will work with 800x600(Different of your resolution) with Non-FullScreen " & @CRLF & @CRLF & "Make a test in GM Finder, before go AFK!")
							$800_res_full = "No"
							IniWrite ( "Config.ini", "Window", "800_res_full", $800_res_full )
							$800_res_non_full = "Yes"
							IniWrite ( "Config.ini", "Window", "800_res_non_full", $800_res_non_full )
							$1024_res_full = "No"
							IniWrite ( "Config.ini", "Window", "1024_res_full", $1024_res_full )
							$1024_res_non_full = "No"
							IniWrite ( "Config.ini", "Window", "1024_res_non_full", $1024_res_non_full )
							$1280_res_full = "No"
							IniWrite ( "Config.ini", "Window", "1280_res_full", $1280_res_full )
							$1280_res_non_full = "No"
							IniWrite ( "Config.ini", "Window", "1280_res_non_full", $1280_res_non_full )
							Dim $gm_char1 = 205
							Dim $gm_char2 = 430
							Dim $gm_char3 = 610
							Dim $gm_char_h = 385
							ExitLoop
						EndIf
					Case $msg= $id1024
					$other_res = "Yes"
					IniWrite ( "Config.ini", "Window", "other_res", $other_res )
					$other_type = "1024x768"
					IniWrite ( "Config.ini", "Window", "other_type", $other_type )
						If $fullscreen = "Yes" Then
							MsgBox(0x40, "Resolution", "GM Finder will work with 1024x768(Different of your resolution) with FullScreen " & @CRLF & @CRLF & "Make a test in GM Finder, before go AFK!")
							$800_res_full = "No"
							IniWrite ( "Config.ini", "Window", "800_res_full", $800_res_full )
							$800_res_non_full = "No"
							IniWrite ( "Config.ini", "Window", "800_res_non_full", $800_res_non_full )
							$1024_res_full = "Yes"
							IniWrite ( "Config.ini", "Window", "1024_res_full", $1024_res_full )
							$1024_res_non_full = "No"
							IniWrite ( "Config.ini", "Window", "1024_res_non_full", $1024_res_non_full )
							$1280_res_full = "No"
							IniWrite ( "Config.ini", "Window", "1280_res_full", $1280_res_full )
							$1280_res_non_full = "No"
							IniWrite ( "Config.ini", "Window", "1280_res_non_full", $1280_res_non_full )
							Dim $gm_char1 = 260
							Dim $gm_char2 = 550
							Dim $gm_char3 = 775
							Dim $gm_char_h = 480
							ExitLoop
						ElseIf $fullscreen = "No" Then
							MsgBox(0x40, "Resolution", "GM Finder will work with 1024x768(Different of your resolution) with Non-FullScreen " & @CRLF & @CRLF & "Make a test in GM Finder, before go AFK!")
							$800_res_full = "No"
							IniWrite ( "Config.ini", "Window", "800_res_full", $800_res_full )
							$800_res_non_full = "No"
							IniWrite ( "Config.ini", "Window", "800_res_non_full", $800_res_non_full )
							$1024_res_full = "No"
							IniWrite ( "Config.ini", "Window", "1024_res_full", $1024_res_full )
							$1024_res_non_full = "Yes"
							IniWrite ( "Config.ini", "Window", "1024_res_non_full", $1024_res_non_full )
							$1280_res_full = "No"
							IniWrite ( "Config.ini", "Window", "1280_res_full", $1280_res_full )
							$1280_res_non_full = "No"
							IniWrite ( "Config.ini", "Window", "1280_res_non_full", $1280_res_non_full )
							Dim $gm_char1 = 315
							Dim $gm_char2 = 540
							Dim $gm_char3 = 720
							Dim $gm_char_h = 475
							ExitLoop
						EndIf
					Case $msg= $id1280
					$other_res = "Yes"
					IniWrite ( "Config.ini", "Window", "other_res", $other_res )
					$other_type = "1280x1024"
					IniWrite ( "Config.ini", "Window", "other_type", $other_type )
						If $fullscreen = "Yes" Then
							MsgBox(0x40, "Resolution", "GM Finder will work with 1280x1024(Different of your resolution) with FullScreen " & @CRLF & @CRLF & "Make a test in GM Finder, before go AFK!")
							$800_res_full = "No"
							IniWrite ( "Config.ini", "Window", "800_res_full", $800_res_full )
							$800_res_non_full = "No"
							IniWrite ( "Config.ini", "Window", "800_res_non_full", $800_res_non_full )
							$1024_res_full = "No"
							IniWrite ( "Config.ini", "Window", "1024_res_full", $1024_res_full )
							$1024_res_non_full = "No"
							IniWrite ( "Config.ini", "Window", "1024_res_non_full", $1024_res_non_full )
							$1280_res_full = "Yes"
							IniWrite ( "Config.ini", "Window", "1280_res_full", $1280_res_full )
							$1280_res_non_full = "No"
							IniWrite ( "Config.ini", "Window", "1280_res_non_full", $1280_res_non_full )
							Dim $gm_char1 = 325
							Dim $gm_char2 = 680
							Dim $gm_char3 = 970
							Dim $gm_char_h = 640
							ExitLoop
						ElseIf $fullscreen = "No" Then
							MsgBox(0x40, "Resolution", "GM Finder will work with 1280x1024(Different of your resolution) with Non-FullScreen " & @CRLF & @CRLF & "Make a test in GM Finder, before go AFK!")
							$800_res_full = "No"
							IniWrite ( "Config.ini", "Window", "800_res_full", $800_res_full )
							$800_res_non_full = "No"
							IniWrite ( "Config.ini", "Window", "800_res_non_full", $800_res_non_full )
							$1024_res_full = "No"
							IniWrite ( "Config.ini", "Window", "1024_res_full", $1024_res_full )
							$1024_res_non_full = "No"
							IniWrite ( "Config.ini", "Window", "1024_res_non_full", $1024_res_non_full )
							$1280_res_full = "No"
							IniWrite ( "Config.ini", "Window", "1280_res_full", $1280_res_full )
							$1280_res_non_full = "Yes"
							IniWrite ( "Config.ini", "Window", "1280_res_non_full", $1280_res_non_full )
							Dim $gm_char1 = 440
							Dim $gm_char2 = 670
							Dim $gm_char3 = 850
							Dim $gm_char_h = 600
							ExitLoop
						EndIf
					Case $msg= $GUI_EVENT_CLOSE
				EndSelect
			Until $msg = $GUI_EVENT_CLOSE
			GUIDelete()
		Else
			MsgBox(0x30, "Attention", "Your current resolution IS supported!")
		EndIf
EndFunc

;*********************************************************************************************************************************

;********** Stop **********
Func Stop ()
	HotKeySet("^!a", "reset_num")
	If $gm_finder = "Activated" Then
		TrayTip("GM Finder" , "GM found you " & $gm_finder_num &" times xP" & @CRLF & @CRLF & "CTRL+ALT+A to reset counter", 8 , 1 )
	Else
	EndIf

	While (1)
		Sleep (1000)
	Wend
EndFunc

Func reset_num ()
	If $gm_finder = "Activated" Then
		$gm_finder_num = 0
		TrayTip("GM Finder" , "GM found you " & $gm_finder_num &" times xP" & @CRLF & @CRLF & "CTRL+ALT+A to reset counter", 8 , 1 )
	Else
		Call("Stop")
	EndIf
EndFunc

;********** Cycle Menu **********
While (1)
	Sleep (1)
WEnd

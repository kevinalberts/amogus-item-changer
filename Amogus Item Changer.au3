#NoTrayIcon
#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Version=Beta
#AutoIt3Wrapper_Icon=amogus2.ico
#AutoIt3Wrapper_Outfile=Amogus Item Changer.exe
#AutoIt3Wrapper_Res_Description=Amogus Item Changer
#AutoIt3Wrapper_Res_Fileversion=0.1.3.37
#AutoIt3Wrapper_Res_ProductVersion=0.1.3.37
#AutoIt3Wrapper_Res_LegalCopyright=VirtualX
#AutoIt3Wrapper_Res_requestedExecutionLevel=requireAdministrator
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#EndRegion
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <NtProcess2.au3>

Global $hProcess,$dwModuleBase,$BaseAddySearch,$dwBaseAddr,$dwBaseAddyLocation,$dwBaseAddy,$LocalPlayerOffset,$SkinOffset,$PetOffset,$HatOffset,$dwBase,$dwLocalPlayer,$HCurValue,$SCurValue,$PCurValue

If ProcessExists("Among Us.exe") = 0 Then
MsgBox(64, "", "Waiting for Among Us...")
ProcessWait("Among Us.exe")
EndIf
$hProcess = OpenProcess(0x1F0FFF, 0, ProcessExists("Among Us.exe"))
$dwModuleBase = _MemoryModuleGetBaseAddress(ProcessExists("Among Us.exe"), "GameAssembly.dll")
AutoUpdate()

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Amogus | Item Changer", 466, 290, 797, 397)
$Tab1 = GUICtrlCreateTab(0, 0, 465, 289, $TCS_FIXEDWIDTH)
$TabSheet1 = GUICtrlCreateTabItem("Hats")
$List1 = GUICtrlCreateList("", 24, 34, 297, 240)
GUICtrlSetData(-1, "2019 yellow party hat|Angel halo|Angry eyebrows|Antenna|Antlers|Archaeologist hat|Astronaut helmet|Backwards cap|Balloon|Banana hat|Bat wings|Beanie|Beat ears|Bird nest|Black bandana|Black fedora|Brain Slug|Burt Curtis hat|Bush hat|Candy canes hat|Captain hat|Cat head hat|Caution sign hat|CCC cap|Cheese hat|Chef hat|Cherry hat|Chocolate ice cream|Christmas lights hat|Christmas tree hat|Crewmate hat|Crown|Dave Panpa cap|Devil horns|Do-rag|Double top hat|Dum sticky note|Egg hat|Elf cap|Elf hat|Ellie Rose hair|Ellry mohawk|Eyeball lamp|Eyebrows|Fez|Flamingo hat|Flat cap|Flower hat|Flowerpot hat|Fredrick Muenster hat|General hat|Geoff Keighley mask|Geoffrey Plumb hat|Goggles|Green fedora|Hard hat|Heart pin|Henry figure|Hockey mask|Hunter hat|Knife hat|Knight helmet|Medical mask|Military hat|Military helmet|Miner gear hat|MIRA hazmat mask|MIRA landing headset|MIRA security cap|Mohawk|Mr. Macbeth hat|Mysterious vagabond mask|Pant hat|Paper hat|Party hat|Pirate hat|Plague doctor mask|Plunger|Police hat|Pompadour|Ponytail|Present hat|Pumpkin hat|Ram horns|Right Hand Man hat and mustache|Rubber glove|Safari hat|Santa hat|Sheriff hat|Ski goggles|Snorkel|Snow Crewmate|Snowman hat|Spooky paper bag hat|Stethoscope|Straw hat|Sven Svensson hat|Thomas Chestershire monocles|Toilet paper hat|Top hat|Toppat Clan leader hat|Toppat Ellie Rose hat|Toppat Henry Stickmin hat|Towel wizard|Unicorn hat|Ushanka|Viking|Wall guard cap|White hat|Winter gear hat|Witch hat|Wizard hat|Wolf ears|Zipper hat")
$Button1 = GUICtrlCreateButton("Set Hat", 338, 248, 107, 25)
$TabSheet2 = GUICtrlCreateTabItem("Skins")
$List2 = GUICtrlCreateList("", 24, 34, 297, 240)
GUICtrlSetData(-1, "Archaeologist skin|Astronaut skin|Black suit|Captain skin|CCC skin|Doctor skin|Mechanic skin|Military skin|Miner gear|MIRA hazmat skin|MIRA landing official skin|MIRA security guard skin|Police skin|Prisoner skin|Right Hand Man Reborn skin|Wall guard skin|White suit|Winter gear")
$Button2 = GUICtrlCreateButton("Set Skin", 338, 248, 107, 25)
$TabSheet3 = GUICtrlCreateTabItem("Pets")
$List3 = GUICtrlCreateList("", 24, 34, 297, 240)
GUICtrlSetData(-1, "Bedcrab|Brainslug|Dog|Ellie|Glitch Pet|Hamster|Henry|Mini Crewmate|Robot|Squig|UFO")
$Button3 = GUICtrlCreateButton("Set Pet", 338, 248, 107, 25)
GUICtrlCreateTabItem("")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			$aMsgBox = MsgBox(4, "Amogus | Item Changer", "Would you like to exit?",0,$Form1)
			If $aMsgBox = 6 Then Exit
		Case $Button1
			If List1() > 0 Then
				ChangeHat(List1())
			EndIf
		Case $Button2
			If List2() > 0 Then
				ChangeSkin(List2())
			EndIf
		Case $Button3
			If List3() > 0 Then
				ChangePet(List3())
			EndIf
	EndSwitch
WEnd

Func ChangeHat($h_data)
	$dwBase = NtReadVirtualMemory($hProcess, $dwModuleBase + $dwBaseAddy, "dword")
	$dwLocalPlayer = NtReadVirtualMemory($hProcess, $dwBase + $LocalPlayerOffset, "dword")
	NtWriteVirtualMemory($hProcess, $dwLocalPlayer + $HatOffset, $h_data, "dword")

	$HCurValue = NtReadVirtualMemory($hProcess, $dwLocalPlayer + $HatOffset, "dword")
	If $HCurValue = $h_data Then
		MsgBox(64, "Success!", "Join a room or rejoin if you're already in!")
	Else
		MsgBox(16, "Failed!", "There should be a problem with the cheat or the game. Contact to developer!" & @CRLF & "Discord: VirtualX#9523")
	EndIf
EndFunc

Func ChangeSkin($s_data)
	$dwBase = NtReadVirtualMemory($hProcess, $dwModuleBase + $dwBaseAddy, "dword")
	$dwLocalPlayer = NtReadVirtualMemory($hProcess, $dwBase + $LocalPlayerOffset, "dword")
	NtWriteVirtualMemory($hProcess, $dwLocalPlayer + $SkinOffset, $s_data, "dword")

	$SCurValue = NtReadVirtualMemory($hProcess, $dwLocalPlayer + $SkinOffset, "dword")
	If $SCurValue = $s_data Then
		MsgBox(64, "Success!", "Join a room or rejoin if you're already in!")
	Else
		MsgBox(16, "Failed!", "There should be a problem with the cheat or the game. Contact to developer!" & @CRLF & "Discord: VirtualX#9523")
	EndIf
EndFunc

Func ChangePet($p_data)
	$dwBase = NtReadVirtualMemory($hProcess, $dwModuleBase + $dwBaseAddy, "dword")
	$dwLocalPlayer = NtReadVirtualMemory($hProcess, $dwBase + $LocalPlayerOffset, "dword")
	NtWriteVirtualMemory($hProcess, $dwLocalPlayer + $PetOffset, $p_data, "dword")

	$PCurValue = NtReadVirtualMemory($hProcess, $dwLocalPlayer + $PetOffset, "dword")
	If $PCurValue = $p_data Then
		MsgBox(64, "Success!", "Join a room or rejoin if you're already in!")
	Else
		MsgBox(16, "Failed!", "There should be a problem with the cheat or the game. Contact to developer!" & @CRLF & "Discord: VirtualX#9523")
	EndIf
EndFunc

Func AutoUpdate()
$BaseAddySearch = FindPattern($hProcess, "A1........83C4..8B40..8B40..C3CCCCCCCCCCCCCCCCCCCCCCCCCCCC55", false, $dwModuleBase)
$dwBaseAddr = "0x" & Hex($BaseAddySearch + 0x1, 8)
$dwBaseAddyLocation = "0x" & Hex(NtReadVirtualMemory($hProcess, $dwBaseAddr, "dword"),8)
$dwBaseAddy = "0x" & Hex(Execute($dwBaseAddyLocation - $dwModuleBase), 8)
;;
$LocalPlayerOffset = "0x" & Hex($BaseAddySearch + 0xA,8)
$LocalPlayerOffset = "0x" & Hex(NtReadVirtualMemory($hProcess, $LocalPlayerOffset,"dword"), 2)
$LocalPlayerOffset = "0x" & Hex(Execute($LocalPlayerOffset - $dwModuleBase), 2)
;;
$SkinOffset = "0x" & Hex($BaseAddySearch + 0xD, 8)
$SkinOffset = "0x" & Hex(NtReadVirtualMemory($hProcess, $SkinOffset,"dword"), 2)
$SkinOffset = "0x" & Hex(Execute($SkinOffset - $dwModuleBase), 4)
;;
$HatOffset = "0x" & Hex($SkinOffset - 0x4, 4)
$PetOffset = "0x" & Hex($SkinOffset - 0x8, 4)
EndFunc

Func List1() ;i know... i'm sick af
	$SelectedHat = GuiCtrlRead($List1)
	If $SelectedHat = "" Then
	Return "0"
	ElseIf $SelectedHat = "Astronaut helmet" Then
	Return "1"
	ElseIf $SelectedHat = "Backwards cap" Then
	Return "2"
	ElseIf $SelectedHat = "Brain Slug" Then
	Return "3"
	ElseIf $SelectedHat = "Bush hat" Then
	Return "4"
	ElseIf $SelectedHat = "Captain hat" Then
	Return "5"
	ElseIf $SelectedHat = "Double top hat" Then
	Return "6"
	ElseIf $SelectedHat = "Flowerpot hat" Then
	Return "7"
	ElseIf $SelectedHat = "Goggles" Then
	Return "8"
	ElseIf $SelectedHat = "Hard hat" Then
	Return "9"
	ElseIf $SelectedHat = "Military hat" Then
	Return "10"
	ElseIf $SelectedHat = "Paper hat" Then
	Return "11"
	ElseIf $SelectedHat = "Party hat" Then
	Return "12"
	ElseIf $SelectedHat = "Police hat" Then
	Return "13"
	ElseIf $SelectedHat = "Stethoscope" Then
	Return "14"
	ElseIf $SelectedHat = "Top hat" Then
	Return "15"
	ElseIf $SelectedHat = "Towel wizard" Then
	Return "16"
	ElseIf $SelectedHat = "Ushanka" Then
	Return "17"
	ElseIf $SelectedHat = "Viking" Then
	Return "18"
	ElseIf $SelectedHat = "Wall guard cap" Then
	Return "19"
	ElseIf $SelectedHat = "Snowman hat" Then
	Return "20"
	ElseIf $SelectedHat = "Antlers" Then
	Return "21"
	ElseIf $SelectedHat = "Christmas lights hat" Then
	Return "22"
	ElseIf $SelectedHat = "Santa hat" Then
	Return "23"
	ElseIf $SelectedHat = "Christmas tree hat" Then
	Return "24"
	ElseIf $SelectedHat = "Present hat" Then
	Return "25"
	ElseIf $SelectedHat = "Candy canes hat" Then
	Return "26"
	ElseIf $SelectedHat = "Elf hat" Then
	Return "27"
	ElseIf $SelectedHat = "2019 yellow party hat" Then
	Return "28"
	ElseIf $SelectedHat = "White hat" Then
	Return "29"
	ElseIf $SelectedHat = "Crown" Then
	Return "30"
	ElseIf $SelectedHat = "Eyebrows" Then
	Return "31"
	ElseIf $SelectedHat = "Angel halo" Then
	Return "32"
	ElseIf $SelectedHat = "Elf cap" Then
	Return "33"
	ElseIf $SelectedHat = "Flat cap" Then
	Return "34"
	ElseIf $SelectedHat = "Plunger" Then
	Return "35"
	ElseIf $SelectedHat = "Snorkel" Then
	Return "36"
	ElseIf $SelectedHat = "Henry figure" Then
	Return "37"
	ElseIf $SelectedHat = "Safari hat" Then
	Return "38"
	ElseIf $SelectedHat = "Sheriff hat" Then
	Return "39"
	ElseIf $SelectedHat = "Eyeball lamp" Then
	Return "40"
	ElseIf $SelectedHat = "Toilet paper hat" Then
	Return "41"
	ElseIf $SelectedHat = "Toppat Clan leader hat" Then
	Return "42"
	ElseIf $SelectedHat = "Black fedora" Then
	Return "43"
	ElseIf $SelectedHat = "Ski goggles" Then
	Return "44"
	ElseIf $SelectedHat = "MIRA landing headset" Then
	Return "45"
	ElseIf $SelectedHat = "MIRA hazmat mask" Then
	Return "46"
	ElseIf $SelectedHat = "Medical mask" Then
	Return "47"
	ElseIf $SelectedHat = "MIRA security cap" Then
	Return "48"
	ElseIf $SelectedHat = "Straw hat" Then
	Return "49"
	ElseIf $SelectedHat = "Banana hat" Then
	Return "50"
	ElseIf $SelectedHat = "Beanie" Then
	Return "51"
	ElseIf $SelectedHat = "Bear ears" Then
	Return "52"
	ElseIf $SelectedHat = "Cheese hat" Then
	Return "53"
	ElseIf $SelectedHat = "Cherry hat" Then
	Return "54"
	ElseIf $SelectedHat = "Egg hat" Then
	Return "55"
	ElseIf $SelectedHat = "Green fedora" Then
	Return "56"
	ElseIf $SelectedHat = "Flamingo hat" Then
	Return "57"
	ElseIf $SelectedHat = "Flower hat" Then
	Return "58"
	ElseIf $SelectedHat = "Knight helmet" Then
	Return "59"
	ElseIf $SelectedHat = "Plant hat" Then
	Return "60"
	ElseIf $SelectedHat = "Cat head hat" Then
	Return "61"
	ElseIf $SelectedHat = "Bat wings" Then
	Return "62"
	ElseIf $SelectedHat = "Devil horns" Then
	Return "63"
	ElseIf $SelectedHat = "Mohawk" Then
	Return "64"
	ElseIf $SelectedHat = "Pumpkin hat" Then
	Return "65"
	ElseIf $SelectedHat = "Spooky paper bag hat" Then
	Return "66"
	ElseIf $SelectedHat = "Witch hat" Then
	Return "67"
	ElseIf $SelectedHat = "Wolf ears" Then
	Return "68"
	ElseIf $SelectedHat = "Pirate hat" Then
	Return "69"
	ElseIf $SelectedHat = "Plague doctor mask" Then
	Return "70"
	ElseIf $SelectedHat = "Knife hat" Then
	Return "71"
	ElseIf $SelectedHat = "Hockey mask" Then
	Return "72"
	ElseIf $SelectedHat = "Miner gear hat" Then
	Return "73"
	ElseIf $SelectedHat = "Winter gear hat" Then
	Return "74"
	ElseIf $SelectedHat = "Archaeologist hat" Then
	Return "75"
	ElseIf $SelectedHat = "Antenna" Then
	Return "76"
	ElseIf $SelectedHat = "Balloon" Then
	Return "77"
	ElseIf $SelectedHat = "Bird nest" Then
	Return "78"
	ElseIf $SelectedHat = "Black bandana" Then
	Return "79"
	ElseIf $SelectedHat = "Caution sign hat" Then
	Return "80"
	ElseIf $SelectedHat = "Chef hat" Then
	Return "81"
	ElseIf $SelectedHat = "CCC cap" Then
	Return "82"
	ElseIf $SelectedHat = "Do-rag" Then
	Return "83"
	ElseIf $SelectedHat = "Dum sticky note" Then
	Return "84"
	ElseIf $SelectedHat = "Fez" Then
	Return "85"
	ElseIf $SelectedHat = "General hat" Then
	Return "86"
	ElseIf $SelectedHat = "Pompadour" Then
	Return "87"
	ElseIf $SelectedHat = "Hunter hat" Then
	Return "88"
	ElseIf $SelectedHat = "Military helmet" Then
	Return "89"
	ElseIf $SelectedHat = "Crewmate hat" Then
	Return "90"
	ElseIf $SelectedHat = "Mysterious vagabond mask" Then
	Return "91"
	ElseIf $SelectedHat = "Ram horns" Then
	Return "92"
	ElseIf $SelectedHat = "Snow Crewmate" Then
	Return "93"
	ElseIf $SelectedHat = "Geoff Keighley mask" Then
	Return "94"
	ElseIf $SelectedHat = "Dave Panpa cap" Then
	Return "95"
	ElseIf $SelectedHat = "Ellie Rose hair" Then
	Return "96"
	ElseIf $SelectedHat = "Sven Svensson hat" Then
	Return "97"
	ElseIf $SelectedHat = "Burt Curtis hat" Then
	Return "98"
	ElseIf $SelectedHat = "Ellry mohawk" Then
	Return "99"
	ElseIf $SelectedHat = "Thomas Chestershire monocles" Then
	Return "100"
	ElseIf $SelectedHat = "Wizard hat" Then
	Return "101"
	ElseIf $SelectedHat = "Fredrick Muenster hat" Then
	Return "102"
	ElseIf $SelectedHat = "Mr. Macbeth hat" Then
	Return "103"
	ElseIf $SelectedHat = "Toppat Henry Stickmin hat" Then
	Return "104"
	ElseIf $SelectedHat = "Toppat Ellie Rose hat" Then
	Return "105"
	ElseIf $SelectedHat = "Geoffrey Plumb hat" Then
	Return "106"
	ElseIf $SelectedHat = "Angry eyebrows" Then
	Return "107"
	ElseIf $SelectedHat = "Chocolate ice cream" Then
	Return "108"
	ElseIf $SelectedHat = "Heart pin" Then
	Return "109"
	ElseIf $SelectedHat = "Ponytail" Then
	Return "110"
	ElseIf $SelectedHat = "Rubber glove" Then
	Return "111"
	ElseIf $SelectedHat = "Unicorn hat" Then
	Return "112"
	ElseIf $SelectedHat = "Zipper hat" Then
	Return "113"
	ElseIf $SelectedHat = "Right Hand Man hat and mustache" Then
	Return "114"
	EndIf
EndFunc

Func List2() ;wasn't really a big deal tho
	$SelectedSkin = GuiCtrlRead($List2)
	If $SelectedSkin = "" Then
	Return "0"
	ElseIf $SelectedSkin = "Astronaut skin" Then
	Return "1"
	ElseIf $SelectedSkin = "Captain skin" Then
	Return "2"
	ElseIf $SelectedSkin = "Mechanic skin" Then
	Return "3"
	ElseIf $SelectedSkin = "Military skin" Then
	Return "4"
	ElseIf $SelectedSkin = "Police skin" Then
	Return "5"
	ElseIf $SelectedSkin = "Doctor skin" Then
	Return "6"
	ElseIf $SelectedSkin = "Black suit" Then
	Return "7"
	ElseIf $SelectedSkin = "White suit" Then
	Return "8"
	ElseIf $SelectedSkin = "Wall guard skin" Then
	Return "9"
	ElseIf $SelectedSkin = "MIRA hazmat skin" Then
	Return "10"
	ElseIf $SelectedSkin = "MIRA security guard skin" Then
	Return "11"
	ElseIf $SelectedSkin = "MIRA landing official skin" Then
	Return "12"
	ElseIf $SelectedSkin = "Miner gear" Then
	Return "13"
	ElseIf $SelectedSkin = "Winter gear" Then
	Return "14"
	ElseIf $SelectedSkin = "Archaeologist skin" Then
	Return "15"
	ElseIf $SelectedSkin = "Prisoner skin" Then
	Return "16"
	ElseIf $SelectedSkin = "CCC skin" Then
	Return "17"
	ElseIf $SelectedSkin = "Right Hand Man Reborn skin" Then
	Return "18"
	EndIf
EndFunc

Func List3() ;it was kinda ez
	$SelectedPet = GuiCtrlRead($List3)
	If $SelectedPet = "" Then
	Return "0"
	ElseIf $SelectedPet = "Brainslug" Then
	Return "1"
	ElseIf $SelectedPet = "Mini Crewmate" Then
	Return "2"
	ElseIf $SelectedPet = "Dog" Then
	Return "3"
	ElseIf $SelectedPet = "Henry" Then
	Return "4"
	ElseIf $SelectedPet = "Hamster" Then
	Return "5"
	ElseIf $SelectedPet = "Robot" Then
	Return "6"
	ElseIf $SelectedPet = "UFO" Then
	Return "7"
	ElseIf $SelectedPet = "Ellie" Then
	Return "8"
	ElseIf $SelectedPet = "Squig" Then
	Return "9"
	ElseIf $SelectedPet = "Bedcrab" Then
	Return "10"
	ElseIf $SelectedPet = "Glitch Pet" Then
	Return "11"
	EndIf
EndFunc

Func _MemoryModuleGetBaseAddress($iPID, $sModule)
	If Not ProcessExists($iPID) Then Return SetError(1, 0, 0)

	If Not IsString($sModule) Then Return SetError(2, 0, 0)

	Local $PSAPI = DllOpen("psapi.dll")

	;Get Process Handle
	Local $hProcess
	Local $PERMISSION = BitOR(0x0002, 0x0400, 0x0008, 0x0010, 0x0020)   ; CREATE_THREAD, QUERY_INFORMATION, VM_OPERATION, VM_READ, VM_WRITE

	If $iPID > 0 Then
		Local $hProcess = DllCall("kernel32.dll", "ptr", "OpenProcess", "dword", $PERMISSION, "int", 0, "dword", $iPID)
		If $hProcess[0] Then
			$hProcess = $hProcess[0]
		EndIf
	EndIf

	;EnumProcessModules
	Local $Modules = DllStructCreate("ptr[1024]")
	Local $aCall = DllCall($PSAPI, "int", "EnumProcessModules", "ptr", $hProcess, "ptr", DllStructGetPtr($Modules), "dword", DllStructGetSize($Modules), "dword*", 0)
	If $aCall[4] > 0 Then
		Local $iModnum = $aCall[4] / 4
		Local $aTemp
		For $i = 1 To $iModnum
			$aTemp = DllCall($PSAPI, "dword", "GetModuleBaseNameW", "ptr", $hProcess, "ptr", Ptr(DllStructGetData($Modules, 1, $i)), "wstr", "", "dword", 260)
			If $aTemp[3] = $sModule Then
				DllClose($PSAPI)
				Return Ptr(DllStructGetData($Modules, 1, $i))
			EndIf
		Next
	EndIf

	DllClose($PSAPI)
	Return SetError(-1, 0, 0)

EndFunc   ;==>_MemoryModuleGetBaseAddress
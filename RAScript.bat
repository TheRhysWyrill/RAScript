@echo off
SETLOCAL EnableExtensions DisableDelayedExpansion
for /F %%a in ('echo prompt $E ^| cmd') do (
  set "ESC=%%a"
)
SETLOCAL EnableDelayedExpansion

echo !ESC![105;93m Downloading RetroArch and Core DLLs !ESC![0m

curl -L https://github.com/libretro/RetroArch/archive/refs/heads/master.zip --Output RetroArch-Source.zip
curl https://buildbot.libretro.com/nightly/windows/x86_64/RetroArch_cores.7z --Output Cores.7z
curl -L https://github.com/TheRhysWyrill/RAScript/raw/main/Required%%20DLLs/DLLs.7z.001 --Output DLLs.7z.001
curl -L https://github.com/TheRhysWyrill/RAScript/raw/main/Required%%20DLLs/DLLs.7z.002 --Output DLLs.7z.002
curl -L https://github.com/TheRhysWyrill/RAScript/raw/main/Assets/Assets.7z --Output Assets.7z
curl -L https://github.com/TheRhysWyrill/RAScript/raw/main/Old%%20Cores/Old_Cores.7z --Output Old_Cores.7z
curl -L https://github.com/GABO1423/Mupen64Plus-Next-XboxOne/latest/download/mupen64plus_next_libretro.7z --Output Mupen64Plus.7z
curl -L https://github.com/GABO1423/ParaLLEl-N64-XboxOne/latest/download/parallel_n64_libretro.7z --Output ParLLEl64.7z

echo !ESC![105;93m Extracting Everything !ESC![0m
"C:\Program Files\7-Zip\7z.exe" x RetroArch-Source.zip -o"%~dp0" *.* -r -y
"C:\Program Files\7-Zip\7z.exe" x DLLs.7z.001 -o"%~dp0RetroArch-master\pkg\msvc-uwp\RetroArch-msvc2019-UWP" *.* -r -y
"C:\Program Files\7-Zip\7z.exe" x Assets.7z -o"%~dp0RetroArch-master\pkg\msvc-uwp\RetroArch-msvc2019-UWP" *.* -r -y
"C:\Program Files\7-Zip\7z.exe" e Cores.7z -aoa
"C:\Program Files\7-Zip\7z.exe" e Old_Cores.7z -aoa
"C:\Program Files\7-Zip\7z.exe" e Mupen64Plus.7z -aoa
"C:\Program Files\7-Zip\7z.exe" e ParaLLEl64.7z -aoa

echo !ESC![105;93m Deleting Unwanted Cores !ESC![0m
del /q /f 81*.dll 2048*.dll a5200*.dll arduous*.dll atari800*.dll bk*.dll blastem*.dll bluemsx*.dll boom3*.dll bsnes*.dll cannonball*.dll cap32*.dll cdi2015*.dll chailove*.dll citra*.dll craft*.dll crocods*.dll desmume_libretro.dll dinothawr*.dll dosbox*.dll ecwolf*.dll fbalpha*.dll fceumm*.dll fixgb*.dll fixnes*.dll fmsx*.dll freechaf*.dll freeintv*.dll frodo*.dll fuse*.dll gearboy*.dll gearcoleco*.dll gearsystem*.dll genesis_plus_gx_wide*.dll gme*.dll gong*.dll gpsp*.dll gw*.dll handy*.dll hatari*.dll jaxe*.dll jumpnbump*.dll kronos*.dll lowresnx*.dll lutro*.dll mame*.dll mednafen_gba*.dll mednafen_lynx*.dll mednafen_pce_fast*.dll mednafen_pce_fast*.dll mednafen_pcfx*.dll mednafen_psx_hw*.dll mednafen_psx*.dll mednafen_snes*.dll mednafen_supafaust*.dll mednafen_supergrafx*.dll mednafen_vb*.dll mesen-s*.dll meteor*.dll minivmac*.dll mrboom*.dll mu_*.dll nekop2*.dll neocd*.dll nestopia*.dll np2kai*.dll nxengine*.dll o2em*.dll oberon*.dll pcsx_rearmed*.dll picodrive*.dll play*.dll pocketcdg*.dll pokemini*.dll potator*.dll prboom*.dll prosystem*.dll puae*.dll px68k*.dll quasi88*.dll quicknes*.dll race*.dll reminiscence*.dll retro8*.dll same_cdi*.dll sameboy*.dll sameduck*.dll scummvm*.dll smsplus*.dll snes9x2*.dll squirreljme*.dll stella*.dll superbroswar*.dll tgbdual*.dll theodore*.dll thepowdertoy*.dll tic80*.dll tyrquake*.dll uzem*.dll vaporspec*.dll vba_next*.dll vbam*.dll vecx*.dll vemulator*.dll vice*.dll virtualjaguar*.dll vitaquake*.dll wasm4*.dll x1*.dll xrick*.dll yabasanshiro*.dll

echo !ESC![105;93m Cleaning Up Files and Folders !ESC![0m
rd /q cores RetroArch-Win64 
del /q /f *.00* *.7z RetroArch-Source.zip "%~dp0RetroArch-master\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\.empty" "%~dp0RetroArch-master\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\cores\.empty"

echo !ESC![105;93m Moving Cores !ESC![0m
ren *.dll
move *.dll "%~dp0RetroArch-master\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\cores\"

echo !ESC![105;93m Making a Backup !ESC![0m
"C:\Program Files\7-Zip\7z.exe" a "%~dp0Cores Backup.7z" "%~dp0RetroArch-master\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\cores"
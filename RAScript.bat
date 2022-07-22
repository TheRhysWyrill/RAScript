@echo off
SETLOCAL EnableExtensions DisableDelayedExpansion
for /F %%a in ('echo prompt $E ^| cmd') do (
  set "ESC=%%a"
)
SETLOCAL EnableDelayedExpansion

echo !ESC![105;93m Downloading RetroArch and DLLs !ESC![0m

curl -L https://github.com/Gamr13/RetroArch_Xbox/archive/refs/heads/master.zip --Output RetroArch-Source.zip
curl https://buildbot.libretro.com/nightly/windows/x86_64/RetroArch_cores.7z --Output Cores.7z
curl -L https://github.com/TheRhysWyrill/RAScript/raw/main/Required%%20DLLs/DLLs.7z.001 --Output DLLs.7z.001
curl -L https://github.com/TheRhysWyrill/RAScript/raw/main/Required%%20DLLs/DLLs.7z.002 --Output DLLs.7z.002
curl -L https://github.com/TheRhysWyrill/RAScript/raw/main/Assets/Assets.7z --Output Assets.7z
curl -L https://github.com/TheRhysWyrill/RAScript/raw/main/Old%%20Cores/Old_Cores.7z --Output Old_Cores.7z
curl -L https://github.com/GABO1423/Mupen64Plus-Next-Xbox/releases/latest/download/mupen64plus_next_libretro.7z --Output Mupen64Plus.7z
curl -L https://github.com/GABO1423/ParaLLEl-N64-Xbox/releases/latest/download/parallel_n64_libretro.7z --Output ParaLLEl64.7z
curl -L https://github.com/GABO1423/Flycast-Libretro-Xbox-Builds/releases/latest/download/flycast_libretro.7z --Output Flycast.7z

echo !ESC![105;93m Extracting Everything !ESC![0m
"C:\Program Files\7-Zip\7z.exe" x RetroArch-Source.zip -o"%~dp0" *.* -r -y
"C:\Program Files\7-Zip\7z.exe" x DLLs.7z.001 -o"%~dp0RetroArch_Xbox-master\pkg\msvc-uwp\RetroArch-msvc2019-UWP" *.* -r -y
"C:\Program Files\7-Zip\7z.exe" x Assets.7z -o"%~dp0RetroArch_Xbox-master\pkg\msvc-uwp\RetroArch-msvc2019-UWP" *.* -r -y
"C:\Program Files\7-Zip\7z.exe" e Cores.7z -aoa
"C:\Program Files\7-Zip\7z.exe" e Old_Cores.7z -aoa
"C:\Program Files\7-Zip\7z.exe" e Mupen64Plus.7z -aoa
"C:\Program Files\7-Zip\7z.exe" e ParaLLEl64.7z -aoa
"C:\Program Files\7-Zip\7z.exe" e Flycast.7z -aoa

echo !ESC![105;93m Deleting Unwanted Cores !ESC![0m
del /q /f 81* 2048* a5200* arduous* atari800* bk* blastem* bluemsx* boom3* bsnes* cannonball* cap32* cdi2015* chailove* citra* craft* crocods* dinothawr* dosbox* ecwolf* ep128* fbalpha* fceumm* fixgb* fixnes* fmsx* freechaf* freeintv* frodo* fuse* gearboy* gearcoleco* gearsystem* genesis_plus_gx_wide* gme* gong* gpsp* gw* handy* hatari* jaxe* jumpnbump* kronos* lowresnx* lutro* mame* mednafen_gba* mednafen_lynx* mednafen_pce_fast* mednafen_pce_fast* mednafen_pcfx* mednafen_psx_hw* mednafen_psx* mednafen_snes* mednafen_supafaust* mednafen_supergrafx* mednafen_vb* mesen-s* meteor* minivmac* mrboom* mu_* nekop2* neocd* nestopia* np2kai* nxengine* o2em* oberon* pcsx_rearmed* picodrive* play* pocketcdg* pokemini* potator* prboom* prosystem* puae* px68k* quasi88* quicknes* race* reminiscence* retro8* same_cdi* sameboy* sameduck* scummvm* smsplus* snes9x2* squirreljme* stella* superbroswar* tgbdual* theodore* thepowdertoy* tic80* tyrquake* uzem* vaporspec* vba_next* vbam* vecx* vemulator* vice* virtualjaguar* vitaquake* wasm4* x1* xrick* yabasanshiro*

echo !ESC![105;93m Cleaning Up Files and Folders !ESC![0m
rd /q cores RetroArch-Win64 
del /q /f *.00* *.7z RetroArch-Source.zip "%~dp0RetroArch_Xbox-master\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\.empty" "%~dp0RetroArch_Xbox-master\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\cores\.empty"

cd RetroArch_Xbox-master

rd /s /q bootstrap ctr "camera\drivers" "cores\libretro-ffmpeg" "cores\libretro-mpv" "cores\libretro-net-retropad" "cores\libretro-video-processor" "deps\bearssl-0.6" "deps\discord-rpc" "deps\dr" "deps\feralgamemode" "deps\libfat" "deps\libFLAC" "deps\libgo2" "deps\libiosuhax" "deps\libShake" "deps\libvita2d" "deps\lua" "deps\mbedtls" "deps\peglib" "deps\Pigs-In-A-Blanket" "deps\switchres" "deps\wayland-protocols" "deps\xxHash" dingux dist-scripts docs emscripten "gfx\common\metal" "gfx\common\wayland" "gfx\display_servers" "gfx\drivers\ctr_shaders" "gfx\drivers\gx2_shaders" "gfx\drivers\rsx_shaders" "gfx\drivers\vulkan_shaders" "gfx\include\Cg" "gfx\include\d3d8" "gfx\include\d3d9" "gfx\include\GL" "gfx\include\pixman" "gfx\include\userland" "gfx\include\vulkan" "input\common" "input\drivers_hid" "input\drivers_joypad\wiiu" "input\drivers_keyboard" "input\include\GameController" "input\include\wiiu" "libretro-common\crt" "libretro-common\test" "libretro-common\vulkan" location

rd /s /q media memory midi "pkg\360" "pkg\android" "pkg\apple" "pkg\ctr" "pkg\debian" "pkg\emscripten" "pkg\libnx" "pkg\miyoo" "pkg\msvc" "pkg\msvc-uwp\RetroArch-msvc2017-UWP" "pkg\msvc-uwp\RetroArch-msvc2017-UWP-cores-nonfree" "pkg\msvc-uwp\RetroArch-msvc2019-UWP-cores-nonfree" "pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\ARM" "pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\ARM64" "pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\Win32" "pkg\ngc" "pkg\pandora" "pkg\ps3" "pkg\ps3_dex" "pkg\ps3_iso" "pkg\psl1ght" "pkg\psp1" "pkg\qnx" "pkg\sailfishos" "pkg\vita" "pkg\wii" "pkg\wiiu" "pkg\windows" play_feature_delivery ps2 qb "record\drivers" reference samples shaders shaders-hlsl shaders-hlsl-no-opt shaders-msl shaders-no-opt steam tests-other tools "ui\drivers\cocoa" "ui\drivers\qt" vita webos wii wiiu

del /q /f .editor* .git* .project .travis* 10bpc* CHANGES* COD* com.libretro.* COPYING* CONTRIBUTING* Doxyfile fetch-submodules.sh github-* Makefile.apple Makefile.c* Makefile.d* Makefile.e* Makefile.g* Makefile.l* Makefile.m* Makefile.n* Makefile.o* Makefile.p* Makefile.r* Makefile.s* Makefile.v* Makefile.w* no-xib.* nvda* README* retroarch.desktop retroarch-* switch_* travis_* travis-* wiiu* "pkg\msvc-uwp\RetroArch-msvc2017-UWP.sln" "pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\.empty" "pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\cores\.empty" "audio\drivers\a"* "audio\drivers\c"* "audio\drivers\d"* "audio\drivers\g"* "audio\drivers\j"* "audio\drivers\o"* "audio\drivers\p"* "audio\drivers\r"* "audio\drivers\s"* "audio\drivers\t"* "audio\drivers\w"* "audio\drivers\xe"* "frontend\drivers\platform_c"* "frontend\drivers\platform_d"* "frontend\drivers\platform_e"* "frontend\drivers\platform_g"* "frontend\drivers\platform_o"* "frontend\drivers\platform_p"* "frontend\drivers\platform_q"*

del /q /f "frontend\drivers\platform_s"* "frontend\drivers\platform_un"* "frontend\drivers\platform_w"* "frontend\drivers\platform_xe"* "gfx\common\c"* "gfx\common\d3d8"* "gfx\common\d3d9"* "gfx\common\d3d10"* "gfx\common\db"* "gfx\common\dr"* "gfx\common\f"* "gfx\common\gd"* "gfx\common\gl1"* "gfx\common\gl3"* "gfx\common\gx"* "gfx\common\m"* "gfx\common\n"* "gfx\common\o"* "gfx\common\p"* "gfx\common\r"* "gfx\common\s"* "gfx\common\v"* "gfx\common\wayland"* "gfx\common\x"* "gfx\drivers\c"* "gfx\drivers\d3d8"* "gfx\drivers\d3d9"* "gfx\drivers\d3d10"* "gfx\drivers\di"* "gfx\drivers\dr"* "gfx\drivers\e"* "gfx\drivers\f"* "gfx\drivers\gd"* "gfx\drivers\gl1"* "gfx\drivers\gl3"* "gfx\drivers\gx"* "gfx\drivers\m"* "gfx\drivers\n"* "gfx\drivers\o"* "gfx\drivers\p"* "gfx\drivers\r"* "gfx\drivers\s"* "gfx\drivers\v"* "gfx\drivers\x"* "gfx\drivers_context\a"* "gfx\drivers_context\c"* "gfx\drivers_context\d"* "gfx\drivers_context\e"* "gfx\drivers_context\k"* "gfx\drivers_context\m"* "gfx\drivers_context\o"*

del /q /f "gfx\drivers_context\p"* "gfx\drivers_context\q"* "gfx\drivers_context\s"* "gfx\drivers_context\v"* "gfx\drivers_context\w"* "gfx\drivers_context\x"* "gfx\drivers_display\gfx_display_c"* "gfx\drivers_display\gfx_display_d3d8"* "gfx\drivers_display\gfx_display_d3d9"* "gfx\drivers_display\gfx_display_d3d10"* "gfx\drivers_display\gfx_display_gd"* "gfx\drivers_display\gfx_display_gl1"* "gfx\drivers_display\gfx_display_gl3"* "gfx\drivers_display\gfx_display_m"* "gfx\drivers_display\gfx_display_r"* "gfx\drivers_display\gfx_display_s"* "gfx\drivers_display\gfx_display_v"* "gfx\drivers_display\gfx_display_w"* "gfx\drivers_font\c"* "gfx\drivers_font\d3d_"* "gfx\drivers_font\ded10"* "gfx\drivers_font\gdi"* "gfx\drivers_font\gl1"* "gfx\drivers_font\gl3"* "gfx\drivers_font\m"* "gfx\drivers_font\p"* "gfx\drivers_font\r"* "gfx\drivers_font\s"* "gfx\drivers_font\v"* "gfx\drivers_font\w"* "gfx\drivers_font\x"* "gfx\drivers_shader\shader_gl_"* "gfx\drivers_shader\shader_gl3"* "gfx\drivers_shader\shader_v"*

del /q /f "input\connect\c"* "input\drivers\a"* "input\drivers\c"* "input\drivers\d"* "input\drivers\g"* "input\drivers\l"* "input\drivers\p"* "input\drivers\q"* "input\drivers\r"* "input\drivers\s"* "input\drivers\ud"* "input\drivers\wayland"* "input\drivers\wiiu"* "input\drivers\x11"* "input\drivers\xe"* "input\drivers_joypad\a"* "input\drivers_joypad\c"* "input\drivers_joypad\d"* "input\drivers_joypad\g"* "input\drivers_joypad\h"* "input\drivers_joypad\l"* "input\drivers_joypad\m"* "input\drivers_joypad\p"* "input\drivers_joypad\q"* "input\drivers_joypad\r"* "input\drivers_joypad\s"* "input\drivers_joypad\u"* "input\drivers_joypad\w"* "input\drivers_joypad\xdk"* "input\drivers_joypad\xinput_hybrid"* "input\include\b"* "input\include\xf"* "intl\google"* "intl\README"* "intl\steam"* "led\drivers\led_r"* "led\drivers\led_w"* "led\drivers\led_x"* "network\discord"* "tasks\task_steam"* "ui\drivers\ui_c"* "ui\drivers\ui_q"*

cd..

echo !ESC![105;93m Moving Cores !ESC![0m
ren *.dll
move *.dll "%~dp0RetroArch_Xbox-master\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\cores\"

echo !ESC![105;93m Making a Backup !ESC![0m
"C:\Program Files\7-Zip\7z.exe" a "%~dp0Cores Backup.7z" "%~dp0RetroArch_Xbox-master\pkg\msvc-uwp\RetroArch-msvc2019-UWP\cores\x64\cores"

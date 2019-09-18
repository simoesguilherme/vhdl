@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.1\\bin
call %xv_path%/xelab  -wto 5b824ae741b948a291540a6a870ca1c9 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot t_FIR3taps_behav xil_defaultlib.t_FIR3taps -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

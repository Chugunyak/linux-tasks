echo -e "II: Info message WW: Warning message" > Xorg.0.log
grep -E "WW|II" Xorg.0.log | sed -e 's/WW/Warn:/' -e 's/II/Info:/' | sort > full.log
cat full.log

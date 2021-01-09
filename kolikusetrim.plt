load "pausal.plt"

# Kreslení
set xrange [30000:970000]
set yrange [-70000:+70000]
set key left top
plot \
    0 lt rgb "black", \
    suma_odvody(x, 0) - pausalni_dan title "Bez dětí" lt rgb "#f9ad3b" lw 1, \
    suma_odvody(x, 1) - pausalni_dan title "Jedno dítě" lt rgb "#faa33e" lw 1, \
    suma_odvody(x, 2) - pausalni_dan title "Dvě děti" lt rgb "#fd8e42" lw 1, \
    suma_odvody(x, 3) - pausalni_dan title "Tři děti" lt rgb "#fe7346" lw 1, \
    suma_odvody(x, 4) - pausalni_dan title "Čtyři děti" lt rgb "#ff5948" lw 1

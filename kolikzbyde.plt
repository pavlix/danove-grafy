load "pausal.plt"

# Kreslení
set xrange [30000:970000]
set yrange [30000:970000]
set key right bottom
plot \
    x title "Bez zdanění" lt rgb "black" lw 2 dashtype 2, \
    x - pausalni_dan title "S paušální daní" lt rgb "#0f737a" lw 2, \
    zbyly_prijem(x, 0) title "Klasika: Bez dětí" lt rgb "#f9ad3b" lw 1, \
    zbyly_prijem(x, 1) title "Klasika: Jedno dítě" lt rgb "#faa33e" lw 1, \
    zbyly_prijem(x, 2) title "Klasika: Dvě děti" lt rgb "#fd8e42" lw 1, \
    zbyly_prijem(x, 3) title "Klasika: Tři děti" lt rgb "#fe7346" lw 1, \
    zbyly_prijem(x, 4) title "Klasika: Čtyři děti" lt rgb "#ff5948" lw 1

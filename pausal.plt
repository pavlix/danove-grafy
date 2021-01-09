# Vstupní údaje
sazba_vydajovy_pausal = 0.60

# Konstanty pro rok 2021
sazba_dan = 0.15
sazba_zdravotni = 0.135
sazba_socialni = 0.292
sleva_na_poplatnika = 27840
sleva_na_dite = 15204
pausalni_dan = 65628
minimalni_zdravotni = 28716
minimalni_socialni = 31056

# Pomocné funkce
max(x, y) = (x > y ? x : y)

# Výpočet daní a pojištění
vydaje(prijmy) = sazba_vydajovy_pausal * prijmy
zisk(prijmy) = prijmy - vydaje(prijmy)
dan_z_prijmu(prijmy) = sazba_dan * zisk(prijmy)
vymerovaci_zaklad(prijmy) = 0.5 * zisk(prijmy)
zdravotni_pojisteni(prijmy) = max(minimalni_zdravotni, \
    sazba_zdravotni * vymerovaci_zaklad(prijmy))
socialni_pojisteni(prijmy) = max(minimalni_socialni, \
    sazba_socialni * vymerovaci_zaklad(prijmy))

# Výpočet slev na dani
sleva_na_deti(pocet) = \
    (pocet > 0 ? 15204 : 0) + \
    (pocet > 1 ? 19404 : 0) + \
    (pocet > 2 ? (pocet-2) * 24204 : 0)
dan_po_sleve_na_poplatnika(prijmy) = max(0, dan_z_prijmu(prijmy) - sleva_na_poplatnika)
dan_po_slevach(prijmy, pocet_deti) = dan_po_sleve_na_poplatnika(prijmy) - sleva_na_deti(pocet_deti)

# Výpočet trojkombinace
suma_odvody(prijmy, pocet_deti) = \
    dan_po_slevach(prijmy, pocet_deti) \
    + zdravotni_pojisteni(prijmy) \
    + socialni_pojisteni(prijmy)

# Kolik mi stát nechá
zbyly_prijem(prijem, pocet_deti) = \
    prijem - suma_odvody(prijem, pocet_deti)

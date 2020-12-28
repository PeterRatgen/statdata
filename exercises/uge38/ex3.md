# At komme i gang

Vi har importeret datasættet. Med `download.file`, `load` og printet starten af
data med `head(data)`. 
Vi har et sæt med `HM M HHM M M M`, formatteret som: `"H","M","M","H","H","M","M","M","M"`.
Hvor H er et hit og M er et miss. Ud fra det kan man udregne en stribelængde
(streak length). Ud fra det viste sæt har vi en streaklængde på: 1, 0, 2, 0, 0,
0.

Vi skal lave en funktion til at `calc_streak` til at udregne streak fra data
sættet.

**Opgave 1**  
I en streaklængde på én er det et mål og en misser. Med en streaklængde på nul
er der én misser.

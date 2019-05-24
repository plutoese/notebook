cd D:\github\notebook\Teaching\Courses\Undergraduate\Econometrics\data

clear
use RDCHEM

gen salesbil = sales / 1000
gen lsalesbil = log(salesbil)
gen salesbilsq = salesbil ^ 2

eststo clear
eststo: quietly regress rd sales 
eststo: quietly regress rd salesbil
eststo: quietly regress rd salesbil salesbilsq
eststo: quietly regress rd lsales 
eststo: quietly regress rd lsalesbil
esttab, se r2 ar2 sca(rss) nogaps

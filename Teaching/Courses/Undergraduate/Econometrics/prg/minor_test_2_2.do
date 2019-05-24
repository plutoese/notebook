cd D:\github\notebook\Teaching\Courses\Undergraduate\Econometrics\data

clear
use WAGE1

gen male = (!female)
gen single = (~married)
gen marrmale = (married & ~female)
gen marrfem = (married & female)
gen singfem = (female & ~married)
gen singmale = (~female & ~married)

eststo clear
eststo: quietly regress wage female 
eststo: quietly regress wage female educ
eststo: quietly regress wage female married marrfem
eststo: quietly regress wage singfem marrfem marrmale
esttab, se r2 ar2 sca(rss) nogaps

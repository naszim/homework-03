######################
# Házi feladat 3.    #
# Programozás I.     #
# 2016/17. II. félév #
# Nagy Szimonetta    #
# 2017-03-25         #
######################

#II/1. Készíts egy listát, ami 5 vektort tartalmaz. Mindegyik vektor hossza 
#legyen egy véletlenszerű 10 és 20 közötti szám. A vektorok (1,2) intervallumon 
#egyenletes eloszlásból származzanak.
l1 <- list(NULL)
for (i in 1:5) {
  l1[i] <- list(c(runif(sample(10:20, 1), 1, 2))) 
}
print(l1)
is.list(l1)

#II/2. Nézd meg for ciklussal, hogy az előbb létrehozott listának milyen 
#hosszúak az elemei! A végeredmény legyen egy vektor.
v1 <- vector("numeric", 5)
for (i in 1:5) {
  v1[i] <- c(length(l1[[i]]))
}
print(v1)
is.vector(v1)

#II/3. Nézd meg az apply függvénycsalád egy tagjával, hogy a listának milyen 
#hosszúak az elemei! A végeredmény legyen egy lista.
l2 <- lapply(l1, FUN = length)
print(l2)
is.list(l2)

#II/4. Nézd meg az apply függvénycsalád egy tagjával, hogy a listának milyen 
#hosszúak az elemei! A végeredmény legyen egy vektor.
l3 <- sapply(l1, FUN = length)
print(l3)
is.vector(l3)
#FELADAT VÉGE-------------------------------------------------------------------

#III/1. Hívd be a chickwts datasetet, amit az R alapból tartalmaz.
chickwts
View(chickwts)

#III/2. Nézd meg, mennyi az átlagsúlya a különbözőképp táplált csirkéknek! 
#Használd az aggregate függvényt!
wts_mean <- aggregate(chickwts$weight~chickwts$feed, chickwts, 
                                 FUN=mean, simplify = T)
View(wts_mean)


#III/3. Az előbb kapott aggregált data frame-et rendezd az átlagsúly szerint 
#csökkenő sorrendbe!
is.data.frame(wts_mean)
stulevel <- stulevel[order(stulevel$ability) , ]
wts_mean_ordered <- wts_mean[order(wts_mean$`chickwts$weight`, decreasing = T), 
                             ]
View(wts_mean_ordered)
#FELADAT VÉGE-------------------------------------------------------------------

#IV/1. Hozz létre egy 50 soros, 10 oszlopos mátrixot, aminek az értékei normális 
#eloszlásból származnak. Minden sor szórása legyen egyenlő a sor számával.
m1 <- matrix(data = NA, 50, 10)
for (i in 1:50) {
  m1[i, ] <- c(rnorm(n = 10, mean = 0, sd = i))
}
View(m1)

#IV/2. Számold ki for ciklussal minden sor szórását! A végeredmény legyen egy 
#vektor.
v2 <- vector("numeric", 50)
for (i in 1:50) {
  v2[i] <- sd(m1[i, ])
}
v2
is.vector(v2)

#IV/3. Számold ki az apply függvénycsalád egy tagjával minden sor szórását! 
#A végeredmény legyen egy vektor.
v3 <- apply(m1, 1, sd)
v3
is.vector(v3)

#IV/4. Normalizáld a mátrix értékeit -1-től 1-ig tartó intervallumra és nézd 
#meg a sorok átlagát!
m2 <- matrix(NA, 50, 10)
for (i in 1:50) {
  j <- c(1:10)
  average <- apply(m1, 1, mean)
  deviation <- apply(m1, 1, sd)
  m2[i, j] <- (m1[i, j]-average[i])/deviation[i]
  rm(average, deviation, j)
}
View(m2)
v4 <- apply(m2, 1, mean)
v4
#FELADAT VÉGE-------------------------------------------------------------------

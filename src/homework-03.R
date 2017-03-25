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

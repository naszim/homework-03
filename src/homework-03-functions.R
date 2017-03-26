#get_gender fv megírása
get_gender <- function(hero){
  hero_row <- subset.data.frame(comic_characters, comic_characters$name == hero)
  if (is.na(hero_row$gsm == T)) {gender <- hero_row$sex}
  else {gender <- hero_row$gsm}
  gender <- trimws(gsub("Cha.*", "\\1", gender), "r")
  as.vector(gender)
  return(gender)
}

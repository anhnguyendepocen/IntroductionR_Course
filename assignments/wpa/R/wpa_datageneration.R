

# WPA 6 [studentsurvey.txt]
{
set.seed(100)
# Study 1
N <- 100

df <- data.frame(sex = sample(c("m", "f"), size = N, replace = TRUE),
                 age = round(rnorm(N, mean = 23, sd = 2), 0),
                 major = sample(c("psychology", "economics", "biology", "chemistry"), 
                                size = N, replace = TRUE, 
                                prob = c(.7, .2, .05, .05)),
                 haircolor = sample(c("brown", "black", "red", "blonde"), size = N, replace = TRUE, prob = c(.4, .2, .05, .35)),
                 iq = round(rnorm(N, mean = 110, sd = 5), 0),
                 country = sample(c("switzerland", "germany", "austria", "italy"), size = N, replace = TRUE, prob = c(.6, .3, .05, .05)),
                 logic = round(rnorm(N, mean = 10, sd = 2), 2),
                 stringsAsFactors = FALSE
)

# siblings
#  ~ major

df$siblings[df$major == "psychology"] <- round(rnorm(sum(df$major == "psychology"), 
                                                     mean = 2.5, 
                                                     sd = 1), 0)

df$siblings[df$major != "psychology"] <- round(rnorm(sum(df$major != "psychology"), 
                                                     mean = 1.5, 
                                                     sd = 1), 0)

df$siblings[df$siblings < 0] <- 0

# multitasking
# ~ haircolor

df$multitasking <- NA
df$multitasking[df$haircolor == "blonde"] <- rnorm(n = sum(df$haircolor == "blonde"),
                                                   mean = 50, sd = 10)

df$multitasking[df$haircolor != "blonde"] <- rnorm(n = sum(df$haircolor != "blonde"),
                                                   mean = 45, sd = 10)

df$multitasking <- round(df$multitasking, 0)

# Parterns
#  ~ major
df$partners <- NA
df$partners <- df$age + df$iq / 5 + rnorm(N, mean = -38, sd = 2)

df$partners[df$major == "chemistry"] <- df$partners[df$major == "chemistry"] + 1
df$partners[df$major == "economics"] <- df$partners[df$major == "economics"] - .5

df$partners <- round(df$partners, 0)
df$partners[df$partners < 0] <- 0



# marijuana
# ~ major

df$marijuana <- NA
df$marijuana[df$major %in% c("biology", "chemistry")] <- sample(c(0, 1), size = sum(df$major %in% c("biology", "chemistry")), prob = c(.2, .8), replace = TRUE)
df$marijuana[df$major %in% c("psychology", "economics")] <- sample(c(0, 1), size = sum(df$major %in% c("psychology", "economics")), prob = c(.5, .5), replace = TRUE)


# risk
#  ~ age + iq

risk.prob <- 1 / (1 + exp(-(df$iq / 10 + df$age / 10 - 12)))

df$risk <- sapply(1:nrow(df), FUN = function(x) {sample(c(0, 1), 1, replace = TRUE, prob = c(risk.prob[x], 1 - risk.prob[x]))})
df$risk <- round(df$risk, 1)

write.table(df, file = "assignments/wpa/data/studentsurvey.txt", sep = "\t", row.names = FALSE)
}


# WPA 7 [facebook.txt]
{

set.seed(101)
recode.fun <- function(x, old, new) {
  
  
  for(i in 1:length(old)) {
    
    
    x[x == old[i]] <- new[i]
    
  }
  
  return(x)
  
}

# Study 1

N <- 500

facebook <- data.frame("sex" = sample(c("m", "f"), size = N, replace = T))

facebook$intelligence <- sample(c("1.low", "2.medium", "3.high"), size = N, replace = T)
# facebook$attractiveness <- sample(c("1.low", "2.medium", "3.high"), size = N, replace = T)
facebook$education <- sample(c("1.HighSchool", "2.Bachelors", "3.Masters", "4.PhD"), size = N, replace = T, prob = c(.2, .5, .2, .1))

facebook$age[facebook$education == "1.HighSchool"] <- rnorm(sum(facebook$education == "1.HighSchool"), mean = 19, sd = .5)
facebook$age[facebook$education == "2.Bachelors"] <- rnorm(sum(facebook$education == "2.Bachelors"), mean = 22, sd = .5)
facebook$age[facebook$education == "3.Masters"] <- rnorm(sum(facebook$education == "3.Masters"), mean = 24, sd = 1)
facebook$age[facebook$education == "4.PhD"] <- rnorm(sum(facebook$education == "4.PhD"), mean = 28.5, sd = 1)

facebook$age <- round(facebook$age, 0)

facebook$university <- sample(c("1.Basel", "2.Zurich", "3.Geneva"), size = N, replace = T)

facebook$attractiveness[facebook$university == "1.Basel"] <-  sample(c("1.low", "2.medium", "3.high"), size = sum(facebook$university == "1.Basel"), prob = c(.1, .1, .8), replace = T)
facebook$attractiveness[facebook$university == "2.Zurich"] <-  sample(c("1.low", "2.medium", "3.high"), size = sum(facebook$university == "2.Zurich"), prob = c(.33, .33, .33), replace = T)
facebook$attractiveness[facebook$university == "3.Geneva"] <-  sample(c("1.low", "2.medium", "3.high"), size = sum(facebook$university == "3.Geneva"), prob = c(.2, .5, .3), replace = T)


facebook$intelligence.num <- as.numeric(recode.fun(facebook$intelligence, c("1.low", "2.medium", "3.high"), c(-1, 0, 1)))
facebook$attractiveness.num <- as.numeric(recode.fun(facebook$attractiveness, c("1.low", "2.medium", "3.high"), c(-2, 0, 4)))
facebook$education.num <- as.numeric(recode.fun(facebook$education, c("1.HighSchool", "2.Bachelors", "3.Masters", "4.PhD"), c(-1, 0, 1, 2)))

# dateability.men

facebook$dateability.mean[facebook$sex == "f"] <- with(facebook[facebook$sex == "f",], intelligence.num * .1 + attractiveness.num * 4 + education.num)
facebook$dateability.mean[facebook$sex == "m"] <- with(facebook[facebook$sex == "m",], intelligence.num * 4 + attractiveness.num * 1 + education.num)

facebook$dateability.mean[facebook$sex == "f" & facebook$intelligence.num == 1] <- -3


facebook$dateability <- round(rnorm(N, mean = facebook$dateability.mean * 3 + 50, sd = 18), 0)

facebook$session <- rep(1:50, each = N / 50)


facebook$haircolor <- sample(c("blonde", "brown", "black", "red"), prob = c(.4, .5, .15, .05), replace = T)

facebook$shirtless[facebook$sex == "m"] <- sample(c("1.No", "2.Yes"), size = sum(facebook$sex == "m"), prob = c(.7, .3), replace = T)
facebook$shirtless[facebook$sex == "f"] <- sample(c("1.No", "2.Yes"), size = sum(facebook$sex == "f"), prob = c(.8, .2), replace = T)

facebook$dateability[facebook$shirtless == "2.Yes" & facebook$sex == "m"] <- facebook$dateability[facebook$shirtless == "2.Yes" & facebook$sex == "m"] - 20
facebook$dateability[facebook$shirtless == "2.Yes" & facebook$sex == "f"] <- facebook$dateability[facebook$shirtless == "2.Yes" & facebook$sex == "f"] + 30



facebook$dateability[facebook$dateability < 0] <- 0
facebook$dateability[facebook$dateability > 100] <- 100


facebook <- facebook[c("session", "sex", "age", "haircolor", "university", "education", "shirtless", "intelligence", "attractiveness", "dateability")]

write.table(facebook, file = "assignments/wpa/data/facebook.txt", sep = "\t", row.names = FALSE)

}

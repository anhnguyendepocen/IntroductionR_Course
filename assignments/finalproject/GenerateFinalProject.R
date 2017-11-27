# Generate random data for a final project


# Data description

# These data represent the result of an experiment on priming. The goal of the study is to see if and how subliminal primes affect behavior.
# In the experiment, participants were given the following instructions:
#   
#   "In your task, you will be briefly see X boxes on your screen. You need to remember the locations of these boxex. When the boxes disappear, 
# your goal is to click on the screen X times in the location of the boxes. If all of your clicks are within the locations of the boxes that 
# were presented, you will earn a bonus. If any of your clicks are not within the boxes, you will not earn a bonus."
# 
# After reading the instructions, participants were given a subliminal prime. That is, a word was briefly displayed on their screen for 100ms. 
# This was fast enough that participants could not consciously see the word, but slow enough that they could be unconsciously perceived.
# 
# After the subliminal prime was displayed, participants were asked to rate how confident they would be that they would click on all of the 
# boxes on a scale from 1 to 100 with 1 being not confident at all, and 100 being extremely confident.
# 
# When participants were ready, they clicked a button called "Show the boxes". After clicking this button, participants were shown the locations 
# of the boxes for 2 seconds. The boxes then disappeared, and participants could then click on the screen to indicate where they thought the boxes 
# were. When they were finished, they completed a brief survey.
# 
# There were 3 main manipulations in the experiment. 
# 
# IV 1: The number of boxes presented to the participant. The more boxes presented, the more difficult the task was.
# IV 2: The word that participants were primed with. The most important word was "accurate" as this was expected to increase performance. Other words were used as controls.
# IV 3: The color of the subliminal word that was presented. While there is prior research showing that subliminal primes can affect behavior, no research has tested if
# the color of subliminal primes has an effect on their influence.
# 
# Here are the main dependent variables in the experiment.
# 
# DV 1: Did the participant accurately click on all of the box locations? 
# DV 2: How confident was the participant that they would click on all of the box locations?
# DV 3: How long did it take for the participant to complete the task?
# DV 4: How interested was the participant in the task?
# 
# 
# ## DATA
# The final dataset is in priming.txt. Here is a description of the columns of the data:
#   
# id: A random id for the participants given in the order in which they completed the study.
# sex: The sex of the participant (0 = male, 1 = female)
# age: The age of the participant
# race: The race of the participant
# color: The color of the word presented to the part
# word: The subliminal word presented to the participant
# education: The participants highest level of education
# boxes: How many boxes were presented to the participant? 
# accuracy: Did the participant correctly click on each box? 0 = no, 1 = yes
# confidence: How confident was the participant that they would click on all of the boxes? 1 = not confident at all, 100 = very confident.
# rt: How long did it take the participant to click the boxes? Measured in milliseconds.
# interest: How interested was the participant in the task? 1 = not at all, 7 = very interested.


GenerateFinalProject <- function(my.id = NULL,  # Randomization seed
                                 write = FALSE,
                                 cases.n = NULL,  # Number of cases
                                 add.na = TRUE,   # Should missing values be added?
                                 include.names = FALSE, # Should column names be included?
                                 return.data = FALSE   # Should dataframe be returned by this function?
 ) { # Should data be written to a text file?
  
  # If no randomization seed was specified, then create one
  if(is.null(my.id)) {
    
    message("You did not specify your id with the my.id argument! By not doing this, the data will change every time you run this function.")
    
    my.id <- sample(100:999, size = 1)
    
    }
  
  # Set the seed
  set.seed(my.id)
  
  # Determine the number of cases
  if(is.null(cases.n)) {
    
    cases.n <- round(rnorm(1, mean = 500, sd = 50), 0)
    
    }
  
  cond.A.n <- 2   # How many levels of condition B will there be in the experiment?
  cond.word.n <- 4   # How many levels of condition B will there be in the experiment?
  cond.education.n <- 4   # How many levels of condition B will there be in the experiment?
  
  # Determine parameters of dependent variables
  confidence.v.mean <- rnorm(1, mean = 100, sd = 5)
  confidence.v.sd <- rnorm(1, mean = 10, sd = 1)
  rt.v.mean <- rnorm(1, mean = 1000, sd = 50)
  rt.v.sd <- rnorm(1, mean = 50, sd = 5)
  age.mean <- rnorm(1, mean = 25, sd = 2)
  age.sd <- rnorm(1, mean = 2, sd = .5)
  
  # Population values of conditions A and B
  cond.A.pop <- c("green", "red", "blue", "orange", "yellow", "black", "brown", "white")
  cond.word.pop <- c("glasses", "cannon", "broom", "candle", "paper", "ship", "eyepatch")
  cond.education.pop <- c("BA", "MS", "PhD", "HighSchool")
  
  # Values of conditions A and B used in the current study
  cond.color.values <- sample(cond.A.pop, size = cond.A.n, replace = FALSE)
  cond.word.values <- c("accurate", sample(cond.word.pop, size = cond.word.n - 1, replace = FALSE))
  cond.education.values <- sample(cond.education.pop, size = cond.education.n, replace = FALSE)
  
  # Determine sex
  sex.v <- sample(c(0, 1), size = cases.n, replace = TRUE)
  
  # Determine race
  race.v <- sample(c("white", "black", "asian", "hispanic", "other"), 
                   size = cases.n, replace = TRUE, 
                   prob = c(.5, .2, .1, .1, .1))
  
  # Determine age
  age.v <- round(rnorm(cases.n, age.mean, sd = age.sd), 0)
  
  # Determine values of B
  education.v <- sample(cond.education.values, size = cases.n, replace = TRUE)
  
  # Determine box sizes
  boxn.v <- rep(1:5, length.out = cases.n)
  
  # Determine values of color.v
  color.v <- sample(cond.color.values, size = cases.n, replace = TRUE)
  
  # Determine values of B
  word.v <- sample(cond.word.values, size = cases.n, replace = TRUE)
  
  # Determine accuracy.v as a function of boxsize
  
  accuracy.p <- 1 / (1 + exp(-(-boxn.v + age.v / 10)))
  accuracy.v <- sapply(1:cases.n, FUN = function(x) {
    
    sample(c(0, 1), 
           size = 1, 
           replace = TRUE, 
           prob = c(1 - accuracy.p[x], accuracy.p[x]))})
  
  # Determine confidence.v as a function of color.v and box.n
  
  confidence.v <- rep(NA, cases.n)
  
  confidence.v[color.v == cond.color.values[1]] <- round(rnorm(n = sum(color.v == cond.color.values[1]), 
                                                               mean = confidence.v.mean - .5 * confidence.v.sd,
                                                               sd = confidence.v.sd), 0)
  
  confidence.v[color.v == cond.color.values[2]] <- round(rnorm(n = sum(color.v == cond.color.values[2]), 
                                                               mean = confidence.v.mean + .5 * confidence.v.sd,
                                                               sd = confidence.v.sd), 0)
  
  confidence.v <- confidence.v - 25 * boxn.v
  
  # Rescale to 0 to 100
  
  confidence.v <- (confidence.v - min(confidence.v)) / (max(confidence.v) - min(confidence.v)) * 100
  confidence.v <- round(confidence.v, 0)
  
  # Determine rt.v as a function of confidence and boxn.v
  
  rt.v <- round(rnorm(n = cases.n, mean = rt.v.mean, sd = rt.v.sd), 0)
  rt.v <- rt.v + 10 * boxn.v - confidence.v * 5 + rnorm(cases.n, mean = 0, sd = .5 * rt.v.sd)
  
  ## lik.v as a function of confidence, sex, and age
  
  lik.v <- round(confidence.v / 10 + sex.v * 5 + age.v / 10 + rnorm(cases.n, 0, 2), 0)
  lik.v <- (lik.v - min(lik.v, na.rm = TRUE)) / (max(lik.v, na.rm = TRUE) - min(lik.v, na.rm = TRUE)) * 6 + 1
  lik.v <- round(lik.v, 0)
  
  # Add some missing values
  
  if(add.na) {
  
  accuracy.v[sample(cases.n, size = sample(0:5, size = 1), replace = FALSE)] <- NA
  race.v[sample(cases.n, size = sample(0:5, size = 1), replace = FALSE)] <- NA
  color.v[sample(cases.n, size = sample(0:5, size = 1), replace = FALSE)] <- NA
  education.v[sample(cases.n, size = sample(0:5, size = 1), replace = FALSE)] <- NA
  accuracy.v[sample(cases.n, size = sample(0:5, size = 1), replace = FALSE)] <- NA
  confidence.v[sample(cases.n, size = sample(0:5, size = 1), replace = FALSE)] <- NA
  rt.v[sample(cases.n, size = sample(0:5, size = 1), replace = FALSE)] <- NA
  lik.v[sample(cases.n, size = sample(0:5, size = 1), replace = FALSE)] <- NA
  
  }
  
  # Create the final dataframe
  
  final.df <- data.frame(id = 1:cases.n,
                         sex = sex.v,
                         age = age.v,
                         race = race.v,
                         color = color.v,
                         word = word.v,
                         education = education.v,
                         boxes = boxn.v,
                         accuracy = accuracy.v,
                         confidence = confidence.v, 
                         rt = rt.v,
                         interest = lik.v,
                         stringsAsFactors = FALSE)
  
  if(include.names == FALSE) {
    
    
    names(final.df) <- paste0("V", 1:ncol(final.df))
    
  }
  
  # Write final dataframe to a file called priming_XXX.txt
  
  if(write) {
    
    write.table(final.df, 
                file = paste("priming_", my.id, ".txt", sep = ""), 
                sep = "\t")
    
    message(paste0("The data are now stored in a file called priming_", my.id, ".txt in your working directory (", getwd(), ")"))
    }
  
  
  if(return.data) {
    
  return(final.df)
    
  }
    
}





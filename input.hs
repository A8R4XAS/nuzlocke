import System.Random (randomIO, randomR, getStdRandom)


{-
regel einlesen txt atei
modul welches dann processing zur verfuegung stellen
-}



--Umlaute werden noch nicht erkannt
readChallenges = do
    file <- readFile "challenges"
    let listOfLines = lines file
    return listOfLines



readPunishment = do
    file <- readFile "punishment"
    let listOfLines = lines file
    return listOfLines




readRules =  do
    file <- readFile "rules"
    let listOfLines = lines file
    return listOfLines




giveRandomElementFromChallenges:: IO String 
giveRandomElementFromChallenges = do
    list   <- readChallenges
    ranDom <- getStdRandom (randomR (0,(length list )-1))
    let y = list !! ranDom
    return y


giveRandomElementFromPunishment:: IO String 
giveRandomElementFromPunishment = do
    list   <- readPunishment
    ranDom <- getStdRandom (randomR (0,(length list )-1))
    let y = list !! ranDom
    return y


giveRandomElementFromRules:: IO String 
giveRandomElementFromRules = do
    list   <- readRules
    ranDom <- getStdRandom (randomR (0,(length list )-1))
    let y = list !! ranDom
    return y


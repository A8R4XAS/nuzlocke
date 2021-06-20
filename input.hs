import System.Random (randomIO, randomR, getStdRandom)


{-
regel einlesen txt atei
modul welches dann processing zur verfuegung stellen
-}


readType = do
    file <- readFile "type"
    let listOfLines = lines file
    return listOfLines

readReward = do
    file <- readFile "reward"
    let listOfLines = lines file
    return listOfLines
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




giveRandomElementFromChallenges :: IO String 
giveRandomElementFromChallenges = do
    list   <- readChallenges
    ranDom <- getStdRandom (randomR (0,(length list )-1))
    let y = list !! ranDom
    return y


giveRandomElementFromPunishment :: IO String 
giveRandomElementFromPunishment = do
    list   <- readPunishment
    ranDom <- getStdRandom (randomR (0,(length list )-1))
    let y = list !! ranDom
    return y


giveRandomElementFromRules :: IO String 
giveRandomElementFromRules = do
    list   <- readRules
    ranDom <- getStdRandom (randomR (0,(length list )-1))
    let y = list !! ranDom
    return y

giveRandomElementFromTypes :: IO String 
giveRandomElementFromTypes = do
    list   <- readType
    ranDom <- getStdRandom (randomR (0,(length list )-1))
    let y = list !! ranDom
    return y

giveRandomElementFromReward :: IO String 
giveRandomElementFromReward = do
    list   <- readReward
    ranDom <- getStdRandom (randomR (0,(length list )-1))
    let y = list !! ranDom
    return y

giveRandomGameSpeedreduce :: IO Int
giveRandomGameSpeedreduce = do
 ranDomInt <- getStdRandom (randomR (25, 75))
 return ranDomInt


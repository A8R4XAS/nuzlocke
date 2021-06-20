import System.Random
{-
random regel ausgabe
hi
-}

regeln :: [ String ]
regeln = ["Permadeath", "Nur das erste Pokemon pro Route darf gefangen werden", "Spietznamen sind Pflicht",
          "Thema-Team","Pro Typ maximal ein Pokemon, erster Typ zaehlt" ,"Keine Flucht vor wilden Pokemon", 
          "Routen nur zu Fuß verlassen", "keine Items verwenden", "nächster Arenakampf ohne Gehaltene Items",
          "keine Z-Attacken oder Mega-Entwicklung beim Arenakampf"]

--random Int between MIN & MAX Int
ranInt = (randomIO :: IO Int) >>= print

ranRangeInt l u = randomRIO (l , u)

f :: Monad m => m a -> a 
f m = a
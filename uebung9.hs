--module Main where
module Uebung9 where
import System.Random (randomIO)
import Data.Char (toUpper)
import Control.Monad

{-
Übung zur Vorlesung
Funktionale Programmierung
Sommersemester 2021
Übungsblatt 9
-}

{-
Block: 2
Ausgabe: 11.06.2021
Abgabe: Bis 23:59h am 17.06.2021 im ASSESS (https://ess.cs.tu-dortmund.de/ASSESS)
-}

{-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Nach der Bearbeitung einzelner Aufgaben, sowie nach der Bearbeitung aller
Aufgaben sollte diese Datei kompilieren.
Ist dies nicht der Fall, sollten Sie ihre Lösung(en) überdenken.
Falls Sie eine Aufgabe nicht lösen können, so kommentieren Sie bitte Ihren
Lösungsversuch einfach wieder aus. Wir werden uns ihre Lösungen, sowie
auskommentierte Teillösungen anschauen.

Bitte achten Sie darauf immer kompilierende Dateien abzugeben!
Geben Sie nur Quellcode und Kommentare als .hs Dateien ab. Abgaben als
kompiliertes Programm (.ho, .exe, ...) oder in anderen Formaten (z.B.
.doc, .pdf, ...) werden nicht akzeptiert.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-}

{-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Hinweis:
Sie dürfen alle Funktionen des Prelude zur Definition nutzen, sofern in der
Aufgabenstellung keine explizite Einschränkung gemacht wurde.
Nutzen Sie also eventuell die in uebung0.hs vorgestellten Wege, um
geeignete Funktionen zu finden, die bereits im Prelude implementiert sind.
Sie dürfen zusätzliche hilfreiche Funktionen natürlich auch selber implementieren.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-}

{-
Aufgabe 9.1 (10 Punkte) - Maybe-Monade
-}
{-
Gegeben seien folgende drei partielle Funktionen:
-}

logarithmus :: Float -> Maybe Float
logarithmus x | x <= 0    = Nothing
              | otherwise = Just (log x)

quadratwurzel :: Float -> Maybe Float
quadratwurzel x | x < 0    = Nothing
                | otherwise = Just (sqrt x)

kehrwert :: Float -> Maybe Float
kehrwert x | x == 0 = Nothing
           | x /= 0 = Just (1 / x)

{-
Implementieren Sie drei partielle Funktionen
fCase, fBind, fDo :: Float -> Maybe Float,
die jeweils den Kehrwert der Wurzel des Logarithmus’ ihres Arguments berechnen.
Formulieren Sie die drei semantisch äquivalenten Funktionen wie folgt:

1. Benutzen Sie die case-Syntax zur Fehlerbehandlung in der Funktion fCase.
2. Benutzen Sie die (>>=)-Notation zur Fehlerbehandlung in der Funktion fBind.
3. Benutzen Sie die do-Notation zur Fehlerbehandlung in der Funktion fDo.
-}


{-
Aufgabe 9.2 (20 Punkte) - Hangman
-}



  {-
  Dictionary einlesen und zufällig ein Wort aus der Liste auswählen.
  readDictionary: Ließt Datei ein
  giveRandomElement: greift auf ein zufälliges Feld zu indem es eine Zufallszahl
                     in der Range von 0 bis Feldlänge-1 erzeugt
    -}

--Umlaute werden noch nicht erkannt
readDictionary = do
    file <- readFile "9blatt/uebung9/dictionary"
    let listOfLines = lines file
    return listOfLines


giveRandomElement:: IO String 
giveRandomElement = do
    list   <- readDictionary
    ranDom <- getStdRandom (randomR (0,(length list )-1))
    let y = list !! ranDom
    return y





{-
Implementieren Sie das Spiel Hangman. Eine Beschreibung des Spiels finden Sie auf
folgender Webseite: http://de.wikipedia.org/wiki/Galgenmännchen.
Das Spiel soll interaktiv in der Konsole spielbar sein und selbstständig auf
Tastatureingaben vom Benutzer reagieren.
Beim Programmstart soll eine Datei "dictionary" mit den möglichen Wörtern eingelesen werden.
uebung9.hs wurde mit einer Beispieldatei "dictionary" gezippt.

Sie können die Funktion randomIO :: IO a aus dem Modul System.Random nutzen,
um eine Zufallszahl zu erhalten, mit der Sie zufällig ein Wort aus der Datei auswählen.

Die Funktion toUpper :: Char -> Char aus dem Modul Data.Char steht Ihnen ebenfalls
zur Verfügung.

Wenn Sie ihr Spiel kompilieren und nicht nur interpretieren wollen, dann dürfen Sie gerne
am Anfang der Datei den Namen des module von Uebung9 zu Main ändern.

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Kommentieren Sie Ihren Code so ausführlich wie möglich!

Unkommentierter Code wird mit 0 Punkten bewertet.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-}

{-
Anmerkung: Das Paket System.Random ist abhängig vom System und der Installation
von Haskell manchmal nicht direkt verfügbar.
Diese Aufgabe ist also eine sehr "praxisnahe" Programmieraufgabe :)
Sollte System.Random bei Ihnen nicht direkt verfügbar sein, dann sehen Sie es bitte als
Teil der Aufgabe es auf Ihrem System entsprechend verfügbar zu machen.
Sollte es hierbei Probleme geben, dürfen Sie gerne eine Mail schreiben oder in den Übungen
nachfragen.

Im Zweifelsfall kommentieren Sie "import System.Random" aus und lösen einfach diese
Aufgabe mit einem "festen" Wert, testen das und schreiben in einem Kommentar, wie der
Aufruf mit randomIO aussehen müsste und warum Sie diesen nicht nutzen konnten.
-}


{-
Aufgabe * (Bonus-Aufgabe) (5 Punkte)
-}
{-
In uebung7.hs haben wir den Datentyp BinBaum a für Binärbäume kennengelernt.
Machen Sie BinBaum zu einer Instanz der Typklassen Functor, Applicative und Monad.

Bei der Instanziierung von Applicative und Monad müssen Sie sich eine sinnvolle
Definition für (<*>) und (>>=) überlegen.
Hier gibt es theoretisch mehrere Möglichkeiten. Erläutern Sie daher Ihre
Implementierung in Kommentaren und geben Sie eine sinnvolle Begründung, warum Sie
sich für Ihre Definition von (<*>) und (>>) entschieden haben.
-}

data BinBaum a = Leaf a | Fork a (BinBaum a) (BinBaum a) deriving Show

foldBaum :: (a -> b) -> (a -> b -> b -> b) -> BinBaum a -> b
foldBaum leaf fork (Leaf a) = leaf a
foldBaum leaf fork (Fork a l r) = fork a (foldBaum leaf fork l) (foldBaum leaf fork r)

bspBaum = Fork 0 (Fork 1 (Leaf 3) (Leaf 5)) (Fork 2 (Leaf 4) (Leaf 6))


module Practica01 where

--TIPOS ALGEBRAICOS

--Ejercicio 1
data Shape = Circle Float | --representa el radio
            Square Float | --representa un lado
            Rectangle Float Float| --representa base y altura
            Triangle Float | --representa un lado
            Trapeze Float Float Float --representa base mayor, base menor y altura
            deriving (Show)

{-
Nota: Para el calculo de perimetro, cambie el nombre de los parametros 
por su version en ingles para evitar confusiones con las entradas de la funcion
area.
Area de figuras recuperado de: https://www.webcolegios.com/file/3513b6.pdf 
-}

--Funcion que calcula el area de las figuras
area :: Shape -> Float
--Circulo
area (Circle radio) =  pi *  radio ** 2
--Cuadrado
area (Square lado) = lado * lado 
--Rectangulo
area (Rectangle base altura) = base * altura  
--Triangulo
area (Triangle side) = ((sqrt 3) / 4) * (side ** 2)
--Trapecio
area (Trapeze mayor menor altura) =  ((mayor + menor) * altura) / 2


--Funcion que calcula el perimetro de las figuras
perimeter :: Shape -> Float
--Circulo
perimeter (Circle radius) =  (2 * pi) * radius
--Cuadrado
perimeter (Square sideS) = 4 * sideS
--Rectangulo
perimeter (Rectangle baseR heightR) = (2 * baseR) + (2 * heightR)
--Triangulo
perimeter (Triangle sideT) = 3 * sideT
--Trapecio
{-
Al trabajar con un isoceles, podemos asumir que la altura es igual al lado c que falta 
Fuente de consulta: https://www.universoformulas.com/matematicas/geometria/perimetro-trapecio/
-}
perimeter (Trapeze maximum minimum heightTrap) = maximum + minimum + (2 * heightTrap)


--Ejercicio 2 (Les toca arreglar el sinonimo)
type Point = (Float, Float)

-- Funcion para calcular la distancia entre dos puntos
distance :: Point -> Point -> Float
distance (x1, y1) (x2, y2) = sqrt ((x2 - x1)^2 + (y2 - y1)^2)

--Funcion para calcular la distancia de un punto al origen
from0 :: Point -> Float
from0 (x, y) = sqrt ((x ^ 2) + (y ^ 2)) 

--Ejercicio 3
--Falta definir la variable houseShape y su tipo (conviene revisar las pruebas unitarias para eso, no basta con colocar Shape)
--Para la localizacion es probable que su firma deba pasar de (Int,Int) a Point 
data Haskellium = Haskellium {name :: String,
                              lastname1 :: String,
                              lastname2 :: String,
                              location :: (Int,Int)
                              }
--Variable global guia
hiroshi = (Haskellium{name = "Hiroshi", lastname1 = "Yoshimura", lastname2 = "non-existent", location = (19,93)})


--Funcion para regresar el hijo de dos Haskelliums dado su nombre
son :: Haskellium -> Haskellium -> String -> Haskellium
son = undefined

--Funcion para calcular las unidades para construir la casa de un Haskellium
houseCost :: Haskellium -> Float
houseCost = undefined

--Funcion para calcular el tiempo que le toma a un Haskellium para llegar a su trabajo
timeToWork :: Haskellium -> Float
timeToWork = undefined

--LISTAS Y FUNCIONES
--Ejercicio 1
palindromo :: String -> Bool
palindromo = undefined

--Ejercicio 2
myFoldr :: (a -> b -> b) -> b -> [a] -> b 
myFoldr f r [] = r
myFoldr f r [a:xs] = f r (myFoldr f r xs)

--Ejercicio 3
conjuntoPotencia :: [a] -> [[a]]
conjuntoPotencia = undefined

--ARBOLES

--Implementacion

data OneTwoTree a = Undefinedd

--Ejercicio 2
suma :: OneTwoTree Int -> Int
suma = undefined

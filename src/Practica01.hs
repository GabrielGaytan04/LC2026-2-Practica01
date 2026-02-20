module Practica01 where

--TIPOS ALGEBRAICOS

--Ejercicio 1
data Shape = Circle Float | --representa el radio
            Square Float | --representa un lado
            Rectangle Float Float| --representa base y altura
            Triangle Float | --representa un lado
            Trapeze Float Float Float --representa base mayor, base menor y altura
            deriving (Show,Eq)

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
NOTA: Difiere con los resultados del test en unas cuantas decimas. Asi que conviene revisar
ese punto.
-}
perimeter (Trapeze maximito minimito heightTrap) = maximito + minimito + (2 * heightTrap)


--Ejercicio 2 
type Point = (Float, Float)

-- Funcion para calcular la distancia entre dos puntos
distance :: Point -> Point -> Float
distance (x1, y1) (x2, y2) = sqrt (((x2 - x1)**2) + ((y2 - y1)**2))

--Funcion para calcular la distancia de un punto al origen
from0 :: Point -> Float
from0 (x, y) = sqrt ((x ** 2) + (y ** 2)) 

--Ejercicio 3
data Haskellium = Haskellium {name :: String,
                              lastName1 :: String,
                              lastName2 :: String,
                              location :: Point,
                              houseShape  :: Shape
                              }

{-NOTA: Hola, si quieres revisar el funcionamiento de un haskellium, escribimos un par de ejemplos.
En particular, si deseas probar una funcion escribe el nombre de esta y alguno de las personas aqui.
(Recomendamos que lo pruebes con HouseCost, ya que los datos coinciden con los visstos en las pruebas unitarias)
-}                              
akira = Haskellium {name = "Akira", lastName1 = "Yamaoka", lastName2 = "non-Existent", location = (19,97), houseShape = Square 10}
hiroshi = Haskellium {name = "Hiroshi", lastName1 = "Yoshimura", lastName2 = "non-Existent", location = (19,93), houseShape = Rectangle 20 8 }

--Funcion para regresar el hijo de dos Haskelliums dado su nombre
son :: Haskellium -> Haskellium -> String -> Haskellium
son p1 p2 childName = Haskellium{
                          name = childName,
                          lastName1 = lastName1 p1,
                          lastName2 = lastName1 p2,
                          location = location p1,
                          houseShape = houseShape p1
                      }
                      
                
--Funcion para calcular las unidades para construir la casa de un Haskellium
houseCost :: Haskellium -> Float
houseCost haskman = (area(houseShape haskman)) + ((perimeter(houseShape haskman)) * 2.5) 


-- Funcion auxiliar para determinar la velocidad del haskellium.
-- Para la funcion timeToWork
-- Abrevie haskellium a hk.
speed :: Haskellium -> Float
speed hk = if home < 300 then 30 else 70
             where home = from0 (location hk)
             
--Funcion para calcular el tiempo que le toma a un Haskellium para llegar a su trabajo
timeToWork :: Haskellium -> Float
timeToWork haskellium = from0 (location haskellium) / speed haskellium

--LISTAS Y FUNCIONES
--Ejercicio 1
palindromo :: String -> Bool
palindromo (x:xs) = if (x:xs) == voltear (x:xs) then True else False

-- Funcion auxiliar que voltea una lista, empieza del final al inicio
-- Para el ejercicio 1, funcion palindromo
voltear :: [a] -> [a]
voltear (x:[]) = [x]
voltear (x:xs) = voltear xs ++ [x]

--Ejercicio 2
--La implementacion actual rroja warning porque "la variale f no es usada" (De acuerdo con el interprete)
myFoldr :: (a -> b -> b) -> b -> [a] -> b 
myFoldr f r [] = r
myFoldr f r (a:xs) = f a (myFoldr f r xs)

--Ejercicio 3

conjuntoPotencia :: [a] -> [[a]]
--Caso base (Lista vacia)
conjuntoPotencia [] = [[]]
--Caso recursivo 
{-
La definicion solicita solo una concatenacion entre dos lista: 
Una lista de listas por comprension de los elementos que contengan al primer elemento y la lista de listas  que no contenga al primero.
-}
conjuntoPotencia (x:xs) = [x : ys | ys <- conjuntoPotencia xs] ++ conjuntoPotencia xs  

--ARBOLES

--a: Definicion del arbol
{-
 La implementacion actual compila.
-} 
data OneTwoTree a = Void | Node a (OneTwoTree a) | Branch a (OneTwoTree a) (OneTwoTree a)

{-
--Ejercicio 2
-- v el valor actual
-}
suma :: OneTwoTree Int -> Int
suma Void = 0
suma (Node v tree) = v + suma tree 
suma (Branch v t1 t2) = v + suma t1 + suma t2

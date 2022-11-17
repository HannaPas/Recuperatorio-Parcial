import Data.List (intersect)
-- defino el data Medico con los atributos de cada medico
data Medico = UnMedico{
    nombre :: String,
    especialidades :: [String],
    añosEspecialidad :: [Int],
    edad :: Int
} deriving(Show, Eq, Ord)

    
-- Ejemplos de algunos medicos 
maria :: Medico
maria = UnMedico {
    nombre = "Maria",
    especialidades = ["ginecologa", "obtetricia" , "gastroenterologa"],
    añosEspecialidad = [ 5 , 6 , 7] , --asumo que la lista esta en orden de acuerdo a la lista especialidad--
    edad = 30
}

juan :: Medico
juan = UnMedico {
    nombre = "Maria",
    especialidades = ["pediatra"],
    añosEspecialidad = [ 5 , 6, 7], --asumo que la lista esta en orden de acuerdo a la lista especialidad--
    edad = 25
}

-- no hay medicos de esas especialidades
noHayMedicos :: [Medico] -> [[String]] -> Bool
noHayMedicos  medicos especialidades =  intersect (especialidades) (filtrarEspecialidad medicos) ==  []

filtrarEspecialidad :: [Medico] -> [[String]]
filtrarEspecialidad medicos = map especialidades medicos

concatenarListas :: [Medico] -> [String]
concatenarListas medicos = concat (filtrarEspecialidad medicos)

-- medicos con mas de 1 especialidad
masDeUnaEspecialidad :: Medico -> Bool
masDeUnaEspecialidad medico = length (especialidades medico) >= 2 
--------------------------------------------------------------------------------
--nuevaEspecialidad (nutricionista)
--agrego a la lista del año especialidad un cero por no tener experiencia,
-- asumiendo que la lista armada coincide el orden de cada especialidad con el orden de la lista de añosEspecialidad
nutricionista :: Medico -> Medico
nutricionista medico | esNutricionista medico = medico 
                     | otherwise = medico {especialidades = especialidades medico  ++ ["nutricionista"] , añosEspecialidad = añosEspecialidad medico ++ [0]}

-- determinar si entre sus especialidades encontramos nutricionista

esNutricionista :: Medico -> Bool
esNutricionista medico = elem "nutricionista" (especialidades medico)

-- malapraxis le quita todas las especialidades a un medico
malapraxis :: Medico -> Medico
malapraxis medico = medico { especialidades = []}

-- aumento en 1 la edad y cada año de la especialidad en 1
cumpleaños :: Medico -> Medico
cumpleaños medico =  medico{edad = edad medico + 1 , añosEspecialidad = sumar1 medico}

--funcion que me permite sumar 1 año a cada año de especialidad
sumar1 :: Medico -> [Int]
sumar1 medico = map (+1) (añosEspecialidad medico) 
 
-- estudian georntologia medicos

estudiarGerontologia :: [Medico] -> [Medico]
estudiarGerontologia medicos = filtrarOncologos medicos

-- filtro si cumple que es oncologo
filtrarOncologos :: [Medico] -> [Medico]
filtrarOncologos medicos = filter esOncologo medicos

-- determino si un medico es oncologo
esOncologo :: Medico -> Bool
esOncologo medico = elem "oncologo" (especialidades medico)

-- determino si los medicos que se llaman leopoldo

esLeopoldo :: Medico -> Bool
esLeopoldo medico = "Leopoldo" == nombre medico

juiciomalapraxis :: [Medico] -> [Medico]
--aplico malapraxis a todos los que se llamen Leopoldo
juiciomalapraxis medicos = map malapraxis (filter esLeopoldo medicos)

-- cambiar nombre del medico en caso que tenga 2 especialidades
cambiarNombre :: Medico -> String -> Medico
cambiarNombre medico nuevoNombre 
 | masDeUnaEspecialidad medico = medico {nombre = nuevoNombre}
 | otherwise = medico
 
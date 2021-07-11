--A
SELECT DISTINCT Estudio.nomeEst, filme.tituloOriginal, GeneroFilme.genero, ator.nomeArt
FROM estudio 
INNER JOIN filme ON (filme.nomeEst = estudio.nomeEst)
INNER JOIN generoFilme ON (generoFilme.tituloOriginal = filme.tituloOriginal)
INNER JOIN personagem ON (personagem.tituloOriginal = filme.tituloOriginal)
INNER JOIN ator ON (ator.numID = personagem.numID)
WHERE generofilme.genero = 'Fantasia' AND ator.nomeart = "Linda Hamilton";

--B
SELECT DISTINCT ator.nomeArt, filme.tituloOriginal, personagem.cache            
FROM personagem
INNER JOIN filme ON (filme.tituloOriginal = personagem.tituloOriginal)
INNER JOIN ator ON (ator.numID = personagem.numID)
WHERE filme.tituloOriginal = 'Terminator 2: Judgement Day'
ORDER BY cache DESC;

--C
SELECT filme.tituloOriginal, filme.nomeReal, filme.custo FROM filme
INNER JOIN generoFilme ON (filme.tituloOriginal = generoFilme.tituloOriginal)
WHERE generofilme.genero = 'Aventura' AND filme.nomeReal = 'Ron Howard';

--D
SELECT realizador.nomeReal, filme.tituloOriginal, ator.nomeArt FROM realizador
INNER JOIN pode ON (pode.nomeReal = realizador.nomeReal)
INNER JOIN ator ON (ator.numID = pode.numID)
INNER JOIN filme ON (filme.nomeReaL = realizador.nomeReal)
WHERE EXISTS (SELECT pode.nomeReal FROM pode WHERE pode.nomeReal = Realizador.nomeReal);

--E
SELECT filme.tituloOriginal FROM filme 
INNER JOIN distribui ON (distribui.tituloOriginal = filme.tituloOriginal)
WHERE filme.nomeEst = '20th Century Fox' 
AND distribui.codCine = 10;


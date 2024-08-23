SELECT campanha.Nome, campanha_usuario.*, usuario.email
FROM campanha
INNER JOIN campanha_usuario ON campanha.id = campanha_usuario.Campanha_id
INNER JOIN usuario ON campanha_usuario.usuarios_id = usuario.id
WHERE campanha_usuario.usuarios_id IN (
'394   ',
'1026  ',
'66578 ');

-------------------------------------


SELECT campanha.Nome, campanha_usuario.*, usuario.nome
FROM campanha
INNER JOIN campanha_usuario ON campanha.id = campanha_usuario.Campanha_id
INNER JOIN usuario ON campanha_usuario.usuarios_id = usuario.id
WHERE campanha.Nome = '8888'
AND usuario.id IN ()

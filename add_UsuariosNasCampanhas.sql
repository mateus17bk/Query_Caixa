INSERT INTO campanha_usuario (usuarios_id, Campanha_id)
SELECT u.id, <id_campanha> 
FROM usuario u 
WHERE u.nivel = 'AGENTE' 
AND u.email IN (
    'P993240',
    'P504101',
    'P710821'

)
AND NOT EXISTS (
    SELECT 1 FROM campanha_usuario cu WHERE cu.Campanha_id = <id_campanha> AND cu.usuarios_id = u.id
);

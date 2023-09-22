INSERT INTO campanha_usuario (usuarios_id, Campanha_id)

SELECT u.id, <id_campanha> 
FROM usuario u 
WHERE u.email IN (
'P993240',
'P504101',
'P710821',
'P523626',
'P655093',
'P654566',
'P657256',
'P720294',
'P717210',
'P709893',
'P628576',
'P636075',
'P744579',
'P745077',
'P747353',
'P656376',
'P615602',
'P714908',
'P656000',
'P653605',
'P617008',
'P605121',
'P750603',
'P745388',
'P959285',
'P982281',
'P974914',
'P975536',
'P973182',
'P977956',
'P970334',
'P985886',
'P976760',
'P595718',
'P718323',
'P655342',
'P687191',
'P974144',
'P656001',
'P687240',
'P744727',
'P999810',
'P610745',
'P613611',
'P720092',
'P954360',
'P907332',
'P717797',
'P749882',
'P771211',
'P673556',
'P630264'
)

AND NOT EXISTS (
SELECT * FROM campanha_usuario cu WHERE cu.Campanha_id = <id_campanha> AND cu.usuarios_id = u.id
);

INSERT INTO campanha (
    CriadoPor,
    Nome,
    isAtivo,
    enviaHsm,
    prioridade,
    maximo_fila,
    empresa_id,
    grupo_campanha_id,
    descricao,
    idTipoMetodoDistribuicaoFila,
    dataInicioAtendimento,
    dataFimAtendimento,
    filaCentralizadora
)
VALUE
('mateus.lima@itx.com.b','7197','1','0','0','200','2','5427','7197','2','1900-01-01 08:00:00','1900-01-01 18:00:00','8888'),
('mateus.lima@itx.com.br','5129','1','0','0','200','2','5427','5129','2','1900-01-01 08:00:00','1900-01-01 18:00:00','8888')

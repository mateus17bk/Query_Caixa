SELECT 
  cq.Tel_Client_ID AS telefone,

  (
    SELECT CAST(cv1.Value AS CHAR)
    FROM History_Chat.chatqueue_custom_variables cv1
    WHERE cv1.ChatQueue_Sequence_ID = cq.Sequence_ID AND cv1.Name = '@CpfCnpj'
    LIMIT 1
  ) AS cpf,

  (
    SELECT CAST(cv1.Value AS CHAR)
    FROM History_Chat.chatqueue_custom_variables cv1
    WHERE cv1.ChatQueue_Sequence_ID = cq.Sequence_ID AND cv1.Name = '@ContratosVNA'
    LIMIT 1
  ) AS contratoVNA,

  (
    SELECT CAST(cv1.Value AS CHAR)
    FROM History_Chat.chatqueue_custom_variables cv1
    WHERE cv1.ChatQueue_Sequence_ID = cq.Sequence_ID AND cv1.Name = '@ValorBoleto'
    LIMIT 1
  ) AS valor,

  (
    SELECT CAST(cv1.Value AS CHAR)
    FROM History_Chat.chatqueue_custom_variables cv1
    WHERE cv1.ChatQueue_Sequence_ID = cq.Sequence_ID AND cv1.Name = '@DataVencimento'
    LIMIT 1
  ) AS vencimento,

  DATE_FORMAT(cq.DateAdded, "%d/%m/%Y") AS data_aceitacao,

  DATE_FORMAT(cq.DateAdded, "%H:%i:%s") AS hora_aceitacao,

  (
    SELECT CAST(cv1.Value AS CHAR)
    FROM History_Chat.chatqueue_custom_variables cv1
    WHERE cv1.ChatQueue_Sequence_ID = cq.Sequence_ID AND cv1.Name = '@LinhaDigitavel'
    LIMIT 1
  ) AS linha_digitavel,

  cq.DateAdded

FROM History_Chat.chatqueue cq
INNER JOIN History_Chat.chatqueue_custom_variables cv
  ON cv.ChatQueue_Sequence_ID = cq.Sequence_ID
WHERE
  cq.DateAdded >= '2025-07-11 00:00:00'
  AND cq.DateAdded <= '2025-07-11 23:59:59'
  AND cv.Name IN ('@ContratosVNA')
ORDER BY cq.DateAdded, vencimento;

SELECT 
   cq.DateAdded
  ,( select TOP 1  CAST(cv1.Value AS VARCHAR(MAX))  from   History_Chat.dbo.chatqueue_custom_variables cv1 where  cv1.ChatQueue_Sequence_ID = cq.Sequence_ID and cv1.Name = '@CpfCnpj'   ) as cpf
   ,  cq.Tel_Client_ID  as telefone
   ,( select   CAST(cv1.Value AS VARCHAR(MAX)) from   History_Chat.dbo.chatqueue_custom_variables cv1 where  cv1.ChatQueue_Sequence_ID = cq.Sequence_ID and cv1.Name = '@DataVencimento' ) as vencimento
   ,( select   CAST(cv1.Value AS VARCHAR(MAX)) from   History_Chat.dbo.chatqueue_custom_variables cv1 where  cv1.ChatQueue_Sequence_ID = cq.Sequence_ID and cv1.Name = '@ContratosVNA' ) as contratoVNA 
    ,( select   CAST(cv1.Value AS VARCHAR(MAX)) from   History_Chat.dbo.chatqueue_custom_variables cv1 where  cv1.ChatQueue_Sequence_ID = cq.Sequence_ID and cv1.Name = '@ValorBoleto' ) as valor 
        ,( select   CAST(cv1.Value AS VARCHAR(MAX)) from   History_Chat.dbo.chatqueue_custom_variables cv1 where  cv1.ChatQueue_Sequence_ID = cq.Sequence_ID and cv1.Name = '@LinhaDigitavel' ) as LinhaDigitavel 
                ,( select   CAST(cv1.Value AS VARCHAR(MAX)) from   History_Chat.dbo.chatqueue_custom_variables cv1 where  cv1.ChatQueue_Sequence_ID = cq.Sequence_ID and cv1.Name = '@RetornoIntegracao' ) as RetornoIntegracao 
FROM    History_Chat.dbo.chatqueue cq WITH (NOLOCK, INDEX(IX_chatqueue_DateAdded))
  INNER JOIN  History_Chat.dbo.chatqueue_custom_variables cv WITH (NOLOCK)
   ON cv.ChatQueue_Sequence_ID = cq.Sequence_ID
WHERE
  cq.DateAdded >= '2023-09-20 00:00:00' AND cq.DateAdded  <= '2023-09-25 23:59:59'  AND cv.Name IN ('@ContratosVNA')
ORDER BY  cq.DateAdded, vencimento

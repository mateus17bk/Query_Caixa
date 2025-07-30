db.chatQueue.updateMany(
  { ChatId: { $in: [ 

    "559291147040 ",           
"559391865380",
"558695739055",
"558381851966"

  ] } },
  { $set: { QueueId: "7777" } }
)

----------------------------------------------------------------

  db.chatQueue.updateMany(
  {
    QeueId: "TESTE_ITX",
    Active: true,
    Finished: false,
    ForceClose: false,
    DateAdded: {
      $gte: ISODate("2025-07-29T00:00:00.000Z"),
      $lt: ISODate("2025-07-29T23:59:59.000Z")
    }
  },
  {
    $set: {
      Active: false,
      Finished: true,
      ForceClose: true,
      DateFinished: ISODate("2025-07-30T16:40:00.000Z")
    }
  }
)

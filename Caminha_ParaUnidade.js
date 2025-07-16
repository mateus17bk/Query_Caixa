db.chatQueue.updateMany(
  { ChatId: { $in: [ 

    "559291147040 ",           
"559391865380",
"558695739055",
"558381851966"

  ] } },
  { $set: { QueueId: "7777" } }
)

# Description:
#   Calm down
#
# Configuration:
#   HUBOT_LESS_MANATEES
#
# Commands:
#   hubot calm me | manatee me - Reply with Manatee
#   ALL CAPS | LONGCAPS - Reply with Manatee

module.exports = (robot) ->
  manatee = ->
    count = 34
    num = Math.floor(Math.random() * count) + 1
    "http://calmingmanatee.com/img/manatee#{ num }.jpg"

  regex = ///
      (\b([A-Z]{2,}\s+)([A-Z]{2,})\b)|
      (\b[A-Z]{5,}\b)
    ///

  robot.respond /manatee|calm( me)?/i, (msg) -> msg.send manatee()

  # robot.hear /calm down|simmer down|that escalated quickly/i, (msg) ->
  #   msg.send manatee()

  unless process.env.HUBOT_LESS_MANATEES
    robot.hear regex, (msg) ->
      unless msg.message.user.name is "Notification"
        # only show if there are at least two consecutive uppercase words
        if msg.message.text.match(regex)[0].split(' ').length > 1
          msg.send manatee()

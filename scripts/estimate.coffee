# Description:
#   Hubot will give you story points during estimation
#
# Commands:
#   hubot estimate me - Receive random points for estimation

POINTS = [1,2,3,5,8,13,20]

module.exports = (robot) ->

  robot.respond /estimate me/i, (msg) ->
    msg.reply POINTS[Math.floor(Math.random() * 7)]

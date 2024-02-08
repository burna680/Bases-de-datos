db.version()
coll_red=db.getCollection("red_social")

coll_red.aggregate(
    [
        {
            $match:{"followed_id": 91930,"change":1}
        },
        {
            $group:{_id: {"follower_id":"$follower_id","followed_id":"$followed_id"},
            estado_seguimiento:
                {
                   $top:
                      {
                         output: "$change",
                         sortBy: { "change": -1 }
                      }
                }
              }
        },
        {
            $count:"estado_seguimiento"
        }
    ]
)

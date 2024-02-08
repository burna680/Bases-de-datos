
coll_tweets=db.getSiblingDB("local").getCollection("rhinos")

coll_tweets.find({})

coll_tweets.aggregate(
    [
        {"$unwind":"$tags"},
        {"$unwind":"$likes"
        },
        {"$match": {
                "user_name":"Lionel Messi",
                "tags":"futbol",
                "likes": {"$in":["jorge","celia"]}
            }
        },
        {"$group":
            {"_id":"$likes","cantidad":{$sum:1}
            }
        }
    ]
)

coll_tweets.aggregate(
    [
    {"$match": {
                "user_name":"Lionel Messi",
                "tags":"futbol",
                "likes": {"$in":["jorge","celia"]}
            }
        }
    ]
)
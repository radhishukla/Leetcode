WITH AllFriends AS (
    SELECT requester_id AS user_id, accepter_id AS friend_id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS user_id, requester_id AS friend_id FROM RequestAccepted
),
FriendCount AS (
    SELECT user_id AS id, COUNT(DISTINCT friend_id) AS num
    FROM AllFriends
    GROUP BY user_id
)

SELECT id, num
FROM FriendCount
ORDER BY num DESC
LIMIT 1;

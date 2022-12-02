/* Problem: You are given a table, BST, containing two columns: N and P,
where N represents the value of a node in Binary Tree, and P is the
parent of N.

Write a query to find the node type of Binary Tree ordered by the value
of the node. Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node. */

-- Start with root because it is also an inner node. For other inner
-- nodes, the condition is that they are the parent of some other node.
-- Therefore, they must be in the p column of the bst table. Remaining
-- nodes must be of leaf type.
SELECT n,
       CASE
         WHEN p IS NULL THEN "root"
         WHEN n IN (SELECT p
                    FROM   bst) THEN "inner"
         ELSE "leaf"
       END
FROM   bst
ORDER  BY n;

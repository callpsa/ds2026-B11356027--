SELECT title, vector_score 
FROM match_private_knowledge((SELECT embedding FROM private_knowledge LIMIT 1), '石門山', 5, NULL);

SELECT  DISTINCT question2.*,question1and3.*,question4and5.*
FROM question2
JOIN question1and3 ON question2.field1 = question1and3.field1
JOIN question4and5 ON question2.field1 = question4and5.field1
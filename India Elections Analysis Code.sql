--SELECT *
--FROM partywise_results;

--1.Ensuring '-' are 0 then changing data type back to INT from NVARCHAR since we could not do that with '-' rows then set 0 as default for '-'

--UPDATE constituencywise_details
--SET EVM_Votes = NULL
--WHERE EVM_Votes = '-';

--ALTER TABLE constituencywise_details
--ADD CONSTRAINT DF_EVM_Votes_Default
--DEFAULT 0 FOR EVM_Votes;

--UPDATE constituencywise_details
--SET EVM_Votes = 0
--WHERE EVM_Votes = '-';

--ALTER TABLE constituencywise_details
--ALTER COLUMN EVM_Votes INT NOT NULL;

--ALTER TABLE constituencywise_details
--DROP CONSTRAINT DF_EVM_Votes_Default;


--SELECT COLUMN_NAME, DATA_TYPE
--FROM INFORMATION_SCHEMA.COLUMNS
--WHERE TABLE_NAME = 'constituencywise_details'
--  AND COLUMN_NAME = 'EVM_Votes';

--2.Ensuring '-' are 0 then changing data type back to INT from NVARCHAR since we could not do that with '-' rows then set 0 as default for '-'

--ALTER TABLE constituencywise_details
--ALTER COLUMN Postal_Votes INT NOT NULL;

--ALTER TABLE constituencywise_details
--ADD CONSTRAINT DF_Postal_Votes_Default
--DEFAULT 0 FOR Postal_Votes;

--SELECT COLUMN_NAME, DATA_TYPE
--FROM INFORMATION_SCHEMA.COLUMNS
--WHERE TABLE_NAME = 'constituencywise_details'
--  AND COLUMN_NAME = 'Total_Votes';

--3.Ensuring '-' are 0 then changing data type back to INT from NVARCHAR since we could not do that with '-' rows then set 0 as default for '-'

--UPDATE constituencywise_details
--SET EVM_Votes = 0
--WHERE Total_Votes = '-';

--ALTER TABLE constituencywise_details
--ALTER COLUMN Total_Votes INT NOT NULL;

--ALTER TABLE constituencywise_details
--ADD CONSTRAINT DF_Total_Votes_Default
--DEFAULT 0 FOR Total_Votes;



--SELECT  COUNT(DISTINCT Parliament_Constituency) AS Total_Seats
--FROM constituencywise_results;

--What are the total number of seats available for election in each state

--SELECT s.State AS State_Name,
--	COUNT(DISTINCT cr.Parliament_Constituency) AS Total_Seats
--FROM constituencywise_results cr
--INNER JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
--INNER JOIN states s ON sr.State_ID = s.State_ID
--GROUP BY s.State
--ORDER BY Total_Seats DESC

--Total seats won by NDA alliance

--SELECT 
--    SUM(CASE 
--            WHEN party IN (
--                'Bharatiya Janata Party - BJP', 
--                'Telugu Desam - TDP', 
--				'Janata Dal  (United) - JD(U)',
--                'Shiv Sena - SHS', 
--                'AJSU Party - AJSUP', 
--                'Apna Dal (Soneylal) - ADAL', 
--                'Asom Gana Parishad - AGP',
--                'Hindustani Awam Morcha (Secular) - HAMS', 
--				'Janasena Party - JnP', 
--				'Janata Dal  (Secular) - JD(S)',
--                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
--                'Nationalist Congress Party - NCP',
--                'Rashtriya Lok Dal - RLD', 
--                'Sikkim Krantikari Morcha - SKM'
--            ) THEN [Won]
--            ELSE 0 
--        END) AS NDA_Total_Seats_Won
--FROM 
--    partywise_results


--Seats won by NDA alliance parties
--SELECT 
--    party as Party_Name,
--    won as Seats_Won
--FROM 
--    partywise_results
--WHERE 
--    party IN (
--        'Bharatiya Janata Party - BJP', 
--        'Telugu Desam - TDP', 
--		'Janata Dal  (United) - JD(U)',
--        'Shiv Sena - SHS', 
--        'AJSU Party - AJSUP', 
--        'Apna Dal (Soneylal) - ADAL', 
--        'Asom Gana Parishad - AGP',
--        'Hindustani Awam Morcha (Secular) - HAMS', 
--        'Janasena Party - JnP', 
--		'Janata Dal  (Secular) - JD(S)',
--        'Lok Janshakti Party(Ram Vilas) - LJPRV', 
--        'Nationalist Congress Party - NCP',
--        'Rashtriya Lok Dal - RLD', 
--        'Sikkim Krantikari Morcha - SKM'
--    )
--ORDER BY Seats_Won DESC

--Total seat won by I.N.D.I.A alliance
--SELECT
--	SUM(CASE 
--            WHEN party IN (
--                'Indian National Congress - INC',
--                'Aam Aadmi Party - AAAP',
--                'All India Trinamool Congress - AITC',
--                'Bharat Adivasi Party - BHRTADVSIP',
--                'Communist Party of India  (Marxist) - CPI(M)',
--                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
--                'Communist Party of India - CPI',
--                'Dravida Munnetra Kazhagam - DMK',
--                'Indian Union Muslim League - IUML',
--                'Nat`Jammu & Kashmir National Conference - JKN',
--                'Jharkhand Mukti Morcha - JMM',
--                'Jammu & Kashmir National Conference - JKN',
--                'Kerala Congress - KEC',
--                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
--                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
--                'Rashtriya Janata Dal - RJD',
--                'Rashtriya Loktantrik Party - RLTP',
--                'Revolutionary Socialist Party - RSP',
--                'Samajwadi Party - SP',
--                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
--                'Viduthalai Chiruthaigal Katchi - VCK'
--            ) THEN [Won]
--            ELSE 0 
--        END) AS INDIA_Total_Seats_Won
--FROM 
--    partywise_results

--Seats won by I.N.D.I.A parties
--SELECT Party as party_name, Won as seats_won
--FROM partywise_results
--WHERE Party IN(
--			    'Indian National Congress - INC',
--                'Aam Aadmi Party - AAAP',
--                'All India Trinamool Congress - AITC',
--                'Bharat Adivasi Party - BHRTADVSIP',
--                'Communist Party of India  (Marxist) - CPI(M)',
--                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
--                'Communist Party of India - CPI',
--                'Dravida Munnetra Kazhagam - DMK',
--                'Indian Union Muslim League - IUML',
--                'Nat`Jammu & Kashmir National Conference - JKN',
--                'Jharkhand Mukti Morcha - JMM',
--                'Jammu & Kashmir National Conference - JKN',
--                'Kerala Congress - KEC',
--                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
--                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
--                'Rashtriya Janata Dal - RJD',
--                'Rashtriya Loktantrik Party - RLTP',
--                'Revolutionary Socialist Party - RSP',
--                'Samajwadi Party - SP',
--                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
--                'Viduthalai Chiruthaigal Katchi - VCK'
--            ) 
--ORDER BY seats_won DESC;

--Add a new column in table partywise_results to get the party alliance as NDA,I.N.D.I.A and OTHER.

--ALTER TABLE partywise_results
--ADD Party_Alliance VARCHAR(50);

--UPDATE partywise_results
--SET party_alliance ='I.N.D.I.A'
--WHERE Party IN (
--	'Indian National Congress - INC',
--    'Aam Aadmi Party - AAAP',
--    'All India Trinamool Congress - AITC',
--    'Bharat Adivasi Party - BHRTADVSIP',
--    'Communist Party of India  (Marxist) - CPI(M)',
--    'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
--    'Communist Party of India - CPI',
--    'Dravida Munnetra Kazhagam - DMK',	
--    'Indian Union Muslim League - IUML',
--    'Jammu & Kashmir National Conference - JKN',
--    'Jharkhand Mukti Morcha - JMM',
--    'Kerala Congress - KEC',
--    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
--    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
--    'Rashtriya Janata Dal - RJD',
--    'Rashtriya Loktantrik Party - RLTP',
--    'Revolutionary Socialist Party - RSP',
--    'Samajwadi Party - SP',
--    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
--    'Viduthalai Chiruthaigal Katchi - VCK'
--);

--UPDATE partywise_results
--SET party_alliance = 'NDA'
--WHERE Party IN(
--	'Bharatiya Janata Party - BJP',
--    'Telugu Desam - TDP',
--    'Janata Dal  (United) - JD(U)',
--    'Shiv Sena - SHS',
--    'AJSU Party - AJSUP',
--    'Apna Dal (Soneylal) - ADAL',
--    'Asom Gana Parishad - AGP',
--    'Hindustani Awam Morcha (Secular) - HAMS',
--    'Janasena Party - JnP',
--    'Janata Dal  (Secular) - JD(S)',
--    'Lok Janshakti Party(Ram Vilas) - LJPRV',
--    'Nationalist Congress Party - NCP',
--    'Rashtriya Lok Dal - RLD',
--    'Sikkim Krantikari Morcha - SKM'
--);

--UPDATE partywise_results
--SET party_alliance = 'OTHER'
--WHERE party_alliance IS NULL;

--SELECT *
--FROM statewise_results;
--SELECT *
--FROM constituencywise_details;

--Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency
--SELECT cr.Winning_Candidate, pr.Party, pr.party_alliance, cr.Total_Votes, cr.Margin, cr.Constituency_Name, s.State
--FROM constituencywise_results cr
--INNER JOIN partywise_results pr ON cr.Party_ID = pr.Party_ID
--INNER JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
--INNER JOIN states s ON sr.State_ID = s.State_ID
--WHERE s.State = 'Uttar Pradesh' AND cr.Constituency_Name = 'AMETHI';

--What is the distribution of EVM votes verses postal votes for candidates in a specific constituency
--SELECT cd.Candidate,cr.Constituency_Name,cd.EVM_Votes,cd.Postal_Votes,cd.Total_Votes
--FROM constituencywise_details cd
--INNER JOIN constituencywise_results cr
--ON cd.Constituency_ID =cr.Constituency_ID
--WHERE Constituency_Name ='AMETHI'

--Which party won most seats in a state,and how many seats did each party win 
--SELECT pr.Party,
--COUNT(cr.Constituency_ID) AS Seats_Won
--FROM partywise_results pr
--INNER JOIN constituencywise_results cr ON pr.Party_ID=cr.Party_ID
--INNER JOIN statewise_results sr ON cr.Parliament_Constituency=sr.Parliament_Constituency
--INNER JOIN states s ON sr.State_ID=s.State_ID
--WHERE s.State ='Goa'
--GROUP BY pr.Party

--What is the total number of seats won by each party alliance in each state

--SELECT *
--FROM constituencywise_details;

--SELECT 
--    s.State,
--    SUM(CASE WHEN pr.Party_Alliance = 'NDA' THEN 1 ELSE 0 END) AS NDA_Seats_Won,
--    SUM(CASE WHEN pr.Party_Alliance = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS INDIA_Seats_Won,
--    SUM(CASE WHEN pr.Party_Alliance = 'OTHER' THEN 1 ELSE 0 END) AS OTHER_Seats_Won
--FROM 
--    partywise_results pr
--INNER JOIN 
--    constituencywise_results cr ON pr.Party_ID = cr.Party_ID
--INNER JOIN 
--    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
--INNER JOIN 
--    states s ON sr.State_ID = s.State_ID  
--GROUP BY 
--    s.State;

--Which candidate received the highest number of EVM votes in each constituency
--SELECT TOP 10 cr.Constituency_Name,cd.Candidate,SUM(cd.EVM_Votes) AS EVM_Votes_Per_Candidate
--FROM constituencywise_details cd
--INNER JOIN constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
--GROUP BY cr.Constituency_Name,cd.Candidate
--ORDER BY EVM_Votes_Per_Candidate DESC

--Which candidate won and which candidate was the runner’s up in each constituency of  a specific state in 2024 elections
--WITH Ranked_Candidate AS (SELECT cd.Candidate,
--cr.Constituency_Name,
--cd.EVM_Votes,
--cd.Postal_Votes,
--cd.EVM_Votes + cd.Postal_Votes AS Total_Votes,
--ROW_NUMBER() OVER (PARTITION BY cd.Constituency_ID ORDER BY cd.EVM_Votes + cd.Postal_Votes DESC) AS Vote_Rank
--FROM constituencywise_details cd
--INNER JOIN constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
--INNER JOIN statewise_results sr ON sr.Parliament_Constituency = cr.Parliament_Constituency
--INNER JOIN states s ON s.State_ID = sr.State_ID
--WHERE s.State='Maharashtra'
--)
--SELECT rc.Constituency_Name,
--MAX(CASE WHEN rc.Vote_Rank =1 THEN rc.Candidate END) AS Winning_Candidate,
--MAX(CASE WHEN rc.Vote_Rank =2 THEN rc.Candidate END) AS First_Runners_Up
--FROM Ranked_Candidate rc
--GROUP BY rc.Constituency_Name
--ORDER BY rc.Constituency_Name

--For the state of Maharashtra, what are the total number of seats, total number of parties,total number of candidates,total votes (including EVM and Postal), and the breakdown of EVM and Postal votes
SELECT 
COUNT(DISTINCT cr.Parliament_Constituency) AS Total_Seats,
COUNT(DISTINCT pr.Party) AS Total_Number_Of_Parties,
COUNT(DISTINCT cd.Candidate)AS Candidate_Count,
SUM(cd.EVM_Votes + cd.Postal_Votes) AS Total_Votes,
SUM(cd.EVM_Votes) AS Total_EVM_Votes,
SUM(cd.Postal_Votes) AS Total_Postal_Votes
FROM constituencywise_results cr
INNER JOIN partywise_results pr ON pr.Party_ID=cr.Party_ID
INNER JOIN constituencywise_details cd ON cr.Constituency_ID= cd.Constituency_ID
INNER JOIN statewise_results sr ON sr.Parliament_Constituency=cr.Parliament_Constituency
INNER JOIN states s ON s.State_ID =sr.State_ID
WHERE s.State='Maharashtra';

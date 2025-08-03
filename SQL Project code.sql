use india_election_result;

-- Total seats

select distinct count('Parliament Constituency') as total_sheets 
from constituencywise_results;

-- What are the total number of seats available for elections in each state

select s.state as state_name,
count(cr.`Parliament Constituency`) as total_seats
from constituencywise_results cr 
inner join statewise_results sr
on cr.`Parliament Constituency` = sr.`Parliament Constituency` inner join states s
on sr.`State ID`= s.`State ID`
group by s.state;


-- Total seats won by NDA Alliance

select
    sum(case
            when party in (
            'Bharatiya Janata Party - BJP',
            'Telugu Desam - TDP',
            'Janata Dal  (United) - JD(U)',
            'Shiv Sena - SHS',
            'AJSU Party - AJSUP',
            'Apna Dal (Soneylal) - ADAL',
            'Asom Gana Parishad - AGP',
            'Hindustani Awam Morcha (Secular) - HAMS',
            'Janasena Party - JnP',
            'Janata Dal  (Secular) - JD(S)',
            'Lok Janshakti Party(Ram Vilas) - LJPRV',
            'Nationalist Congress Party - NCP',
            'Rashtriya Lok Dal - RLD',
            'Sikkim Krantikari Morcha - SKM'
		) then Won
        ELSE 0
	END) AS NDA_Total_Seats_Won
FROM 
    partywise_results;

-- Seats won by NDA Alliance Parties

select 
    Party as `Party Name`,
    Won as `Seats Won`
from
    partywise_results
where 
    Party in(
            'Bharatiya Janata Party - BJP',
            'Telugu Desam - TDP',
            'Janata Dal  (United) - JD(U)',
            'Shiv Sena - SHS',
            'AJSU Party - AJSUP',
            'Apna Dal (Soneylal) - ADAL',
            'Asom Gana Parishad - AGP',
            'Hindustani Awam Morcha (Secular) - HAMS',
            'Janasena Party - JnP',
            'Janata Dal  (Secular) - JD(S)',
            'Lok Janshakti Party(Ram Vilas) - LJPRV',
            'Nationalist Congress Party - NCP',
            'Rashtriya Lok Dal - RLD',
            'Sikkim Krantikari Morcha - SKM'
		)
order by `Seats Won` desc;

-- Total seats won by I.N.D.I.A. Alliance

select
    sum(case
            when party in (
			'Indian National Congress - INC',
            'Aam Aadmi Party - AAAP',
            'All India Trinamool Congress - AITC',
            'Bharat Adivasi Party - BHRTADVSIP',
            'Communist Party of India  (Marxist) - CPI(M)',
            'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
            'Communist Party of India - CPI',
            'Dravida Munnetra Kazhagam - DMK',
            'Indian Union Muslim League - IUML',
            'Jammu & Kashmir National Conference - JKN',
            'Jharkhand Mukti Morcha - JMM',
            'Jammu & Kashmir National Conference - JKN',
            'Kerala Congress - KEC',
            'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
            'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
            'Rashtriya Janata Dal - RJD',
            'Rashtriya Loktantrik Party - RLTP',
			'Revolutionary Socialist Party - RSP',
            'Samajwadi Party - SP',
            'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
			'Viduthalai Chiruthaigal Katchi - VCK'
		) then Won
        ELSE 0
	END) AS INDIA_Total_Seats_Won
FROM 
    partywise_results;
    
    
-- Seats won by I.N.D.I.A. Alliance Parties    
    
select 
    Party as `Party Name`,
    Won as `Seats Won`
from
    partywise_results
where 
    Party in(
            'Indian National Congress - INC',
            'Aam Aadmi Party - AAAP',
            'All India Trinamool Congress - AITC',
            'Bharat Adivasi Party - BHRTADVSIP',
            'Communist Party of India  (Marxist) - CPI(M)',
            'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
            'Communist Party of India - CPI',
            'Dravida Munnetra Kazhagam - DMK',
            'Indian Union Muslim League - IUML',
            'Jammu & Kashmir National Conference - JKN',
            'Jharkhand Mukti Morcha - JMM',
            'Jammu & Kashmir National Conference - JKN',
            'Kerala Congress - KEC',
            'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
            'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
            'Rashtriya Janata Dal - RJD',
            'Rashtriya Loktantrik Party - RLTP',
			'Revolutionary Socialist Party - RSP',
            'Samajwadi Party - SP',
            'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
			'Viduthalai Chiruthaigal Katchi - VCK'
		)
order by `Seats Won` desc;

-- Adding new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER 

SET sql_safe_updates = 0;

alter table partywise_results
   add party_alliance varchar(100); 

UPDATE partywise_results
    SET party_alliance = 'I.N.D.I.A'
        WHERE Party in(
            'Indian National Congress - INC',
            'Aam Aadmi Party - AAAP',
            'All India Trinamool Congress - AITC',
            'Bharat Adivasi Party - BHRTADVSIP',
            'Communist Party of India  (Marxist) - CPI(M)',
            'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
            'Communist Party of India - CPI',
            'Dravida Munnetra Kazhagam - DMK',
            'Indian Union Muslim League - IUML',
            'Jammu & Kashmir National Conference - JKN',
            'Jharkhand Mukti Morcha - JMM',
            'Jammu & Kashmir National Conference - JKN',
            'Kerala Congress - KEC',
            'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
            'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
            'Rashtriya Janata Dal - RJD',
            'Rashtriya Loktantrik Party - RLTP',
			'Revolutionary Socialist Party - RSP',
            'Samajwadi Party - SP',
            'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
			'Viduthalai Chiruthaigal Katchi - VCK'
		);
        
UPDATE partywise_results
    SET party_alliance = 'NDA'
        WHERE Party in(
            'Bharatiya Janata Party - BJP',
            'Telugu Desam - TDP',
            'Janata Dal  (United) - JD(U)',
            'Shiv Sena - SHS',
            'AJSU Party - AJSUP',
            'Apna Dal (Soneylal) - ADAL',
            'Asom Gana Parishad - AGP',
            'Hindustani Awam Morcha (Secular) - HAMS',
            'Janasena Party - JnP',
            'Janata Dal  (Secular) - JD(S)',
            'Lok Janshakti Party(Ram Vilas) - LJPRV',
            'Nationalist Congress Party - NCP',
            'Rashtriya Lok Dal - RLD',
            'Sikkim Krantikari Morcha - SKM'
		);
        
UPDATE partywise_results
    SET party_alliance = 'OTHER'
        WHERE party_alliance IS NULL;
        
SET sql_safe_updates = 1;

SELECT party,
Won
FROM partywise_results
where party_alliance = 'NDA'
order by Won desc;


-- Winning candidate's name, their party name,total votes, and the margin of victory for a specific state and constituency ?

SELECT 
    cr.`Winning Candidate`,
    pr.Party,
    pr.party_alliance,
    cr.`Total Votes`,
    cr.Margin,
    s.State,
    cr.`Constituency Name`
FROM
    constituencywise_results cr inner join partywise_results pr on cr.`Party ID` = pr.`Party ID`
    inner join 
    statewise_results sr on cr.`Parliament Constituency`=sr.`Parliament Constituency`
    inner join 
    states s on sr.`State ID` = s.`State ID` 
WHERE cr.`Constituency Name` = 'SURAT';

-- What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?

SELECT 
    cd.`EVM Votes`,
    cd.`Postal Votes`,
    cd.`Total Votes`,
    cd.Candidate,
    cr.`Constituency Name`
FROM
    constituencywise_results cr join constituencywise_details cd on cr.`Constituency ID` = cd.`Constituency ID`
WHERE 
    cr.`Constituency Name`= 'AMROHA';

-- Which parties won the most seats in a state, and how many seats did each party win ?

SELECT 
    pr.Party,
    COUNT(cr.`Constituency ID`) AS  Seat_Won
FROM 
    constituencywise_results cr
JOIN
    partywise_results pr ON cr.`Party ID` = pr.`Party ID`
JOIN
    statewise_results sr ON cr.`Parliament Constituency` = sr.`Parliament Constituency`
JOIN 
    states s ON sr.`State ID` = s.`State ID`
WHERE 
    s.state='Gujarat'
GROUP BY 
    pr.Party
ORDER BY 
    Seat_Won DESC;

-- What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024

SELECT 
    s.state,
    SUM(CASE WHEN pr.party_alliance = 'NDA' THEN 1 ELSE 0 END) AS NDA_Seat_Won,
    SUM(CASE WHEN pr.party_alliance = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS INDIA_Seat_Won,
    SUM(CASE WHEN pr.party_alliance = 'OTHER' THEN 1 ELSE 0 END) AS OTHER_Seat_Won
FROM 
    constituencywise_results cr
JOIN
    partywise_results pr ON cr.`Party ID` = pr.`Party ID`
JOIN
    statewise_results sr ON cr.`Parliament Constituency` = sr.`Parliament Constituency`
JOIN 
    states s ON sr.`State ID` = s.`State ID`
GROUP BY
    s.state;
    
-- Which candidate received the highest number of EVM votes in each constituency (top 10)

select
    cr.`Constituency Name`,
    cd.`Constituency ID`,
    cd.Candidate,
    cd.`EVM Votes`
from
    constituencywise_details cd
inner join
    constituencywise_results cr ON cd.`Constituency ID` = cr.`Constituency ID`
where
    cd.`EVM Votes` = (
        SELECT MAX(cd1.`EVM Votes`)
        FROM constituencywise_details cd1
        WHERE cd1.`Constituency ID` = cd.`Constituency ID`
	)
order by 
    cd.`EVM Votes` DESC LIMIT 10;
    
-- Which candidate won and which candidate was the runner-up in each constituency of State for the 2024 elections?

WITH RankedCandidates as (
    select
        cd.`Constituency ID`,
        cd.Candidate,
        cd.Party,
        cd.`EVM Votes`,
        cd.`Postal Votes`,
        cd.`EVM Votes` + cd.`Postal Votes` AS Total_Votes,
        row_number() over(partition by cd.`Constituency ID` order by cd.`EVM Votes` + cd.`Postal Votes` DESC) AS VoteRank
	from
        constituencywise_details cd
	join
        constituencywise_results cr ON cd.`Constituency ID` = cr.`Constituency ID`
	join
        statewise_results sr ON cr.`Parliament Constituency` = sr.`Parliament Constituency`
	join
        states s ON sr.`State ID` = s.`State ID`
	where 
        s.State = 'Uttar Pradesh'
)

select
    cr.`Constituency Name`,
    MAX(CASE WHEN rc.VoteRank = 1 THEN rc.Candidate END) as Winning_Candidate,
    MAX(CASE WHEN rc.VoteRank = 2 THEN rc.Candidate END) as Runnerup_Candidate
from
    RankedCandidates rc
join
    constituencywise_results cr ON rc.`Constituency ID` = cr.`Constituency ID`
group by
    cr.`Constituency Name`
order by
    cr.`Constituency Name`;


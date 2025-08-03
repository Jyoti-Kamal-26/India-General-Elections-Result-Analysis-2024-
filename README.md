# India General Elections 2024 – SQL Project

This is a SQL-based analysis I worked on to explore the results of the 2024 Indian General Elections. The goal was to dig into the election data, find out how different parties and alliances performed, and get some interesting insights — like which parties won the most seats, who got the highest votes, and how alliances compared across states.

---

## What I Did

- Analyzed total number of seats, both overall and state-wise.
- Looked at how many seats were won by NDA, I.N.D.I.A, and OTHER alliances.
- Checked performance of each party in different states.
- Compared EVM vs postal votes in specific constituencies.
- Found top candidates based on votes.
- Identified winners and runner-ups in each constituency (focused on Uttar Pradesh).

---

## Tools & Tech Used

- **MySQL** for querying
- **MySQL Workbench** (or VS Code terminal)
- Basic understanding of joins, group by, subqueries, and window functions

---

## Tables I Used

- `constituencywise_results`
- `partywise_results`
- `statewise_results`
- `states`
- `constituencywise_details`

---

## 💡 Sample Query

Here's one example that shows how I compared alliance performance across different states:

```sql
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
````

---

## Insights

* Total seats analyzed: **543**
* Added a new column to group each party into its respective alliance: **NDA**, **I.N.D.I.A**, or **OTHER**
* Found that **Surat** had the highest victory margin, and **Amroha** was interesting for comparing EVM vs postal votes
* Identified top 10 candidates with highest EVM votes
* Used CTE and window functions to find **winner vs runner-up** candidates in Uttar Pradesh

---
 
## 👤 About Me

I'm Jyoti Kamal — currently learning and building projects using SQL and Python. This project helped me understand how to work with real-world datasets and write better SQL queries.

GitHub: [@Jyoti-Kamal-26](https://github.com/Jyoti-Kamal-26)

---


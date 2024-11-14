# India-Elections-Results-2024-Analysis

## Project Overview
This project analyzes the results of the 2024 Indian general elections, focusing on the distribution of seats won by different political alliances (NDA, I.N.D.I.A, and others) across various states and constituencies. The analysis aims to provide insights into vote distribution patterns, alliance strength, and the performance of key political parties in different regions.

## Features
- **Data Integration and Analysis with SQL**: Uses SQL queries to join, aggregate, and categorize election results from multiple tables.
- **Vote Distribution Analysis**: Analyzes vote types (EVM vs. postal) and examines the seat distribution across alliances.
- **Dynamic SQL Queries**: Utilizes `CASE` statements, `SUM`, `ROW_NUMBER`, and `GROUP BY` clauses to segment and calculate seat distributions for alliances and individual parties.
- **Data Aggregation**: Presents results on a state level, highlighting the total seats won by each alliance and the distribution of seats within each state.

## Data Structure
- **Party_Alliance**: This column categorizes each party into alliances such as NDA, I.N.D.I.A, or OTHER.
- **Seats_Won**: Represents the number of seats each party has won in specific states.
- **State**: State names where the seats are won.

### Tables:
- **partywise_results**: Stores seat information for each party and alliance.
- **constituencywise_results**: Stores constituency details related to each party.
- **statewise_results**: Links constituencies to states.

## Key SQL Techniques Used
- **CASE Statements**: Used to categorize parties into alliances based on conditions.
- **Aggregations with SUM**: Calculates total seats won by each alliance.
- **JOINS**: Combines data across tables for a holistic view.
- **Window Functions (ROW_NUMBER)**: Helps rank or order results based on vote counts.
- **Filtering and Limiting Results**: `TOP` and `ORDER BY` clauses are used to limit output rows for specific queries.

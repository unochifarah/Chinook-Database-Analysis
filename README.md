# Chinook Digital Media Store Analysis
### PostgreSQL

**By Jasmine Unochi** · [LinkedIn](https://www.linkedin.com/in/jasmine-unochi-4613a3169) · [GitHub](https://github.com/unochifarah)

---

## Overview

The Chinook Database represents a digital media store, including tables for artists, albums, media tracks, invoices, and customers. It consists of 11 relational tables covering everything from purchase history to customer geography and media format preferences.

---

## Questions Explored

1. Which track sells the most?
2. Which artist sells the most?
3. Which album sells the most?
4. What is the top genre per country?
5. What is the most tracks bought in a single purchase?
6. Which country orders the most?
7. Which media type is most popular?

---

## Process

For each question I identified the relevant tables first, then broke the problem into smaller pieces before building the JOIN chain. Multi-table queries were written step by step — starting from the fact table (invoice_line) and joining outward to artist, genre, and customer tables as needed. For the genre-per-country analysis, I used a CTE with RANK() and PARTITION BY to isolate the top genre within each country.

---

## Findings

- **Iron Maiden dominates at both artist and track level** top selling artist with 140 sales, and their song The Trooper is the top selling individual track with 5 sales
- **Chico Buarque wins the album race** Minha Historia is the best selling album with 27 sales, despite Chico Buarque not appearing in the top artists list. Iron Maiden's sales are spread across their catalog; Chico Buarque's are concentrated in one album, two different patterns worth paying attention to when curating new content
- **Rock dominates globally** across 25 countries, 92% have Rock as their #1 genre. Argentina is the only country where another genre ties for first (Alternative & Punk), and Sweden is the only country where Rock doesn't win, Latin takes the top spot there
- **Purchase size maxes out at 14 tracks** the most tracks bought in a single purchase is 14, and 59 customers hit that number, suggesting a consistent buying pattern rather than outlier behavior
- **USA leads in orders** 91 orders, nearly double Canada in second place with 56. France and Brazil tie for third at 35 orders each
- **MPEG audio file is the dominant format** 1,976 sales vs 146 for the second place format (Protected AAC). Customers have a clear and overwhelming format preference

---

## Conclusion

The store's strongest market is the USA, with Rock music in MPEG format being the clear preference across both geography and format dimensions. Iron Maiden's catalog-wide popularity and The Trooper's individual track performance suggest that classic rock back-catalogs drive consistent repeat purchases. Targeted promotions or bundle pricing around Rock artists particularly in the USA and Canada which could be an effective way to increase order frequency among existing customers.

---

## SQL Concepts Used

| Concept | Where Used |
|---|---|
| INNER JOIN (multi-table) | All queries — up to 3 tables joined per query |
| GROUP BY + ORDER BY | Aggregating sales by artist, album, track, country |
| SUM / COUNT | Quantity totals and order counts |
| CTE (WITH clause) | Genre-per-country analysis |
| RANK() OVER (PARTITION BY) | Ranking genres within each country |

---

## Tools Used

| Tool | Purpose |
|---|---|
| PostgreSQL | All queries and analysis |

---

## Dataset

**Source:** [AdventureWorks-2014]([https://www.kaggle.com/datasets/ranasabrii/chinook](https://www.kaggle.com/datasets/duckduckboot/adventureworks-2014)) via Kaggle
**Tables:** 3 relational tables
**Fields:** Sales Order, Customer Master, Vendor Master

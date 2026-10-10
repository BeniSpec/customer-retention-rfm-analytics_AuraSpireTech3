# Business Questions

## 1. Business Problem
Marketing is acquiring customers for a UK online gift retailer, but nobody knows whether those customers come back. Money spent winning a customer who buys once is lost; money spent keeping a good customer keeps paying off.

Flow: Problem → Question → Analysis → Action. This file covers the first two steps before any data is touched.

## 2. Decision This Analysis Supports
- **Who will use it:** the marketing team.
- **Decision:** where to spend retention effort and budget first, and which customer groups deserve different retention actions.
- **What they need:** which customers return, how quickly, which are valuable or slipping away, and what to try next.

## 3. Key Questions

### Q1. Are customers returning after their first purchase?
- **Who / when:** customers whose first order fell between Dec 2010 and Nov 2011.
- **Metric:** repeat-customer rate = customers with 2+ orders ÷ all customers.
- **Decision:** is retention or acquisition the bigger opportunity?

### Q2. How does retention change by acquisition cohort?
- **Who / when:** customers grouped by the month of their first order.
- **Metric:** % of each cohort that orders again 1, 2, 3 ... months later.
- **Decision:** which acquisition months bring customers who stay, so promotions can aim at them.

### Q3. How long does it take customers to purchase again?
- **Who / when:** repeat customers, from first order to second order.
- **Metric:** median and spread of days between order 1 and order 2.
- **Decision:** when to send a follow-up message or offer.

### Q4. Which customers are high-value, frequent, or at risk of churning?
- **Who:** every customer with an ID.
- **Metric:** RFM: Recency (days since last order), Frequency (number of orders), Monetary (total spend).
- **Decision:** who gets retention effort first.

### Q5. Which segments should receive different retention strategies?
- **Who:** the RFM segments from Q4 (for example Champions, Loyal, At Risk, Lost).
- **Metric:** segment size, share of revenue, and repeat rate per segment.
- **Decision:** which retention action to test first. This analysis shows who is at risk; a controlled A/B test (Project 4) is what shows whether an action works.

## 4. Metric Definitions
| Term | Definition |
|---|---|
| Customer | A distinct, non-blank CustomerID |
| Order | A distinct InvoiceNo that does not start with "C" |
| Revenue | Quantity × UnitPrice in GBP (gross, returns excluded) |
| Cohort month | The month of a customer's first valid order |
| Retained in month N | Customer places an order N calendar months after their cohort month |
| Repeat customer | A customer with 2 or more orders |
| Churn | To be defined on Day 6 |

## 5. Scope and Baseline
- **Population:** customers with a CustomerID.
- **Period:** 1 Dec 2010 to 9 Dec 2011.
- **Time grain:** month.
- **Baseline:** the average retention across all cohorts. A cohort is "strong" or "weak" relative to this average.
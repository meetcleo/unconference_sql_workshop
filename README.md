# Unconference SQL Workshop

![Hackers](./img.jpg)

## Why?

- Will learn approaches for DB modelling and performance tuning
- Will learn some specific features of postgres that help with this
- Learn a bit about how Cleo works under the hood
- Will do this collaboratively
- These skills will help you fix 80% of your scaling problems

## Approach

- We'll have three related tables that we'll need to join and filter in order to find users that match a specific set of criteria
- We'll start with some default rails-generated models, then we'll:
    - See how the query performs on a small set of data (your typical dev environment)
    - See how the query performs on a larger set of data (hint: we'll need to make some changes in order to make it scale)
    - Try a couple types of indexes to help query performance
    - Tweak our query to make it more efficient

## Steps

1. Generate bare-bones Rails project: `rails new unconference_sql_workshop --api -M -P -C -S -J -T -d postgresql`
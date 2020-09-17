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
1. Generate models:
    1. User: `rails generate model user name:string email:string snooze_until:datetime --no-timestamps`
    1. Message: `rails generate model message body:text user:references --no-timestamps`
    1. FirebaseToken: `rails generate model firebase_token token:string invalidated_at:datetime user:references --no-timestamps`
    1. Apply to database: `rails db:setup`
1. We want to find users that have recently sent a message asking for help so we can reach out to them (we'll create the `User.need_help` scope). These users should:
    1. Not have notifications snoozed
    1. Have a message with the word `help` in the body
    1. Have a Firebase token that is not invalidated
1. We want to generate a sample of data over which we will analyze performance
    1. Generate on the scale of 10's: `rake data:generate_a_little`
    1. Generate on the scale of 10's of thousands: `rake data:generate_a_lot`

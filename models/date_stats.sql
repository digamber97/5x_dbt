{{ config(materialized = 'view') }}

-- WE ARE TRYING to ANALYZE, IN HWICH PERIOD MOST OF PROVINCE GOT HIGHEST NEW CASES 

with date_stats as (
    select data.PROVINCE,  max(NEW_CASES) as higest_cases from "INTERVIEW_DB"."PLAYGROUND_DIGAMBER_KALIVEMULA"."PROVINCES" as pro INNER JOIN 
"INTERVIEW_DB"."PLAYGROUND_DIGAMBER_KALIVEMULA"."COVID19_DATA" as data on pro.PROVINCE = data.PROVINCE GROUP BY data.PROVINCE
)

select cases.*, data.DATE from max_cases as cases INNER JOIN "INTERVIEW_DB"."PLAYGROUND_DIGAMBER_KALIVEMULA"."COVID19_DATA" as data 
on cases.higest_cases=data.NEW_CASES and data.PROVINCE= cases.PROVINCE ORDER BY data.DATE
INSERT INTO XXHR.XXHR_PER_SOCIETIES (
    SOCIETY_ID, 
    CODE, 
    DATE_START, 
    DATE_END, 
    SUBS_AMOUNT, 
    SUBS_PERIOD, 
    SUBS_TOTAL, 
    SUBS_HOLD
) VALUES (
    1485,              -- New society ID
    'XXHR02',          -- New code
    TO_DATE('01-JAN-2024', 'DD-MON-YYYY'),  -- Start date
    TO_DATE('31-DEC-2024', 'DD-MON-YYYY'),  -- End date
    150,               -- Subscription amount
    12,                -- Subscription period
    1800,              -- Subscription total
    150                -- Subscription hold
);

COMMIT;

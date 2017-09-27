CREATE TABLE public.machines
(
    id uuid NOT NULL,
    name text COLLATE pg_catalog."default" NOT NULL,
    status text COLLATE pg_catalog."default" NOT NULL,
    location text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT machines_pk PRIMARY KEY (id)
)
WITH (OIDS = FALSE)
TABLESPACE pg_default;
ALTER TABLE public.machines OWNER to postgres;
COMMENT ON TABLE public.machines IS 'Table is used to store information about manufacturing equiptment that can be used to produce products';

CREATE TABLE public.bookings
(
    machine_id uuid NOT NULL,
    job_id text COLLATE pg_catalog."default" NOT NULL,
    date date NOT NULL,
    timeslot numeric NOT NULL,
    CONSTRAINT bookings_ck PRIMARY KEY (timeslot, date, machine_id),
    CONSTRAINT booking_fk FOREIGN KEY (machine_id)
        REFERENCES public.machines (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (OIDS = FALSE)
TABLESPACE pg_default;
ALTER TABLE public.bookings OWNER to postgres;
COMMENT ON TABLE public.bookings IS 'This tables stores jobs that are booked onto machines for processing';


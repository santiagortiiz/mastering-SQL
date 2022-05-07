-- https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/PostgreSQL.TransportableDB.html#PostgreSQL.TransportableDB.transport.import_from_server
transport.import_from_server(
   host text,
   port int,
   username text,
   password text,
   database text,
   local_password text,
   dry_run bool
)

-- Parameter groups
max_worker_processes = GREATEST(${DBInstanceVCPU*2},8) -- default
SET max_worker_processes = integer
SET pg_transport.num_workers = integer;
SET pg_transport.work_mem = kilobytes;
SET pg_transport.timing = Boolean;
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
CREATE ROLE replication_user LOGIN REPLICATION PASSWORD 'replicationpassword';
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
SELECT * FROM pg_create_physical_replication_slot('node_a_slot');
EOSQL
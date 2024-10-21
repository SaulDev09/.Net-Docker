
# Wait to be sure that SQL Server came up
# sleep 20s

# Try 2
until /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P P@ssw0rd? -C -Q "SELECT 1" > /dev/null
do
  echo "Waiting for SQL Server to be available..."
  sleep 5
done

# Run the setup script to create the DB and the schema in the DB
# Note: make sure that your password matches what is in the Dockerfile
/opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P P@ssw0rd? -d master -i setup.sql -C
/opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P P@ssw0rd? -d BookStore -i data.sql -C

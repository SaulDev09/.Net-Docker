#start SQL Server, start the script to create the DB and import the data, start the app
#/opt/mssql/bin/sqlserver & /usr/src/app/import-data.sh

#version 1
#/usr/src/app/import-data.sh & /opt/mssql/bin/sqlservr


#version 2

# Start SQL Server in the background
/opt/mssql/bin/sqlservr &

# Wait until SQL Server is ready to accept connections
echo "===> Waiting for SQL Server to be available..."
until /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'P@ssw0rd?' -C -Q "SELECT 1" &> /dev/null
do
  sleep 1
  echo "===> Waiting"
done

# Now run the import
echo "===> SQL Server is up - running import-data.sh"
bash /usr/src/app/import-data.sh

# Wait for sqlservr to keep running in foreground
wait

mkdir temp
cd temp
wget -i ../files
ls -a1 | grep zip | xargs -I @ unzip @
ls -a1 | grep shp$ | xargs -I @ ogr2ogr -f "PostgreSQL" PG:"host=$PGHOST port=$PGPORT user=$PGUSER password=$PGPASSWORD dbname=$PGDATABASE" -nlt MULTIPOLYGON @
cd ..
rm -r temp

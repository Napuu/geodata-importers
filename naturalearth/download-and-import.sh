mkdir temp
cd temp
wget -i ../files
ls -a1 | grep zip | xargs -I @ unzip @
ls -a1 | grep shp$ | OGR_ENABLE_PARTIAL_REPROJECTION=true xargs -I @ ogr2ogr -f "PostgreSQL" PG:"host=$PGHOST port=$PGPORT user=$PGUSER password=$PGPASSWORD dbname=$PGDATABASE" -t_srs EPSG:3857 -nlt MULTIPOLYGON @
cd ..
rm -r temp

PGHOST="${PGHOST:-192.168.1.111}"
PGPORT="${PGPORT:-5432}"
PGSCHEMA="${PGSCHEMA:-naturalearth}"
PGPASSWORD="${PGPASSWORD:-test}"
PGDATABASE="${PGDATABASE:-test}"
PGUSER="${PGUSER:-test}"
mkdir temp
cd temp
wget -i ../files
ls -a1 | grep zip | xargs -I @ unzip @
ls -a1 | grep shp$ | OGR_ENABLE_PARTIAL_REPROJECTION=true xargs -I @ ogr2ogr -f "PostgreSQL" PG:"host=$PGHOST port=$PGPORT user=$PGUSER password=$PGPASSWORD dbname=$PGDATABASE schemas=$PGSCHEMA" -t_srs EPSG:3857 -nlt MULTIPOLYGON @
cd ..
rm -r temp

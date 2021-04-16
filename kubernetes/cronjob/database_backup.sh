#!/bin/sh
# 使用外部变量传入关键名称和地址，如果：DB_HOST等
export DUMP_FILE="$DB_NAME-$(date +"%F-%H%M%S").sql"
export MC_HOSTS="$S3_PROTOCOL://$S3_ACCESS_KEY:$S3_SECRET_KEY@$S3_HOST"

echo "mysqldump -h$DB_HOST -P$DB_PORT -u$DB_USER -p$DB_PASSWORD --database $DB_NAME > $DB_NAME-$(date +"%F-%H%M%S").sql.gz"
mysqldump -h$DB_HOST -P$DB_PORT -u$DB_USER -p$DB_PASSWORD --database $DB_NAME > $DUMP_FILE

if [ -n "S3_HOST" ]; then

  export MC_HOSTS_store="$S3_PROTOCOL://$S3_ACCESS_KEY:$S3_SECRET_KEY@$S3_HOST"
  echo "mc cp $DUMP_FILE store/$S3_BUCKET"
  mc cp $DUMP_FILE store/backup/aliyun-database/

fi
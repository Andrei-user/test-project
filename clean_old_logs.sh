#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Использование: $0 /path/to/logs N"
  exit 1
fi

LOG_DIR="$1"
DAYS="$2"

FILES=$(find "$LOG_DIR" -type f -name "*.log" -mtime +"$DAYS")

echo "Найдены следующие файлы:"
echo "$FILES"

read -p "Удалить эти файлы? (y/n): " CONFIRM

if [ "$CONFIRM" = "y" ]; then
  echo "$FILES" | xargs rm -f
  echo "Файлы удалены."
else
  echo "Удаление отменено."
fi

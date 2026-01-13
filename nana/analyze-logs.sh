#!/bin/bash

LOG_DIR="/Users/abaddha/Documents/code/bash-scripting/nana/logs"
ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")
REPORT_FILE="/Users/abaddha/Documents/code/bash-scripting/nana/logs/log_analysis_report.txt"

echo -e "\nAnalyzing log files" > "$REPORT_FILE"
echo "===================" >> "$REPORT_FILE"

echo -e "\nList of log files updated in last 24 hrs" >> "$REPORT_FILE"
LOG_FILES=$(find $LOG_DIR -name "*.log" -mtime -1)
echo "$LOG_FILES" >> "$REPORT_FILE"

for LOG_FILE in $LOG_FILES; do

  echo -e "\n" >> "$REPORT_FILE"
  echo "=====================================================================" >> "$REPORT_FILE"
  echo "=======$LOG_FILE======" >> "$REPORT_FILE"
  echo "=====================================================================" >> "$REPORT_FILE"

  for PATTERN in ${ERROR_PATTERNS[@]}; do

    echo -e "\nSearching $PATTERN logs in $LOG_FILE" >> "$REPORT_FILE"
    grep "$PATTERN" "$LOG_FILE" >> "$REPORT_FILE"

    echo -e "\nNumber of $PATTERN logs found in $LOG_FILE" >> "$REPORT_FILE"
    ERROR_COUNT=$(grep -c "$PATTERN" "$LOG_FILE")
    echo $ERROR_COUNT >> "$REPORT_FILE"

    if [ "$ERROR_COUNT" -gt 10 ]; then
      echo -e "\n   ⚠️ Action Required: too many $PATTERN issues in log file $LOG_FILE\n"
    fi

  done

done

echo -e "\nLog analysis completed & report saved in: $REPORT_FILE\n"
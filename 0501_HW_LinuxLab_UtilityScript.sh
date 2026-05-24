#!bin bash

REPORT="report.txt"

echo "Starting Script"

pwd

#Make Directories
mkdir New
mkdir Backup
mkdir Archive

#Create Sample Files
touch New/sample1.txt
touch New/sample2.txt
touch New/sample3.txt


#write to files
echo "Hello1" > New/sample1.txt
echo "Hello2" > New/sample2.txt
echo "Hello3" > New/sample3.txt


# View New Directory
ls -al New/

# Copy to backup
cp -v New/sample1.txt Backup/
cp -v New/sample2.txt Backup/
cp -v New/sample3.txt Backup/

# View Backup Directory
ls -al Backup/

# Move and Rename a file
mv -v New/sample1.txt Archive/sample1_renamed.txt

# Create report
{
  echo "Report"
  echo "Date: $(date)"
  echo ""

  echo "Contents of New:"
  ls -a New/
  echo ""

  echo "Contents of Backup:"
  ls -a Backup/
  echo ""

  echo "Contents of Archive:"
  ls -a Archive/
  echo ""

  echo "File text from Backup/sample1.txt:"
  cat Backup/sample1.txt
  echo ""

  echo "File text from New/sample2.txt:"
  cat New/sample2.txt
  echo ""

  echo "File text from New/sample3.txt:"
  cat New/sample3.txt
  echo ""
} > "$REPORT"

# Print the report
cat "$REPORT"

echo "script complete"

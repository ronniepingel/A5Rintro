* Encoding: UTF-8.
ET DECIMAL COMMA.

GET DATA  /TYPE=TXT
  /FILE="C:\Users\ronpi764\Dropbox\Teaching\Dataanalyser\Dataanalys2\conscriptiondata.csv"
  /DELIMITERS=";"
  /QUALIFIER='"'
  /FIRSTCASE=2
  /VARIABLES=
  id AUTO
  year AUTO
  height AUTO
  weight AUTO
  psych AUTO
  muscle AUTO
  armstrength AUTO
  physical AUTO
  gripstrength AUTO
  legstrength AUTO
  sbp AUTO
  dbp AUTO
  officer AUTO
  testa AUTO
  testb AUTO
  testc AUTO
  testd AUTO.

COMPUTE bmi=weight / ( (height/100)*(height/100) ).
EXECUTE.

RECODE bmi (SYSMIS=SYSMIS) (25 thru Highest=1) (ELSE=0) INTO overweight.
EXECUTE.

DO IF(MISSING(bmi)).
COMPUTE bmicat=..
ELSE IF (bmi < 18.5).
COMPUTE bmicat = 1.
ELSE IF (bmi >= 18.5 AND bmi < 25).
COMPUTE bmicat = 2.
ELSE IF (bmi >= 25 AND bmi < 30).
COMPUTE bmicat = 3.
ELSE IF (bmi >= 30).
COMPUTE bmicat = 4.
END IF.
EXECUTE.



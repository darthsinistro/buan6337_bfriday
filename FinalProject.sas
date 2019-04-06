libname mydata '/folders/myfolders/SAS Class';
PROC IMPORT OUT= mydata.BlackFriday
            DATAFILE= "/folders/myfolders/SAS Class/BlackFriday.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;
data BlackFriday;
 set mydata.BlackFriday;
run;
/**********************************RUN OFF THE UNALTERED DATA SET TO RETAIN COLUMNS AND M/F Categories*************************************/
/************Summary Statistics***************/
/*Purchase Amount */
proc means data= BlackFriday n mean stddev min p25 median p75 max maxdec= 2;
var purchase;
 title 'Purchase Amount Summary Statistics';
run;

/*by Gender*/
proc sort data=BlackFriday;
by Gender;
run;
proc means data= BlackFriday n mean stddev min p25 median p75 max maxdec= 2;
var Purchase;
 title 'Purchase Amount by Gender';
 by Gender;
run;

/*by Age*/
proc sort data=BlackFriday;
by Age;
run;
proc means data= BlackFriday n mean stddev min p25 median p75 max maxdec= 2;
var Purchase;
 title 'Purchase Amount by Age';
 by Age;
run;

/*by Marital Status*/
proc sort data=BlackFriday;
by Marital_Status;
run;
proc means data= BlackFriday n mean stddev min p25 median p75 max maxdec= 2;
var Purchase;
 title 'Purchase Amount by Marital Status';
 by Marital_Status;
run;

/*by Occupation*/
proc sort data=BlackFriday;
by Occupation;
run;
proc means data= BlackFriday n mean stddev min p25 median p75 max maxdec= 2;
var Purchase;
 title 'Purchase Amount by Occupation';
 by Occupation;
run;

/*by City_Category*/
proc sort data=BlackFriday;
by City_Category;
run;
proc means data= BlackFriday n mean stddev min p25 median p75 max maxdec= 2;
var Purchase;
 title 'Purchase Amount by City Category';
 by City_Category;
run;

/*by Stay_In_Current_City_Years*/
proc sort data=BlackFriday;
by Stay_In_Current_City_Years;
run;
proc means data= BlackFriday n mean stddev min p25 median p75 max maxdec= 2;
var Purchase;
 title 'Purchase Amount by Time in Current City (Years)';
 by Stay_In_Current_City_Years;
run;

/*by Product_Category_1*/
proc sort data=BlackFriday;
by Product_Category_1;
run;
proc means data= BlackFriday n mean stddev min p25 median p75 max maxdec= 2;
var Purchase;
 title 'Purchase Amount by Product Category';
 by Product_Category_1;
run;

/*********Bar Charts of Frequency****************/
/*Gender*/
proc sgplot data = BlackFriday;
title 'Gender Frequency';
vbar Gender;
run;

/*City*/
proc sgplot data = BlackFriday;
title 'City Category Frequency';
vbar City_Category;
run;

/*Marital_Status*/
proc sgplot data = BlackFriday;
title 'Marital Status Frequency';
vbar Marital_Status;
run;

/*Age*/
proc sgplot data = BlackFriday;
title 'Age Frequency';
vbar Age;
run;

/*Stay in City*/
proc sgplot data = BlackFriday;
title 'Stay in Current City Frequency';
vbar Stay_In_Current_City_Years;
run;

/*Product_Category_1*/
proc sgplot data = BlackFriday;
title 'Product Category 1 Frequency';
vbar Product_Category_1;
run;

/**Anova for differences in populations based on the summary statistics**/
/*Age*/
ods graphics on;
proc anova data=BlackFriday;
class Age;
model Purchase = Age;
means Age;
run;
ods graphics off;

/*City_Category*/
ods graphics on;
proc anova data=BlackFriday;
class City_Category;
model Purchase = City_Category;
means City_Category;
run;
ods graphics off;

/*Gender*/
ods graphics on;
proc anova data=BlackFriday;
class Gender;
model Purchase = Gender;
means Gender;
run;
ods graphics off;

/*Marital_Status*/
ods graphics on;
proc anova data=BlackFriday;
class Marital_Status;
model Purchase = Marital_Status;
means Martial_Status;
run;
ods graphics off;

/*Occupation*/
ods graphics on;
proc anova data=BlackFriday;
class Occupation;
model Purchase = Occupation;
means Occupation;
run;
ods graphics off;

/*Stay_In_Current_City_Years*/
ods graphics on;
proc anova data=BlackFriday;
class Stay_In_Current_City_Years;
model Purchase = Stay_In_Current_City_Years;
means Stay_In_Current_City_Years;
run;
ods graphics off;

/*Product_Category_1*/
ods graphics on;
proc anova data=BlackFriday;
class Product_Category_1;
model Purchase = Product_Category_1;
means Product_Category_1;
run;
ods graphics off;

#!/bin/bash
#
#Programmer Cristian Aguirre
#
#The script should compute the sale amounts per associate 
#for the year 2017, as well as high salesperson. At the end 
#of the report list the name of sales people and sales amount in descending order.

#***********************************************************


BEGIN{
print "	           ABC Computing"
print "	    2017 Sales Associates Report"
printf ("%-20s %-20s %-20s \n", "Name", "Position", "Sales Amount")
print "=========================================================="

FS=":"

highSalesPerson=0
highAmount=0
salesAmt=0
}


#BODY
{
#The fields are: $1- ID, $2- Name, $3-Position
      if (NF == 3)
         {
		 #FIELD VARIABLES
         associateID = $1
         empName = $2
         empPosition = $3

	 id[associateID] = associateID

         name[associateID] = empName
         position[associateID] = empPosition
         }
#The fields are: $1-Number Item, $2- Typeofitem, $3-Name of item, $4 price
      if (NF == 4)
         {
         #FIELD VARIABLES
         prodID = $1
         price = $4

         idSaleAmount[prodID] = price
         }
#The fields are: $1-Numoftrans, $2- productId, $3- quantity, $4-date, $5personId

      if (NF == 5)
         {

			#FIELD VARIABLES
			prodID = $2
			quantity = $3
			associateID = $5
			saleDate = $4

			if (saleDate ~/2017$/)
            associateSum[associateID]+=(quantity*idSaleAmount[prodID])
			}
}


END {

    for (i in associateSum)
       {
       printf("%-20s %-20s %12.2f\n", name[i], position[i], associateSum[i] )

       printf("  %-3s %-18s %10.2f\n", id[i], name[i],
               associateSum[i])| "sort -nr -k 4"
       }


#printf ("%-20s %20s %20d \n", name, position, sales)

print "\n SORTED RESULTS BASED ON SALES\n"

}



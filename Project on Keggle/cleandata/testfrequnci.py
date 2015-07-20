#import csv

#ItemList = list()

#with open('C:\Rice2015\Rice Class\COMP540\Assements\Project on Keggle\train.csv','rb') as csvfile:
#    trainreader = csv.reader(csvfile, delimiter=',')
 #   for row in trainreader
  #   rowValue = 
   #   CsvItem = [for row in trainreader]
    #    for Item in CsvItem
     #     if Item[] != codeList[]
      #    ItemList.append(Item[]])
         
from datetime import * 
import time 
import sys
import csv



from _sqlite3 import Row

f = open('train-1.csv')

csv_f = csv.reader(f,delimiter=',')

health_examination_item = list()

for row in csv_f:
    hxtiemnum = len(row)
    for i in range(10,hxtiemnum,3):
        if row[i] in health_examination_item:
            health_examination_item=health_examination_item
        else:
            health_examination_item.append(row[i])
    #print row
    #print i
f.close() 
   #print health_xamination_item
while '' in health_examination_item:
    health_examination_item.remove('')

health_examination_avgvalue = [0]*39

dict= dict(zip(health_examination_item,health_examination_avgvalue))


KEY = dict.keys()
resultFyle = open('output.csv','wb')
dict_writer = csv.writer(resultFyle,dialect='excel') 
dict_writer.writerow(KEY)
resultFyle.close() 

#from _sqlite3 import Row
#print dict
f = open('train-1.csv','rb')

csv_f = csv.reader(f,delimiter=',')

for row in csv_f:
    #if set(row).pop() == '':
     #   print row
      #  pass
    #else:
    #print row 
    def datediff(beginDate,endDate): 
        format="%Y-%m-%d"; 
        date1=time.strptime(beginDate,format) 
        
        date2=time.strptime(endDate,format)  
        
        bd=time.mktime(date1)
        ed = time.mktime(date2)
        daysec = 24 * 60 * 60
        if ( ed - bd )/daysec <1:
            return int(1)
        else:
            return int(( ed - bd )/daysec)

            
            
    date1 = row[7]
    date2 = row[8]

              
    
      
    for dictindex in range(len(health_examination_item)):
        countj=0
        daysdiffrow = datediff(date1,date2)
        print daysdiffrow
        health_examination_avgvalue = dict[health_examination_item[dictindex]]
        #print health_examination_avgvalue
        for i in range(10,len(row),3):
                   
       
            if row[i] == health_examination_item[dictindex]:
          # health_examination_avgvalue= 
            #print item
                
                                
                health_examination_avgvalue = (countj+1)/float(daysdiffrow)
                print health_examination_avgvalue
            #print health_examination_value
          # dict(item) = health_examination_avgvalue
                #print health_examination_avgvalue
                dict[health_examination_item[dictindex]]=float(health_examination_avgvalue)
                countj=countj+1
            else:
                health_examination_avgvalue = dict[health_examination_item[dictindex]]
                    #print dict           #print row[k]
               # else:
                #    print 'compare next item'
        #else:
         #   print 'read a different item'
            
    RESULTS = dict.values()
    print RESULTS
    resultFyle = open('output.csv','ab+')
    dict_writer = csv.writer(resultFyle,dialect='excel') 
    dict_writer.writerow(RESULTS)
    resultFyle.close() 
    for key in dict.keys():
        dict[key]=0


f.close()   
     
                    
                    


#with open('test1.csv','r') as t:
 # rowValue = csv.reader(t)
  #for row in rowValue:
   #   print row
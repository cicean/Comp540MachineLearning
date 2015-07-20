'''
Created on Apr 20, 2015

@author: cicean
'''

import csv
from _sqlite3 import Row

f = open('testcleanhandv1.0.csv','rb')

csv_f = csv.reader(f,delimiter=',')

for row in csv_f:
    testid = row[0]
    #print testid
    f1 = open('handtest.csv','rb')
    csv_f1 = csv.reader(f1,delimiter=',')

    for row1 in csv_f1:
        if testid == row1[0]:
            testprodict=row1[2]
        else:
            testprodict=row[1]
    f1.close()
    
print testprodict
resultFyle = open('output.csv','wb+')
dict_writer = csv.writer(resultFyle,dialect='excel') 
dict_writer.writerow(testprodict)
resultFyle.close() 
    

f.close()  
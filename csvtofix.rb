
class CsvToFix
  
def convert(_file,widefix,alignleft,typestring)
# widefix = [10,8,3,13,5,11,40]
# alignleft =[true,false,false,true,true,false,false]
# typestring=[false,false,false,false,false,false,true]
 r = File.new("_result", "w")
    
    File.foreach(_file) {|line| 
      columns = line.split(',')
      i=1
      newline = ''
       columns.each{|col|
         fillchar = '0'
         if (typestring[i-1]) then fillchar = ' ' end
           
              if alignleft[i-1]  then
              newline = newline + col.ljust(widefix[i-1],fillchar)              
              else
              newline = newline + col.rjust(widefix[i-1],fillchar)
              end
              i=i+1
        }
        r.puts(newline)
       # print( newline )
        
      }
      
      r.close
end
end
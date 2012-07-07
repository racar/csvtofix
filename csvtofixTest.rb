require 'test/unit'
require './csvtofix.rb'
class CsvtofixTest < Test::Unit::TestCase 
    $widefix 
    $alignleft 
    $typestring 
  def setup
    f = File.new("_testinput.csv", "w") 
    f.puts("1,800999333,140119,14,25632,ESTADO-ORIGEN-ABD07,0,-") 
    f.puts("1,51985785,140119,14,210123,FECHA-ESTADO-ORIGEN-ABD07,20120220,-") 
    f.close
    
    $widefix = [1,11,6,2,18,30,20,0]
    $alignleft = [false,false,false,false,false,true,true,true]
    $typestring = [false,false,false,false,false,true,true,true]
    
    f = File.new("_testresult", "w") 
    row1 = '1'.ljust($widefix[0],'0')+ 
    '51985785'.rjust($widefix[1],'0')+
    '3'.rjust($widefix[2],'0')+
    '4'.ljust($widefix[3],'0')+
    '5'.ljust($widefix[4],'0')+
    '25632'.rjust($widefix[5],'0')+
    'Este es el nombre de'.rjust($widefix[6],' ')
    f.puts(row1) 
    f.puts("1,2,3,4,5,6,texto") 
    f.close
  end
  
  def teardown
    
  end
  
  def testconvert 
   
    csvtofixObj = CsvToFix.new()
    csvtofixObj.convert('_testinput.csv',$widefix,$alignleft,$typestring)
    
    assert_equal(100, csvtofixObj.convert('_testinput.csv'))
     
    
    end
        
         
 end
Counting repeated three-mers gene from long DNA sequence;                                                          
                                                                                                                   
                           _1_  _2_  _3_                                                                           
Problem: Count 'AGC' in 'GTAGCTGAGCTAAGCAT', three occurances                                                      
                                                                                                                   
github                                                                                                             
https://tinyurl.com/y6bg4jhs                                                                                       
https://github.com/rogerjdeangelis/utl-counting-repeated-three-mers-gene-from-dna-sequence-samples                 
                                                                                                                   
StackOverflow                                                                                                      
https://tinyurl.com/y6nurs5e                                                                                       
https://stackoverflow.com/questions/57661006/counting-repeated-5-mers-gene-from-100-dna-sequence-samples           
                                                                                                                   
                                                                                                                   
                           _1_  _2_  _3_                                                                           
Problem: Count 'AGC' in 'GTAGCTGAGCTAAGCAT', three occurances                                                      
                                                                                                                   
                                                                                                                   
Counting-repeated-three-mers-gene-from-dna-sequence-samples                                                        
                                                                                                                   
     Three Solutions                                                                                               
                                                                                                                   
         a.  SAS: countc(tranwrd(dna,"AAA",'#'),'#')                                                               
         b.  R: sapply(gregexpr(sam, dna), function(x) sum(x > 0));                                                
         c.  More comprehensive solution by                                                                        
             Paul Dorfman                                                                                          
             sashole@bellsouth.net                                                                                 
*_                   _                                                                                             
(_)_ __  _ __  _   _| |_                                                                                           
| | '_ \| '_ \| | | | __|                                                                                          
| | | | | |_) | |_| | |_                                                                                           
|_|_| |_| .__/ \__,_|\__|                                                                                          
        |_|                                                                                                        
;                                                                                                                  
                                                                                                                   
%let dna=%str("AGTACGTGCATAGC", "GTAGCTAGCTAGCAT");                                                                
                                                                                                                   
*            _               _                                                                                     
  ___  _   _| |_ _ __  _   _| |_                                                                                   
 / _ \| | | | __| '_ \| | | | __|                                                                                  
| (_) | |_| | |_| |_) | |_| | |_                                                                                   
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                  
                |_|                                                                                                
;                                                                                                                  
                                                                                                                   
SAS                                                                                                                
===                                                                                                                
                                                                                                                   
 WORK.HAVE total obs=2                                                                                             
                                                                                                                   
         DNA           CNT                                                                                         
                                                                                                                   
  AGTACGTGCATAGC        1                                                                                          
  GTAGCTGAGCTAAGCAT     3                                                                                          
                                                                                                                   
R                                                                                                                  
                                                                                                                   
%put Number of AGC in each DNA sequence &=want;                                                                    
                                                                                                                   
Number of AGC mers in each DNA sequence WANT=1 3                                                                   
                                                                                                                   
*                                                                                                                  
 _ __  _ __ ___   ___ ___  ___ ___                                                                                 
| '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                                                
| |_) | | | (_) | (_|  __/\__ \__ \                                                                                
| .__/|_|  \___/ \___\___||___/___/                                                                                
|_|                                                                                                                
;                                                                                                                  
                                                                                                                   
*                                                                                                                  
  __ _     ___  __ _ ___                                                                                           
 / _` |   / __|/ _` / __|                                                                                          
| (_| |_  \__ \ (_| \__ \                                                                                          
 \__,_(_) |___/\__,_|___/                                                                                          
                                                                                                                   
;                                                                                                                  
                                                                                                                   
options validvarname=upcase;                                                                                       
libname sd1 "d:/sd1";                                                                                              
data have;                                                                                                         
 input dna $64.;                                                                                                   
 cnt=countc(tranwrd(dna,"AGC",'#'),'#');;                                                                          
 put cnt=;                                                                                                         
cards4;                                                                                                            
AGTACGTGCATAGC                                                                                                     
GTAGCTGAGCTAAGCAT                                                                                                  
;;;;                                                                                                               
run;quit;                                                                                                          
                                                                                                                   
*_        ____                                                                                                     
| |__    |  _ \                                                                                                    
| '_ \   | |_) |                                                                                                   
| |_) |  |  _ <                                                                                                    
|_.__(_) |_| \_\                                                                                                   
                                                                                                                   
;                                                                                                                  
%utl_submit_r64(resolve('                                                                                          
dna <- c("AGTACGTGCATAGC", "GTAGCTAGCTAGCAT");                                                                     
sam <- "AGC";                                                                                                      
want=paste(t(sapply(gregexpr(sam, dna), function(x) sum(x > 0))),sep="",collapse=" ");                             
str(want);                                                                                                         
writeClipboard(want);                                                                                              
'),returnVar=want);                                                                                                
                                                                                                                   
%put Number of AGC in each DNA sequence &=want;                                                                    
                                                                                                                   
*                                            _                    _                                                
  ___      ___ ___  _ __ ___  _ __  _ __ ___| |__   ___ _ __  ___(_)_   _____                                      
 / __|    / __/ _ \| '_ ` _ \| '_ \| '__/ _ \ '_ \ / _ \ '_ \/ __| \ \ / / _ \                                     
| (__ _  | (_| (_) | | | | | | |_) | | |  __/ | | |  __/ | | \__ \ |\ V /  __/                                     
 \___(_)  \___\___/|_| |_| |_| .__/|_|  \___|_| |_|\___|_| |_|___/_| \_/ \___|                                     
                             |_|                                                                                   
;                                                                                                                  
                                                                                                                   
The TRANWRD trick is simple (and very fast); but, generally speaking, it's rather precarious:                      
There's no guarantee "#" (or any other character selected for the purpose) isn't in the search string.             
It counts only non-overlapping instances of the search-for substring. In other words,                              
looking for "AAA" in "AAAAA", it returns 1 rather than 3.                                                          
These drawbacks can be avoided via inexpensive custom coding, for example:                                         
                                                                                                                   
data _null_ ;                                                                                                      
  search = "gtAGCtgAGCAGCAGCtaAGCat" ;                                                                             
  for = "AGC" ;                                                                                                    
  overlap = 1 ;*1=count overlaps, 0=do not;                                                                        
  _d = ifn (overlap, 0, length (for) - 1) ;                                                                        
  _p = 1 ;                                                                                                         
  do count = 0 by 1 until (_f = 0) ;                                                                               
    _f = find (substrn (search, _p), for) ;                                                                        
    _p = _p + _f + _d ;                                                                                            
  end ;                                                                                                            
  put count= ;                                                                                                     
run ;                                                                                                              
                                                                                                                   
This prototype is easily FCMPed:                                                                                   
                                                                                                                   
proc fcmp outlib=work.f.f ;                                                                                        
  function countsub (search $, for $, overlap) ;                                                                   
    d = ifn (overlap, 0, length (for) - 1) ;                                                                       
    p = 1 ;                                                                                                        
    do q = 0 by 1 until (f = 0) ;                                                                                  
      f = find (substrn (search, p), for) ;                                                                        
      p = p + f + d ;                                                                                              
    end ;                                                                                                          
    return (q) ;                                                                                                   
  endsub ;                                                                                                         
quit ;                                                                                                             
                                                                                                                   
option cmplib=work.f ;                                                                                             
                                                                                                                   
data _null_ ;                                                                                                      
  input str :$32. sub :$3. ovlp ;                                                                                  
  count = counts (str, sub, ovlp) ;                                                                                
  put count= ;                                                                                                     
  cards ;                                                                                                          
gtAGCtgAGCAGCtaAGCat AGC 0                                                                                         
gtAGCtgAGCAGCtaAGCat AGC 1                                                                                         
gtAXXCtgAXYtaAYYat   AGC 0                                                                                         
gtAXXCtgAXYtaAYYat   AGC 1                                                                                         
gtXXXXCtgXXXX        XXX 0                                                                                         
gtXXXXCtgXXXX        XXX 1                                                                                         
;                                                                                                                  
run ;                                                                                                              
                                                                                                                   
Surely, it won't run nearly as fast as the TRANWRD subterfuge.                                                     
But it guarantees that the search returns the correct result                                                       
regardless of the content of the arguments. Plus, that overlap thingy ...                                          
                                                                                                                   
Best regards                                                                                                       
Pau,                                                                                                               
                                                                                                                   
                                                                                                                   

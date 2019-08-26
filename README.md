# utl-counting-repeated-three-mers-gene-from-dna-sequence-samples
Counting repeated three-mers gene from long DNA sequence

    Counting repeated three-mers gene from long DNA sequence;                                                         
                               _1_  _2_  _3_                                                                          
    Problem: Count 'AGC' in 'GTAGCTGAGCTAAGCAT', three occurances                                                     
                                                                                                                      
    github                                                                                                            
    https://tinyurl.com/y6bg4jhs                                                                                      
    https://github.com/rogerjdeangelis/utl-counting-repeated-three-mers-gene-from-dna-sequence-samples                
                                                                                                                      
    StackOverflow                                                                                                     
    https://tinyurl.com/y6nurs5e                                                                                      
    https://stackoverflow.com/questions/57661006/counting-repeated-5-mers-gene-from-100-dna-sequence-samples          
                                                                                                                      
                                                                                                                      
    Counting-repeated-three-mers-gene-from-dna-sequence-samples                                                       
                                                                                                                      
         Two Solutions                                                                                                
                                                                                                                      
             a.  SAS: countc(tranwrd(dna,"AAA",'#'),'#')                                                              
             b.  R: sapply(gregexpr(sam, dna), function(x) sum(x > 0));                                               
                                                                                                                      
                                                                                                                      
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
                                                                                                                      
                                                                                                                      
                                                                                                                      
                                                                                                                      
                                                                                                                      

#
# Description: Translate by YOUDAO api
# Date: 12-09-2016 v1.0
#

#
# you should apply your private API key and keyfrom previously 
# through the wedside: http://fanyi.youdao.com/openapi
# 

library(rjson)
library(RCurl)
library(bitops)

# replace your own API key an keyfrom in the quotations at next function
# word: the word that you want to translate
# key: your own API key
# keyfrom: your own keyfrom

translate <- function(word, key='replace your API key here', keyfrom='replace your keyfrom here')
  
{
  
  # combine the url for asking the api to translate, the format of result is .json

  jsonresult <- getURL(paste("http://fanyi.youdao.com/openapi.do?keyfrom=", keyfrom, 
                             "&key=", key, "&type=data&doctype=json&version=1.1&q=", 
                             word, sep = ""))
  
  # switch the format of result for .json to list so that it can be conveniently use in R

  result = fromJSON(jsonresult)
  
  if(is.null(result$basic$explains))
  {
    
    # display while don't access the result

    print("sorry, we can't find a result")
    
  } 
  else
  {
    
    # show the result

    print(result$basic$explains)
    
  }
  
  #return(result)
  
}

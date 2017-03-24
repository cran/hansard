## ----eval=FALSE----------------------------------------------------------
#  library(hansard)
#  members_search("abbot")
#  #>   MP.ID additionalName                      constituency constituencyCode
#  #> 1   172          Julie Hackney North and Stoke Newington           146966
#  #> 2  1651      Granville                              <NA>               NA
#  #> 3  4249           <NA>                      Newton Abbot           147092
#  #> 4  3827         Edmond                              <NA>               NA
#  #>   familyName                       fullName gender  givenName
#  #> 1     Abbott                Ms Diane Abbott Female      Diane
#  #> 2    Hodgson Lord Hodgson of Astley Abbotts   Male      Robin
#  #> 3     Morris              Anne Marie Morris Female Anne Marie
#  #> 4  Neuberger   Lord Neuberger of Abbotsbury   Male      David
#  #>                            homePage
#  #> 1     http://www.dianeabbott.org.uk
#  #> 2                              <NA>
#  #> 3 http://www.annemariemorris.co.uk/
#  #> 4       http://www.judiciary.gov.uk
#  #>                                                      label        party
#  #> 1                Biography information for Ms Diane Abbott       Labour
#  #> 2 Biography information for Lord Hodgson of Astley Abbotts         <NA>
#  #> 3              Biography information for Anne Marie Morris Conservative
#  #> 4   Biography information for Lord Neuberger of Abbotsbury         <NA>
#  #>                             twitter
#  #> 1 https://twitter.com/HackneyAbbott
#  #> 2                              <NA>
#  #> 3    https://twitter.com/AMMorrisMP
#  #> 4                              <NA>
#  

## ----eval = FALSE--------------------------------------------------------
#  x <- mp_vote_record(172, "aye")
#  #> Retrieving page 1 of 4
#  #> Retrieving page 2 of 4
#  #> Retrieving page 3 of 4
#  #> Retrieving page 4 of 4
#  #> head(x)
#  #>  _about                                                              title
#  #> 1 http://data.parliament.uk/resources/626911                            Opposition Motion: Community Pharmacies
#  #> 2 http://data.parliament.uk/resources/626953                           Opposition Motion: Police Officer Safety
#  #> 3 http://data.parliament.uk/resources/621252                                           Opposition Motion: Yemen
#  #> 4 http://data.parliament.uk/resources/607490 Closure Motion: Sexual Offences (Pardons Etc.) Bill second reading
#  #> 5 http://data.parliament.uk/resources/582798      Opposition Motion: NHS sustainabiliy and transformation plans
#  #> 6 http://data.parliament.uk/resources/576587                                Finance Bill: Report Stage Amdt 174
#  #>                 uin date._value date._datatype
#  #> 1 CD:2016-11-02:142  2016-11-02       dateTime
#  #> 2 CD:2016-11-02:143  2016-11-02       dateTime
#  #> 3 CD:2016-10-26:139  2016-10-26       dateTime
#  #> 4 CD:2016-10-21:138  2016-10-21       dateTime
#  #> 5 CD:2016-09-14:134  2016-09-14       dateTime
#  #> 6 CD:2016-09-06:125  2016-09-06       dateTime
#  

## ----eval = FALSE--------------------------------------------------------
#  #> research_topics_list <- research_topics_list()
#  #>
#  #> research_subtopics_list <- research_subtopics_list()
#  #>
#  #> research_types_list <- research_types_list()
#  #>
#  #> research_topics_list[[7]]
#  #> [1] "Defence"
#  #>
#  #> research_subtopics_list[[7]][10]
#  #> [1] "Falkland Islands"
#  #>
#  #> research_types_list[[1]]
#  #> [1] "Lords Library notes"
#  

## ----eval = FALSE--------------------------------------------------------
#  #> x <- research_briefings(topic = research_topics_list[[7]])
#  #>
#  #> x <- research_briefings(topic = research_topics_list[[7]], subtopic=research_subtopics_list[[7]][10])
#  #>
#  #> x <- research_briefings(topic = "Defence")
#  

## ----eval = FALSE--------------------------------------------------------
#  #> x <- research_briefings(subtopic = research_subtopics_list[[7]][10])
#  #>
#  #> x <- research_briefings(subtopic = "Falkland Islands")
#  #>
#  #> system.time(without_topic <- research_briefings(subtopic = research_subtopics_list[[7]][10]))
#  #> Retrieving page 1 of 1
#  #>   user  system elapsed
#  #>   1.12    2.59    4.71
#  #>
#  #> system.time(with_topic <- research_briefings(topic = research_topics_list[[7]], subtopic=research_subtopics_list[[7]][10]))
#  #> Retrieving page 1 of 1
#  #>    user  system elapsed
#  #>    0.47    1.31    1.89
#  #>
#  #> all.equal(with_topic, without_topic)
#  #> [1] TRUE

## ---- eval=FALSE---------------------------------------------------------
#  x <- hansard_generic("commonsansweredquestions.json")


library(jiebaR)
library(tidytext)
library(dplyr)
library(readr)
library(stringr)
library(ggplot2)

#讀入已斷詞PPT資料
data <- read.csv("jiabaptt.csv",stringsAsFactors = F)


#斷詞
tidy_text_format <- data %>%
  unnest_tokens(output = "word", input = "all_content",
                token = "regex", pattern = " ") 

#算頻率
des_tidy_text_format <- tidy_text_format %>%
  group_by(word) %>%
  summarise(n = n()) %>%
  arrange(desc(n))

# 建立情緒字典
positive <- read_csv("positive.txt")
negative <- read_csv("negative.txt")
positive <- data.frame(word = positive, sentiments = "positive", stringsAsFactors = FALSE) 
negative <- data.frame(word = negative, sentiemtns = "negative", stringsAsFactors = FALSE)
colnames(negative) = c("word","sentiment")
colnames(positive) = c("word","sentiment")
LIWC_ch <- rbind(positive, negative) 


# 分析正面負面情緒
emotion_dict <- des_tidy_text_format %>%
  inner_join(LIWC_ch, by = "word") 


#詞性標記
tag1 <- worker("tag")

tag_word1 <-tagging(emotion_dict$word,tag1)

split_category1 <- strsplit(tag_word1," ",fixed=TRUE)

select_category1 <- names(split_category1)

df_select_category1 <- cbind(category=select_category1)

new_df_select_category1 <- df_select_category1 [-(3640:3651),]

count_category_df1 <- cbind(emotion_dict,new_df_select_category1)

#write.csv(count_category_df1,"emotion_dict.csv",row.names=F, na = "NA")


# 視覺化: 正面情緒詞與負面情緒詞的數量比較

ggplot(emotion_dict,aes(sentiment))+
  geom_bar(width=0.25)











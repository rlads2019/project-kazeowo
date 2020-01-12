
# 原始碼說明文件

##原始資料製作

0.`positive.txt` & `negative.txt`    
  - 情緒詞辭典

1.`data.rmd` & `ptt.csv`  
  - 原始爬蟲

2.`pttmine.rmd` & `jiabaptt.csv`     
  - 排除回文，並只選取心情版
  - 斷詞
  - 詞頻統計與文字雲[沒有一個字的詞](pttmine.rmd檔)

3.`pttminetag.rmd` & `ptttag.csv`     
  - 有標詞性的斷詞 
  - 詞頻統計[沒有介係詞](pttmine檔)

4.`emotion_dict.R & emotion_dict.csv` & `emotion_top10.csv`    
  - 情感字典與數量(有標詞性) 
  - 正面情緒詞和負面情緒詞的統計圖(emotion_dict.R檔)
  - 篩選出分手形容詞、名詞、動詞前十名(emotion_dict.csv → emotion_Top10.csv)

##統計繪圖
1.`find_love_time`    
  - 交往時間的統計與長條圖

2.`find_reason.rmd`     
  - 分手理由的quanteda

3.`emotion_vis`     
  -分手情感詞長條圖(分為形容詞、名詞、動詞)


- csv檔的雲端硬碟版 https://drive.google.com/drive/folders/1ZhjV4rMIIOkYAcE7SVwtkwmZ69kmgE9Y?usp=sharing

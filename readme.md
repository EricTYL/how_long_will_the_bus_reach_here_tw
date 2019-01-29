# 全台公車站牌資訊小工具

## 介紹：
這個小工具調用[公路總局公車動態資訊 API](https://ptx.transportdata.tw/MOTC/Swagger/#!/CityBusApi/CityBusApi_EstimatedTimeOfArrival_0)，若想指定站牌和路線，可自行前往官方文件選定縣市和公車路線來取得預估到站時間 API 網址，代換到程式裡即可。執行該 Ruby 程式時，若目標公車預估到達目標站牌時間小於等於 300 秒，將顯示`Incomming`訊息，若大於 300 秒則顯示`Zzz`訊息。

***特別注意，此程式僅供示範用途，且由於使用測試身份串接 API，每天有請求數的上限，因此不保證 API 功能穩定，而測試身份也有可能隨時被停用。如欲商用、正式研究，請參閱[官方會員申請說明](https://ptxmotc.gitbooks.io/ptx-api-documentation/content/member/MemberType.html)。***

有兩個狀態(S0,S1)讓count1和count2計數，在每一次的count1、count2的迴圈中多加一個判斷 

說明：
從S0開始，此時count1會開始數到9，count2會維持為253。
當count1計數到9時，下個clk先進行判斷，state會變成S1
state為S1，count2會253開始減直到79，state再變成S0，count1從0開始數到9，count2變成253。


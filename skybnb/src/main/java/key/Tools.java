package key;

import java.util.Random;

public class Tools {

	public String randID(String randstr) {
//		int randID = 0;
		Random r = new Random();
		int[] sixNum = new int[6];

		/**
		 * -------------------------------------------------- eg. 步驟 for(i=0 to n) ar[i]
		 * = rand() Step1 i = 0 -> ar[0] = 9 Step2 i = 1 -> ar[1] = 1 與前一個 i[0] 比較 Step3
		 * i = 2 -> ar[2] = 9 與前兩個 i[0]、i[1] 比較 再取亂數 -> i[2] = 3 . . 需要 1.for(i=0 to n)
		 * 給予arr[i]隨機數 2.for(j=0 to i) 與arr[i]之前的數列比較是否相同
		 * -----------------------------------------------------
		 */
		for (int i = 0; i < 6; i++) {
			sixNum[i] = r.nextInt(6) + 1; // 將隨機數(1-49)放入 sixNum[i]
			for (int j = 0; j < i;) { // 與前數列比較，若有相同則再取亂數
				if (sixNum[j] == sixNum[i]) {
					sixNum[i] = r.nextInt(6) + 1;
					j = 0; // 避面重新亂數後又產生相同數字，若出現重覆，迴圈從頭開始重新比較所有數
				} else
					j++; // 若都不重複則下一個數
			}
		}


		for (int i = 0; i < 6; i++) {

			randstr += String.valueOf(sixNum[i]);
		}

		return randstr;
	}
}

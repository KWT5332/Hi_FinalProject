package kh.spring.config;

import org.springframework.stereotype.Repository;

@Repository
public class XSSFillterConfig {
	public static String XSSFilter(String target) {
		if(target!=null) {
			target = target.replaceAll("<", "&lt;");
			//lt 는 less than 즉 작다'<'를 다르게 표현하는법    < 가들어와서 태그를 걸려고 하면 HTML에서는 < 로 바뀌지만 데이터 저장시에는&lt로 치환하여 저장되는것 
			target = target.replaceAll(">", "&gt;");
			target = target.replaceAll("&", "&amp;");
		}
		return target;
	}
}

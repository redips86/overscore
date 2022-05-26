package kr.co.overscore.util.scrap;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import kr.co.overscore.model.scrap.FeaturedStats;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.Connection.Method;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class ScrapUtils {
	private ScrapUtils() {}
	
	
	public static List<FeaturedStats> getFeaturedStats(Document doc) {
		Elements elements = doc.select(".card-content");
		List<FeaturedStats> returnList = new ArrayList<FeaturedStats>();
		
		for (int idx=0 ; idx< elements.size(); idx++) {
			FeaturedStats stat = new FeaturedStats();
			
			stat.setType(idx <= 7 ? 1 : 2);
			
			stat.setStatsName(replaceParam(elements.get(idx).select(".card-heading").text().trim()));
			stat.setStatsValue(replaceParam(elements.get(idx).select(".card-copy").text()));
			
			returnList.add(stat);
		}
		
		return returnList;
	}
	
	
	public static String replaceParam(String in) {
		return in.replace(" - ", "_").replace("-", "_").replace(" ", "_");
	}
	
	
	public static void main(String args[]) {
		Connection conn = Jsoup
				.connect("https://playoverwatch.com/en-us/career/pc/us/redips-31459")
				//.connect("https://playoverwatch.com/en-us/search?q=redips-31459")
				
				.method(Method.GET)								
				.header("Accept", "text/html, */*; q=0.01")
				.header("Accept-Charset", "windows-949,utf-8;q=0.7,*;q=0.3")
				.header("Accept-Encoding", "gzip, deflate")
				.header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
				.ignoreContentType(true).timeout(100000)
				.followRedirects(true).ignoreHttpErrors(true);
		
		
		try {
			Document doc = conn.get();
			
			System.out.println(doc.html());
			
			List<FeaturedStats> list = getFeaturedStats(doc);
			
			for(FeaturedStats stat : list) {
				System.out.println("type = " + stat.getType() + ", name = " + stat.getStatsName() + ", val = " + stat.getStatsValue());
			}
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}

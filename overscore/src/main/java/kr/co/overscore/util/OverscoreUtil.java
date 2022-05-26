package kr.co.overscore.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import kr.co.overscore.model.ImageModel;
import kr.co.overscore.model.SummaryModel;


public class OverscoreUtil {
	
	public static String getRankToTier(int rank){
		if(rank > 0 && rank < 1500){
			return "bronze";
		}else if(rank >= 1500 && rank < 2000){
			return "silver";
		}else if(rank >= 2000 && rank < 2500){
			return "gold";
		}else if(rank >= 2500 && rank < 3000){
			return "platinum";
		}else if(rank >= 3000 && rank < 3500){
			return "diamond";
		}else if(rank >= 3500 && rank <= 4000){
			return "master";
		}else if(rank >= 4000 && rank <= 5000){
			return "grandmaster";
		}else{
			return "unranked";
		}
	} 
	
	public static String getRankToTierNumber(int rank){
		if(rank > 0 && rank < 1500){
			return "1";
		}else if(rank >= 1500 && rank < 2000){
			return "2";
		}else if(rank >= 2000 && rank < 2500){
			return "3";
		}else if(rank >= 2500 && rank < 3000){
			return "4";
		}else if(rank >= 3000 && rank < 3500){
			return "5";
		}else if(rank >= 3500 && rank <= 4000){
			return "6";
		}else if(rank >= 4000 && rank <= 5000){
			return "7";
		}else{
			return "0";
		}
	} 
	
	public static String getBotTag(String server, int rank){
		int botTag = 10000000;
		
		if(server.equals("pc"))
			botTag *= 1;
		else if(server.equals("psn"))
			botTag *= 4;
		else if(server.equals("xbl"))
			botTag *= 5;
		
		if(rank == -1)
			botTag += 100;
		else{
			if(rank > 0 && rank < 1500){
				botTag += 1;
			}else if(rank >= 1500 && rank < 2000){
				botTag += 2;
			}else if(rank >= 2000 && rank < 2500){
				botTag += 3;
			}else if(rank >= 2500 && rank < 3000){
				botTag += 4;
			}else if(rank >= 3000 && rank < 3500){
				botTag += 5;
			}else if(rank >= 3500 && rank <= 4000){
				botTag += 6;
			}else if(rank >= 4000 && rank <= 5000){
				botTag += 7;
			}
		}
		return String.valueOf(botTag);
	}
	
	public static SummaryModel setTierImage(List<ImageModel> dataList, SummaryModel summary){
		for(ImageModel im : dataList){
			if(im.getImageName().equals(OverscoreUtil.getRankToTier(summary.getComprank()))){
				summary.setTierImage(im.getImageValue());
			}
		}
		
		return summary;
	}
	
}
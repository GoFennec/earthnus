package kr.co.earthnus.user.camBoard;

import java.util.ArrayList;

public class ContextArrange {
	public String context(String context) {
		
		// 지우고싶은 태그 추가
		ArrayList<String> list = new ArrayList<String>();
		list.add("<p");						// p태그	
		list.add("<span");					// span태그				
		list.add("<h");						// h태그 종류
		list.add("<b");						// b태그
		list.add("<u");						// u태그
		list.add("<img");					// img태그
		list.add("</");						// 종료 태그
		
		for(int i = 0; i < list.size(); i++) {
			String target = list.get(i);
			
			while(context.contains(list.get(i))) {
				int target_num = context.indexOf(target); 
				String replace = context.substring(target_num,(context.substring(target_num).indexOf(">") + 1 + target_num));
				
				context = context.replace(replace, "");
			}
		}
		
		context = context.replace("&rsquo;", " ");
		context = context.replace("&lsquo;", " ");
		context = context.replace("&lt;", " ");
		context = context.replace("&gt;", " ");
		context = context.replace("&#39;", " ");
		context = context.replace("&nbsp;", " ");
		context = context.replace("&rsquo;", " ");
		context = context.replace("\n", " ");
		
		return context;		
	}
}

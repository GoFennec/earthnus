package kr.co.earthnus.user.camBoard;

import java.util.ArrayList;

public class ContextArrange {
	public String context(String context) {
		
		// �������� �±� �߰�
		ArrayList<String> list = new ArrayList<String>();
		list.add("<p");						// p�±�	
		list.add("<span");					// span�±�				
		list.add("<h");						// h�±� ����
		list.add("<b");						// b�±�
		list.add("<u");						// u�±�
		list.add("<img");					// img�±�
		list.add("</");						// ���� �±�
		
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

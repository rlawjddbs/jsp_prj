package day0326;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;

public class JtbcRssParsing {
	
	private static JtbcRssParsing jrp;
	
	public static JtbcRssParsing getInstance() {
		if(jrp == null) {
			jrp = new JtbcRssParsing();
		} // end if
		return jrp;
	} // getInstance
	
	public List<RssVO> getNews( String rssName ) throws IOException, JDOMException{
		List<RssVO> list = new ArrayList<RssVO>();
		
		// 1. Builder ����
		SAXBuilder builder = new SAXBuilder();
		// 2. ���� ��ü ��� - URL�� �ܺ� �������� �����ϴ� RSS ���� ��ü ���
		Document doc = builder.build(new URL("http://fs.jtbc.joins.com/RSS/"+rssName+".xml"));
		// 3. �ֻ��� �θ� ��� ���
		Element rootNode = doc.getRootElement(); // <rss>
		// 4. �ڽ� ���(channel) ���
		Element channelNode = rootNode.getChild("channel");
		// 5. channel node�� �ڽ� ���� ���
		Iterator<Element> someNodes = channelNode.getChildren().iterator();
		
		Element someNode = null;
		Iterator<Element> itemSubNodes = null;
		Element itemSubNode = null;
		RssVO rv = null;
		while( someNodes.hasNext() ) { // ä�� ����� �ڽ� ������ ��ȯ
			someNode = someNodes.next();
			if( "item".equals(someNode.getName())) { // ���� someNode �� ����� ����� item �ΰ�?
				// item ����� ��� �ڽĵ� ���
				itemSubNodes = someNode.getChildren().iterator(); 
				rv = new RssVO();
				while( itemSubNodes.hasNext() ) {
					itemSubNode = itemSubNodes.next();
					if( "title".equals(itemSubNode.getName()) ) {
						rv.setTitle(itemSubNode.getText());
					} // end if
					if( "link".equals(itemSubNode.getName()) ) {
						rv.setLink(itemSubNode.getText());
					} // end if
					if( "description".equals(itemSubNode.getName()) ) {
						rv.setDescription(itemSubNode.getText());
					} // end if
					if( "pubDate".equals(itemSubNode.getName()) ) {
						rv.setPubDate(itemSubNode.getText());
					} // end if
				} // end while
				list.add(rv);
			} // end if
		} // end while
		
		return list;
	} // getNews
	
	public static void main(String[] args) {
		JtbcRssParsing jrp = JtbcRssParsing.getInstance();
		try {
			System.out.println(jrp.getNews("newsflash"));
		} catch (IOException e) {
			e.printStackTrace();
		} catch (JDOMException e) {
			e.printStackTrace();
		}
	} // main
	
} // class

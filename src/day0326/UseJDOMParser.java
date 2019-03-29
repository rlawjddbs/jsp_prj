package day0326;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.Iterator;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;

/**
 *	JDOM Parser 사용해보기
 * @author owner
 */
public class UseJDOMParser {

	public UseJDOMParser() throws JDOMException, IOException{
		// 1. Parser 생성
		SAXBuilder builder = new SAXBuilder();
		// 2. XML 문서를 객체 저장 
		// web Server
		Document doc = builder.build(new URL("http://localhost:8080/jsp_prj/xml0326/names.xml")); // build method에는 File(직접경로)이나 URL(웹상)이 들어갈 수 있다.
		// 3. 문서객체에서 최상위 부모노드 얻기
		Element rootNode = doc.getRootElement();
		// 4. 부모노드의 자식 노드 얻기
		Iterator<Element> namesNode = rootNode.getChildren().iterator();
		
		// 5. 자식 노드 순환
		Element nameNode = null;
		while(namesNode.hasNext()) {
			// 6. 자식 노드 얻기
			nameNode = namesNode.next();
			System.out.println("노드명 : "+nameNode.getName());
			System.out.println("노드값 : "+nameNode.getText());
			System.out.println("노드값 : "+nameNode.getValue()); // 텍스트인데 값이 나온다(?)
		} // end while
//		System.out.println( namesNode );
		
	} // UseJDOMParser
	
	public static void main(String[] args) {
		try {
			new UseJDOMParser();
		} catch (JDOMException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch
	} // main

} // class

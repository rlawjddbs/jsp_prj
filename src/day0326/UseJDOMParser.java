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
 *	JDOM Parser ����غ���
 * @author owner
 */
public class UseJDOMParser {

	public UseJDOMParser() throws JDOMException, IOException{
		// 1. Parser ����
		SAXBuilder builder = new SAXBuilder();
		// 2. XML ������ ��ü ���� 
		// web Server
		Document doc = builder.build(new URL("http://localhost:8080/jsp_prj/xml0326/names.xml")); // build method���� File(�������)�̳� URL(����)�� �� �� �ִ�.
		// 3. ������ü���� �ֻ��� �θ��� ���
		Element rootNode = doc.getRootElement();
		// 4. �θ����� �ڽ� ��� ���
		Iterator<Element> namesNode = rootNode.getChildren().iterator();
		
		// 5. �ڽ� ��� ��ȯ
		Element nameNode = null;
		while(namesNode.hasNext()) {
			// 6. �ڽ� ��� ���
			nameNode = namesNode.next();
			System.out.println("���� : "+nameNode.getName());
			System.out.println("��尪 : "+nameNode.getText());
			System.out.println("��尪 : "+nameNode.getValue()); // �ؽ�Ʈ�ε� ���� ���´�(?)
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

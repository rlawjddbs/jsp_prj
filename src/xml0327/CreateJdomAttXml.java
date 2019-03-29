package xml0327;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jdom2.Attribute;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

public class CreateJdomAttXml {

	public List<DataVO> data(){
		List<DataVO> list = new ArrayList<DataVO>();
		list.add(new DataVO("�ƹ���","����","������","�¿�",1600));
		list.add(new DataVO("�ָ�������","�ؽ�","����ö","������ī",3000));
		list.add(new DataVO("��ī","�ؽ�","������","������ī",1600));
		list.add(new DataVO("�ҷ���","���","������","SUV",4800));
		list.add(new DataVO("MANƮ��","MAN","������","Ʈ��",10000));
		return list;
	} // data
	
	
	public Document createXml( List<DataVO> carList) {
		// 1. xml ������ü ����
		Document doc = new Document();
		// 2. �ֻ��� �θ��� ����
		Element rootNode = new Element("cars");
		// �ڽ� ��� ����
		Element carNode = null;
		Element carModelNode = null;
		Element companyNode = null;
		Element ownerNode = null;
		Element ccNode = null;
		// �Ӽ� ��� ����
		Attribute carTypeAtt = null;
		
		for( DataVO data : carList ) {
			// 3. �ڽ� ��� ����
			carNode = new Element("car");
			carModelNode = new Element("model");
			companyNode = new Element("company");
			ownerNode = new Element("owner");
			ccNode = new Element("cc");
			// �Ӽ� ��� ����
			carTypeAtt = new Attribute("car_type", data.getCarType());
			
			// 4. �ڽ� ��忡 �� ����
			carModelNode.setText(data.getCarModel());
			companyNode.setText(data.getCompany());
			ownerNode.setText(data.getOwner());
			ccNode.setText(String.valueOf(data.getCc()));
			// �Ӽ�����
			carNode.setAttribute(carTypeAtt);
			// 5. ���� ���� �ڽ� ��带 �θ� ��忡 �߰�
			// carNode�� �ڽ� ��� �߰�
			carNode.addContent(carModelNode);
			carNode.addContent(companyNode);
			carNode.addContent(ownerNode);
			carNode.addContent(ccNode);
			// �ڽ� ��带 ���� car ��带 �ֻ��� �θ� ��忡 ��ġ
			rootNode.addContent(carNode);
		} // end for
		// 6 . �ڽ� ��带 ���� �θ� ��带 xml������ü�� �߰�
		doc.addContent(rootNode);
		return doc;
	} // createXml
	
	public void createXmlFile( Document doc ) throws IOException{
		// 7. ��� ��ü ���� : compact, raw format�� ���ٷ� ����Ѵ�.
//		XMLOutputter x_out = new XMLOutputter( Format.getCompactFormat() );
//		XMLOutputter x_out = new XMLOutputter( Format.getRawFormat() );
		XMLOutputter x_out = new XMLOutputter( Format.getPrettyFormat() );
		// 8. xml ���� ��ü�� ��� ��Ʈ���� ����Ͽ� ���
		x_out.output(doc, System.out);
		x_out.output(doc, new FileOutputStream("C:/dev/workspace/jsp_prj/WebContent/xml0327/jdom_car.xml"));
	} // createXmlFile
	
	
	public static void main(String[] args) {
		CreateJdomAttXml c = new CreateJdomAttXml();
		try {
			c.createXmlFile( c.createXml(c.data()) );
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch
	} // main

} // class

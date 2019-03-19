package day1210;

import java.awt.Button;
import java.awt.Font;
import java.awt.Frame;
import java.awt.Label;
import java.awt.List;
import java.awt.TextField;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

@SuppressWarnings("serial")
public class HardHome extends Frame {

	public HardHome() {
		super("수동배치");
		
		Label lblFont = new Label("글꼴");
		TextField lblFontText = new TextField();
		Label lblStyle = new Label("글꼴 스타일");
		TextField lblStyleText = new TextField();
		Label lblSize = new Label("크기");
		TextField lblSizeText = new TextField();
		Label lblSee = new Label("보기");
		TextField lblSeeText = new TextField("AaBbYyZz");
		lblSeeText.setFont(new Font("Dialog", Font.BOLD,22));
		Button btnYes = new Button("확인");
		Button btnNo = new Button("취소");
		
		
		List listFont = new List();
		listFont.add("Dialog");
		listFont.add("Serif");
		listFont.add("SansSerif");
		listFont.add("Monospaced");
		listFont.add("DialogInput");
		
		List listStyle = new List();
		listStyle.add("일반");
		listStyle.add("굵게");
		listStyle.add("기울임꼴");
		listStyle.add("굵게 기울임꿀");
		
		List listSize = new List();
		int i = 0;
		String temp = "";
//		while(i<81) {
//			if(i/2==0&&i<11) {
//			} else if(i<81) {
//				temp=String.valueOf(i);
//				listSize.add(temp);
//			}
//			i++;
//		}
		
		for(i=2; i<11; i++) {
			temp=String.valueOf(i);
			listSize.add(temp);
			i=i+1;
		}
		
		for(i=11; i<81; i++) {
			temp=String.valueOf(i);
			listSize.add(temp);
		}
		
		
		
		setLayout(null);
		
		lblFont.setBounds(27,50,80,20);
		lblFontText.setBounds(30,70,90,20);
		
		lblStyle.setBounds(155,50,80,20);
		lblStyleText.setBounds(155,70,90,20);
		
		lblSize.setBounds(280,50,80,20);
		lblSizeText.setBounds(280,70,90,20);
		
		lblSee.setBounds(160,210,80,20);
		lblSeeText.setBounds(160,230,120,70);
		
		listFont.setBounds(30,100,90,85);
		listStyle.setBounds(155,100,90,85);
		listSize.setBounds(280,100,90,85);
		
		btnYes.setBounds(230,305,45,30);
		btnNo.setBounds(300,305,45,30);

		
		add(lblFont);
		add(lblFontText);
		add(listFont);
		
		
		add(lblStyle);
		add(lblStyleText);
		add(listStyle);
		
		add(lblSize);
		add(lblSizeText);
		add(listSize);
		
		add(lblSee);
		add(lblSeeText);
		
		add(btnYes);
		add(btnNo);
		
		
		setBounds(200,100,400,350);
		setResizable(false);
		setVisible(true);
		
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent we) {
				dispose();
			}
		});
		
		
	}
	
	public static void main(String[] args) {
		new HardHome();
	}

}

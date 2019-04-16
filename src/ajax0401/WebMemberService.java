package ajax0401;

import java.sql.SQLException;

import org.json.simple.JSONObject;

/**
 *	Service는 업무로직을 처리하는 클래스
 * @author owner
 */
public class WebMemberService {
	
	public JSONObject serachId(String id) {
		JSONObject json = new JSONObject();
		
		WebMemberDAO wm_dao = WebMemberDAO.getInstance();
		boolean flag = false;
		try {
			flag = wm_dao.selectId(id);
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch
		
		// DB 조회 결과를 JSONObject에 추가
		json.put("idResult", flag);
		
		return json;
	} // class
} // class

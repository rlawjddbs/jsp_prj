package json0328;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class JsonService {
	public JSONObject searchEmpData(int deptno) {
		JSONObject json_obj = new JSONObject();
		
		JsonEmpSearchDAO jes_dao = JsonEmpSearchDAO.getInstance();
		
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH;mm");
			json_obj.put("pubData", sdf.format(new Date()));
			List<EmpVO> list = jes_dao.selectEmpList(deptno);
			
			json_obj.put("result", !list.isEmpty()); // ��ȸ�� ����Ǹ� true
			
			JSONArray json_arr = new JSONArray();
			JSONObject temp_obj = null;
			EmpVO ev = null;
			
			for(int i=0; i < list.size(); i++) {
				ev = list.get(i);
				temp_obj = new JSONObject();
				temp_obj.put("empno", ev.getEmpno());
				temp_obj.put("sal", ev.getSal());
				temp_obj.put("ename", ev.getEname());
				temp_obj.put("job", ev.getJob());
				temp_obj.put("hiredate", ev.getHiredate());
				// JSONArray�� �����Ǿ� ���� ���� JSONObject �߰�
				json_arr.add(temp_obj);
			} // end for
			
			// ��ȸ�� ����� ���� JSONArray�� JSONObject�� �߰��Ѵ�.
			json_obj.put("resultData", json_arr);
			
		} catch (SQLException e) {
			json_obj.put("result", false);
			e.printStackTrace();
		} // end catch
		
		return json_obj;
	} // searchEmpData
} // JsonService

package cn.edu.ustb.dao;

import java.util.*;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;

import cn.edu.ustb.entity.Record;
import cn.edu.ustb.entity.User;
import cn.edu.ustb.entity.WorkFlow;
import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;

public class WorkFlowDao {
	private QueryRunner qr = new TxQueryRunner();

	public User findUserByUid(Integer uid) {
		String sql = "select * from user where uid=?";
		try {
			return qr.query(sql, new BeanHandler<User>(User.class), uid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public User findUserByUsername(String username) {
		String sql = "select * from user where username=?";
		try {
			return qr.query(sql, new BeanHandler<User>(User.class), username);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void updateAccountByUid(Double price, Integer uid) {
		String sql = "update user set money=money+? where uid=?";
		try {
			qr.update(sql, price, uid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<WorkFlow> findWorkFlowByStatus(int status) {
		String sql = "select * from wf_instance where wfStatus=?";
		try {
			return qr.query(sql, new BeanListHandler<WorkFlow>(WorkFlow.class), status);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<WorkFlow> findWorkFlowByUid(Integer uid) {
		String sql = "select * from wf_instance where uid=?";
		try {
			return qr.query(sql, new BeanListHandler<WorkFlow>(WorkFlow.class), uid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public WorkFlow findWorkFlowByWid(Integer wid) {
		String sql = "select * from wf_instance where wid=?";
		try {
			Map<String, Object> map = qr.query(sql, new MapHandler(), wid);
			WorkFlow workFlow = CommonUtils.toBean(map, WorkFlow.class);
			User user = CommonUtils.toBean(map, User.class);
			workFlow.setUser(user);
			return workFlow;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//?????????????????????????????????
		public List<WorkFlow> findWorkFlowBywfName(String wfName) {
			String sql = "select * from wf_instance where wfName like ? and uid=0 ";
			try {
				return qr.query(sql, new BeanListHandler<WorkFlow>(WorkFlow.class), "%"+wfName+"%");
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
		//????????????????????????????????????????????????
		
		@SuppressWarnings("null")
		public List<WorkFlow> findWorkFlowBysame(String wfName) {
			String sql = "select * from wf_instance where uid=0 ";
			List<WorkFlow> worklist = new ArrayList<WorkFlow>();
			//String sql2 = "select * from wf_instance where wfName=? and uid=0 ";
			try {
				List<Object> list =qr.query(sql,new ColumnListHandler("wfName"));
				List<String> name = new ArrayList<String>();
				for( Object o : list)
				{
					String s=(String) o;
					int d[][]; // ??????
					int n = s.length();
					int m = wfName.length();
					int i; // ??????str???
					int j; // ??????target???
					char ch1; // str???
					char ch2; // target???
					int temp; // ??????????????????,?????????????????????????????????,??????0??????1
					float same;//?????????
					//if (n == 0 || m == 0) {
					//	same=0;break;		
					//}
					d = new int[n + 1][m + 1];
					for (i = 0; i <= n; i++) { // ??????????????????
						d[i][0] = i;
					}

					for (j = 0; j <= m; j++) { // ??????????????????
						d[0][j] = j;
					}

					for (i = 1; i <= n; i++) { // ??????str
						ch1 = s.charAt(i - 1);
						// ?????????target
						for (j = 1; j <= m; j++) {
							ch2 = wfName.charAt(j - 1);
							if (ch1 == ch2 || ch1 == ch2 + 32 || ch1 + 32 == ch2) {
								temp = 0;
							} else {
								temp = 1;
							}
							// ??????+1,??????+1, ?????????+temp?????????
							d[i][j] = Math.min(Math.min(d[i - 1][j] + 1, d[i][j - 1] + 1), d[i - 1][j - 1] + temp);
						}
					}

					same= 1 - (float) d[n][m] / Math.max(s.length(), wfName.length()) ;
					if(same>0)
					{
						name.add(s);
					}
				}
				for (String n:name)
				{
					String sql2 = "select * from wf_instance where wfName =? and uid=0 ";
					Map<String, Object> map = qr.query(sql2, new MapHandler(), n);
					WorkFlow workFlow = CommonUtils.toBean(map, WorkFlow.class);
					worklist.add(workFlow);
				}
				
				return worklist;
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
		

	public void addWorkFlow(WorkFlow workFlow) {
		String sql = "insert into wf_instance values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = { workFlow.getWid(), workFlow.getWfName(), workFlow.getWfStatus(),
				workFlow.getUser().getUid(), workFlow.getWfImagePath(), workFlow.getWfArea(),
				workFlow.getWfEnvironment(), workFlow.getWfObject(), workFlow.getWfPrinciple(),
				workFlow.getWfKeywords(), workFlow.getWfDescription(), workFlow.getComment(), workFlow.getWfJson(),
				workFlow.getWfPara(), workFlow.getWfPrice(), workFlow.getWfUser(),workFlow.getField() };
		try {
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public void addRecord(Record record) {
		String sql = "insert into wf_records values(?,?,?,?,?,?)";
		Object[] params = { record.getRid(), record.getTime(), record.getWid(), record.getWfType(), record.getUid(),
				record.getValue() };
		try {
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public void updateStatusByWid(Integer wfStatus, Integer wid) {
		String sql = "update wf_instance set wfStatus=? where wid=?";
		Object[] params = { wfStatus, wid };
		try {
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public void deleteWorkFlowByWid(Integer wid) {
		String sql = "delete from wf_instance where wid=?";
		try {
			qr.update(sql, wid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}
	
	//????????????????????????????????????
	public List<WorkFlow> findWorkFlowByFiled(String filed){
		String sql = "select * from wf_instance where field like CONCAT('%',?,'%') ";
		try {
			return qr.query(sql, new BeanListHandler<WorkFlow>(WorkFlow.class), filed);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}

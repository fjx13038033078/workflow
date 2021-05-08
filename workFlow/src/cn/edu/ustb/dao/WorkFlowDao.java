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
	//根据工作流模板名称查找
		public List<WorkFlow> findWorkFlowBywfName(String wfName) {
			String sql = "select * from wf_instance where wfName like ? and uid=0 ";
			try {
				return qr.query(sql, new BeanListHandler<WorkFlow>(WorkFlow.class), "%"+wfName+"%");
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
		//根据搜索的字符串相似度查找工作流
		
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
					int d[][]; // 矩阵
					int n = s.length();
					int m = wfName.length();
					int i; // 遍历str的
					int j; // 遍历target的
					char ch1; // str的
					char ch2; // target的
					int temp; // 记录相同字符,在某个矩阵位置值的增量,不是0就是1
					float same;//相似度
					//if (n == 0 || m == 0) {
					//	same=0;break;		
					//}
					d = new int[n + 1][m + 1];
					for (i = 0; i <= n; i++) { // 初始化第一列
						d[i][0] = i;
					}

					for (j = 0; j <= m; j++) { // 初始化第一行
						d[0][j] = j;
					}

					for (i = 1; i <= n; i++) { // 遍历str
						ch1 = s.charAt(i - 1);
						// 去匹配target
						for (j = 1; j <= m; j++) {
							ch2 = wfName.charAt(j - 1);
							if (ch1 == ch2 || ch1 == ch2 + 32 || ch1 + 32 == ch2) {
								temp = 0;
							} else {
								temp = 1;
							}
							// 左边+1,上边+1, 左上角+temp取最小
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
	
	//根据领域查找对应的工作流
	public List<WorkFlow> findWorkFlowByFiled(String filed){
		String sql = "select * from wf_instance where field like CONCAT('%',?,'%') ";
		try {
			return qr.query(sql, new BeanListHandler<WorkFlow>(WorkFlow.class), filed);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}

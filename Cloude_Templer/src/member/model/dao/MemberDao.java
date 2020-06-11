package member.model.dao;

import org.apache.ibatis.session.SqlSession;

import member.model.vo.Member;

public class MemberDao {


	public Member idCheck(SqlSession session, String userId) {
		Member m = null;
		
		 m = session.selectOne("memberMapper.idCheck", userId);
		System.out.println("idCheck의 dao : " + m);
		if(m == null) {
			session.close();
		}
		return m;
	}

}

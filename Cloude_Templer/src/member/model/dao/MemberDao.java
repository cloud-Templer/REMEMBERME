package member.model.dao;

import org.apache.ibatis.session.SqlSession;

import member.model.exception.InsertFailException;
import member.model.vo.Member;

public class MemberDao {


	public Member idCheck(SqlSession session, String userId) {
		Member m = null;
		
		 m = session.selectOne("memberMapper.idCheck", userId);
		System.out.println("idCheck의 dao : " + m);
		
		return m;
	}

	public int insertMember(SqlSession session, Member m) throws InsertFailException {
		int result =0;
		
		result = session.insert("memberMapper.insertMember", m);
		
		if(result >0) {
			session.commit();
		}else {
			session.rollback();
			
			session.close();
			throw new InsertFailException("회원 가입 실패!");
		}
		
		return result;
	}

}

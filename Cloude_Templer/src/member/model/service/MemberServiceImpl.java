package member.model.service;

import static common.Template.getSqlSession;

import org.apache.ibatis.session.SqlSession;

import member.model.dao.MemberDao;
import member.model.exception.InsertFailException;
import member.model.vo.Member;

public class MemberServiceImpl implements MemberService{

	@Override
	public Member idCheck(String userId) {
		SqlSession session = getSqlSession();
		
		Member m = new MemberDao().idCheck(session,userId);
		
		System.out.println("service에서 m : " + m );
		
		return m;
	}
	
	@Override
	public int insertMember(Member m) throws InsertFailException {
		SqlSession session = getSqlSession();
		int result =0;
		
		result = new MemberDao().insertMember(session,m);
		
		
		return result;
	}

}
